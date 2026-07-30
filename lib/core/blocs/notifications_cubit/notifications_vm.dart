import 'package:foodly_world/data_models/notifications/notifications_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_vm.freezed.dart';

@freezed
abstract class NotificationsVM with _$NotificationsVM {
  const NotificationsVM._();

  const factory NotificationsVM({
    @Default([]) List<NotificationDM> notifications,
    @Default(0) int unreadCount,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default(20) int perPage,
    @Default(0) int total,
    @Default(false) bool isPolling,
    @Default(false) bool hasMorePages,
  }) = _NotificationsVM;

  bool get hasUnread => unreadCount > 0;

  List<NotificationDM> get unreadNotifications =>
      notifications.where((n) => !n.isRead).toList();

  List<NotificationDM> get readNotifications =>
      notifications.where((n) => n.isRead).toList();
}
