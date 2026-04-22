// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_forward_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodingForwardRequestDTO _$GeocodingForwardRequestDTOFromJson(
        Map<String, dynamic> json) =>
    GeocodingForwardRequestDTO(
      query: json['query'] as String,
      language: json['language'] as String?,
      region: json['region'] as String?,
    );

Map<String, dynamic> _$GeocodingForwardRequestDTOToJson(
        GeocodingForwardRequestDTO instance) =>
    <String, dynamic>{
      'query': instance.query,
      if (instance.language case final value?) 'language': value,
      if (instance.region case final value?) 'region': value,
    };
