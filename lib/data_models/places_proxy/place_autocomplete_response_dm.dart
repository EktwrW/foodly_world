import 'package:foodly_world/data_models/places_proxy/place_prediction_dm.dart';
import 'package:foodly_world/data_models/places_proxy/proxy_status_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_autocomplete_response_dm.freezed.dart';
part 'place_autocomplete_response_dm.g.dart';

/// Respuesta de `POST /api/places/autocomplete`.
///
/// Shape espejo del backend:
/// ```json
/// {
///   "status": "OK",
///   "predictions": [ ... ]
/// }
/// ```
///
/// `status` con `unknownEnumValue: unknown` para no abortar el parse si
/// Google introduce un valor nuevo — caemos a `ProxyStatusEnum.unknown` y
/// el caller decide qué hacer (log + UI de error genérico).
///
/// `predictions` con `@Default([])` — si viene `null` o ausente (edge case
/// raro: Google devolvió `ZERO_RESULTS` con el campo omitido), no tiramos
/// NPE.
@freezed
class PlaceAutocompleteResponseDM with _$PlaceAutocompleteResponseDM {
  const factory PlaceAutocompleteResponseDM({
    @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown) required ProxyStatusEnum status,
    @Default(<PlacePredictionDM>[]) List<PlacePredictionDM> predictions,
  }) = _PlaceAutocompleteResponseDM;

  factory PlaceAutocompleteResponseDM.fromJson(Map<String, dynamic> json) =>
      _$PlaceAutocompleteResponseDMFromJson(json);
}
