import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:foodly_world/core/network/users/me_repo.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_transfer_objects/local_auth/local_auth_dto.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_auth/local_auth.dart';
import 'package:logger/logger.dart';

part 'local_auth_cubit.freezed.dart';
part 'local_auth_state.dart';

class LocalAuthCubit extends Cubit<LocalAuthState> {
  LocalAuthDTO _dto;
  final LocalAuthentication auth = LocalAuthentication();
  final _meRepo = di<MeRepo>();
  final _authSessionService = di<AuthSessionService>();

  LocalAuthCubit()
      : _dto = const LocalAuthDTO(),
        super(const LocalAuthState.initial(LocalAuthDTO())) {
    if (!kIsWeb) {
      initializeLocalAuth();
    } else {
      emit(_Loaded(_dto));
    }
  }

  bool get biometricAuthEnabled => _dto.deviceIsSupported && _dto.availableBiometrics.isNotEmpty;

  void initializeLocalAuth() async {
    emit(_Loading(_dto));
    await auth.isDeviceSupported().then(
      (isSupported) async {
        _dto = _dto.copyWith(deviceIsSupported: isSupported);

        if (isSupported) {
          await _checkBiometrics().then((value) => _dto = _dto.copyWith(canCheckBiometrics: value));
        }

        if (_dto.canCheckBiometrics) {
          await _getAvailableBiometrics();
        }

        if (di<AuthSessionService>().isLoggedIn && biometricAuthEnabled) {
          emit(_NeedAuthentication(_dto));
        } else {
          emit(_Loaded(_dto));
        }
      },
    );
  }

  Future<void> _getAvailableBiometrics() async {
    try {
      await auth.getAvailableBiometrics().then(
            (availableBiometrics) => _dto = _dto.copyWith(availableBiometrics: availableBiometrics),
          );
    } on PlatformException catch (e) {
      _dto = _dto.copyWith(availableBiometrics: <BiometricType>[]);
      di<Logger>().e(e.toString());
    }
  }

  Future<bool> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      di<Logger>().e(e.toString());
    }

    return canCheckBiometrics;
  }

  Future<void> authenticate() async {
    _dto = _dto.copyWith(isAuthenticating: true);
    try {
      await auth
          .authenticate(
        localizedReason: S.current.secureAuthentication,
        options: const AuthenticationOptions(stickyAuth: true),
      )
          .then(
        (authenticated) async {
          emit(_Loading(_dto));
          _dto = _dto.copyWith(authenticated: authenticated);
          if (authenticated) {
            await _meRepo.biometricLogin().then(
              (response) {
                return response.when(
                  success: (userSessionDM) {
                    _authSessionService.setSession(userSessionDM);
                    emit(_Authenticated(_dto = _dto.copyWith(userSessionDM: userSessionDM, isAuthenticating: false)));
                  },
                  failure: (e) {
                    di<Logger>().e('$e');
                    emit(_Error('$e', _dto.copyWith(isAuthenticating: false)));
                  },
                );
              },
            );
          } else {
            di<Logger>().e(S.current.unauthorizedAccess);
            emit(_Error(S.current.unauthorizedAccess, _dto.copyWith(isAuthenticating: false)));
          }
        },
      );
      return;
    } on PlatformException catch (e) {
      di<Logger>().e('$e');
      emit(_Error('$e', _dto.copyWith(isAuthenticating: false)));
      return;
    }
  }
}
