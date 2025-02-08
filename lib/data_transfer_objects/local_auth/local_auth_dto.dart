import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_auth/local_auth.dart';

part 'local_auth_dto.freezed.dart';

@freezed
class LocalAuthDTO with _$LocalAuthDTO {
  const factory LocalAuthDTO({
    @Default(false) bool deviceIsSupported,
    @Default(false) bool isAuthenticating,
    @Default(false) bool canCheckBiometrics,
    @Default([]) List<BiometricType> availableBiometrics,
    @Default(false) bool authenticated,
    @Default(UserSessionDM(user: UserDM(), token: '')) UserSessionDM userSessionDM,
  }) = _LocalAuthDTO;
}
