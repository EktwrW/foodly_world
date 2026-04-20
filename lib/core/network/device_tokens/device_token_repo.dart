import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/device_tokens/device_token_client.dart';

/// ApiResult wrapper around [DeviceTokenClient].
///
/// Every call is best-effort — a failure here must never block the login
/// flow or break the user session. See [PushNotificationService] for the
/// silent-failure policy mirrored on the service side.
class DeviceTokenRepo {
  final DeviceTokenClient _client;

  const DeviceTokenRepo({required DeviceTokenClient client}) : _client = client;

  Future<ApiResult<String?>> register({
    required String fcmToken,
    required String platform,
    String? deviceName,
    String? deviceModel,
    String? appVersion,
    String? locale,
  }) async {
    try {
      final response = await _client.register(
        fcmToken: fcmToken,
        platform: platform,
        deviceName: deviceName,
        deviceModel: deviceModel,
        appVersion: appVersion,
        locale: locale,
      );
      // `response` is `dynamic` (see NOTE in DeviceTokenClient) — cast to
      // the shape the BE returns: {'device_token_uuid': String, ...}.
      final map = response is Map<String, dynamic>
          ? response
          : (response is Map ? Map<String, dynamic>.from(response) : const <String, dynamic>{});
      return ApiResult.success(map['device_token_uuid'] as String?);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> unregister({required String fcmToken}) async {
    try {
      await _client.unregister(body: {'fcm_token': fcmToken});
      return const ApiResult.success(null);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
