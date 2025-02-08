part of 'root_bloc.dart';

@freezed
class RootState with _$RootState {
  const RootState._();

  const factory RootState.initial() = _Initial;
  const factory RootState.cachedState({required UserSessionDM userSessionDM}) = _CachedState;
  const factory RootState.userLoggedOut() = _UserLoggedOut;
  const factory RootState.sessionExpired() = _SessionExpired;

  factory RootState.fromJson(Map<String, Object?> json) => _$RootStateFromJson(json);
}
