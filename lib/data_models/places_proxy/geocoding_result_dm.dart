import 'package:foodly_world/data_models/places_proxy/place_address_component_dm.dart';
import 'package:foodly_world/data_models/places_proxy/place_geometry_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'geocoding_result_dm.freezed.dart';
part 'geocoding_result_dm.g.dart';

/// Item de la lista `results` que devuelven Geocoding reverse y forward.
///
/// Shape cuasi-idéntica a un Place Details, pero Google omite algunos
/// campos (no hay `name`, no hay `formatted_phone_number`) y agrega
/// `types` a nivel root (qué representa el resultado: `street_address`,
/// `locality`, `postal_code`, `country`, `plus_code`, etc.).
///
/// Los consumers típicos (LocationBloc, signup auto-fill) solo miran
/// `addressComponents` para extraer country/state/city/postal_code +
/// `formattedAddress` para mostrar.
@freezed
class GeocodingResultDM with _$GeocodingResultDM {
  const factory GeocodingResultDM({
    @JsonKey(name: 'place_id') String? placeId,
    @JsonKey(name: 'formatted_address') String? formattedAddress,
    @JsonKey(name: 'address_components') @Default(<PlaceAddressComponentDM>[]) List<PlaceAddressComponentDM> addressComponents,
    PlaceGeometryDM? geometry,
    @Default(<String>[]) List<String> types,
  }) = _GeocodingResultDM;

  factory GeocodingResultDM.fromJson(Map<String, dynamic> json) => _$GeocodingResultDMFromJson(json);
}
