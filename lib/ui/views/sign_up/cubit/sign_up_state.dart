part of 'sign_up_cubit.dart';

@freezed
sealed class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.loading(UserProfileVM signUpVM) = _Loading;
  const factory SignUpState.loaded(UserProfileVM signUpVM) = _Loaded;
  const factory SignUpState.userCreated(UserProfileVM signUpVM) = _UserCreated;
  const factory SignUpState.businessCreationFinished(UserProfileVM signUpVM) = _BusinessCreationFinished;
  const factory SignUpState.error(String msg, UserProfileVM signUpVM) = _Error;
}
