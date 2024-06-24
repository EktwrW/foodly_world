import 'package:foodly_world/core/enums/business_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'opening_hours_dm.freezed.dart';
part 'opening_hours_dm.g.dart';

@freezed
class BusinessOpeningHoursDm with _$BusinessOpeningHoursDm {
  const BusinessOpeningHoursDm._();

  const factory BusinessOpeningHoursDm({
    @JsonKey(name: 'business_opening_hours') @Default(BusinessDays()) BusinessDays businessDays,
  }) = _BusinessOpeningHoursDm;

  factory BusinessOpeningHoursDm.fromJson(Map<String, dynamic> json) => _$BusinessOpeningHoursDmFromJson(json);

  Map<Weekday, Day> get weekdaysData => {
        Weekday.sunday: businessDays.day0,
        Weekday.monday: businessDays.day1,
        Weekday.tuesday: businessDays.day2,
        Weekday.wednesday: businessDays.day3,
        Weekday.thursday: businessDays.day4,
        Weekday.friday: businessDays.day5,
        Weekday.saturday: businessDays.day6
      };

  bool get allDaysAreDayOff => weekdaysData.values.every((day) => day.isDayOff);
}

@freezed
class BusinessDays with _$BusinessDays {
  const factory BusinessDays({
    @JsonKey(name: 'day_0') @Default(Day()) Day day0,
    @JsonKey(name: 'day_1') @Default(Day()) Day day1,
    @JsonKey(name: 'day_2') @Default(Day()) Day day2,
    @JsonKey(name: 'day_3') @Default(Day()) Day day3,
    @JsonKey(name: 'day_4') @Default(Day()) Day day4,
    @JsonKey(name: 'day_5') @Default(Day()) Day day5,
    @JsonKey(name: 'day_6') @Default(Day()) Day day6,
  }) = _BusinessDays;

  factory BusinessDays.fromJson(Map<String, dynamic> json) => _$BusinessDaysFromJson(json);
}

@freezed
class Day with _$Day {
  const Day._();

  const factory Day({
    @JsonKey(name: 'open_a') String? openA,
    @JsonKey(name: 'open_b') String? openB,
    @JsonKey(name: 'close_a') String? closeA,
    @JsonKey(name: 'close_b') String? closeB,
  }) = _Day;

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  bool get isDayOff => openA == null && openB == null;
  bool get canAddSecondPeriod => openA != null && closeA != null;
  bool get limitPeriodsReached => canAddSecondPeriod && openB != null && closeB != null;
}
