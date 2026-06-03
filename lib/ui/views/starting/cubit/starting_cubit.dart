import 'dart:convert' show base64Url, jsonDecode, utf8;

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart' show FlutterNativeSplash;
import 'package:foodly_world/core/core_exports.dart' show AuthSessionService, BaseConfig, FoodlyStrings, MeRepo, di;

import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'package:foodly_world/data_transfer_objects/user/auth_social_login_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/auth_social_register_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_body_login_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_recover_password_dto.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/utils/split_name.dart';
import 'package:foodly_world/ui/views/starting/starting_page.dart';
import 'package:foodly_world/ui/views/starting/view_models/starting_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'starting_cubit.freezed.dart';
part 'starting_state.dart';

class StartingCubit extends Cubit<StartingState> {
  final AuthSessionService _authSessionService;
  final Logger _logger;
  final MeRepo _meRepo;
  // Web: clientId = Web OAuth client (from dart-define).
  // Android/iOS: clientId = null (Android uses google-services.json,
  //   iOS uses GoogleService-Info.plist CLIENT_ID).
  // serverClientId: Web OAuth client — needed by Android & iOS to obtain
  //   idToken/serverAuthCode. Explicit here so we never depend on
  //   auto-discovery from config files.
  final _googleSignIn = GoogleSignIn(
    clientId: kIsWeb ? di<BaseConfig>().googleSignInClientId : null,
    serverClientId: kIsWeb ? null : di<BaseConfig>().googleSignInClientId,
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
          emailController: TextEditingController(text: 'userdemo1@mail.com'),
          passwordController: TextEditingController(text: 'Test@123'),
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
        emit(_Loading(_vm = _vm.copyWith(justSocialRegistered: false)));

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

  /// Sign in with Apple — espeja [googleSignIn]. El flujo nativo de iOS
  /// devuelve un `identityToken` (JWT), NO un access_token OAuth: lo mandamos
  /// como `access_provider_token` y el backend lo verifica con
  /// `Socialite::driver('apple')->userFromToken($jwt)`.
  ///
  /// Apple solo entrega `givenName`/`familyName`/`email` en la PRIMERA
  /// autorización (y nunca dentro del JWT), así que los persistimos en el VM
  /// para que [_setSocialLoginUserForSignUp] los use si el usuario es nuevo.
  void appleSignIn() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: const [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final identityToken = credential.identityToken;
      if (identityToken == null || identityToken.isEmpty) {
        emit(_Error(S.current.loginError, _vm));
        return;
      }

      // Apple incluye el email como claim del identityToken (JWT) en cada login.
      // Si falta (típico en el SIMULADOR, que no lo entrega), evitamos pegarle
      // al backend —que respondería 500 "email inválido"— y mostramos un mensaje
      // claro. En un dispositivo real el claim viene presente.
      if (!_identityTokenHasEmail(identityToken)) {
        _logger.w('Apple identityToken sin claim email (esperable en simulador).');
        emit(_Error(S.current.socialEmailMissing, _vm));
        return;
      }

      emit(_Loading(_vm = _vm.copyWith(
        // Reseteamos el de Google para que _setSocialLoginUserForSignUp tome
        // la rama de Apple, y guardamos los datos de esta autorización.
        googleSignInAccount: null,
        appleGivenName: credential.givenName,
        appleFamilyName: credential.familyName,
        appleEmail: credential.email,
        justSocialRegistered: false,
      )));

      final body = AuthSocialLoginDTO(accessToken: identityToken, provider: 'apple');

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
    } on SignInWithAppleAuthorizationException catch (e) {
      // El usuario canceló el diálogo: no es un error, volvemos a welcome sin
      // mostrar toast rojo.
      if (e.code == AuthorizationErrorCode.canceled) {
        emit(_Welcome(_vm));
        return;
      }
      _logger.e('SignInWithAppleAuthorizationException: ${e.code} - ${e.message}');
      emit(_Error(e.message, _vm));
    } on PlatformException catch (e) {
      _logger.e('PlatformException: ${e.code} - ${e.message}');
      emit(_Error(e.message ?? S.current.platformError, _vm));
    } catch (error) {
      _logger.e('${S.current.error}: $error');
      emit(_Error('${S.current.loginError}: $error', _vm));
    }
  }

  /// Decodifica el payload del identityToken (JWT) y verifica que traiga un
  /// claim `email` no vacío. Solo lee claims, NO valida la firma (eso lo hace
  /// el backend). Devuelve false ante cualquier token malformado.
  bool _identityTokenHasEmail(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return false;
      final payload = jsonDecode(utf8.decode(base64Url.decode(base64Url.normalize(parts[1])))) as Map<String, dynamic>;
      final email = payload['email'];
      return email is String && email.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  /// Usuario social NUEVO (no existe aún en backend). Construimos el user con
  /// los datos del provider/credential y emitimos [_IsNewUser] SIN setear
  /// sesión todavía: el alta recién se concreta cuando el usuario acepta los
  /// T&C en el diálogo de consentimiento (StartingPage → [registerSocialUser]).
  void _setSocialLoginUserForSignUp(UserSessionDM userSessionDM) {
    var user = userSessionDM.user;

    // Rama Google: el nombre viene en displayName y hay avatar.
    if (googleSignInAccount != null) {
      final fullName = splitName(googleSignInAccount?.displayName ?? '');
      user = user.copyWith(
        email: googleSignInAccount?.email,
        firstName: fullName[FoodlyStrings.FIRST_NAME],
        lastName: fullName[FoodlyStrings.LAST_NAME],
      );
      _vm = _vm.copyWith(importedAvatar: googleSignInAccount?.photoUrl);
    } else {
      // Rama Apple: nombre/email capturados del credential (primera vez).
      // Apple no provee avatar. Hacemos fallback al user del backend por si
      // es un re-login donde Apple ya no manda nombre.
      user = user.copyWith(
        email: _vm.appleEmail ?? user.email,
        firstName: _vm.appleGivenName ?? user.firstName,
        lastName: _vm.appleFamilyName ?? user.lastName,
      );
    }

    emit(_IsNewUser(_vm = _vm.copyWith(userSessionDM: userSessionDM.copyWith(user: user))));
  }

  /// Concreta el alta social tras aceptar T&C. Crea la cuenta en backend (rol
  /// customer) con los datos capturados y, si sale bien, entra al home con la
  /// sesión real. El nombre/apellido de Apple viajan acá, garantizando que
  /// queden persistidos aunque Apple no los reenvíe en futuros logins.
  void registerSocialUser() async {
    emit(_Loading(_vm));

    final pending = _vm.userSessionDM.user;
    final dto = AuthSocialRegisterDTO(
      name: pending.firstName ?? '',
      lastName: pending.lastName,
      email: pending.email ?? '',
      provider: pending.provider ?? '',
      providerId: pending.providerId ?? '',
      providerAvatar: _vm.importedAvatar,
      // Mismo avatar como avatar_url para que el backend lo baje a
      // profile_photo_path (si no, el comerciante ve placeholder en la reserva).
      avatarUrl: _vm.importedAvatar,
    );

    await _meRepo.socialRegister(dto).then(
      (response) {
        return response.when(
          success: (userSessionDM) {
            _vm = _vm.copyWith(justSocialRegistered: true);
            _provideAccessToUser(userSessionDM);
          },
          failure: (error) {
            _logger.e('$error ${error.stackTrace}', stackTrace: error.stackTrace);
            emit(_Error(error.errorMsg, _vm));
          },
        );
      },
    );
  }

  /// El usuario rechazó los T&C en el diálogo de consentimiento: abortamos el
  /// alta (no se crea nada en backend) y volvemos a la pantalla inicial.
  void cancelSocialSignUp() {
    _vm = _vm.copyWith(
      justSocialRegistered: false,
      googleSignInAccount: null,
      appleGivenName: null,
      appleFamilyName: null,
      appleEmail: null,
      importedAvatar: null,
    );
    setView(StartingPageView.initial);
  }

  void login() {
    // Reseteamos el flag de alta social (cubit es singleton) para no reabrir
    // el WelcomeDialog social en un login normal posterior.
    emit(_Loading(_vm = _vm.copyWith(justSocialRegistered: false)));

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
      ..initializeFavorites()
      ..initializeNotifications();
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
