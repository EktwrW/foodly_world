import 'package:json_annotation/json_annotation.dart' show JsonValue;

enum ReviewType {
  @JsonValue('business')
  business,
  @JsonValue('dish')
  dish,
  @JsonValue('service')
  service,
  @JsonValue('drink')
  drink,
  @JsonValue('promotion')
  promotion,
  @JsonValue('event')
  event;

  bool get isBusiness => this == ReviewType.business;
  bool get isDish => this == ReviewType.dish;
  bool get isService => this == ReviewType.service;
  bool get isDrink => this == ReviewType.drink;
  bool get isPromotion => this == ReviewType.promotion;
  bool get isEvent => this == ReviewType.event;
}
