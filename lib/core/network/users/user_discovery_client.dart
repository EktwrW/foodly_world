import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/user_discovery/nearby_user_dm.dart';
import 'package:retrofit/retrofit.dart';

part 'user_discovery_client.g.dart';

@RestApi()
abstract class UserDiscoveryClient {
  factory UserDiscoveryClient(Dio dio) = _UserDiscoveryClient;

  @GET('/users/nearby')
  Future<NearbyUsersResponseDM> getNearbyUsers({
    @Query('latitude') required double latitude,
    @Query('longitude') required double longitude,
    @Query('radius') double? radius,
    @Query('sort') String? sort,
    @Query('page') int? page,
    @Query('per_page') int? perPage,
  });

  @GET('/users/profile/{uuid}')
  Future<UserProfileResponseDM> getUserProfile(@Path('uuid') String uuid);
}

/// Wrapper for the profile endpoint response { success: true, data: {...} }
class UserProfileResponseDM {
  final UserProfileDM data;

  UserProfileResponseDM({required this.data});

  factory UserProfileResponseDM.fromJson(Map<String, dynamic> json) {
    return UserProfileResponseDM(
      data: UserProfileDM.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}
