import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/notifications/notifications_client.dart';
import 'package:foodly_world/data_models/notifications/notifications_dm.dart';

class NotificationsRepo {
  final NotificationsClient _notificationsClient;

  const NotificationsRepo({required NotificationsClient notificationsClient})
      : _notificationsClient = notificationsClient;

  Future<ApiResult<NotificationsResponseDM>> getNotifications({
    int? perPage,
    bool? onlyUnread,
    int? page,
    String? locale,
  }) async {
    try {
      return ApiResult.success(await _notificationsClient.getNotifications(
        perPage: perPage,
        onlyUnread: onlyUnread,
        page: page,
        locale: locale,
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<int>> getUnreadCount() async {
    try {
      final response = await _notificationsClient.getUnreadCount();
      return ApiResult.success(response.unreadCount);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> markAsRead(String uuid) async {
    try {
      return ApiResult.success(await _notificationsClient.markAsRead(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> markAllAsRead() async {
    try {
      return ApiResult.success(await _notificationsClient.markAllAsRead());
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> deleteNotification(String uuid) async {
    try {
      return ApiResult.success(await _notificationsClient.deleteNotification(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
