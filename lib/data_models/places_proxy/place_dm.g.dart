// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceDMImpl _$$PlaceDMImplFromJson(Map<String, dynamic> json) =>
    _$PlaceDMImpl(
      placeId: json['place_id'] as String?,
      name: json['name'] as String?,
      formattedAddress: json['formatted_address'] as String?,
      addressComponents: (json['address_components'] as List<dynamic>?)
              ?.map((e) =>
                  PlaceAddressComponentDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PlaceAddressComponentDM>[],
      geometry: json['geometry'] == null
          ? null
          : PlaceGeometryDM.fromJson(json['geometry'] as Map<String, dynamic>),
      formattedPhoneNumber: json['formatted_phone_number'] as String?,
      internationalPhoneNumber: json['international_phone_number'] as String?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
    );

Map<String, dynamic> _$$PlaceDMImplToJson(_$PlaceDMImpl instance) =>
    <String, dynamic>{
      if (instance.placeId case final value?) 'place_id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.formattedAddress case final value?)
        'formatted_address': value,
      'address_components':
          instance.addressComponents.map((e) => e.toJson()).toList(),
      if (instance.geometry?.toJson() case final value?) 'geometry': value,
      if (instance.formattedPhoneNumber case final value?)
        'formatted_phone_number': value,
      if (instance.internationalPhoneNumber case final value?)
        'international_phone_number': value,
      'types': instance.types,
    };
