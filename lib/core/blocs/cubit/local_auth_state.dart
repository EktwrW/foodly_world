part of 'local_auth_cubit.dart';

@freezed
class LocalAuthState with _$LocalAuthState {
  const factory LocalAuthState.initial(LocalAuthDTO localAuthDTO) = _Initial;
  const factory LocalAuthState.loading(LocalAuthDTO localAuthDTO) = _Loading;
  const factory LocalAuthState.loaded(LocalAuthDTO localAuthDTO) = _Loaded;
  const factory LocalAuthState.needAuthentication(LocalAuthDTO localAuthDTO) = _NeedAuthentication;
  const factory LocalAuthState.credentialsNotAvailable(LocalAuthDTO localAuthDTO) = _CredentialsNotAvailable;
  const factory LocalAuthState.authenticated(LocalAuthDTO localAuthDTO) = _Authenticated;
  const factory LocalAuthState.error(String msg, LocalAuthDTO localAuthDTO) = _Error;
}
