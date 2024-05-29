import 'package:foodly_world/core/enums/business_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'opening_hours_dm.freezed.dart';
part 'opening_hours_dm.g.dart';

@freezed
class OpeningHoursResult with _$OpeningHoursResult {
  const factory OpeningHoursResult({
    @JsonKey(name: 'opening_hours') required OpeningHoursDM openingHoursDM,
  }) = _OpeningHoursResult;

  factory OpeningHoursResult.fromJson(Map<String, dynamic> json) => _$OpeningHoursResultFromJson(json);
}

@freezed
class OpeningHoursDM with _$OpeningHoursDM {
  const OpeningHoursDM._();

  const factory OpeningHoursDM({
    @JsonKey(name: 'periods') @Default([]) List<Period> periods,
  }) = _OpeningHoursDM;

  factory OpeningHoursDM.fromJson(Map<String, dynamic> json) => _$OpeningHoursDMFromJson(json);

  bool get isOpenNow {
    final now = DateTime.now();
    final currentWeekday = Weekday.values.firstWhere((day) => day.value == now.weekday);
    final currentTime = '${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}';

    return periods.any((period) {
      final (openDay, openTime) = (period.open.day, period.open.time);
      final (closeDay, closeTime) = (period.close.day, period.close.time);

      if (openDay == currentWeekday) {
        // Handle case when open and close are on the same day
        if (closeDay == currentWeekday) {
          return currentTime.compareTo(openTime) >= 0 && currentTime.compareTo(closeTime) <= 0;
        }

        // Handle case when close is on the next day
        return currentTime.compareTo(openTime) >= 0;
      }

      // Handle case when the current day is the close day and open day was the previous day
      if (closeDay == currentWeekday && openDay.value == (currentWeekday.value - 1) % 7) {
        return currentTime.compareTo(closeTime) <= 0;
      }

      return false;
    });
  }
}

@freezed
class Period with _$Period {
  const factory Period({
    required OpenCloseDetails open,
    required OpenCloseDetails close,
  }) = _Period;

  factory Period.fromJson(Map<String, dynamic> json) => _$PeriodFromJson(json);
}

@freezed
class OpenCloseDetails with _$OpenCloseDetails {
  const factory OpenCloseDetails({
    required Weekday day,

    /// 'time' is saved using 0000 simple string formatting because we want to keep the current format from the google places api
    required String time,
  }) = _OpenCloseDetails;

  factory OpenCloseDetails.fromJson(Map<String, dynamic> json) => _$OpenCloseDetailsFromJson(json);
}
