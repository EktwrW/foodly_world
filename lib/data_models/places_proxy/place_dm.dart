import 'package:foodly_world/data_models/places_proxy/place_address_component_dm.dart';
import 'package:foodly_world/data_models/places_proxy/place_geometry_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_dm.freezed.dart';
part 'place_dm.g.dart';

/// Reemplazo drop-in del `Place` de `nova_places_api` en nuestros consumers.
///
/// **Superficie compatible** (campos que hoy usa el código):
///   - `place.name`                     → `placeDM.name`
///   - `place.formattedAddress`         → `placeDM.formattedAddress`
///   - `place.geometry.location.lat`    → `placeDM.geometry?.location.lat`
///   - `place.geometry.location.lng`    → `placeDM.geometry?.location.lng`
///   - `place.addressComponents`        → `placeDM.addressComponents`
///       - `.longName`                  ← `long_name`
///       - `.shortName`                 ← `short_name`
///       - `.types`                     ← `types` (lista de strings)
///   - `place.types`                    → `placeDM.types` (top-level del
///     result, ej. `["locality", "political"]`). Default: lista vacía.
///
/// **Campos extra** que llegan porque lo pedimos en el field mask del backend
/// (ver `config/places_proxy.php` → `details_fields`):
///   - `formatted_phone_number` / `international_phone_number` — para
///     business onboarding, autofill del campo teléfono.
///
/// Coordenadas defensivas: `geometry` es nullable aunque Google SIEMPRE lo
/// envía. Razón: en Fase 1 hubo un bug donde el DTO del nova_places_api
/// perdía coords en el roundtrip por tipos mal mapeados. Mejor ser explícito
/// y dejar que el caller use `?? 0.0` o valide con `geometry != null`.
@freezed
class PlaceDM with _$PlaceDM {
  const factory PlaceDM({
    @JsonKey(name: 'place_id') String? placeId,
    String? name,
    @JsonKey(name: 'formatted_address') String? formattedAddress,
    @JsonKey(name: 'address_components') @Default(<PlaceAddressComponentDM>[]) List<PlaceAddressComponentDM> addressComponents,
    PlaceGeometryDM? geometry,
    @JsonKey(name: 'formatted_phone_number') String? formattedPhoneNumber,
    @JsonKey(name: 'international_phone_number') String? internationalPhoneNumber,
    // `types` top-level del Place (ej. `["locality", "political"]`). Lo
    // pedimos en el field mask del backend porque algunos consumers
    // (p.ej. distinguir street_address de route) lo necesitan. Default
    // a lista vacía para que los consumers puedan hacer `.contains(...)`
    // sin null-checks.
    @Default(<String>[]) List<String> types,
  }) = _PlaceDM;

  factory PlaceDM.fromJson(Map<String, dynamic> json) => _$PlaceDMFromJson(json);
}
