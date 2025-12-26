import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart' show FlutterNativeSplash;
import 'package:foodly_world/core/core_exports.dart' show AuthSessionService, BaseConfig, FoodlyStrings, MeRepo, di;

import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'package:foodly_world/data_transfer_objects/user/auth_social_login_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_body_login_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_recover_password_dto.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/utils/split_name.dart';
import 'package:foodly_world/ui/views/starting/starting_page.dart';
import 'package:foodly_world/ui/views/starting/view_models/starting_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:universal_io/io.dart';

part 'starting_cubit.freezed.dart';
part 'starting_state.dart';

class StartingCubit extends Cubit<StartingState> {
  final AuthSessionService _authSessionService;
  final Logger _logger;
  final MeRepo _meRepo;
  final _googleSignIn = GoogleSignIn(
    clientId: Platform.isIOS || kIsWeb ? di<BaseConfig>().googleSignInClientId : null,
    scopes: FoodlyStrings.GOOGLE_SIGN_IN_SCOPES,
  );

  StartingVM _vm;
  GoogleSignInAccount? get googleSignInAccount => _vm.googleSignInAccount;

  StartingCubit(
    AuthSessionService authSessionService,
    Logger logger,
    MeRepo meRepo,
  )   : _authSessionService = authSessionService,
        _logger = logger,
        _meRepo = meRepo,
        _vm = StartingVM(
          emailController: TextEditingController(text: 'hwald@mailinator.com'),
          passwordController: TextEditingController(text: 'Niko_2018'),
          // emailController: TextEditingController(text: 'jh@mailinator.com'), //client user
          // passwordController: TextEditingController(text: 'Niko_2018'),
        ),
        super(const StartingState.initial()) {
    if (kIsWeb) FlutterNativeSplash.remove();
    setView(StartingPageView.initial);
  }

  void googleSignIn() async {
    try {
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }
      final signIn = await _googleSignIn.signIn();
      _vm = _vm.copyWith(googleSignInAccount: signIn);

      if (signIn != null) {
        emit(_Loading(_vm));

        final googleAuth = await _vm.googleSignInAccount?.authentication;
        final body = AuthSocialLoginDTO(accessToken: googleAuth?.accessToken ?? '', provider: 'google');

        await _meRepo.socialLogin(body).then(
          (response) {
            return response.when(
              success: (userSessionDM) => (userSessionDM.user.uuid?.isEmpty ?? true)
                  ? _setSocialLoginUserForSignUp(userSessionDM)
                  : _provideAccessToUser(userSessionDM),
              failure: ((error) {
                _logger.e('$error ${error.stackTrace}', stackTrace: error.stackTrace);
                emit(_Error(error.errorMsg, _vm));
              }),
            );
          },
        );
      } else {
        emit(_Error(S.current.error, _vm));
      }
    } on PlatformException catch (e) {
      _logger.e('PlatformException: ${e.code} - ${e.message}');
      emit(_Error(e.message ?? S.current.platformError, _vm));
    } catch (error) {
      _logger.e('${S.current.error}: $error');
      emit(_Error('${S.current.loginError}: $error', _vm));
    }
  }

  void _setSocialLoginUserForSignUp(UserSessionDM userSessionDM) {
    var user = userSessionDM.user;
    final fullName = splitName(googleSignInAccount?.displayName ?? '');
    user = user.copyWith(
      email: googleSignInAccount?.email,
      firstName: fullName[FoodlyStrings.FIRST_NAME],
      lastName: fullName[FoodlyStrings.LAST_NAME],
    );

    _vm = _vm.copyWith(importedAvatar: googleSignInAccount?.photoUrl);

    _provideAccessToUser(userSessionDM = userSessionDM.copyWith(user: user));
  }

  void login() {
    emit(_Loading(_vm));

    final loginDTO = UserBodyLoginDTO(email: _vm.emailController?.text ?? '', password: _vm.passwordController?.text);

    _meRepo.login(loginDTO: loginDTO).then((response) {
      return response.when(
        success: (userSessionDM) => _provideAccessToUser(userSessionDM),
        failure: (e) {
          _logger.e('${e.error}');
          emit(_Error(e.errorMsg, _vm));
        },
      );
    });
  }

  void _provideAccessToUser(UserSessionDM userSessionDM) {
    _authSessionService
      ..setSession(userSessionDM)
      ..initializeFavorites();
    if (userSessionDM.user.uuid?.isNotEmpty ?? false) {
      emit(_UserAuthenticated(_vm = _vm.copyWith(userSessionDM: userSessionDM)));
    } else {
      emit(_IsNewUser(_vm = _vm.copyWith(userSessionDM: userSessionDM)));
    }
  }

  void setView(StartingPageView newView) {
    _vm = _vm.copyWith(currentView: newView);

    emit(_Welcome(_vm));
  }

  void setAutovalidateMode(AutovalidateMode newMode) {
    _vm = _vm.copyWith(autovalidateMode: newMode);

    emit(_Welcome(_vm));
  }

  void recoverPassword() {
    emit(_Welcome(_vm = _vm.copyWith(recoverPasswordView: RecoverPasswordView.sendingRequest)));

    _meRepo.recoverPassword(UserRecoverPasswordDTO(email: _vm.emailController?.text ?? '')).then(
      (response) {
        return response.when(
          success: (_) {
            emit(_Welcome(_vm = _vm.copyWith(recoverPasswordView: RecoverPasswordView.passwordSent)));
          },
          failure: (e) {
            _logger.e('$e');
            emit(_Error('$e', _vm = _vm.copyWith(recoverPasswordView: RecoverPasswordView.errorRequest)));
          },
        );
      },
    );
  }

  void restartRecoverPassword() =>
      emit(_Welcome(_vm = _vm.copyWith(recoverPasswordView: RecoverPasswordView.requestPassword)));

  void resetPasswordController() {
    _vm.passwordController?.clear();
    emit(_Welcome(_vm));
  }
}
