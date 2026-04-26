import 'package:dio/dio.dart' show MultipartFile;
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/users/me_client.dart';
import 'package:foodly_world/core/utils/file_handler/file_handler_selector.dart';
import 'package:foodly_world/data_models/availability/username_dm.dart';
import 'package:foodly_world/data_models/logout/logout_dm.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'package:foodly_world/data_transfer_objects/user/auth_social_login_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_body_login_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_body_register_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_body_set_password_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_body_update_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_recover_password_dto.dart';

class MeRepo {
  final MeClient _meClient;

  const MeRepo({required MeClient meClient}) : _meClient = meClient;

  Future<ApiResult<UserDM>> fetchLoggedUser() async {
    try {
      return ApiResult.success(await _meClient.fetchLoggedUser());
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<UserDM>> getUserByGuid(String uuid) async {
    try {
      return ApiResult.success(await _meClient.getUserByGuid(uuid));
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

  Future<ApiResult<UserSessionDM>> refreshToken() async {
    try {
      return ApiResult.success(await _meClient.refreshToken());
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

  Future<ApiResult<UserSessionDM>> register({
    required UserBodyRegisterDTO registerDTO,
    String? filePath,
    String? avatarUrl,
  }) async {
    final fileHandler = getFileHandler();
    final photoMultipartFile = avatarUrl != null
        ? await fileHandler.getMultipartFileFromUrl(avatarUrl)
        : await fileHandler.getMultipartFile(filePath);

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
        country: registerDTO.country.value,
        gender: registerDTO.gender,
        roleId: registerDTO.roleId?.index ?? 4,
        photo: photoMultipartFile != null ? [photoMultipartFile] : [],
        firebasePhoneToken: registerDTO.firebasePhoneToken,
        latitude: registerDTO.latitude,
        longitude: registerDTO.longitude,
        provider: registerDTO.provider,
        providerId: registerDTO.providerId,
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

  Future<ApiResult<void>> updatePassword(UserBodyUpdateDTO updateDTO) async {
    try {
      return ApiResult.success(await _meClient.updatePassword(updateDTO));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// First-time password set — for social-login users whose password is NULL.
  /// Paired with the BE's `/set-password` endpoint, which rejects with 409 if
  /// a password is already set (in that case use [updatePassword] instead).
  Future<ApiResult<void>> setPassword(UserBodySetPasswordDTO setPasswordDTO) async {
    try {
      return ApiResult.success(await _meClient.setPassword(setPasswordDTO));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<UserSessionDM>> updateProfile(UserBodyUpdateDTO updateDTO) async {
    try {
      return ApiResult.success(await _meClient.updateProfile(
        name: updateDTO.firstName,
        lastName: updateDTO.lastName,
        username: updateDTO.userName,
        dateOfBirth: updateDTO.dateOfBirth?.toIso8601String(),
        email: updateDTO.email,
        phone: updateDTO.phone,
        zipCode: updateDTO.zipCode,
        city: updateDTO.city,
        country: updateDTO.country?.value,
        gender: updateDTO.gender,
        roleId: updateDTO.roleId?.index,
        latitude: updateDTO.latitude,
        longitude: updateDTO.longitude,
        address: updateDTO.address,
        // Sudo-mode verification fields. The DTO carries them as
        // `password` / `newPassword`, mapped to `current_password` /
        // `new_password` in the multipart body. The repo previously
        // dropped them when destructuring — silently breaking the
        // email-change flow because the BE always saw a missing
        // current_password and refused with 422 (or 401, in legacy).
        password: updateDTO.password,
        newPassword: updateDTO.newPassword,
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<UsernameDM>> checkUsernameAvailability(String username) async {
    try {
      return ApiResult.success(await _meClient.checkUsernameAvailability(username));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> deleteAccount() async {
    try {
      return ApiResult.success(await _meClient.deleteAccount());
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> sendContact({
    required String recipient,
    required String subject,
    required String message,
    String? attachmentPath,
  }) async {
    final fileHandler = getFileHandler();
    List<MultipartFile>? attachment;

    if (attachmentPath != null) {
      final file = await fileHandler.getMultipartFile(attachmentPath);
      if (file != null) attachment = [file];
    }

    try {
      return ApiResult.success(await _meClient.sendContact(
        recipient: recipient,
        subject: subject,
        message: message,
        attachment: attachment,
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
