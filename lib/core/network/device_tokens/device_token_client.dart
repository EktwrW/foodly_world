import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'device_token_client.g.dart';

/// Retrofit client for FCM device-token registration.
///
/// Endpoints are mounted under the authenticated (`auth:sanctum`) group on
/// the backend — the Authorization header injected by [FoodlyApiProvider]
/// is what ties a token to a user.
///
/// `register` is idempotent and should be called:
///  - once on login (after [setSession])
///  - every time [FirebaseMessaging.onTokenRefresh] fires
///
/// `unregister` is called on explicit logout so the device stops receiving
/// pushes. When [FirebaseMessaging.deleteToken] is also called the backend
/// will further clean up on the next send attempt (UNREGISTERED response
/// triggers a soft-delete server-side).
/// NOTE on return type (`dynamic` instead of `Map<String, dynamic>`):
/// the `retrofit_generator` has a long-standing bug where a typed map
/// return emits `dynamic.fromJson(v)` inside the generated `.g.dart`
/// (invalid Dart, fails `flutter build web`). Using `dynamic` bypasses the
/// generator's deserialization loop and returns `_result.data` raw. The
/// repo then casts to `Map<String, dynamic>` and reads the field it needs.
@RestApi()
abstract class DeviceTokenClient {
  factory DeviceTokenClient(Dio dio) = _DeviceTokenClient;

  @POST('/device-tokens/register')
  Future<dynamic> register({
    @Field('fcm_token') required String fcmToken,
    @Field('platform') required String platform, // 'ios' | 'android' | 'web'
    @Field('device_name') String? deviceName,
    @Field('device_model') String? deviceModel,
    @Field('app_version') String? appVersion,
    @Field('locale') String? locale,
  });

  /// Retrofit's @DELETE doesn't support @Field, so we use a Map body.
  @DELETE('/device-tokens/unregister')
  Future<dynamic> unregister({
    @Body() required Map<String, dynamic> body,
  });
}
