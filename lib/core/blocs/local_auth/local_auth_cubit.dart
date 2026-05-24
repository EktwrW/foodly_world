import 'dart:async';

import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/push_notification_service.dart';
import 'package:foodly_world/data_transfer_objects/local_auth/local_auth_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_auth/local_auth.dart';

part 'local_auth_cubit.freezed.dart';
part 'local_auth_state.dart';

class LocalAuthCubit extends Cubit<LocalAuthState> {
  LocalAuthDTO _dto;
  final LocalAuthentication auth = LocalAuthentication();
  final MeRepo _meRepo;
  final AuthSessionService _authSessionService;
  final Logger _logger;

  LocalAuthCubit(
    MeRepo meRepo,
    AuthSessionService authSessionService,
    Logger logger,
  )   : _authSessionService = authSessionService,
        _meRepo = meRepo,
        _logger = logger,
        _dto = const LocalAuthDTO(),
        super(const LocalAuthState.initial(LocalAuthDTO())) {
    if (!kIsWeb) {
      initializeLocalAuth();
    } else {
      emit(_Loaded(_dto));
    }
  }

  bool get biometricAuthEnabled => _dto.deviceIsSupported && _dto.availableBiometrics.isNotEmpty;

  /// True cuando `authenticate()` ya fue invocado (user tocó el botón
  /// biométrico) y el flow está en curso — desde el setteo de
  /// `isAuthenticating=true` en la línea 114, hasta el `emit(_Authenticated)`
  /// / `emit(_Error)` que cierra el flow.
  ///
  /// Distinto de `_authSessionService.isBiometricLoginInProgress`: ese flag
  /// se setea SÍNCRONAMENTE en `initializeLocalAuth` cuando se detecta
  /// sesión guardada, ANTES de saber si el user va a usar biometría. O sea
  /// `isBiometricLoginInProgress=true` no implica "user tocó el botón" — solo
  /// "el cubit reservó el guard por las dudas". Este getter sí discrimina.
  ///
  /// Lo usa `FoodlyLocationWrapper._scheduleBiometricSafetyCheck` para
  /// destrabar el watchdog cuando el user ignora el botón biométrico y se
  /// loguea por otro path (email+password, Google, Apple) — caso en el que
  /// el cubit queda eterno en `_NeedAuthentication` con `isAuthenticating=false`.
  bool get isAuthInProgress => _dto.isAuthenticating;

  void initializeLocalAuth() async {
    emit(_Loading(_dto));

    // Use hasSessionOrPending instead of isLoggedIn: after the dual-token
    // refactor, tokens are restored asynchronously from secure storage, so
    // isLoggedIn is still false at this point. hasSessionOrPending is set
    // synchronously in fromJson() and indicates a cached session exists.
    final hasSession = _authSessionService.hasSessionOrPending;

    // Set the guard SYNCHRONOUSLY before any await so that
    // FoodlyLocationWrapper's postFrameCallback (fires after frame 1, ~16ms)
    // sees the flag and defers the location check. Without this, the location
    // permission dialog appears while the biometric dialog is being prepared,
    // causing the OS to dismiss the biometric dialog. Cleared below when
    // biometrics turn out to not be available.
    if (hasSession) {
      _authSessionService.setBiometricLoginInProgress(true);
    }

    await auth.isDeviceSupported().then(
      (isSupported) async {
        if (hasSession && isSupported == false) {
          await _checkLoginStatusCall();
        }

        _dto = _dto.copyWith(deviceIsSupported: isSupported);

        if (isSupported) {
          await _checkBiometrics().then((value) => _dto = _dto.copyWith(canCheckBiometrics: value));
        }

        if (_dto.canCheckBiometrics) {
          await _getAvailableBiometrics();
        }

        if (hasSession && biometricAuthEnabled) {
          // Gate de validación de sesión PREVIO al prompt biométrico.
          //
          // Bug 2026-05-22: con un token guardado ya muerto en el BE, el
          // flujo viejo mostraba la huella igual; el user autenticaba, recién
          // ahí `biometricLogin()` pegaba al BE, recibía 401, y la app caía a
          // starting page. Resultado: huella para nada.
          //
          // `initializeSessionOrClear` (disparado por `RootBloc.fromJson`)
          // corre en paralelo y valida el token contra el BE (silentRefresh +
          // fetchLoggedUser). Esperamos su veredicto antes de decidir. El
          // `.timeout` es defensa en profundidad: el veredicto SIEMPRE se
          // completa (vía el `finally` de `initializeSessionOrClear`), pero si
          // por lo que fuere no llegara, no colgamos el arranque — caemos al
          // lado seguro (rutear a login).
          bool sessionValid;
          try {
            sessionValid = await _authSessionService.sessionRestoreVerdict
                .timeout(const Duration(seconds: 12));
          } catch (_) {
            sessionValid = false;
          }

          if (sessionValid) {
            emit(_NeedAuthentication(_dto));
          } else {
            // Sesión inválida: NO pedimos biometría. `initializeSessionOrClear`
            // ya llamó `clearInvalidSession()` (tokens limpios, forceToLogin
            // arriba). Bajamos el guard especulativo y emitimos `_Loaded` con
            // `authenticated == false` (default del DTO): el handler `loaded:`
            // de `FoodlyWrapper` rutea a login. Path ya validado, sin huella
            // de por medio.
            _authSessionService.setBiometricLoginInProgress(false);
            emit(_Loaded(_dto));
          }
        } else {
          // Biometrics not available — clear the speculative guard set above
          // so FoodlyLocationWrapper's deferred subscription can fire.
          if (hasSession) {
            _authSessionService.setBiometricLoginInProgress(false);
          }
          // Biometric auth won't happen — complete any deferred services init
          // that was waiting on the biometric flow to resolve.
          _authSessionService.completePendingServicesInit();
          emit(_Loaded(_dto));
        }
      },
    );
  }

  Future<void> _getAvailableBiometrics() async {
    try {
      await auth.getAvailableBiometrics().then(
            (availableBiometrics) => _dto = _dto.copyWith(availableBiometrics: availableBiometrics),
          );
    } on PlatformException catch (e) {
      _dto = _dto.copyWith(availableBiometrics: <BiometricType>[]);
      _logger.e(e.toString());
    }
  }

  Future<bool> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      _logger.e(e.toString());
    }

    return canCheckBiometrics;
  }

  Future<void> authenticate() async {
    if (_dto.isAuthenticating) return;
    _dto = _dto.copyWith(isAuthenticating: true);

    // Serializar detrás del flujo de permiso de notificaciones.
    //
    // Por qué: Android no encola diálogos system-modal. Si el prompt de
    // POST_NOTIFICATIONS (disparado fire-and-forget desde main.dart vía
    // PushNotificationService.initialize()) sigue en pantalla cuando le
    // pedimos al OS mostrar el BiometricPrompt, Android rechaza el request
    // silenciosamente — `authenticated=false` sin que el usuario vea la
    // sheet de fingerprint/Face ID. Reproducido en 1.4.2+32 (2026-04-21):
    // logout → cerrar app → revocar notificaciones en Settings → reabrir →
    // diálogo push → aprobar → biometría jamás aparece y el botón queda
    // no-op hasta swipe-kill (por el bug del _dto, ver abajo).
    //
    // Esperamos SIN timeout arbitrario: timeouts cortos (5 s) hacían
    // fall-through antes de que el usuario tocara Permitir en el diálogo
    // de notificaciones, mostrando BiometricPrompt en paralelo y
    // cancelando el reconocimiento. El safety-net contra cuelgue del
    // plugin vive dentro del service (timer de 120 s), así que acá solo
    // necesitamos try/catch por si el servicio no está registrado.
    if (di.isRegistered<PushNotificationService>()) {
      try {
        await di<PushNotificationService>().permissionFlowComplete;
      } catch (_) {
        // Service missing — fall through. El reset de isAuthenticating
        // abajo asegura que el retry manual funcione.
      }
    }

    // Bug D (2026-05-06): grace period entre el cierre del diálogo de
    // notificaciones y la apertura del BiometricPrompt.
    //
    // El plugin `flutter_local_notifications` resuelve la promise de
    // `requestNotificationsPermission()` apenas el usuario tappea
    // Permitir/Denegar — pero Android tarda ~200-400ms en estabilizar el
    // window-focus después de cerrar un system dialog. Si llamamos a
    // `auth.authenticate()` dentro de esa ventana, el OS recibe el
    // request mientras el FocusManager todavía está soltando el dialog
    // anterior y silencia el BiometricPrompt sin error visible.
    //
    // 400ms es deliberadamente conservador: 200ms es el límite inferior
    // observado en devices viejos, así que dejamos margen. El usuario no
    // percibe la pausa porque ocurre entre dos diálogos system-modal
    // consecutivos. iOS no tiene este race (el FaceID/TouchID prompt es
    // serializado por el OS), pero el delay es inocuo allí.
    if (!kIsWeb) {
      await Future.delayed(const Duration(milliseconds: 400));
    }

    // Bug D (cont.): re-evaluar capacidad biométrica DESPUÉS del permission
    // flow.
    //
    // El initializeLocalAuth() corre al construir el cubit, antes de que
    // el usuario haya respondido al diálogo de notificaciones. En el edge
    // case "sesión guardada + permisos reseteados", esa primera
    // evaluación puede agarrar un estado transitorio del OS (ej. Android
    // todavía no ha rehidratado los providers de biometría tras reset)
    // y devolver canCheckBiometrics=false aunque el dispositivo SÍ
    // soporte. Sin re-evaluar, terminamos en _Loaded con biometricAuthEnabled=false
    // y el user nunca ve la sheet de fingerprint.
    //
    // Esta re-evaluación es defensiva: si el primer check fue correcto,
    // el segundo retorna lo mismo y no cambia el flujo. Solo "rescata"
    // los casos donde el primer check fue víctima del race.
    if (!kIsWeb && !biometricAuthEnabled) {
      try {
        final isSupported = await auth.isDeviceSupported();
        if (isSupported) {
          final canCheck = await _checkBiometrics();
          _dto = _dto.copyWith(deviceIsSupported: isSupported, canCheckBiometrics: canCheck);
          if (canCheck) {
            await _getAvailableBiometrics();
          }
        }
      } catch (e) {
        _logger.w('Re-evaluación de biometrics falló: $e');
      }

      // Si tras la re-evaluación seguimos sin biometría disponible,
      // abortamos limpiamente — no tiene sentido pedir authenticate().
      if (!biometricAuthEnabled) {
        _dto = _dto.copyWith(isAuthenticating: false);
        _authSessionService.setBiometricLoginInProgress(false);
        _authSessionService.completePendingServicesInit();
        emit(_Loaded(_dto));
        return;
      }
    }

    try {
      await auth
          .authenticate(
        localizedReason: S.current.secureAuthentication,
        options: const AuthenticationOptions(stickyAuth: true),
      )
          .then(
        (authenticated) async {
          emit(_Loading(_dto));
          _dto = _dto.copyWith(authenticated: authenticated);
          if (authenticated) {
            await _checkLoginStatusCall();
          } else {
            // Biometric was denied/cancelled. Clear the guard so that location
            // checks and notification polling can resume normally.
            _authSessionService.setBiometricLoginInProgress(false);
            // CRITICAL: reassign _dto (the field), not only the copy passed to
            // emit. The previous version emitted the new state with
            // isAuthenticating=false but left the field sitting at true, so
            // the `if (_dto.isAuthenticating) return;` guard at the top of
            // this method would short-circuit every subsequent retry —
            // including the manual tap on the fingerprint button. The only
            // way out was a swipe-kill (fresh cubit). Same bug applies to the
            // PlatformException catch block below.
            _dto = _dto.copyWith(isAuthenticating: false);
            _logger.e(S.current.unauthorizedAccess);
            emit(_Error(S.current.unauthorizedAccess, _dto));
          }
        },
      );
      return;
    } on PlatformException catch (e) {
      _logger.e('$e');
      // See comment above: reset the field, not only the emit payload.
      _dto = _dto.copyWith(isAuthenticating: false);
      // Mensaje presentable al usuario — el listener de FingerprintButtonLogin
      // ahora muestra este `msg` en un snackbar, así que NO puede ser la
      // PlatformException cruda. El detalle técnico queda en el log de arriba.
      emit(_Error(S.current.unauthorizedAccess, _dto));
      return;
    }
  }

  Future<void> _checkLoginStatusCall() async {
    // Guard: pause notifications and suppress 401 handling while the backend
    // rotates the token (deletes old token, creates new one). Without this,
    // any in-flight or polling request using the old token would receive 401
    // and trigger a false "session expired" error.
    _authSessionService.setBiometricLoginInProgress(true);

    await _meRepo.biometricLogin().then(
      (response) {
        return response.when(
          success: (userSessionDM) {
            _authSessionService
              ..setSession(userSessionDM)
              ..initializeFavorites()
              ..initializeNotifications();
            emit(_Authenticated(_dto = _dto.copyWith(userSessionDM: userSessionDM, isAuthenticating: false)));
            // Clear the biometric-login guard with a grace period so that any
            // stale in-flight responses (using the old token) that arrive after
            // this point are still suppressed by the Dio interceptor.
            Future.delayed(
              const Duration(seconds: 2),
              () => _authSessionService.setBiometricLoginInProgress(false),
            );
          },
          failure: (e) {
            _authSessionService.setBiometricLoginInProgress(false);
            _logger.e('$e');
            // El backend rechazó el biometric-login (típicamente 401: la
            // sesión cacheada ya está muerta del lado servidor — logout
            // previo, token revocado, o sesión cerrada en otro dispositivo).
            // Limpiamos la sesión persistida (RootBloc _CachedState + secure
            // storage) para que el próximo arranque NO vuelva a ofrecer
            // biometría contra un token muerto. Sin esto, el 401 se repetía
            // en cada arranque / hot-restart en loop.
            _authSessionService.clearInvalidSession();
            // CRÍTICO: reasignar el CAMPO `_dto`, no sólo la copia del emit.
            // El guard `if (_dto.isAuthenticating) return;` al tope de
            // `authenticate()` lee el campo; si queda en `true`, todo press
            // posterior del botón biométrico se corta en seco — botón muerto
            // hasta swipe-kill. Las ramas hermanas (success, biometría
            // cancelada, PlatformException) ya reasignan; ésta era la única
            // que faltaba. Además el getter `isAuthInProgress` (= este campo)
            // alimenta el watchdog de FoodlyLocationWrapper: un `true` pegado
            // ahí desincroniza otros flujos.
            _dto = _dto.copyWith(isAuthenticating: false);
            // Mensaje para el usuario, NO la excepción cruda: la sesión
            // expiró y debe entrar con usuario y contraseña. El `$e` queda
            // sólo en el log de arriba.
            emit(_Error(S.current.biometricSnackbarTextSpanB, _dto));
          },
        );
      },
    );
  }
}
