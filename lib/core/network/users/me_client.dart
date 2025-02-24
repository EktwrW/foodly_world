import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/availability/username_dm.dart';
import 'package:foodly_world/data_models/logout/logout_dm.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'package:foodly_world/data_transfer_objects/user/auth_social_login_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_body_login_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_body_update_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_recover_password_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'me_client.g.dart';

@RestApi()
abstract class MeClient {
  factory MeClient(Dio dio) = _MeClient;

  @GET('/user')
  Future<UserDM> fetchLoggedUser();

  @GET('/user/{uuid}')
  Future<UserDM> getUserByGuid(@Path('uuid') String uuid);

  @POST('/login')
  Future<UserSessionDM> login(@Body() UserBodyLoginDTO loginDTO);

  @POST('/biometric-login')
  Future<UserSessionDM> biometricLogin();

  @POST('/logout')
  Future<LogoutDM> logout();

  @POST('/social-login')
  Future<UserSessionDM> socialLogin(@Body() AuthSocialLoginDTO socialLoginDTO);

  @POST('/forgot-password')
  Future<void> recoverPassword(@Body() UserRecoverPasswordDTO email);

  @POST('/register')
  @MultiPart()
  Future<UserSessionDM> register({
    @Part(name: 'name') required String name,
    @Part(name: 'last_name') required String lastName,
    @Part(name: 'username') required String username,
    @Part(name: 'date_of_birth') required String dateOfBirth,
    @Part(name: 'email') required String email,
    @Part(name: 'password') required String password,
    @Part(name: 'password_confirmation') required String passwordConfirmation,
    @Part(name: 'phone') required String? phone,
    @Part(name: 'address') required String? address,
    @Part(name: 'zip_code') required String zipCode,
    @Part(name: 'city') required String? city,
    @Part(name: 'country') required String? country,
    @Part(name: 'gender') required String gender,
    @Part(name: 'role_id') required int roleId,
    @Part(name: 'photo') required List<MultipartFile> photo,
  });

  @POST('/update-profile-photo')
  @MultiPart()
  Future<void> updateProfilePhoto({
    @Part(name: 'photo') required List<MultipartFile> photo,
  });

  @POST('/update-password')
  Future<void> updatePassword(@Body() UserBodyUpdateDTO updateDTO);

  @POST('/update-profile')
  @MultiPart()
  Future<UserSessionDM> updateProfile({
    @Part(name: 'username') String? username,
    @Part(name: 'name') String? name,
    @Part(name: 'last_name') String? lastName,
    @Part(name: 'email') String? email,
    @Part(name: 'phone') String? phone,
    @Part(name: 'date_of_birth') String? dateOfBirth,
    @Part(name: 'current_password') String? password,
    @Part(name: 'new_password') String? newPassword,
    @Part(name: 'zip_code') String? zipCode,
    @Part(name: 'address') String? address,
    @Part(name: 'city') String? city,
    @Part(name: 'country') String? country,
    @Part(name: 'gender') String? gender,
    @Part(name: 'role_id') int? roleId,
    @Part(name: 'latitude') double? latitude,
    @Part(name: 'longitude') double? longitude,
  });

  @GET('/username-available/{username}')
  Future<UsernameDM> checkUsernameAvailability(@Path('username') String username);
}
