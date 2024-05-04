import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/users/me_client.dart';
import 'package:foodly_world/core/utils/file_handler/file_handler_selector.dart';
import 'package:foodly_world/data_models/logout/logout_dm.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'package:foodly_world/data_transfer_objects/user/auth_social_login_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_body_login_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_body_register_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_recover_password_dto.dart';

class MeRepo {
  final MeClient _meClient;

  MeRepo({required MeClient meClient}) : _meClient = meClient;

  Future<ApiResult<UserDM>> fetchLoggedUser() async {
    try {
      return ApiResult.success(await _meClient.fetchLoggedUser());
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<UserSessionDM>> biometricLogin() async {
    try {
      return ApiResult.success(await _meClient.biometricLogin());
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<UserSessionDM>> login({required UserBodyLoginDTO loginDTO}) async {
    try {
      return ApiResult.success(await _meClient.login(loginDTO));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<LogoutDM>> logout() async {
    try {
      return ApiResult.success(await _meClient.logout());
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> recoverPassword(UserRecoverPasswordDTO email) async {
    try {
      return ApiResult.success(await _meClient.recoverPassword(email));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<UserSessionDM>> socialLogin(AuthSocialLoginDTO socialLoginDTO) async {
    try {
      return ApiResult.success(await _meClient.socialLogin(socialLoginDTO));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<UserSessionDM>> register({required UserBodyRegisterDTO registerDTO, String? filePath}) async {
    final fileHandler = getFileHandler();
    final photoMultipartFile = await fileHandler.getMultipartFile(filePath);

    try {
      return ApiResult.success(await _meClient.register(
        name: registerDTO.firstName,
        lastName: registerDTO.lastName,
        username: registerDTO.userName,
        dateOfBirth: registerDTO.dateOfBirth.toIso8601String(),
        email: registerDTO.email,
        password: registerDTO.password,
        passwordConfirmation: registerDTO.passwordConfirmation,
        phone: registerDTO.phone,
        address: registerDTO.address,
        zipCode: registerDTO.zipCode,
        city: registerDTO.city,
        country: registerDTO.country,
        gender: registerDTO.gender,
        roleId: registerDTO.roleId?.index ?? 4,
        photo: photoMultipartFile != null ? [photoMultipartFile] : [],
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> updateProfilePhoto({String? filePath}) async {
    final fileHandler = getFileHandler();
    final photoMultipartFile = await fileHandler.getMultipartFile(filePath);

    try {
      return ApiResult.success(await _meClient.updateProfilePhoto(
        photo: photoMultipartFile != null ? [photoMultipartFile] : [],
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
