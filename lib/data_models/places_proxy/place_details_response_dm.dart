import 'package:foodly_world/data_models/places_proxy/place_dm.dart';
import 'package:foodly_world/data_models/places_proxy/proxy_status_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_details_response_dm.freezed.dart';
part 'place_details_response_dm.g.dart';

/// Respuesta de `GET /api/places/details/{placeId}`.
///
/// Shape espejo del backend:
/// ```json
/// {
///   "status": "OK",
///   "result": { ... PlaceDM ... }
/// }
/// ```
///
/// En status `NOT_FOUND` el backend responde HTTP 404 con `result: null`
/// y el Dio interceptor lo convierte en DioException — el repo lo mapea a
/// ApiResult.failure. Así que el `result` en una deserialización exitosa
/// siempre viene no-null, pero lo dejamos nullable por defensa (memoria
/// "JSON enums defensivos — cover both valid and defensive").
@freezed
abstract class PlaceDetailsResponseDM with _$PlaceDetailsResponseDM {
  const factory PlaceDetailsResponseDM({
    @JsonKey(unknownEnumValue: ProxyStatusEnum.unknown) required ProxyStatusEnum status,
    PlaceDM? result,
  }) = _PlaceDetailsResponseDM;

  factory PlaceDetailsResponseDM.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsResponseDMFromJson(json);
}
