import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_transfer_objects/local_auth/local_auth_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_auth/local_auth.dart';

part 'local_auth_cubit.freezed.dart';
part 'local_auth_state.dart';

class LocalAuthCubit extends Cubit<LocalAuthState> {
  LocalAuthDTO _dto;
  final LocalAuthentication auth = LocalAuthentication();
  final MeRepo _meRepo;
  final AuthSessionService _authSessionService;
  final Logger _logger;

  LocalAuthCubit(
    MeRepo meRepo,
    AuthSessionService authSessionService,
    Logger logger,
  )   : _authSessionService = authSessionService,
        _meRepo = meRepo,
        _logger = logger,
        _dto = const LocalAuthDTO(),
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
        if (_authSessionService.isLoggedIn && isSupported == false) {
          await _checkLoginStatusCall();
        }

        _dto = _dto.copyWith(deviceIsSupported: isSupported);

        if (isSupported) {
          await _checkBiometrics().then((value) => _dto = _dto.copyWith(canCheckBiometrics: value));
        }

        if (_dto.canCheckBiometrics) {
          await _getAvailableBiometrics();
        }

        if (_authSessionService.isLoggedIn && biometricAuthEnabled) {
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
      _logger.e(e.toString());
    }
  }

  Future<bool> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      _logger.e(e.toString());
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
            await _checkLoginStatusCall();
          } else {
            _logger.e(S.current.unauthorizedAccess);
            emit(_Error(S.current.unauthorizedAccess, _dto.copyWith(isAuthenticating: false)));
          }
        },
      );
      return;
    } on PlatformException catch (e) {
      _logger.e('$e');
      emit(_Error('$e', _dto.copyWith(isAuthenticating: false)));
      return;
    }
  }

  Future<void> _checkLoginStatusCall() async {
    await _meRepo.biometricLogin().then(
      (response) {
        return response.when(
          success: (userSessionDM) {
            _authSessionService
              ..setSession(userSessionDM)
              ..initializeFavorites()
              ..initializeNotifications();
            emit(_Authenticated(_dto = _dto.copyWith(userSessionDM: userSessionDM, isAuthenticating: false)));
          },
          failure: (e) {
            _logger.e('$e');
            emit(_Error('$e', _dto.copyWith(isAuthenticating: false)));
          },
        );
      },
    );
  }
}
