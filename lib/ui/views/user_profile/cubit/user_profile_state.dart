part of 'user_profile_cubit.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState.initial(UserProfileVM vm) = _Initial;
  factory UserProfileState.loading(UserProfileVM vm) = _Loading;
  factory UserProfileState.updatingProfilePicture(UserProfileVM vm) = _UpdatingProfilePicture;
  factory UserProfileState.loaded(UserProfileVM vm) = _Loaded;
  factory UserProfileState.userUpdated(UserProfileVM vm, String msg) = _UserUpdated;
  factory UserProfileState.error(String message, UserProfileVM vm) = _Error;
}
