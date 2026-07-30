// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_prediction_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlacePredictionDM _$PlacePredictionDMFromJson(Map<String, dynamic> json) =>
    _PlacePredictionDM(
      placeId: json['place_id'] as String,
      description: json['description'] as String,
      structuredFormatting: json['structured_formatting'] == null
          ? null
          : PlaceStructuredFormattingDM.fromJson(
              json['structured_formatting'] as Map<String, dynamic>),
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
    );

Map<String, dynamic> _$PlacePredictionDMToJson(_PlacePredictionDM instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'description': instance.description,
      if (instance.structuredFormatting?.toJson() case final value?)
        'structured_formatting': value,
      'types': instance.types,
    };

_PlaceStructuredFormattingDM _$PlaceStructuredFormattingDMFromJson(
        Map<String, dynamic> json) =>
    _PlaceStructuredFormattingDM(
      mainText: json['main_text'] as String?,
      secondaryText: json['secondary_text'] as String?,
    );

Map<String, dynamic> _$PlaceStructuredFormattingDMToJson(
        _PlaceStructuredFormattingDM instance) =>
    <String, dynamic>{
      if (instance.mainText case final value?) 'main_text': value,
      if (instance.secondaryText case final value?) 'secondary_text': value,
    };
