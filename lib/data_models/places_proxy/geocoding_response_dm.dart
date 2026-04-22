import 'package:foodly_world/data_models/places_proxy/geocoding_result_dm.dart';
import 'package:foodly_world/data_models/places_proxy/proxy_status_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'geocoding_response_dm.freezed.dart';
part 'geocoding_response_dm.g.dart';

/// Respuesta común de `POST /api/geocoding/reverse` y `POST /api/geocoding/forward`.
///
/// Shape espejo del backend (mismo envelope para ambos endpoints):
/// ```json
/// {
///   "status": "OK",
///   "results": [ ... ]
/// }
/// ```
///
/// Convención de consumo: el "mejor" resultado siempre es `results[0]`
/// (Google ordena por relevancia). Consumers que solo necesitan un
/// componente (country, city) deben buscar en `results[0].addressComponents`
/// con `firstWhereOrNull((c) => c.types.contains('...'))`, mismo patrón
/// que hoy en `location_bloc::getLocationDetailsFromCoordinates` y
/// `location_service::updateLocationFromPlace`.
@freezed
class GeocodingResponseDM with _$GeocodingResponseDM {
  const factory GeocodingResponseDM({
    @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown) required ProxyStatusEnum status,
    @Default(<GeocodingResultDM>[]) List<GeocodingResultDM> results,
  }) = _GeocodingResponseDM;

  factory GeocodingResponseDM.fromJson(Map<String, dynamic> json) => _$GeocodingResponseDMFromJson(json);
}
