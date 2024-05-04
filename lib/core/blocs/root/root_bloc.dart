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
      _authSessionService.setSession(cachedState.userSessionDM);
      _authSessionService.updateBiometricAuth(true);
      return cachedState;
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(RootState state) => state.toJson();
}
