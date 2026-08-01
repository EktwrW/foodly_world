// ignore_for_file: unused_field

import 'dart:async' show Completer, unawaited;
import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/services/push_notification_service.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'package:foodly_world/data_transfer_objects/nlp_search/device_info_dto.dart';
import 'package:foodly_world/ui/shared_widgets/logout/logout_dialog_content.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/cubit/social_cubit.dart';
import 'package:foodly_world/ui/views/home/widgets/top_offers/cubit/nearby_promotions_cubit.dart';
import 'package:foodly_world/ui/views/starting/starting_page.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AuthSessionService {
  final BaseConfig _config;
  final LocalStorageService _localStorageService;
  final FoodlyApiProvider _appApiProvider;
  final MeRepo _meRepo;
  final SecureTokenService _secureTokenService;
  FavoritesCubit? _favoritesCubit;
  NotificationsCubit? _notificationsCubit;
  PushNotificationService? _pushService;

  /// Referencia directa al [StartingCubit] singleton (creado en main.dart),
  /// cableada vía [setStartingCubit]. Permite que el teardown de sesión
  /// devuelva la starting page a un estado renderable SIN depender de un
  /// BuildContext — ver [clearInvalidSession].
  StartingCubit? _startingCubit;

  AuthSessionService({
    required BaseConfig config,
    required MeRepo meRepo,
    required LocalStorageService localStorageService,
    required FoodlyApiProvider appApiProvider,
    required SecureTokenService secureTokenService,
  })  : _config = config,
        _appApiProvider = appApiProvider,
        _meRepo = meRepo,
        _localStorageService = localStorageService,
        _secureTokenService = secureTokenService;

  UserSessionDM? userSessionDM;
  Map<String, String>? _authHeader;
  String? _refreshToken;
  bool requestBiometricAuth = false;
  bool forceToLogin = false;
  bool _isBiometricLoginInProgress = false;
  bool _pendingServicesInit = false;
  bool _isRefreshingToken = false;
  bool _isLoggingOut = false;

  /// Modo invitado (guest browsing, App Store 5.1.1.v). Cuando es `true`, el
  /// usuario navega el descubrimiento (home, promos, negocios, menús) SIN
  /// sesión. Es efímero EN MEMORIA — no se persiste, así que un cold-start
  /// siempre cae en la starting page. Se prende en [enterGuestMode] (botón
  /// "Explorar") y se apaga al loguearse o al salir del modo invitado.
  /// NO confundir con [isLoggedIn]: un invitado es `!isLoggedIn && isGuest`.
  bool isGuest = false;

  /// Completer del veredicto de validación de la sesión cacheada del arranque.
  /// Lo completa [initializeSessionOrClear] vía su `finally`; lo consume
  /// [LocalAuthCubit.initializeLocalAuth] como gate previo al prompt biométrico.
  /// Lazy: lo crea quien lo toque primero — ambos flujos arrancan en paralelo
  /// en el boot y su orden entre sí no está garantizado.
  Completer<bool>? _sessionRestoreVerdict;

  /// Referencia directa al [RootBloc] de la app, cableada una sola vez en
  /// main.dart tras construir el bloc. Permite que el teardown de sesión
  /// limpie el estado persistido de HydratedBloc SIN depender de un
  /// BuildContext (ver [_tearDownSession]).
  RootBloc? _rootBloc;

  /// True when HydratedBloc found a cached session and async token restoration
  /// is in progress. Set synchronously in [RootBloc.fromJson] so that
  /// [LocalAuthCubit.initializeLocalAuth] can detect a restorable session
  /// before [setSession] has been called (which sets [userSessionDM]).
  /// Cleared when [initializeSessionOrClear] completes (success or failure).
  bool hasPendingSessionRestore = false;

  /// Device metadata — computed once at startup via [initDeviceMetadata].
  /// Available app-wide for any feature that needs to enrich API requests.
  NlpSearchPlatform? platform;
  DeviceInfoDTO? deviceInfo;

  bool get isLoggedIn => userSessionDM != null && (userSessionDM?.user.uuid?.isNotEmpty ?? false);

  /// Whether there is a session being restored OR already active.
  /// Use this for early checks (biometric guard) where [isLoggedIn] would
  /// return false because [setSession] hasn't been called yet.
  bool get hasSessionOrPending => isLoggedIn || hasPendingSessionRestore;

  /// True si hay sesión real O el usuario está en modo invitado. Se usa en los
  /// guards de ruteo y en los cubits del home para dejar pasar al invitado a
  /// las superficies públicas (descubrimiento) sin abrir las privadas.
  bool get hasSessionOrGuest => isLoggedIn || isGuest;

  /// Entra al modo invitado. Idempotente. Lo llama [StartingCubit.enterAsGuest]
  /// desde el botón "Explorar" de la starting page.
  void enterGuestMode() => isGuest = true;

  /// Sale del modo invitado (al loguearse o al volver a la starting page).
  void exitGuestMode() => isGuest = false;
  bool get userIsManager => userSessionDM?.user.isManager ?? false;
  String get uuid => userSessionDM?.user.uuid ?? '';
  Map<String, String>? get authHeader => _authHeader;
  String get lang => Intl.getCurrentLocale().substring(0, 2);
  String get currency => userSessionDM?.user.business.firstOrNull?.country?.currencySymbol ?? '\$';
  bool get isAccessTokenExpired {
    if (!isLoggedIn) return false;
    final createdAtStr = userSessionDM?.tokedCreatedAt;
    if (createdAtStr == null || createdAtStr.isEmpty) return false;
    try {
      final createdAt = DateTime.parse(createdAtStr);
      // Access token lives 24h (server-side). Use 23h client-side to
      // trigger refresh before the server rejects the token.
      return DateTime.now().difference(createdAt).inHours >= 23;
    } catch (_) {
      return false;
    }
  }

  bool get hasRefreshToken => _refreshToken != null && _refreshToken!.isNotEmpty;
  bool get isRefreshingToken => _isRefreshingToken;

  bool get mustCompleteProfile => false; //TODO: HW - define the logic to get this value

  /// Detects and caches platform + device metadata once at app startup.
  /// Safe to call without await — failures are swallowed to never block startup.
  Future<void> initDeviceMetadata() async {
    platform = _resolvePlatform();

    String? model;
    String? osVersion;
    String? appVersion;

    try {
      final plugin = DeviceInfoPlugin();
      if (kIsWeb) {
        model = (await plugin.webBrowserInfo).browserName.name;
      } else if (Platform.isAndroid) {
        model = (await plugin.androidInfo).model;
      } else if (Platform.isIOS) {
        model = (await plugin.iosInfo).utsname.machine;
      } else if (Platform.isMacOS) {
        model = (await plugin.macOsInfo).model;
      } else if (Platform.isWindows) {
        model = (await plugin.windowsInfo).computerName;
      } else if (Platform.isLinux) {
        model = (await plugin.linuxInfo).name;
      }
    } catch (_) {}

    if (!kIsWeb) {
      try {
        osVersion = Platform.operatingSystemVersion;
      } catch (_) {}
    }

    try {
      appVersion = (await PackageInfo.fromPlatform()).version;
    } catch (_) {}

    deviceInfo = DeviceInfoDTO(model: model, osVersion: osVersion, appVersion: appVersion);
  }

  NlpSearchPlatform _resolvePlatform() {
    if (kIsWeb) return NlpSearchPlatform.web;
    if (Platform.isAndroid) return NlpSearchPlatform.android;
    if (Platform.isIOS) return NlpSearchPlatform.ios;
    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) return NlpSearchPlatform.desktop;
    return NlpSearchPlatform.unknown;
  }

  bool get isBiometricLoginInProgress => _isBiometricLoginInProgress;

  /// True desde el inicio de [endSession] hasta el próximo login válido
  /// ([setSession] con sesión válida lo resetea). El interceptor Dio lo
  /// consulta para que, durante el cierre de sesión, un 401 NO dispare
  /// `silentRefresh` (→ `setSession` → `saveTokens` repoblaría el secure
  /// storage recién limpiado) NI `notifyTokenExpired` (→ modal "sesión
  /// expirada"). Mismo patrón de guard que [isBiometricLoginInProgress].
  bool get isLoggingOut => _isLoggingOut;

  void updateBiometricAuth(bool newValue) => requestBiometricAuth = newValue;

  Future<void> updateForceToLogin(bool newValue) async => forceToLogin = newValue;

  /// Guards biometric login against 401 race conditions.
  /// When true, the Dio interceptor suppresses [notifyTokenExpired] because
  /// the backend is rotating the token (old one deleted, new one in-flight).
  void setBiometricLoginInProgress(bool value) {
    _isBiometricLoginInProgress = value;
    if (value) {
      _notificationsCubit?.pausePolling();
    }
  }

  /// Completes deferred favorites/notifications initialization.
  /// Called when biometric auth turns out to not be needed (device doesn't
  /// support it or no biometrics enrolled) but the token was already validated.
  void completePendingServicesInit() {
    if (_pendingServicesInit) {
      _pendingServicesInit = false;
      initializeFavorites();
      initializeNotifications();
    }
  }

  void setSession(UserSessionDM? newUserSessionDM) {
    userSessionDM = newUserSessionDM;

    // Bug E (2026-05-06): cuando recibimos una sesión válida nueva (uuid
    // no vacío), bajamos forceToLogin. Sin esto, si un boot anterior dejó
    // el flag en true (initializeSessionOrClear → 401 → clearInvalidSession
    // setea forceToLogin=true sin postFrame que lo baje), un re-login
    // exitoso (Google sign-in, email/password, biométrico) deja el flag
    // arriba y el GoRouter redirector tira al user de vuelta a /login en
    // la siguiente navegación. Loop sin escape.
    //
    // La invariante es simple: tener tokens válidos ⇒ NO force-to-login.
    // Anclar el reset acá garantiza que TODO callsite que crea sesión
    // (login, socialLogin, biometricLogin, silentRefresh) lo arregla en
    // un solo lugar — antes había que recordar de bajar el flag manualmente
    // en cada callsite, y los olvidos causaban este bug.
    if (newUserSessionDM != null && (newUserSessionDM.user.uuid?.isNotEmpty ?? false)) {
      forceToLogin = false;
      // Un login válido (email/password, Google, Apple, biométrico, silent
      // refresh) cancela cualquier guard de logout pendiente.
      _isLoggingOut = false;
      // Un login real cierra el modo invitado: a partir de acá hay sesión.
      isGuest = false;

      // App Links F3a: el canje del código de join pendiente ya NO vive acá.
      // El postFrame perdía la carrera contra el bootstrap del login (que
      // navega a home al final y pisaba la navegación a la orden). Ahora el
      // redirect global de GoRouter desvía cualquier navegación post-login
      // a /join/{code} cuando hay código estacionado — sin carreras.
    }

    // Prefer access_token (new dual-token field); fall back to token (legacy).
    final activeToken = newUserSessionDM?.accessToken ?? newUserSessionDM?.token;
    final tokenType = newUserSessionDM?.tokenType ?? 'Bearer';

    _authHeader = {FoodlyStrings.AUTHORIZATION: '$tokenType $activeToken'};
    di<FoodlyApiProvider>().setAuthToken('$tokenType $activeToken');

    // Store the refresh token separately — it must survive session copyWith
    // operations that don't carry it (e.g. user profile updates).
    if (newUserSessionDM?.refreshToken != null && newUserSessionDM!.refreshToken!.isNotEmpty) {
      _refreshToken = newUserSessionDM.refreshToken;
    }

    // Persist tokens to secure storage (Keychain / EncryptedSharedPreferences).
    // Fire-and-forget — failures are non-fatal for the current session.
    if (activeToken != null && activeToken.isNotEmpty) {
      _secureTokenService.saveTokens(
        accessToken: activeToken,
        refreshToken: _refreshToken ?? '',
        tokenType: tokenType,
        tokenCreatedAt: newUserSessionDM?.tokedCreatedAt,
      );
    }

    if (!kIsWeb) {
      // Defensa: si Crashlytics no está inicializado (Firebase boot falló,
      // o estamos corriendo bajo flutter_test sin Firebase mock) no debe
      // tumbar el flujo de setSession. Es un side-effect informativo —
      // saber el uid en los crash reports es útil pero NO crítico para el
      // ciclo de vida de la sesión.
      try {
        FirebaseCrashlytics.instance.setUserIdentifier(newUserSessionDM?.user.uuid ?? 'anonymous');
      } catch (_) {
        // No-op por diseño.
      }
    }
  }

  void setBusinesses(List<BusinessDM> businesses) => userSessionDM != null
      ? userSessionDM = userSessionDM?.copyWith(user: userSessionDM!.user.copyWith(business: businesses))
      : null;

  void setFavoritesCubit(FavoritesCubit cubit) {
    _favoritesCubit = cubit;
  }

  void setNotificationsCubit(NotificationsCubit cubit) {
    _notificationsCubit = cubit;
  }

  /// Registra el [StartingCubit] de la app. Se cablea una vez en main.dart,
  /// dentro del `create` de su [BlocProvider]. Permite que [clearInvalidSession]
  /// resetee la vista de la starting page sin un BuildContext.
  void setStartingCubit(StartingCubit cubit) {
    _startingCubit = cubit;
  }

  /// Register the push notification service so login/logout can drive the
  /// FCM token registration lifecycle. Registered at DI time.
  void setPushNotificationService(PushNotificationService service) {
    _pushService = service;
  }

  /// Registers the app's [RootBloc] so session teardown can clear the
  /// persisted HydratedBloc session WITHOUT a BuildContext. Wired once at
  /// startup in main.dart, right after RootBloc is constructed.
  void setRootBloc(RootBloc bloc) {
    _rootBloc = bloc;
  }

  /// Future que resuelve cuando termina la validación de la sesión cacheada
  /// del arranque ([initializeSessionOrClear]): `true` = sesión válida (o
  /// refrescada con éxito), `false` = sesión inválida y limpiada.
  ///
  /// [LocalAuthCubit.initializeLocalAuth] lo espera ANTES de ofrecer el prompt
  /// biométrico: sin esto se pedía huella sobre un token ya muerto en el BE y,
  /// tras autenticar, `biometricLogin()` recibía 401 y la app caía a starting
  /// page (bug 2026-05-22). El acceso es lazy — crea el [Completer] si aún no
  /// existe — para tolerar que `initializeLocalAuth` lo espere antes de que
  /// `initializeSessionOrClear` haya arrancado.
  Future<bool> get sessionRestoreVerdict =>
      (_sessionRestoreVerdict ??= Completer<bool>()).future;

  /// Completa el veredicto de [sessionRestoreVerdict] de forma idempotente:
  /// es seguro llamarlo más de una vez — los `complete` posteriores se ignoran.
  void _completeSessionRestoreVerdict(bool valid) {
    final completer = _sessionRestoreVerdict ??= Completer<bool>();
    if (!completer.isCompleted) completer.complete(valid);
  }

  /// Validates the cached token via a lightweight API call, then initializes
  /// favorites/notifications if valid. If invalid, clears session and forces login.
  /// Called from [RootBloc.fromJson()] — runs async in background (fire-and-forget).
  ///
  /// When [requestBiometricAuth] is true (native platforms), services initialization
  /// is deferred to avoid a race condition: the biometric login endpoint rotates the
  /// token (deletes old, creates new), and any in-flight request using the old token
  /// would receive 401 → triggering a false "session expired" error.
  /// Services are started later by [_checkLoginStatusCall] (biometric success) or
  /// [completePendingServicesInit] (biometric not available).
  Future<void> initializeSessionOrClear(UserSessionDM session) async {
    try {
      await _validateRestoredSession(session);
    } finally {
      // Veredicto para el gate biométrico de [LocalAuthCubit]: si tras validar
      // seguimos logueados, la sesión era válida; si fue limpiada
      // (`clearInvalidSession` → `userSessionDM = null`), `isLoggedIn` es false.
      // Una sola línea cubre TODOS los exit paths del método interno: éxito,
      // fallo de `fetchLoggedUser`, refresh fallido con `return` temprano, o
      // excepción no controlada.
      _completeSessionRestoreVerdict(isLoggedIn);
    }
  }

  Future<void> _validateRestoredSession(UserSessionDM session) async {
    setSession(session);

    // If access token looks expired client-side, try a silent refresh first
    // using the long-lived refresh token (180 days). This is the key path
    // that keeps biometric login working after weeks of inactivity.
    if (isAccessTokenExpired && hasRefreshToken) {
      final refreshed = await silentRefresh();
      if (!refreshed) {
        hasPendingSessionRestore = false;
        clearInvalidSession();
        return;
      }
    }

    try {
      final result = await _meRepo.fetchLoggedUser();
      result.when(
        success: (_) {
          hasPendingSessionRestore = false;
          // By the time this callback runs, updateBiometricAuth(true) has
          // already executed (it's synchronous and called right after this
          // async method in fromJson). On native, defer services to avoid
          // the token-rotation race condition during biometric login.
          if (requestBiometricAuth) {
            _pendingServicesInit = true;
          } else {
            initializeFavorites();
            initializeNotifications();
          }
        },
        failure: (_) {
          hasPendingSessionRestore = false;
          clearInvalidSession();
        },
      );
    } catch (_) {
      hasPendingSessionRestore = false;
      clearInvalidSession();
    }
  }

  /// Clears session data without UI navigation (no BuildContext needed).
  ///
  /// Used cuando una sesión cacheada resulta inválida: falla la validación
  /// del token en el restore de fondo ([initializeSessionOrClear]), o el
  /// backend rechaza el `biometric-login` con 401
  /// ([LocalAuthCubit._checkLoginStatusCall]).
  ///
  /// Limpia también el estado persistido de HydratedBloc (`userLogout` vía
  /// [_rootBloc]). Sin esto, una sesión muerta del lado servidor quedaba en
  /// el `_CachedState` y CADA arranque volvía a ofrecer login biométrico
  /// contra un token que el backend ya rechazó → loop 401 → starting page.
  void clearInvalidSession() {
    userSessionDM = null;
    _authHeader = null;
    _refreshToken = null;
    _pendingServicesInit = false;
    _isBiometricLoginInProgress = false;
    _isRefreshingToken = false;
    _appApiProvider.dio.options.headers.remove(FoodlyStrings.AUTHORIZATION);
    _secureTokenService.clearAll(); // fire-and-forget
    _favoritesCubit?.clearAllFavorites();
    _notificationsCubit?.clear();

    // Devuelve la starting page a un estado renderable. Tras un login, el
    // StartingCubit singleton queda en `_UserAuthenticated`; StartingPage369
    // sólo pinta contenido para los estados loading/welcome/error y cae a
    // `SizedBox.expand()` (pantalla en blanco) para cualquier otro. Si una
    // sesión se invalida en runtime (401 multi-dispositivo → notifyTokenExpired)
    // y se navega a la starting page con el cubit todavía en
    // `_UserAuthenticated`, el usuario ve el snackbar de "sesión expirada"
    // sobre una pantalla vacía. `setView(initial)` emite `_Welcome`, que sí
    // renderiza. Es el mismo reset que ya hace `exit()` en el logout manual;
    // acá lo replicamos para el logout automático. Idempotente en el boot
    // (el cubit recién creado ya está en `_Welcome`).
    _startingCubit?.setView(StartingPageView.initial);

    _rootBloc?.add(const RootEvent.userLogout());
    forceToLogin = true;
  }

  void initializeFavorites() {
    if (isLoggedIn && _favoritesCubit != null) {
      _favoritesCubit!
        ..initFromUserDM()
        ..loadFavoriteObjects()
        ..initPageController();
    }
  }

  void initializeNotifications() {
    if (isLoggedIn && _notificationsCubit != null) {
      _notificationsCubit!.initialize();
    }
    // Register current FCM token with the BE so this session can receive push.
    // Fire-and-forget — silent-failure-by-design (see PushNotificationService).
    if (isLoggedIn && _pushService != null) {
      unawaited(_pushService!.registerCurrentToken());
    }
  }

  void logout(BuildContext context) {
    if (context.read<LocalAuthCubit>().biometricAuthEnabled) {
      di<DialogService>().showCustomDialog(const LogoutDialog(), 2);
    } else {
      endSession(context);
    }
  }

  void endSession(BuildContext context, {bool redirectToStart = false}) async {
    // Guard de logout en curso. Se activa ANTES de cualquier await/red para
    // que el interceptor Dio (DioRequestHandler) sepa que estamos cerrando
    // sesión: en esta ventana un 401 de una request concurrente (polling,
    // re-registro del token FCM, etc.) NO debe disparar silentRefresh
    // —que vía setSession→saveTokens repoblaría el secure storage recién
    // limpiado— ni notifyTokenExpired. Se resetea en setSession al
    // re-loguearse.
    _isLoggingOut = true;

    di<DialogService>().showLoading();

    // accessToken ?? token: tras el refactor dual-token el BE puede devolver
    // sólo `access_token` (sin el legacy `token`). Leer únicamente `.token`
    // dejaba `authToken` vacío tras un login biométrico → se tomaba la rama
    // `else` y `_meRepo.logout()` (logout del lado servidor) nunca corría.
    // Se usa el mismo orden de preferencia que setSession.
    final authToken = userSessionDM?.accessToken ?? userSessionDM?.token ?? '';

    // Unregister the FCM token BEFORE hitting the logout endpoint — the
    // DELETE /device-tokens/unregister call needs the still-valid Bearer
    // token to authenticate. Order matters: if we cleared the header first,
    // the BE would return 401 and the token row would linger server-side.
    if (isLoggedIn && _pushService != null) {
      await _pushService!.unregisterCurrentToken();
    }

    if (isLoggedIn && authToken.isNotEmpty) {
      await _meRepo.logout().then((value) {
        return value.when(
          success: (_) => clearSession(context, redirectToStart: redirectToStart),
          failure: (e) {
            di<Logger>().e('$e');
            return clearSession(context, redirectToStart: redirectToStart);
          },
        );
      });
    } else {
      // clearSession ya es tolerante a contexto desmontado: el teardown de
      // sesión corre SIEMPRE y sólo la navegación depende del contexto.
      if (context.mounted) {
        await clearSession(context, redirectToStart: redirectToStart);
      }
    }
    di<DialogService>().hideLoading();
  }

  /// Desmonta la sesión y navega fuera.
  ///
  /// El teardown de ESTADO ([_tearDownSession]) corre SIEMPRE, sea cual sea
  /// el estado del `context`. Sólo la navegación final depende de que haya
  /// un widget vivo — y si no lo hay, se navega directo por el router.
  Future<void> clearSession(BuildContext context, {bool redirectToStart = false}) async {
    try {
      await _tearDownSession();
    } catch (e) {
      di<Logger>().e('Error en _tearDownSession: $e');
    }

    // Navegación. exit() ya trae su propio try/catch con fallback al router.
    try {
      if (context.mounted) {
        exit(context, redirectToStart: redirectToStart);
      } else {
        // Sin contexto vivo: el estado del router es la fuente de verdad,
        // así que navegamos directo. Bajamos forceToLogin en post-frame,
        // igual que hace notifyTokenExpired, para que el redirector global
        // resuelva el redirect inicial pero después deje re-loguear.
        di<AppRouter>().appRouter.goNamed(redirectToStart ? AppRoutes.start.name : AppRoutes.login.name);
        di<AppRouter>().clearRouteHistory();
        WidgetsBinding.instance.addPostFrameCallback((_) => forceToLogin = false);
      }
    } catch (e) {
      di<Logger>().e('Error en la navegación de clearSession: $e');
    }

    // Reset de la barra de búsqueda — cosmético, best-effort. Aislado y
    // DESPUÉS de la navegación para que un ProviderNotFound (el contexto del
    // LogoutDialog puede no colgar del provider) nunca aborte el logout.
    if (context.mounted) {
      try {
        context.read<SmartSearchCubit>().resetToInitial();
      } catch (e) {
        di<Logger>().w('clearSession: no se pudo resetear SmartSearchCubit: $e');
      }
    }
  }

  /// Teardown de sesión SIN dependencia de BuildContext: anula el estado en
  /// memoria, borra los tokens del secure storage, limpia los cubits y —
  /// clave — limpia el estado persistido de [RootBloc] vía la referencia
  /// directa [_rootBloc] (NO `context.read`), de modo que el `_CachedState`
  /// de HydratedBloc se borra aunque ningún widget esté montado.
  ///
  /// Antes este paso vivía dentro de `if (context.mounted)` en clearSession:
  /// si el contexto del LogoutDialog estaba desmontado tras los awaits del
  /// flujo de logout, `RootEvent.userLogout` nunca se despachaba, HydratedBloc
  /// conservaba la sesión vieja, y al reabrir la app restauraba una sesión
  /// fantasma → 401 → modal "sesión expirada".
  Future<void> _tearDownSession() async {
    userSessionDM = null;
    _authHeader = null;
    _refreshToken = null;
    _appApiProvider.dio.options.headers.remove(FoodlyStrings.AUTHORIZATION);
    await _secureTokenService.clearAll();
    _favoritesCubit?.clearAllFavorites();
    _notificationsCubit?.clear();
    di<SocialCubit>().clear();
    di<NearbyPromotionsCubit>().clear();
    // Bug e2e 2026-07-31: el carrito de orden grupal es singleton en memoria
    // y sobrevivía al logout — el siguiente usuario del MISMO dispositivo
    // heredaba la orden ajena ("Ver pedido" → 403, círculo vicioso). end()
    // además retira la notificación ongoing de Android vía onChange.
    di<ActiveGroupOrderCubit>().end();
    _rootBloc?.add(const RootEvent.userLogout());
    forceToLogin = true;
  }

  void exit(BuildContext context, {bool redirectToStart = false}) {
    try {
      // Limpiar el estado de autenticación
      context.read<MainDrawerCubit>().updateSelectedIndex(0);
      context.read<StartingCubit>().setView(StartingPageView.initial);

      // Actualizar el estado de forceToLogin antes de la navegación
      updateForceToLogin(false).then((_) {
        // Usar addPostFrameCallback para asegurar que la navegación ocurra después
        // de que todos los estados se hayan actualizado
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            di<AppRouter>().appRouter.goNamed(redirectToStart ? AppRoutes.start.name : AppRoutes.login.name);
            di<AppRouter>().clearRouteHistory();
          }
        });
      });
    } catch (e) {
      di<Logger>().e('Error en exit: $e');
      // Intentar navegar directamente si algo falla
      try {
        di<AppRouter>().appRouter.goNamed(redirectToStart ? AppRoutes.start.name : AppRoutes.login.name);
      } catch (e) {
        di<Logger>().e('Error al navegar al login: $e');
      }
    }
  }

  /// Restores tokens from secure storage into an existing [UserSessionDM].
  /// Called from [RootBloc.fromJson()] when HydratedBloc restores user data
  /// but the persisted JSON no longer contains tokens (stripped in toJson).
  /// Also handles one-time migration from HydratedBloc plaintext tokens to
  /// secure storage for users upgrading from a pre-Phase-3 build.
  Future<UserSessionDM?> restoreTokensFromSecureStorage(UserSessionDM session) async {
    final storedAccess = await _secureTokenService.accessToken;
    final storedRefresh = await _secureTokenService.refreshToken;
    final storedType = await _secureTokenService.tokenType;
    final storedCreatedAt = await _secureTokenService.tokenCreatedAt;

    if (storedAccess != null && storedAccess.isNotEmpty) {
      // Tokens found in secure storage — restore them into the session.
      return session.copyWith(
        token: storedAccess,
        accessToken: storedAccess,
        refreshToken: storedRefresh,
        tokenType: storedType ?? session.tokenType ?? 'Bearer',
        tokedCreatedAt: storedCreatedAt ?? session.tokedCreatedAt,
      );
    }

    // One-time migration: tokens still in HydratedBloc (plaintext), not yet
    // in secure storage. Move them over and return the session as-is.
    if (session.token != null && session.token!.isNotEmpty) {
      await _secureTokenService.saveTokens(
        accessToken: session.accessToken ?? session.token!,
        refreshToken: session.refreshToken ?? session.token!,
        tokenType: session.tokenType ?? 'Bearer',
        tokenCreatedAt: session.tokedCreatedAt,
      );
      _refreshToken = session.refreshToken ?? session.token;
      return session;
    }

    // No tokens anywhere — session is invalid.
    return null;
  }

  Future<void> validateAccessToken() async {
    // Client-side check — server enforces the real expiration via Sanctum.
    // This is a fast pre-check to avoid unnecessary network calls.
  }

  /// Silently refreshes the access token using the stored refresh token.
  /// Returns true on success, false on failure (refresh token also expired).
  /// Prevents concurrent refresh attempts via [_isRefreshingToken] guard.
  Future<bool> silentRefresh() async {
    if (_isRefreshingToken) return false;
    if (!hasRefreshToken) return false;

    _isRefreshingToken = true;
    try {
      // Temporarily set the refresh token as the active auth header so the
      // /token/refresh endpoint receives it as the Bearer token.
      final tokenType = userSessionDM?.tokenType ?? 'Bearer';
      di<FoodlyApiProvider>().setAuthToken('$tokenType $_refreshToken');

      final result = await _meRepo.refreshToken();
      return result.when(
        success: (newSession) {
          setSession(newSession);
          return true;
        },
        failure: (_) {
          return false;
        },
      );
    } catch (_) {
      return false;
    } finally {
      _isRefreshingToken = false;
    }
  }

  /// Handles token expiration: clears session, shows a localized message,
  /// and navigates to login. Guards against re-entrancy via [forceToLogin].
  ///
  /// Navigation uses the router directly (not a BuildContext) because
  /// [clearInvalidSession] above tears down cubits/widgets, and by the next
  /// frame `rootNavigatorKey.currentContext.mounted` is frequently false —
  /// which previously left the snackbar on screen and a blank page behind it
  /// (Bug E.2, 2026-04-21). The router's own state is the source of truth,
  /// so `goNamed` works without a live widget context.
  ///
  /// IMPORTANT: [forceToLogin] is reset to `false` on the post-frame callback
  /// after the login redirect lands. Without this, the global redirector in
  /// [AppRouter] keeps returning `/login` for every subsequent navigation —
  /// including the user successfully logging back in. The original code only
  /// reset the flag from [exit] (manual logout), so an automatic 401 path
  /// left the app in a permanent "always-redirect-to-login" state, which
  /// rendered as a blank page on top of `/login` once the route's widgets
  /// tried to read the now-null userSessionDM. The flag did its job (block
  /// re-entrancy and force the initial redirect); after the redirect
  /// completes, we have to clear it so the router can move on.
  void notifyTokenExpired() {
    // _isLoggingOut: durante un cierre de sesión, un 401 es esperado (el
    // server ya invalidó el token) — no es una expiración que merezca el
    // modal. Defensa en profundidad: el interceptor ya no debería llamar
    // acá durante el logout, pero el guard lo cubre igual.
    if (forceToLogin || _isBiometricLoginInProgress || _isLoggingOut) return;

    // Bug H (2026-06-01, descubierto post-go-live 1.6.4 en Play Store): un
    // 401 ocurrido cuando NUNCA hubo sesión (cold-start post-instalación sin
    // login previo) NO es una expiración — es ausencia de credenciales.
    // Algún Bloc/Cubit dispara un endpoint authed (no whitelisted en
    // DioRequestHandler) antes de que el user se loguée, el server responde
    // 401 correctamente y el ErrorInterceptor cae acá. Sin este guard
    // pintamos un modal "Tu sesión ha expirado" sobre la welcome screen,
    // arruinando la primera impresión.
    //
    // La fix complementaria es localizar el cubit que inicializa pidiendo
    // un endpoint authed pre-login y agregarle su propio guard de
    // `isLoggedIn`, pero este check es DEFENSA EN PROFUNDIDAD: cubre los 4
    // call sites de DioRequestHandler (request/error × refresh-failed/
    // sin-refresh) y cualquier futuro path que invoque notifyTokenExpired
    // sin haberse asegurado primero de que había sesión.
    //
    // No usamos `userSessionDM != null` (más permisivo) porque una restoración
    // parcial podría dejar un dm con uuid vacío — `isLoggedIn` es el getter
    // canónico que ya combina ambos checks. Una sesión legítimamente expirada
    // (token vencido, dm populado con uuid no vacío) sigue gatillando el
    // modal como antes.
    if (!isLoggedIn) return;

    clearInvalidSession();

    // Navigate FIRST — always, context-independent. Even if the snackbar
    // below can't render (no live context), the user still lands on /login.
    try {
      di<AppRouter>().appRouter.goNamed(AppRoutes.login.name);
    } catch (e) {
      di<Logger>().e('notifyTokenExpired: navigation to login failed: $e');
    }

    // Reset the gate after the navigation has been resolved by the router.
    // Doing it on the post-frame callback (instead of synchronously) ensures
    // the global redirector still sees `forceToLogin == true` during the
    // initial redirect resolution; only AFTER /login is mounted do we let
    // the flag fall back to false so the user can log back in normally.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      forceToLogin = false;
    });

    // Best-effort snackbar. If the context is still mounted the user gets the
    // explanatory message; if not, we've at least taken them to login so
    // they're not stuck on a blank screen.
    final context = rootNavigatorKey.currentContext;
    if (context != null && context.mounted) {
      FoodlySnackbars.errorGeneric(context, S.current.sessionExpiredMessage);
    }
  }

  void notifyInternalServerError(DioException dioException) {
    di<Logger>().e('Internal server error: ${dioException.message}');
  }

  bool hasAccessToModule(ModuleGuardType module) {
    switch (module) {
      case ModuleGuardType.home:
        return [UserRole.admin, UserRole.owner, UserRole.customer].contains(userSessionDM?.user.roleId);

      case ModuleGuardType.business:
        return [UserRole.admin, UserRole.owner].contains(userSessionDM?.user.roleId);

      case ModuleGuardType.menu:
        return true;

      case ModuleGuardType.accountSettings:
        return [UserRole.admin, UserRole.owner, UserRole.customer].contains(userSessionDM?.user.roleId);

      case ModuleGuardType.unknown:
        return false;
    }
  }
}
