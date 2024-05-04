part of 'root_bloc.dart';

@freezed
class RootEvent with _$RootEvent {
  const factory RootEvent.cacheAuthSession({required UserSessionDM userSessionDM}) = _CacheAuthSession;
  const factory RootEvent.userLogout() = _UserLogout;
  const factory RootEvent.expireSession() = _ExpireSession;
}
