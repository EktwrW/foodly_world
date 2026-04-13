import 'dart:async' show unawaited;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'root_event.dart';
part 'root_state.dart';
part 'root_bloc.freezed.dart';
part 'root_bloc.g.dart';

/// RootBloc is used to handle user caching state, don't use it for anything else.
class RootBloc extends HydratedBloc<RootEvent, RootState> {
  final AuthSessionService _authSessionService;

  RootBloc({required AuthSessionService authSessionService})
      : _authSessionService = authSessionService,
        super(const _Initial()) {
    on<RootEvent>((event, emit) async {
      await event.when(
        cacheAuthSession: (userSessionDM) {
          emit(_CachedState(userSessionDM: userSessionDM));
        },
        userLogout: () async {
          emit(const _UserLoggedOut());
          emit(const _Initial());
        },
        expireSession: () {
          emit(const _SessionExpired());
          emit(const _Initial());
        },
      );
    });
  }

  @override
  RootState? fromJson(Map<String, dynamic> json) {
    try {
      final cachedState = _CachedState.fromJson(json);

      // Signal that a session restore is in progress BEFORE the async call.
      // This lets LocalAuthCubit.initializeLocalAuth() detect a restorable
      // session and activate the biometric guard even though setSession()
      // hasn't been called yet (isLoggedIn is still false at this point).
      _authSessionService.hasPendingSessionRestore = true;

      // Restore tokens from secure storage (Keychain / EncryptedSharedPrefs)
      // into the session, then validate. This is async but fire-and-forget
      // because the UI doesn't depend on the token being ready synchronously
      // — the biometric login flow will handle re-auth if needed.
      unawaited(_restoreAndInitialize(cachedState.userSessionDM));

      // Only expect biometric auth on native platforms (iOS/Android).
      // On web, services init proceeds immediately in initializeSessionOrClear.
      if (!kIsWeb) _authSessionService.updateBiometricAuth(true);
      return cachedState;
    } catch (e) {
      return null;
    }
  }

  /// Restores tokens from secure storage, then validates the session.
  Future<void> _restoreAndInitialize(UserSessionDM session) async {
    final restoredSession = await _authSessionService.restoreTokensFromSecureStorage(session);
    if (restoredSession != null) {
      _authSessionService.initializeSessionOrClear(restoredSession);
    } else {
      // No tokens found — session is invalid.
      _authSessionService.hasPendingSessionRestore = false;
      _authSessionService.notifyTokenExpired();
    }
  }

  @override
  Map<String, dynamic>? toJson(RootState state) {
    final json = state.toJson();
    // Strip sensitive token fields from the persisted state.
    // Tokens are now stored in SecureTokenService (Keychain / EncryptedSharedPrefs)
    // and restored via restoreTokensFromSecureStorage() in fromJson().
    if (json.containsKey('userSessionDM')) {
      final sessionMap = json['userSessionDM'];
      if (sessionMap is Map<String, dynamic>) {
        sessionMap.remove('token');
        sessionMap.remove('access_token');
        sessionMap.remove('refresh_token');
        // Keep token_type and token_created_at — they're non-sensitive metadata.
      }
    }
    return json;
  }
}
