// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_autocomplete_response_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceAutocompleteResponseDMImpl _$$PlaceAutocompleteResponseDMImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaceAutocompleteResponseDMImpl(
      status: $enumDecode(_$ProxyStatusEnumEnumMap, json['status'],
          unknownValue: ProxyStatusEnum.unknown),
      predictions: (json['predictions'] as List<dynamic>?)
              ?.map(
                  (e) => PlacePredictionDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PlacePredictionDM>[],
    );

Map<String, dynamic> _$$PlaceAutocompleteResponseDMImplToJson(
        _$PlaceAutocompleteResponseDMImpl instance) =>
    <String, dynamic>{
      'status': _$ProxyStatusEnumEnumMap[instance.status]!,
      'predictions': instance.predictions.map((e) => e.toJson()).toList(),
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
