import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/users/user_discovery_client.dart';
import 'package:foodly_world/data_models/user_discovery/nearby_user_dm.dart';

class UserDiscoveryRepo {
  final UserDiscoveryClient _client;

  const UserDiscoveryRepo({required UserDiscoveryClient client}) : _client = client;

  Future<ApiResult<NearbyUsersResponseDM>> getNearbyUsers({
    required double latitude,
    required double longitude,
    double? radius,
    String? sort,
    int? page,
    int? perPage,
  }) async {
    try {
      return ApiResult.success(
        await _client.getNearbyUsers(
          latitude: latitude,
          longitude: longitude,
          radius: radius,
          sort: sort,
          page: page,
          perPage: perPage,
        ),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<UserProfileDM>> getUserProfile(String uuid) async {
    try {
      final response = await _client.getUserProfile(uuid);
      return ApiResult.success(response.data);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
