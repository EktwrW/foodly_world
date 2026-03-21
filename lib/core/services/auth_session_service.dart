// ignore_for_file: unused_field

import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:foodly_world/core/core_exports.dart';
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
  FavoritesCubit? _favoritesCubit;
  NotificationsCubit? _notificationsCubit;

  AuthSessionService({
    required BaseConfig config,
    required MeRepo meRepo,
    required LocalStorageService localStorageService,
    required FoodlyApiProvider appApiProvider,
  })  : _config = config,
        _appApiProvider = appApiProvider,
        _meRepo = meRepo,
        _localStorageService = localStorageService;

  UserSessionDM? userSessionDM;
  Map<String, String>? _authHeader;
  bool requestBiometricAuth = false;
  bool forceToLogin = false;
  bool _isBiometricLoginInProgress = false;
  bool _pendingServicesInit = false;

  /// Device metadata — computed once at startup via [initDeviceMetadata].
  /// Available app-wide for any feature that needs to enrich API requests.
  NlpSearchPlatform? platform;
  DeviceInfoDTO? deviceInfo;

  bool get isLoggedIn => userSessionDM != null && (userSessionDM?.user.uuid?.isNotEmpty ?? false);
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
      return DateTime.now().difference(createdAt).inDays >= 30;
    } catch (_) {
      return false;
    }
  }

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
    _authHeader = {FoodlyStrings.AUTHORIZATION: '${newUserSessionDM?.tokenType} ${newUserSessionDM?.token}'};
    di<FoodlyApiProvider>().setAuthToken('${newUserSessionDM?.tokenType} ${newUserSessionDM?.token}');
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

    try {
      final result = await _meRepo.fetchLoggedUser();
      result.when(
        success: (_) {
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
        failure: (_) => _clearInvalidSession(),
      );
    } catch (_) {
      _clearInvalidSession();
    }
  }

  /// Clears session data without UI navigation (no BuildContext needed).
  /// Used when token validation fails during background restore.
  void _clearInvalidSession() {
    userSessionDM = null;
    _authHeader = null;
    _pendingServicesInit = false;
    _isBiometricLoginInProgress = false;
    _appApiProvider.dio.options.headers.remove(FoodlyStrings.AUTHORIZATION);
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
  }

  void logout(BuildContext context) {
    if (context.read<LocalAuthCubit>().biometricAuthEnabled) {
      di<DialogService>().showCustomDialog(const LogoutDialog(), 2);
    } else {
      endSession(context);
    }
  }

  void endSession(BuildContext context) async {
    di<DialogService>().showLoading();
    final authToken = userSessionDM?.token ?? '';

    if (isLoggedIn && authToken.isNotEmpty) {
      await _meRepo.logout().then((value) {
        return value.when(
          success: (_) => clearSession(context),
          failure: (e) {
            di<Logger>().e('$e');
            clearSession(context);
          },
        );
      });
    } else {
      clearSession(context);
    }
    di<DialogService>().hideLoading();
  }

  Future<void> clearSession(BuildContext context) async {
    try {
      userSessionDM = null;
      _authHeader = null;
      _appApiProvider.dio.options.headers.remove(FoodlyStrings.AUTHORIZATION);
      _favoritesCubit?.clearAllFavorites();
      _notificationsCubit?.clear();
      di<SocialCubit>().clear();
      di<NearbyPromotionsCubit>().clear();

      if (context.mounted) {
        context.read<RootBloc>().add(const RootEvent.userLogout());
        context.read<SmartSearchCubit>().resetToInitial();
      }

      await updateForceToLogin(true);
      if (context.mounted) exit(context);
    } catch (e) {
      di<Logger>().e('Error en clearSession: $e');
      // Intentar la navegación directa como fallback
      if (context.mounted) {
        context.read<SmartSearchCubit>().resetToInitial();
        di<AppRouter>().appRouter.goNamed(AppRoutes.login.name);
      }
    }
  }

  void exit(BuildContext context) {
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
            di<AppRouter>().appRouter.goNamed(AppRoutes.login.name);
          }
        });
      });
    } catch (e) {
      di<Logger>().e('Error en exit: $e');
      // Intentar navegar directamente si algo falla
      try {
        di<AppRouter>().appRouter.goNamed(AppRoutes.login.name);
      } catch (e) {
        di<Logger>().e('Error al navegar al login: $e');
      }
    }
  }

  Future<void> validateAccessToken() async {
    // Client-side check — server enforces the real expiration via Sanctum.
    // This is a fast pre-check to avoid unnecessary network calls.
  }

  /// Handles token expiration: clears session, shows a localized message,
  /// and navigates to login. Guards against re-entrancy via [forceToLogin].
  void notifyTokenExpired() {
    if (forceToLogin || _isBiometricLoginInProgress) return;
    _clearInvalidSession();

    final context = rootNavigatorKey.currentContext;
    if (context != null && context.mounted) {
      FoodlySnackbars.errorGeneric(context, S.current.sessionExpiredMessage);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          di<AppRouter>().appRouter.goNamed(AppRoutes.login.name);
        }
      });
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
