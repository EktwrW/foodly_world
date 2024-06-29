import 'package:foodly_world/core/enums/business_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'opening_hours_dm.freezed.dart';
part 'opening_hours_dm.g.dart';

@freezed
class BusinessOpeningHoursDm with _$BusinessOpeningHoursDm {
  const factory BusinessOpeningHoursDm({
    @JsonKey(name: 'business_opening_hours') @Default(BusinessDays()) BusinessDays businessDays,
  }) = _BusinessOpeningHoursDm;

  factory BusinessOpeningHoursDm.fromJson(Map<String, dynamic> json) => _$BusinessOpeningHoursDmFromJson(json);
}

@freezed
class BusinessDays with _$BusinessDays {
  const BusinessDays._();

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

  Map<Weekday, Day> get weekdaysData => {
        Weekday.sunday: day0,
        Weekday.monday: day1,
        Weekday.tuesday: day2,
        Weekday.wednesday: day3,
        Weekday.thursday: day4,
        Weekday.friday: day5,
        Weekday.saturday: day6
      };

  bool get allDaysAreDayOff => weekdaysData.values.every((day) => day.isDayOff);
}

@freezed
class Day with _$Day {
  const Day._();

  const factory Day({
    @JsonKey(name: 'open_a') String? openA,
    @JsonKey(name: 'open_b') String? openB,
    @JsonKey(name: 'close_a') String? closeA,
    @JsonKey(name: 'close_b') String? closeB,
    @JsonKey(includeFromJson: false, includeToJson: false) @Default(false) bool showSecondPeriod,
  }) = _Day;

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  bool get isDayOff => openA == null && openB == null;
  bool get canSaveOrAddSecondPeriod => openA != null && closeA != null;
  bool get limitPeriodsReached => canSaveOrAddSecondPeriod && openB != null && closeB != null;
}
