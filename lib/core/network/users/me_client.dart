import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/logout/logout_dm.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/data_models/user_session/user_session_dm.dart';
import 'package:foodly_world/data_transfer_objects/user/auth_social_login_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_body_login_dto.dart';
import 'package:foodly_world/data_transfer_objects/user/user_recover_password_dto.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'me_client.g.dart';

@RestApi()
abstract class MeClient {
  factory MeClient(Dio dio) = _MeClient;

  @GET('/user')
  Future<UserDM> fetchLoggedUser();

  @POST('/login')
  Future<UserSessionDM> login(@Queries() UserBodyLoginDTO loginDTO);

  @POST('/biometric-login')
  Future<UserSessionDM> biometricLogin();

  @POST('/logout')
  Future<LogoutDM> logout();

  @POST('/social-login')
  Future<UserSessionDM> socialLogin(@Queries() AuthSocialLoginDTO socialLoginDTO);

  @POST('/forgot-password')
  Future<void> recoverPassword(@Queries() UserRecoverPasswordDTO email);

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
}
