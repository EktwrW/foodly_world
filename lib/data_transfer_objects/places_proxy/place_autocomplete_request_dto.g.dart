// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_autocomplete_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceAutocompleteRequestDTO _$PlaceAutocompleteRequestDTOFromJson(
        Map<String, dynamic> json) =>
    PlaceAutocompleteRequestDTO(
      input: json['input'] as String,
      sessionToken: json['sessionToken'] as String?,
      language: json['language'] as String?,
      region: json['region'] as String?,
      components: json['components'] as String?,
      location: json['location'] as String?,
      radius: (json['radius'] as num?)?.toInt(),
      types: json['types'] as String?,
    );

Map<String, dynamic> _$PlaceAutocompleteRequestDTOToJson(
        PlaceAutocompleteRequestDTO instance) =>
    <String, dynamic>{
      'input': instance.input,
      if (instance.sessionToken case final value?) 'sessionToken': value,
      if (instance.language case final value?) 'language': value,
      if (instance.region case final value?) 'region': value,
      if (instance.components case final value?) 'components': value,
      if (instance.location case final value?) 'location': value,
      if (instance.radius case final value?) 'radius': value,
      if (instance.types case final value?) 'types': value,
    };
