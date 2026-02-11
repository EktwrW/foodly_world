import 'package:flutter/material.dart' show Icons, IconData;
import 'package:icons_plus/icons_plus.dart' show Bootstrap;
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
  generalUpdate('general_update');

  final String value;
  const FoodlyNotificationSubType(this.value);
}
