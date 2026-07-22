import 'package:foodly_world/core/enums/business_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'opening_hours_dm.freezed.dart';
part 'opening_hours_dm.g.dart';

@freezed
abstract class BusinessDays with _$BusinessDays {
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
        Weekday.saturday: day6,
      };

  // `isOpen` getter intentionally removed: use [BusinessDM.isOpen] instead,
  // which reads the server-computed `status` field. The BE applies the
  // business's local timezone (via BusinessStatusHelper) — computing it
  // here with `DateTime.now()` was wrong for any cross-timezone viewer.
  // [Day.isInOpeningHoursRange] still exists for the visited/business
  // weekly opening-hours widget, where it's only used to highlight the
  // current weekday row (visual cue, not a status truth).

  bool get allDaysAreDayOff => weekdaysData.values.every((day) => day.isDayOff);
}

@freezed
abstract class Day with _$Day {
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

  bool get isInOpeningHoursRange {
    if (isDayOff) return false;

    return isWithinPeriod(openA, closeA) || isWithinPeriod(openB, closeB);
  }

  bool isWithinPeriod(String? open, String? close) {
    if (open == null || close == null) return false;

    final now = DateTime.now();
    final dateFormat = DateFormat('HH:mm');

    final openTime = dateFormat.parse(open);
    final closeTime = dateFormat.parse(close);

    final openDateTime = DateTime(now.year, now.month, now.day, openTime.hour, openTime.minute);
    var closeDateTime = DateTime(now.year, now.month, now.day, closeTime.hour, closeTime.minute);

    // Handle next day close time (e.g., open 22:00, close 02:00)
    if (closeDateTime.isBefore(openDateTime)) {
      closeDateTime = closeDateTime.add(const Duration(days: 1));
    }

    // Check if current time is between open and close times
    return now.isAfter(openDateTime) && now.isBefore(closeDateTime) || 
        now.isAtSameMomentAs(openDateTime); // Also consider exact opening time as open
  }

  bool get closeAIsNextDay {
    if (openA == null || closeA == null) return false;

    final hourA = int.parse(openA!.replaceAll(':', ''));
    final hourB = int.parse(closeA!.replaceAll(':', ''));

    return hourB < hourA;
  }

  bool get closeBIsNextDay {
    if (openB == null || closeB == null) return false;
    if (closeAIsNextDay) return false;

    final open = int.parse(openB!.replaceAll(':', ''));
    final close = int.parse(closeB!.replaceAll(':', ''));

    return open > close;
  }

  bool get openAAndCloseBHaveConflict {
    if (openA != null && closeB != null) {
      final hourA = int.parse(openA!.replaceAll(':', ''));
      final hourB = int.parse(closeB!.replaceAll(':', ''));

      return hourB > hourA && closeBIsNextDay;
    }

    return false;
  }

  bool get closeAAndOpenBHaveConflict {
    if (closeA != null && openB != null) {
      final hourA = int.parse(closeA!.replaceAll(':', ''));
      final hourB = int.parse(openB!.replaceAll(':', ''));

      return hourB < hourA;
    }

    return false;
  }
}
