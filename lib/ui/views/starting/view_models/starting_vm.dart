import 'package:flutter/material.dart' show TextEditingController, AutovalidateMode;
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'package:foodly_world/ui/views/starting/starting_page.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'starting_vm.freezed.dart';

enum RecoverPasswordView { requestPassword, sendingRequest, passwordSent, errorRequest }

@freezed
class StartingVM with _$StartingVM {
  const StartingVM._();

  const factory StartingVM({
    @Default(StartingPageView.initial) StartingPageView currentView,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    @Default(UserSessionDM(user: UserDM(), token: '')) UserSessionDM userSessionDM,
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
    @Default(RecoverPasswordView.requestPassword) RecoverPasswordView recoverPasswordView,
    GoogleSignInAccount? googleSignInAccount,
  }) = _StartingVM;

  bool get isRequestingPassword => recoverPasswordView == RecoverPasswordView.sendingRequest;
  bool get passwordSuccessfullySent => recoverPasswordView == RecoverPasswordView.passwordSent;
  bool get errorRequestingPassword => recoverPasswordView == RecoverPasswordView.errorRequest;
  bool get willRequestPassword => recoverPasswordView == RecoverPasswordView.requestPassword;
}
