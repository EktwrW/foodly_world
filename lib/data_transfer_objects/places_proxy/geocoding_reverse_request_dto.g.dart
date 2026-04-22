// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_reverse_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodingReverseRequestDTO _$GeocodingReverseRequestDTOFromJson(
        Map<String, dynamic> json) =>
    GeocodingReverseRequestDTO(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      language: json['language'] as String?,
      region: json['region'] as String?,
    );

Map<String, dynamic> _$GeocodingReverseRequestDTOToJson(
        GeocodingReverseRequestDTO instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      if (instance.language case final value?) 'language': value,
      if (instance.region case final value?) 'region': value,
    };
