import 'package:flutter/material.dart' show IconData, Icons;
import 'package:foodly_world/generated/l10n.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:json_annotation/json_annotation.dart';

enum BusinessServices {
  @JsonValue(1)
  wifi(Bootstrap.wifi, 1),
  @JsonValue(2)
  multiLanguage(Icons.language, 2),
  @JsonValue(3)
  kidChairs(Icons.child_care, 3),
  @JsonValue(4)
  babyChangingStation(Icons.baby_changing_station, 4),
  @JsonValue(5)
  kidsPlayArea(BoxIcons.bx_child, 5),
  @JsonValue(6)
  outdoor(Icons.table_restaurant, 6),
  @JsonValue(7)
  accessiblePMR(Icons.accessible_sharp, 7),
  @JsonValue(8)
  delivery(Icons.delivery_dining, 8),
  @JsonValue(9)
  takeAway(Icons.takeout_dining_sharp, 9),
  @JsonValue(10)
  smokingArea(Icons.smoking_rooms, 10),
  @JsonValue(11)
  happyHours(BoxIcons.bxs_drink, 11),
  @JsonValue(12)
  happyBirthday(Bootstrap.cake2_fill, 12),
  @JsonValue(13)
  parking(BoxIcons.bxs_parking, 13),
  @JsonValue(14)
  petFriendly(Icons.pets, 14),
  @JsonValue(15)
  catering(Icons.room_service, 15),
  @JsonValue(16)
  liveMusic(Bootstrap.music_note_list, 16);

  final IconData iconData;
  final int value;

  const BusinessServices(this.iconData, this.value);

  static final _textMap = {
    BusinessServices.wifi: S.current.wifi,
    BusinessServices.kidChairs: S.current.kidChairs,
    BusinessServices.babyChangingStation: S.current.babyChangingStation,
    BusinessServices.smokingArea: S.current.smokingArea,
    BusinessServices.accessiblePMR: S.current.accessiblePMR,
    BusinessServices.happyBirthday: S.current.happyBirthday,
    BusinessServices.multiLanguage: S.current.multilanguage,
    BusinessServices.delivery: S.current.delivery,
    BusinessServices.takeAway: S.current.takeAway,
    BusinessServices.kidsPlayArea: S.current.kidsPlayArea,
    BusinessServices.catering: S.current.catering,
    BusinessServices.happyHours: S.current.happyHours,
    BusinessServices.parking: S.current.parking,
    BusinessServices.petFriendly: S.current.petFriendly,
    BusinessServices.outdoor: S.current.outdoorSeating,
    BusinessServices.liveMusic: S.current.liveMusic,
  };

  String get text => _textMap[this] ?? '';
}

enum BusinessPlan {
  @JsonValue('free')
  free,
  @JsonValue('plan_3')
  plan3,
  @JsonValue('plan_6')
  plan6,
  @JsonValue('plan_9')
  plan9,
}

extension BusinessPlanExtension on BusinessPlan {
  String get value {
    switch (this) {
      case BusinessPlan.free:
        return 'free';
      case BusinessPlan.plan3:
        return 'plan_3';
      case BusinessPlan.plan6:
        return 'plan_6';
      case BusinessPlan.plan9:
        return 'plan_9';
      default:
        return 'free';
    }
  }
}

enum Weekday {
  @JsonValue(1)
  sunday(1),
  @JsonValue(2)
  monday(2),
  @JsonValue(3)
  tuesday(3),
  @JsonValue(4)
  wednesday(4),
  @JsonValue(5)
  thursday(5),
  @JsonValue(6)
  friday(6),
  @JsonValue(7)
  saturday(7);

  final int value;
  const Weekday(this.value);

  static final _dayStrings = {
    Weekday.sunday: S.current.weekday1,
    Weekday.monday: S.current.weekday2,
    Weekday.tuesday: S.current.weekday3,
    Weekday.wednesday: S.current.weekday4,
    Weekday.thursday: S.current.weekday5,
    Weekday.friday: S.current.weekday6,
    Weekday.saturday: S.current.weekday7,
  };

  String get dayString => _dayStrings[this] ?? '';
}
