// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_result_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeocodingResultDMImpl _$$GeocodingResultDMImplFromJson(
        Map<String, dynamic> json) =>
    _$GeocodingResultDMImpl(
      placeId: json['place_id'] as String?,
      formattedAddress: json['formatted_address'] as String?,
      addressComponents: (json['address_components'] as List<dynamic>?)
              ?.map((e) =>
                  PlaceAddressComponentDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PlaceAddressComponentDM>[],
      geometry: json['geometry'] == null
          ? null
          : PlaceGeometryDM.fromJson(json['geometry'] as Map<String, dynamic>),
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
    );

Map<String, dynamic> _$$GeocodingResultDMImplToJson(
        _$GeocodingResultDMImpl instance) =>
    <String, dynamic>{
      if (instance.placeId case final value?) 'place_id': value,
      if (instance.formattedAddress case final value?)
        'formatted_address': value,
      'address_components':
          instance.addressComponents.map((e) => e.toJson()).toList(),
      if (instance.geometry?.toJson() case final value?) 'geometry': value,
      'types': instance.types,
    };
