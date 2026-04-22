// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_response_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceDetailsResponseDMImpl _$$PlaceDetailsResponseDMImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaceDetailsResponseDMImpl(
      status: $enumDecode(_$ProxyStatusEnumEnumMap, json['status'],
          unknownValue: ProxyStatusEnum.unknown),
      result: json['result'] == null
          ? null
          : PlaceDM.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PlaceDetailsResponseDMImplToJson(
        _$PlaceDetailsResponseDMImpl instance) =>
    <String, dynamic>{
      'status': _$ProxyStatusEnumEnumMap[instance.status]!,
      if (instance.result?.toJson() case final value?) 'result': value,
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
