part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.loading(SignUpVM signUpVM) = _Loading;
  const factory SignUpState.loaded(SignUpVM signUpVM) = _Loaded;
  const factory SignUpState.userCreated(SignUpVM signUpVM) = _UserCreated;
  const factory SignUpState.businessCreated(SignUpVM signUpVM) = _BusinessCreated;
  const factory SignUpState.error(String msg, SignUpVM signUpVM) = _Error;
}
