import 'package:flutter/material.dart' show TextEditingController, AutovalidateMode;
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'package:foodly_world/ui/views/starting/starting_page.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'starting_vm.freezed.dart';

enum RecoverPasswordView { requestPassword, sendingRequest, passwordSent, errorRequest }

@freezed
abstract class StartingVM with _$StartingVM {
  const StartingVM._();

  const factory StartingVM({
    @Default(StartingPageView.initial) StartingPageView currentView,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    @Default(UserSessionDM(user: UserDM(), token: '')) UserSessionDM userSessionDM,
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
    @Default(RecoverPasswordView.requestPassword) RecoverPasswordView recoverPasswordView,
    GoogleSignInAccount? googleSignInAccount,
    // Apple solo entrega nombre/email en la PRIMERA autorización y nunca
    // dentro del identityToken (el JWT solo trae `sub` + email). Por eso los
    // capturamos del lado cliente —igual que el displayName/email de Google—
    // y los arrastramos al sign-up cuando el usuario es nuevo.
    String? appleGivenName,
    String? appleFamilyName,
    String? appleEmail,
    String? importedAvatar,
    // True solo cuando el usuario acaba de crearse vía alta social directa
    // (Apple/Google). Lo usa StartingPage para mostrar el WelcomeDialog (con la
    // guía de "migrar a cuenta empresarial") en ese primer ingreso al home, y
    // NO en logins normales posteriores.
    @Default(false) bool justSocialRegistered,
  }) = _StartingVM;

  bool get isRequestingPassword => recoverPasswordView == RecoverPasswordView.sendingRequest;
  bool get passwordSuccessfullySent => recoverPasswordView == RecoverPasswordView.passwordSent;
  bool get errorRequestingPassword => recoverPasswordView == RecoverPasswordView.errorRequest;
  bool get willRequestPassword => recoverPasswordView == RecoverPasswordView.requestPassword;
}
