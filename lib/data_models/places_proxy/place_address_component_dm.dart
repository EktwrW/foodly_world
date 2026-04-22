import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_address_component_dm.freezed.dart';
part 'place_address_component_dm.g.dart';

/// Item de la lista `address_components` que Google devuelve tanto en
/// Place Details como en Geocoding.
///
/// Estructura estable de Google — misma shape hace ~10 años. Los `types`
/// son strings tipo `country`, `locality`, `administrative_area_level_1`,
/// `postal_code`, `route`, `street_number`, `premise`, `plus_code`, etc.
/// Los consumidores filtran por `types.contains('country')` etc (mismo
/// pattern que hoy en location_service y location_bloc).
///
/// `@Default([])` en `types` evita NPEs en edge cases raros (p.ej. algún
/// address component sin tipo — no he visto nunca, pero el defensivo es
/// barato y mata toda una clase de bugs).
@freezed
class PlaceAddressComponentDM with _$PlaceAddressComponentDM {
  const factory PlaceAddressComponentDM({
    @JsonKey(name: 'long_name') required String longName,
    @JsonKey(name: 'short_name') required String shortName,
    @Default(<String>[]) List<String> types,
  }) = _PlaceAddressComponentDM;

  factory PlaceAddressComponentDM.fromJson(Map<String, dynamic> json) =>
      _$PlaceAddressComponentDMFromJson(json);
}
