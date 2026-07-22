import 'package:flutter/material.dart' show Icons, IconData;
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;
import 'package:json_annotation/json_annotation.dart' show JsonEnum, JsonValue;

@JsonEnum()
enum FoodlyNotificationType {
  @JsonValue('business')
  business('business'),
  @JsonValue('customer')
  customer('customer');

  final String value;
  const FoodlyNotificationType(this.value);

  IconData get icon {
    switch (this) {
      case FoodlyNotificationType.business:
        return Icons.business_center_rounded;
      case FoodlyNotificationType.customer:
        return Bootstrap.person_vcard_fill;
    }
  }
}

@JsonEnum()
enum FoodlyNotificationSubType {
  @JsonValue('new_follower')
  newFollower('new_follower'),
  @JsonValue('new_review')
  newReview('new_review'),
  @JsonValue('new_promotion')
  newPromotion('new_promotion'),
  @JsonValue('promotion_update')
  promotionUpdate('promotion_update'),
  @JsonValue('new_favorite_menu_item')
  newFavoriteMenuItem('new_favorite_menu_item'),
  @JsonValue('new_favorite_menu')
  newFavoriteMenu('new_favorite_menu'),
  @JsonValue('new_favorite_promotion')
  newFavoritePromotion('new_favorite_promotion'),
  @JsonValue('general_update')
  generalUpdate('general_update'),
  @JsonValue('new_reservation_request')
  newReservationRequest('new_reservation_request'),
  @JsonValue('reservation_confirmed')
  reservationConfirmed('reservation_confirmed'),
  @JsonValue('reservation_rejected')
  reservationRejected('reservation_rejected'),
  @JsonValue('reservation_cancelled')
  reservationCancelled('reservation_cancelled'),
  @JsonValue('reservation_cancelled_by_business')
  reservationCancelledByBusiness('reservation_cancelled_by_business'),
  // --------------------------------------------------------------------
  // Catering & Chefs service bookings (vertical launched Apr 2026).
  // Emitted by BE ReservationController + ReservationMessageController
  // and gated by NotificationController::PUSH_ELIGIBLE_SUBTYPES. These
  // notifications carry the reservation_uuid in `data` because service
  // bookings live in the same `reservations` table as dine-in/events.
  //
  // Adding a new subtype here requires:
  //   1. matching string in BE Notification::SUBTYPE_SERVICE_* const
  //   2. i18n entry in lang/{en,es,pt}/notifications.php
  //   3. update to entityUuid / isServiceBookingNotification in
  //      notifications_dm.dart so the tap-to-navigate works.
  // The @JsonKey(unknownEnumValue: generalUpdate) on NotificationDM.subType
  // prevents a missing entry here from breaking the whole list (it
  // degrades silently to generalUpdate). Do not remove that safety net.
  // --------------------------------------------------------------------
  @JsonValue('service_booking_requested')
  serviceBookingRequested('service_booking_requested'),
  @JsonValue('service_quote_received')
  serviceQuoteReceived('service_quote_received'),
  @JsonValue('service_quote_approved')
  serviceQuoteApproved('service_quote_approved'),
  @JsonValue('service_quote_rejected')
  serviceQuoteRejected('service_quote_rejected'),
  @JsonValue('service_message_new')
  serviceMessageNew('service_message_new'),
  // Social graph (Follow Loop, mayo 2026): un user que el destinatario
  // sigue publicó un post nuevo. Push-eligible (ver
  // NotificationController::PUSH_ELIGIBLE_SUBTYPES). Tap-target = perfil
  // del actor; `data` trae actor_uuid + post_uuid.
  @JsonValue('followed_user_post')
  followedUserPost('followed_user_post');

  final String value;
  const FoodlyNotificationSubType(this.value);
}
