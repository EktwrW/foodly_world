// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_search_body_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessSearchBodyDTO _$BusinessSearchBodyDTOFromJson(
        Map<String, dynamic> json) =>
    BusinessSearchBodyDTO(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      radius: (json['radius'] as num?)?.toDouble(),
      voiceText: json['voice_text'] as String,
    );

Map<String, dynamic> _$BusinessSearchBodyDTOToJson(
        BusinessSearchBodyDTO instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      if (instance.radius case final value?) 'radius': value,
      'voice_text': instance.voiceText,
    };
