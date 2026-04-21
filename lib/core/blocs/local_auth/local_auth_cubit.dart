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
          emit(_NeedAuthentication(_dto));
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
      emit(_Error('$e', _dto));
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
            emit(_Error('$e', _dto.copyWith(isAuthenticating: false)));
          },
        );
      },
    );
  }
}
