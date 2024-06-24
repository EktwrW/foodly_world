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
  @JsonValue(0)
  sunday(0),
  @JsonValue(1)
  monday(1),
  @JsonValue(2)
  tuesday(2),
  @JsonValue(3)
  wednesday(3),
  @JsonValue(4)
  thursday(4),
  @JsonValue(5)
  friday(5),
  @JsonValue(6)
  saturday(6);

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

enum Hour {
  @JsonValue('00:00')
  zero('00:00'),
  @JsonValue('00:30')
  zeroAndAHalf('00:30'),
  @JsonValue('01:00')
  one('01:00'),
  @JsonValue('01:30')
  oneAndAHalf('01:30'),
  @JsonValue('02:00')
  two('02:00'),
  @JsonValue('02:30')
  twoAndAHalf('02:30'),
  @JsonValue('03:00')
  three('03:00'),
  @JsonValue('03:30')
  threeAndAHalf('03:30'),
  @JsonValue('04:00')
  four('04:00'),
  @JsonValue('04:30')
  fourAndAHalf('04:30'),
  @JsonValue('05:00')
  five('05:00'),
  @JsonValue('05:30')
  fiveAndAHalf('05:30'),
  @JsonValue('06:00')
  six('06:00'),
  @JsonValue('06:30')
  sixAndAHalf('06:30'),
  @JsonValue('07:00')
  seven('07:00'),
  @JsonValue('07:30')
  sevenAndAHalf('07:30'),
  @JsonValue('08:00')
  eight('08:00'),
  @JsonValue('08:30')
  eightAndAHalf('08:30'),
  @JsonValue('09:00')
  nine('09:00'),
  @JsonValue('09:30')
  nineAndAHalf('09:30'),
  @JsonValue('10:00')
  ten('10:00'),
  @JsonValue('10:30')
  tenAndAHalf('10:30'),
  @JsonValue('11:00')
  eleven('11:00'),
  @JsonValue('11:30')
  elevenAndAHalf('11:30'),
  @JsonValue('12:00')
  twelve('12:00'),
  @JsonValue('12:30')
  twelveAndAHalf('12:30'),
  @JsonValue('13:00')
  thirteen('13:00'),
  @JsonValue('13:30')
  thirteenAndAHalf('13:30'),
  @JsonValue('14:00')
  fourteen('14:00'),
  @JsonValue('14:30')
  fourteenAndAHalf('14:30'),
  @JsonValue('15:00')
  fifteen('15:00'),
  @JsonValue('15:30')
  fifteenAndAHalf('15:30'),
  @JsonValue('16:00')
  sixteen('16:00'),
  @JsonValue('16:30')
  sixteenAndAHalf('16:30'),
  @JsonValue('17:00')
  seventeen('17:00'),
  @JsonValue('17:30')
  seventeenAndAHalf('17:30'),
  @JsonValue('18:00')
  eighteen('18:00'),
  @JsonValue('18:30')
  eighteenAndAHalf('18:30'),
  @JsonValue('19:00')
  nineteen('19:00'),
  @JsonValue('19:30')
  nineteenAndAHalf('19:30'),
  @JsonValue('20:00')
  twenty('20:00'),
  @JsonValue('20:30')
  twentyAndAHalf('20:30'),
  @JsonValue('21:00')
  twentyOne('21:00'),
  @JsonValue('21:30')
  twentyOneAndAHalf('21:30'),
  @JsonValue('22:00')
  twentyTwo('22:00'),
  @JsonValue('22:30')
  twentyTwoAndAHalf('22:30'),
  @JsonValue('23:00')
  twentyThree('23:00'),
  @JsonValue('23:30')
  twentyThreeAndAHalf('23:30');

  final String value;
  const Hour(this.value);
}
