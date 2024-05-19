import 'package:flutter/material.dart' show IconData, Icons;
import 'package:foodly_world/generated/l10n.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:json_annotation/json_annotation.dart';

enum BusinessServices {
  wifi(Bootstrap.wifi),
  multiLanguage(Icons.language),
  kidChairs(Icons.child_care),
  babyChangingStation(Icons.baby_changing_station),
  kidsPlayArea(BoxIcons.bx_child),
  accessiblePMR(Icons.accessible_sharp),
  delivery(Icons.delivery_dining),
  takeAway(Icons.takeout_dining_sharp),
  smokingArea(Icons.smoking_rooms),
  happyHours(BoxIcons.bxs_drink),
  happyBirthday(Bootstrap.cake2_fill),
  parking(BoxIcons.bxs_parking),
  petFriendly(Icons.pets),
  catering(Icons.room_service);

  final IconData iconData;

  const BusinessServices(this.iconData);

  String get text {
    switch (this) {
      case BusinessServices.wifi:
        return S.current.wifi;
      case BusinessServices.kidChairs:
        return S.current.kidChairs;
      case BusinessServices.babyChangingStation:
        return S.current.babyChangingStation;
      case BusinessServices.smokingArea:
        return S.current.smokingArea;
      case BusinessServices.accessiblePMR:
        return S.current.accessiblePMR;
      case BusinessServices.happyBirthday:
        return S.current.happyBirthday;
      case BusinessServices.multiLanguage:
        return S.current.multilanguage;
      case BusinessServices.delivery:
        return S.current.delivery;
      case BusinessServices.takeAway:
        return S.current.takeAway;
      case BusinessServices.kidsPlayArea:
        return S.current.kidsPlayArea;
      case BusinessServices.catering:
        return S.current.catering;
      case BusinessServices.happyHours:
        return S.current.happyHours;
      case BusinessServices.parking:
        return S.current.parking;
      case BusinessServices.petFriendly:
        return S.current.petFriendly;
    }
  }
}

enum BusinessPlan {
  @JsonValue('free')
  free,
  @JsonValue('plan3')
  plan3,
  @JsonValue('plan6')
  plan6,
  @JsonValue('plan9')
  plan9,
}

extension BusinessPlanExtension on BusinessPlan {
  String get value {
    switch (this) {
      case BusinessPlan.free:
        return 'free';
      case BusinessPlan.plan3:
        return 'plan3';
      case BusinessPlan.plan6:
        return 'plan6';
      case BusinessPlan.plan9:
        return 'plan9';
      default:
        return 'free';
    }
  }
}
