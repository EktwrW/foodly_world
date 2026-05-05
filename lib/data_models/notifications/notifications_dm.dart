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
    @JsonKey(name: 'reservation_uuid') String? reservationUuid,
    // Social graph: post creado por un user seguido (Follow Loop). Lo
    // poblamos por completitud aunque hoy el tap-target del switch de
    // entityUuid es el perfil del actor (no hay aún una ruta a un post
    // individual). Si más adelante agregamos PostDetailPage, basta con
    // cambiar el case del switch a data?.postUuid.
    @JsonKey(name: 'post_uuid') String? postUuid,
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
    // Defensive parsing: if the BE ships a subType the FE enum doesn't know
    // about (e.g. a new vertical rolled out ahead of the FE patch), fall
    // back to `generalUpdate` instead of throwing ArgumentError. Without
    // this, a single unknown subtype in a page of results aborts the whole
    // `fromJson` of NotificationsResponseDM and the user sees an empty
    // list + the generic Dio error modal. Seen live on 2026-04-20 when the
    // BE started emitting service_booking_* subtypes for the Catering &
    // Chefs vertical before this enum was updated.
    @JsonKey(name: 'sub_type', unknownEnumValue: FoodlyNotificationSubType.generalUpdate)
    FoodlyNotificationSubType? subType,
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
        // Tap → perfil del autor del post. No tenemos ruta a un post
        // individual todavía; el perfil muestra todos sus posts y es el
        // destino más coherente con la intención del usuario al tocar
        // ("ver qué publicó esta persona que sigo").
        FoodlyNotificationSubType.followedUserPost => data?.actorUuid,
        FoodlyNotificationSubType.newFavoriteMenu => data?.menuUuid,
        FoodlyNotificationSubType.newFavoriteMenuItem => data?.foodItemUuid ?? data?.drinkItemUuid ?? data?.comboUuid,
        FoodlyNotificationSubType.newFavoritePromotion => data?.promotionUuid,
        FoodlyNotificationSubType.newReview => data?.businessUuid,
        FoodlyNotificationSubType.newPromotion => data?.promotionUuid,
        FoodlyNotificationSubType.promotionUpdate => data?.promotionUuid,
        FoodlyNotificationSubType.newReservationRequest ||
        FoodlyNotificationSubType.reservationConfirmed ||
        FoodlyNotificationSubType.reservationRejected ||
        FoodlyNotificationSubType.reservationCancelled ||
        FoodlyNotificationSubType.reservationCancelledByBusiness ||
        // Service bookings share the `reservations` table with dine-in so
        // the tap-through target is the same (my-reservations / manage-
        // reservations). The BE populates data.reservation_uuid for all of
        // these — see ReservationController::createServiceBookingNotification
        // and NotificationController::createNotification.
        FoodlyNotificationSubType.serviceBookingRequested ||
        FoodlyNotificationSubType.serviceQuoteReceived ||
        FoodlyNotificationSubType.serviceQuoteApproved ||
        FoodlyNotificationSubType.serviceQuoteRejected ||
        FoodlyNotificationSubType.serviceMessageNew =>
          data?.reservationUuid,
        _ => null,
      };

  /// Business UUID - present in business favorite notifications
  String? get businessUuid => data?.businessUuid;

  /// Reservation UUID - present in reservation notifications
  String? get reservationUuid => data?.reservationUuid;

  bool get isReservationNotification => const {
        FoodlyNotificationSubType.newReservationRequest,
        FoodlyNotificationSubType.reservationConfirmed,
        FoodlyNotificationSubType.reservationRejected,
        FoodlyNotificationSubType.reservationCancelled,
        FoodlyNotificationSubType.reservationCancelledByBusiness,
      }.contains(subType);

  /// Catering & Chefs service-booking notifications. Kept separate from
  /// [isReservationNotification] so the UI can show a different icon /
  /// copy if needed (e.g. a chef hat instead of a fork), even though both
  /// groups deep-link to the reservations screens.
  bool get isServiceBookingNotification => const {
        FoodlyNotificationSubType.serviceBookingRequested,
        FoodlyNotificationSubType.serviceQuoteReceived,
        FoodlyNotificationSubType.serviceQuoteApproved,
        FoodlyNotificationSubType.serviceQuoteRejected,
        FoodlyNotificationSubType.serviceMessageNew,
      }.contains(subType);
}
