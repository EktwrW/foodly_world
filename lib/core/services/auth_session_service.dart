// ignore_for_file: unused_field

import 'dart:async' show unawaited;
import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/core/services/push_notification_service.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'package:foodly_world/data_transfer_objects/nlp_search/device_info_dto.dart';
import 'package:foodly_world/ui/shared_widgets/logout/logout_dialog_content.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
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
  bool get userIsManager => userSessionDM?.user.isManager ?? false;
  String get uuid => userSessionDM?.user.uuid ?? '';
  Map<String, String>? get authHeader => _authHeader;
  String get lang => Intl.getCurrentLocale().substring(0, 2);
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
      FirebaseCrashlytics.instance.setUserIdentifier(newUserSessionDM?.user.uuid ?? 'anonymous');
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

  /// Register the push notification service so login/logout can drive the
  /// FCM token registration lifecycle. Registered at DI time.
  void setPushNotificationService(PushNotificationService service) {
    _pushService = service;
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
    setSession(session);

    // If access token looks expired client-side, try a silent refresh first
    // using the long-lived refresh token (180 days). This is the key path
    // that keeps biometric login working after weeks of inactivity.
    if (isAccessTokenExpired && hasRefreshToken) {
      final refreshed = await silentRefresh();
      if (!refreshed) {
        hasPendingSessionRestore = false;
        _clearInvalidSession();
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
          _clearInvalidSession();
        },
      );
    } catch (_) {
      hasPendingSessionRestore = false;
      _clearInvalidSession();
    }
  }

  /// Clears session data without UI navigation (no BuildContext needed).
  /// Used when token validation fails during background restore.
  void _clearInvalidSession() {
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
    di<DialogService>().showLoading();
    final authToken = userSessionDM?.token ?? '';

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
            clearSession(context, redirectToStart: redirectToStart);
          },
        );
      });
    } else {
      if (context.mounted) {
        clearSession(context, redirectToStart: redirectToStart);
      }
    }
    di<DialogService>().hideLoading();
  }

  Future<void> clearSession(BuildContext context, {bool redirectToStart = false}) async {
    try {
      userSessionDM = null;
      _authHeader = null;
      _refreshToken = null;
      _appApiProvider.dio.options.headers.remove(FoodlyStrings.AUTHORIZATION);
      await _secureTokenService.clearAll();
      _favoritesCubit?.clearAllFavorites();
      _notificationsCubit?.clear();
      di<SocialCubit>().clear();
      di<NearbyPromotionsCubit>().clear();

      if (context.mounted) {
        context.read<RootBloc>().add(const RootEvent.userLogout());
        context.read<SmartSearchCubit>().resetToInitial();
      }

      await updateForceToLogin(true);
      if (context.mounted) exit(context, redirectToStart: redirectToStart);
    } catch (e) {
      di<Logger>().e('Error en clearSession: $e');
      // Intentar la navegación directa como fallback
      if (context.mounted) {
        context.read<SmartSearchCubit>().resetToInitial();
        di<AppRouter>().appRouter.goNamed(redirectToStart ? AppRoutes.start.name : AppRoutes.login.name);
      }
    }
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
  /// [_clearInvalidSession] above tears down cubits/widgets, and by the next
  /// frame `rootNavigatorKey.currentContext.mounted` is frequently false —
  /// which previously left the snackbar on screen and a blank page behind it
  /// (Bug E.2, 2026-04-21). The router's own state is the source of truth,
  /// so `goNamed` works without a live widget context.
  void notifyTokenExpired() {
    if (forceToLogin || _isBiometricLoginInProgress) return;
    _clearInvalidSession();

    // Navigate FIRST — always, context-independent. Even if the snackbar
    // below can't render (no live context), the user still lands on /login.
    try {
      di<AppRouter>().appRouter.goNamed(AppRoutes.login.name);
    } catch (e) {
      di<Logger>().e('notifyTokenExpired: navigation to login failed: $e');
    }

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
