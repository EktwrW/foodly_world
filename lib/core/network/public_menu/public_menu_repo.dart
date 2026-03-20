import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/public_menu/public_menu_client.dart';
import 'package:foodly_world/data_models/public_menu/public_menu_dm.dart';

class PublicMenuRepo {
  final PublicMenuClient _client;

  const PublicMenuRepo({required PublicMenuClient client}) : _client = client;

  Future<ApiResult<PublicMenuResponseDM>> fetchPublicMenu(String businessUuid) async {
    try {
      return ApiResult.success(await _client.fetchPublicMenu(businessUuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
