// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationsResponseDM _$NotificationsResponseDMFromJson(
        Map<String, dynamic> json) =>
    _NotificationsResponseDM(
      notifications: (json['notifications'] as List<dynamic>?)
              ?.map((e) => NotificationDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      meta: json['meta'] == null
          ? null
          : NotificationsMetaDM.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationsResponseDMToJson(
        _NotificationsResponseDM instance) =>
    <String, dynamic>{
      'notifications': instance.notifications.map((e) => e.toJson()).toList(),
      if (instance.meta?.toJson() case final value?) 'meta': value,
    };

_NotificationsMetaDM _$NotificationsMetaDMFromJson(Map<String, dynamic> json) =>
    _NotificationsMetaDM(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 1,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 1,
      perPage: (json['per_page'] as num?)?.toInt() ?? 20,
      total: (json['total'] as num?)?.toInt() ?? 0,
      unreadCount: (json['unread_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$NotificationsMetaDMToJson(
        _NotificationsMetaDM instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
      'unread_count': instance.unreadCount,
    };

_UnreadCountResponseDM _$UnreadCountResponseDMFromJson(
        Map<String, dynamic> json) =>
    _UnreadCountResponseDM(
      unreadCount: (json['unread_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$UnreadCountResponseDMToJson(
        _UnreadCountResponseDM instance) =>
    <String, dynamic>{
      'unread_count': instance.unreadCount,
    };

_NotificationDataDM _$NotificationDataDMFromJson(Map<String, dynamic> json) =>
    _NotificationDataDM(
      actorId: (json['actor_id'] as num?)?.toInt(),
      actorUuid: json['actor_uuid'] as String?,
      actorPhotoUrl: json['actor_photo_url'] as String?,
      businessId: (json['business_id'] as num?)?.toInt(),
      businessUuid: json['business_uuid'] as String?,
      menuId: (json['menu_id'] as num?)?.toInt(),
      menuUuid: json['menu_uuid'] as String?,
      foodItemId: (json['food_item_id'] as num?)?.toInt(),
      foodItemUuid: json['food_item_uuid'] as String?,
      drinkItemId: (json['drink_item_id'] as num?)?.toInt(),
      drinkItemUuid: json['drink_item_uuid'] as String?,
      comboId: (json['combo_id'] as num?)?.toInt(),
      comboUuid: json['combo_uuid'] as String?,
      promotionId: (json['promotion_id'] as num?)?.toInt(),
      promotionUuid: json['promotion_uuid'] as String?,
      reservationUuid: json['reservation_uuid'] as String?,
      postUuid: json['post_uuid'] as String?,
    );

Map<String, dynamic> _$NotificationDataDMToJson(_NotificationDataDM instance) =>
    <String, dynamic>{
      if (instance.actorId case final value?) 'actor_id': value,
      if (instance.actorUuid case final value?) 'actor_uuid': value,
      if (instance.actorPhotoUrl case final value?) 'actor_photo_url': value,
      if (instance.businessId case final value?) 'business_id': value,
      if (instance.businessUuid case final value?) 'business_uuid': value,
      if (instance.menuId case final value?) 'menu_id': value,
      if (instance.menuUuid case final value?) 'menu_uuid': value,
      if (instance.foodItemId case final value?) 'food_item_id': value,
      if (instance.foodItemUuid case final value?) 'food_item_uuid': value,
      if (instance.drinkItemId case final value?) 'drink_item_id': value,
      if (instance.drinkItemUuid case final value?) 'drink_item_uuid': value,
      if (instance.comboId case final value?) 'combo_id': value,
      if (instance.comboUuid case final value?) 'combo_uuid': value,
      if (instance.promotionId case final value?) 'promotion_id': value,
      if (instance.promotionUuid case final value?) 'promotion_uuid': value,
      if (instance.reservationUuid case final value?) 'reservation_uuid': value,
      if (instance.postUuid case final value?) 'post_uuid': value,
    };

_NotificationDM _$NotificationDMFromJson(Map<String, dynamic> json) =>
    _NotificationDM(
      id: (json['id'] as num).toInt(),
      uuid: json['uuid'] as String,
      type: $enumDecodeNullable(_$FoodlyNotificationTypeEnumMap, json['type']),
      subType: $enumDecodeNullable(
          _$FoodlyNotificationSubTypeEnumMap, json['sub_type'],
          unknownValue: FoodlyNotificationSubType.generalUpdate),
      title: json['title'] as String? ?? '',
      message: json['message'] as String? ?? '',
      isRead: json['is_read'] as bool? ?? false,
      data: json['data'] == null
          ? null
          : NotificationDataDM.fromJson(json['data'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$NotificationDMToJson(_NotificationDM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      if (_$FoodlyNotificationTypeEnumMap[instance.type] case final value?)
        'type': value,
      if (_$FoodlyNotificationSubTypeEnumMap[instance.subType]
          case final value?)
        'sub_type': value,
      'title': instance.title,
      'message': instance.message,
      'is_read': instance.isRead,
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updated_at': value,
    };

const _$FoodlyNotificationTypeEnumMap = {
  FoodlyNotificationType.business: 'business',
  FoodlyNotificationType.customer: 'customer',
};

const _$FoodlyNotificationSubTypeEnumMap = {
  FoodlyNotificationSubType.newFollower: 'new_follower',
  FoodlyNotificationSubType.newReview: 'new_review',
  FoodlyNotificationSubType.newPromotion: 'new_promotion',
  FoodlyNotificationSubType.promotionUpdate: 'promotion_update',
  FoodlyNotificationSubType.newFavoriteMenuItem: 'new_favorite_menu_item',
  FoodlyNotificationSubType.newFavoriteMenu: 'new_favorite_menu',
  FoodlyNotificationSubType.newFavoritePromotion: 'new_favorite_promotion',
  FoodlyNotificationSubType.generalUpdate: 'general_update',
  FoodlyNotificationSubType.newReservationRequest: 'new_reservation_request',
  FoodlyNotificationSubType.reservationConfirmed: 'reservation_confirmed',
  FoodlyNotificationSubType.reservationRejected: 'reservation_rejected',
  FoodlyNotificationSubType.reservationCancelled: 'reservation_cancelled',
  FoodlyNotificationSubType.reservationCancelledByBusiness:
      'reservation_cancelled_by_business',
  FoodlyNotificationSubType.serviceBookingRequested:
      'service_booking_requested',
  FoodlyNotificationSubType.serviceQuoteReceived: 'service_quote_received',
  FoodlyNotificationSubType.serviceQuoteApproved: 'service_quote_approved',
  FoodlyNotificationSubType.serviceQuoteRejected: 'service_quote_rejected',
  FoodlyNotificationSubType.serviceMessageNew: 'service_message_new',
  FoodlyNotificationSubType.followedUserPost: 'followed_user_post',
};
