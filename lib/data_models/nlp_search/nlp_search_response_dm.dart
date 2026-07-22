import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nlp_search_response_dm.freezed.dart';
part 'nlp_search_response_dm.g.dart';

@freezed
abstract class NlpSearchResponseDM with _$NlpSearchResponseDM {
  const factory NlpSearchResponseDM({
    @JsonKey(name: 'business') @Default([]) List<BusinessDM> business,
    @JsonKey(name: 'nlp_info') NlpInfoDM? nlpInfo,
  }) = _NlpSearchResponseDM;

  factory NlpSearchResponseDM.fromJson(Map<String, dynamic> json) => _$NlpSearchResponseDMFromJson(json);
}

@freezed
abstract class NlpInfoDM with _$NlpInfoDM {
  const factory NlpInfoDM({
    @JsonKey(name: 'detected_categories') @Default([]) List<int> detectedCategories,
    @JsonKey(name: 'extracted_keywords') @Default([]) List<String> extractedKeywords,
    @Default(0.0) double confidence,
    @JsonKey(name: 'time_filter') TimeFilterDM? timeFilter,
  }) = _NlpInfoDM;

  factory NlpInfoDM.fromJson(Map<String, dynamic> json) => _$NlpInfoDMFromJson(json);
}

@freezed
abstract class TimeFilterDM with _$TimeFilterDM {
  const factory TimeFilterDM({
    String? from,
    String? to,
    @JsonKey(name: 'day_of_week') int? dayOfWeek,
    @JsonKey(name: 'meal_time') String? mealTime,
  }) = _TimeFilterDM;

  factory TimeFilterDM.fromJson(Map<String, dynamic> json) => _$TimeFilterDMFromJson(json);
}
