// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_address_component_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceAddressComponentDMImpl _$$PlaceAddressComponentDMImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaceAddressComponentDMImpl(
      longName: json['long_name'] as String,
      shortName: json['short_name'] as String,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
    );

Map<String, dynamic> _$$PlaceAddressComponentDMImplToJson(
        _$PlaceAddressComponentDMImpl instance) =>
    <String, dynamic>{
      'long_name': instance.longName,
      'short_name': instance.shortName,
      'types': instance.types,
    };
