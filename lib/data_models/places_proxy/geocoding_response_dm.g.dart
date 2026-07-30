// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_response_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeocodingResponseDM _$GeocodingResponseDMFromJson(Map<String, dynamic> json) =>
    _GeocodingResponseDM(
      status: $enumDecode(_$ProxyStatusEnumEnumMap, json['status'],
          unknownValue: ProxyStatusEnum.unknown),
      results: (json['results'] as List<dynamic>?)
              ?.map(
                  (e) => GeocodingResultDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <GeocodingResultDM>[],
    );

Map<String, dynamic> _$GeocodingResponseDMToJson(
        _GeocodingResponseDM instance) =>
    <String, dynamic>{
      'status': _$ProxyStatusEnumEnumMap[instance.status]!,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

const _$ProxyStatusEnumEnumMap = {
  ProxyStatusEnum.ok: 'OK',
  ProxyStatusEnum.zeroResults: 'ZERO_RESULTS',
  ProxyStatusEnum.notFound: 'NOT_FOUND',
  ProxyStatusEnum.invalidRequest: 'INVALID_REQUEST',
  ProxyStatusEnum.overQueryLimit: 'OVER_QUERY_LIMIT',
  ProxyStatusEnum.requestDenied: 'REQUEST_DENIED',
  ProxyStatusEnum.unknownError: 'UNKNOWN_ERROR',
  ProxyStatusEnum.upstreamError: 'UPSTREAM_ERROR',
  ProxyStatusEnum.unknown: 'unknown',
};
