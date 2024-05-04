import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_suggestion_dm.freezed.dart';
part 'place_suggestion_dm.g.dart';

@freezed
class PlaceSuggestionDM with _$PlaceSuggestionDM {
  const factory PlaceSuggestionDM({
    required String id,
    required String type,
    @JsonKey(name: 'place_type') required List<String> placeType,
    required double relevance,
    required Map<String, dynamic> properties,
    required String text,
    @JsonKey(name: 'place_name') required String placeName,
    @JsonKey(name: 'matching_text') String? matchingText,
    @JsonKey(name: 'matching_place_name') String? matchingPlaceName,
    List<double>? bbox,
    required List<double> center,
    required GeometryDM geometry,
    List<ContextDM>? context,
  }) = _PlaceSuggestionDM;

  factory PlaceSuggestionDM.fromJson(Map<String, dynamic> json) => _$PlaceSuggestionDMFromJson(json);
}

@freezed
class GeometryDM with _$GeometryDM {
  const factory GeometryDM({
    required String type,
    required List<double> coordinates,
  }) = _GeometryDM;

  factory GeometryDM.fromJson(Map<String, dynamic> json) => _$GeometryDMFromJson(json);
}

@freezed
class ContextDM with _$ContextDM {
  const factory ContextDM({
    required String id,
    @JsonKey(name: 'mapbox_id') String? mapboxId,
    String? wikidata,
    @JsonKey(name: 'short_code') String? shortCode,
    required String text,
  }) = _ContextDM;

  factory ContextDM.fromJson(Map<String, dynamic> json) => _$ContextDMFromJson(json);
}
