import 'package:foodly_world/core/enums/business_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'opening_hours_dm.freezed.dart';
part 'opening_hours_dm.g.dart';

@freezed
class OpeningHoursDM with _$OpeningHoursDM {
  const factory OpeningHoursDM({
    @JsonKey(name: 'result') required Result result,
  }) = _OpeningHoursDM;

  factory OpeningHoursDM.fromJson(Map<String, dynamic> json) => _$OpeningHoursDMFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    required String name,
    @JsonKey(name: 'opening_hours') required OpeningHours openingHours,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class OpeningHours with _$OpeningHours {
  const factory OpeningHours({
    @JsonKey(name: 'open_now') required bool openNow,
    required List<Period> periods,
    @JsonKey(name: 'weekday_text') required List<String> weekdayText,
  }) = _OpeningHours;

  factory OpeningHours.fromJson(Map<String, dynamic> json) => _$OpeningHoursFromJson(json);
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
    required String time,
  }) = _OpenCloseDetails;

  factory OpenCloseDetails.fromJson(Map<String, dynamic> json) => _$OpenCloseDetailsFromJson(json);
}
