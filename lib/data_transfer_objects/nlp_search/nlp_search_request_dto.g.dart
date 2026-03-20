// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nlp_search_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NlpSearchRequestDTO _$NlpSearchRequestDTOFromJson(Map<String, dynamic> json) =>
    NlpSearchRequestDTO(
      query: json['query'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      distanceKm: (json['distance_km'] as num?)?.toDouble(),
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      userUuid: json['user_uuid'] as String?,
      sessionId: json['session_id'] as String?,
      platform:
          $enumDecodeNullable(_$NlpSearchPlatformEnumMap, json['platform']),
      deviceInfo: json['device_info'] == null
          ? null
          : DeviceInfoDTO.fromJson(json['device_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NlpSearchRequestDTOToJson(
        NlpSearchRequestDTO instance) =>
    <String, dynamic>{
      'query': instance.query,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      if (instance.distanceKm case final value?) 'distance_km': value,
      if (instance.limit case final value?) 'limit': value,
      if (instance.offset case final value?) 'offset': value,
      if (instance.userUuid case final value?) 'user_uuid': value,
      if (instance.sessionId case final value?) 'session_id': value,
      if (_$NlpSearchPlatformEnumMap[instance.platform] case final value?)
        'platform': value,
      if (instance.deviceInfo?.toJson() case final value?) 'device_info': value,
    };

const _$NlpSearchPlatformEnumMap = {
  NlpSearchPlatform.android: 'android',
  NlpSearchPlatform.ios: 'ios',
  NlpSearchPlatform.web: 'web',
  NlpSearchPlatform.desktop: 'desktop',
  NlpSearchPlatform.unknown: 'unknown',
};
