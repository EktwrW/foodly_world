import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/buzz/buzz_client.dart';
import 'package:foodly_world/data_models/buzz/buzz_item_dm.dart';

class BuzzRepo {
  final BuzzClient _client;

  const BuzzRepo({required BuzzClient buzzClient}) : _client = buzzClient;

  Future<ApiResult<BuzzResponseDM>> getBuzz({
    required double latitude,
    required double longitude,
    double? radius,
    int? page,
  }) async {
    try {
      return ApiResult.success(
        await _client.getBuzz(
          latitude: latitude,
          longitude: longitude,
          radius: radius,
          page: page,
        ),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
