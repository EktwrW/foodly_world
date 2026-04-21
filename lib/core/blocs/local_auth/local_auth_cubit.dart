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

    // Serialize behind the push-permission flow.
    //
    // Why: Android does not queue system-modal dialogs. If POST_NOTIFICATIONS
    // is still on screen (from main.dart's fire-and-forget
    // PushNotificationService.initialize()) when we ask the OS to show the
    // BiometricPrompt, Android silently rejects the biometric request —
    // authenticated=false is returned without the user ever seeing the
    // fingerprint/Face ID sheet. Reproduced on release 1.4.2+32 in the
    // 2026-04-21 edge case: logout (save session) → close app → revoke
    // notifications in Android Settings → reopen → push dialog shows →
    // approve push → biometric never appears, and the fingerprint button
    // is a no-op until the app is swipe-killed (because of the latent bug
    // below).
    //
    // The pattern mirrors FoodlyLocationWrapper — same Completer, same 5s
    // defensive timeout. If Firebase blew up inside initialize() the
    // completer still settles via the catch block, so we never hang past
    // 5s.
    if (di.isRegistered<PushNotificationService>()) {
      try {
        await di<PushNotificationService>()
            .permissionFlowComplete
            .timeout(const Duration(seconds: 5));
      } catch (_) {
        // Timeout or service missing — fall through. Worst case we hit the
        // same race once and the user has to retry; the isAuthenticating
        // reset below ensures the retry actually runs.
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
