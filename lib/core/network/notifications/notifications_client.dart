import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/notifications/notifications_dm.dart';
import 'package:retrofit/retrofit.dart';

part 'notifications_client.g.dart';

@RestApi()
abstract class NotificationsClient {
  factory NotificationsClient(Dio dio) = _NotificationsClient;

  /// [locale] — language tag del dispositivo (`es`, `pt-PT`, …). El backend
  /// traduce title/message de cada notificación AL LEER en ese locale
  /// (NotificationResource). Sin este query param el BE cae a 'es'.
  @GET('/notifications')
  Future<NotificationsResponseDM> getNotifications({
    @Query('per_page') int? perPage,
    @Query('only_unread') bool? onlyUnread,
    @Query('page') int? page,
    @Query('locale') String? locale,
  });

  @GET('/notifications/unread-count')
  Future<UnreadCountResponseDM> getUnreadCount();

  @POST('/notifications/mark-read/{uuid}')
  Future<void> markAsRead(@Path('uuid') String uuid);

  @POST('/notifications/mark-all-read')
  Future<void> markAllAsRead();

  @DELETE('/notifications/{uuid}')
  Future<void> deleteNotification(@Path('uuid') String uuid);
}
