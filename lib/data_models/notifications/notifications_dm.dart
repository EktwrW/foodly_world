import 'package:foodly_world/core/enums/foodly_notification_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_dm.freezed.dart';
part 'notifications_dm.g.dart';

@freezed
class NotificationsResponseDM with _$NotificationsResponseDM {
  const factory NotificationsResponseDM({
    @Default([]) List<NotificationDM> notifications,
    NotificationsMetaDM? meta,
  }) = _NotificationsResponseDM;

  factory NotificationsResponseDM.fromJson(Map<String, dynamic> json) => _$NotificationsResponseDMFromJson(json);
}

@freezed
class NotificationsMetaDM with _$NotificationsMetaDM {
  const factory NotificationsMetaDM({
    @JsonKey(name: 'current_page') @Default(1) int currentPage,
    @JsonKey(name: 'last_page') @Default(1) int lastPage,
    @JsonKey(name: 'per_page') @Default(20) int perPage,
    @Default(0) int total,
    @JsonKey(name: 'unread_count') @Default(0) int unreadCount,
  }) = _NotificationsMetaDM;

  factory NotificationsMetaDM.fromJson(Map<String, dynamic> json) => _$NotificationsMetaDMFromJson(json);
}

@freezed
class UnreadCountResponseDM with _$UnreadCountResponseDM {
  const factory UnreadCountResponseDM({
    @JsonKey(name: 'unread_count') @Default(0) int unreadCount,
  }) = _UnreadCountResponseDM;

  factory UnreadCountResponseDM.fromJson(Map<String, dynamic> json) => _$UnreadCountResponseDMFromJson(json);
}

@freezed
class NotificationDataDM with _$NotificationDataDM {
  const factory NotificationDataDM({
    @JsonKey(name: 'actor_id') int? actorId,
    @JsonKey(name: 'actor_uuid') String? actorUuid,
    @JsonKey(name: 'actor_photo_url') String? actorPhotoUrl,
    @JsonKey(name: 'business_id') int? businessId,
    @JsonKey(name: 'business_uuid') String? businessUuid,
    @JsonKey(name: 'menu_id') int? menuId,
    @JsonKey(name: 'menu_uuid') String? menuUuid,
    @JsonKey(name: 'food_item_id') int? foodItemId,
    @JsonKey(name: 'food_item_uuid') String? foodItemUuid,
    @JsonKey(name: 'drink_item_id') int? drinkItemId,
    @JsonKey(name: 'drink_item_uuid') String? drinkItemUuid,
    @JsonKey(name: 'combo_id') int? comboId,
    @JsonKey(name: 'combo_uuid') String? comboUuid,
    @JsonKey(name: 'promotion_id') int? promotionId,
    @JsonKey(name: 'promotion_uuid') String? promotionUuid,
  }) = _NotificationDataDM;

  factory NotificationDataDM.fromJson(Map<String, dynamic> json) => _$NotificationDataDMFromJson(json);
}

@freezed
class NotificationDM with _$NotificationDM {
  const NotificationDM._();

  const factory NotificationDM({
    required int id,
    required String uuid,
    FoodlyNotificationType? type,
    @JsonKey(name: 'sub_type') FoodlyNotificationSubType? subType,
    @Default('') String title,
    @Default('') String message,
    @JsonKey(name: 'is_read') @Default(false) bool isRead,
    NotificationDataDM? data,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _NotificationDM;

  factory NotificationDM.fromJson(Map<String, dynamic> json) => _$NotificationDMFromJson(json);

  bool get isBusinessNotification => type == FoodlyNotificationType.business;
  bool get isCustomerNotification => type == FoodlyNotificationType.customer;
  bool get isValid => type != null && subType != null && title.isNotEmpty;

  /// Actor photo URL - for avatar display without extra API calls
  String? get actorPhotoUrl => data?.actorPhotoUrl;

  /// Actor UUID - for navigating to actor profile
  String? get actorUuid => data?.actorUuid;

  /// Entity UUID based on notification sub_type - for navigation
  String? get entityUuid => switch (subType) {
        FoodlyNotificationSubType.newFollower => data?.actorUuid,
        FoodlyNotificationSubType.newFavoriteMenu => data?.menuUuid,
        FoodlyNotificationSubType.newFavoriteMenuItem => data?.foodItemUuid ?? data?.drinkItemUuid ?? data?.comboUuid,
        FoodlyNotificationSubType.newFavoritePromotion => data?.promotionUuid,
        FoodlyNotificationSubType.newReview => data?.businessUuid,
        FoodlyNotificationSubType.newPromotion => data?.promotionUuid,
        FoodlyNotificationSubType.promotionUpdate => data?.promotionUuid,
        _ => null,
      };

  /// Business UUID - present in business favorite notifications
  String? get businessUuid => data?.businessUuid;

  String get timeAgo {
    if (createdAt == null) return '';
    final now = DateTime.now();
    final difference = now.difference(createdAt!);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }
}
