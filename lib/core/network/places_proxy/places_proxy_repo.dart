import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/places_proxy/foodly_places_client.dart';
import 'package:foodly_world/data_models/places_proxy/geocoding_response_dm.dart';
import 'package:foodly_world/data_models/places_proxy/place_autocomplete_response_dm.dart';
import 'package:foodly_world/data_models/places_proxy/place_details_response_dm.dart';
import 'package:foodly_world/data_transfer_objects/places_proxy/geocoding_forward_request_dto.dart';
import 'package:foodly_world/data_transfer_objects/places_proxy/geocoding_reverse_request_dto.dart';
import 'package:foodly_world/data_transfer_objects/places_proxy/place_autocomplete_request_dto.dart';

/// Repositorio de Places/Geocoding contra el backend proxy Foodly.
///
/// **Contrato:** espejo 1:1 de `FoodlyPlacesClient` pero envolviendo toda
/// excepción Dio/Retrofit en `ApiResult.failure(AppRequestException(...))`.
/// Mismo patrón que `NlpSearchRepo` — sin branching custom por tipo de
/// excepción acá; los callers que necesiten diferenciar notFound vs outage
/// pueden inspeccionar `(failure.error.error as DioException?)?.response?.statusCode`
/// (semántica documentada en los docblocks de cada método de abajo).
///
/// **No resuelve el feature flag acá.** La decisión "proxy vs
/// nova_places_api directo" vive en el consumidor (LocationService,
/// SignUpCubit, etc.) leyendo `AppFeaturesRepo.placesProxyEnabled`
/// cacheado. Mantener el repo "tonto" permite que los tests de parsing
/// no tengan que mockear también el feature flag.
///
/// **Por qué un repo en vez de usar el client directo:** mismo argumento
/// de `NlpSearchRepo` — queremos que los BLoCs consuman `ApiResult` (que
/// ya saben manejar) y no tengan que try/catch Dio/Retrofit exceptions
/// diseminadas por la app.
class PlacesProxyRepo {
  final FoodlyPlacesClient _client;

  const PlacesProxyRepo({required FoodlyPlacesClient client}) : _client = client;

  /// Places Autocomplete.
  ///
  /// Failure modes esperados (dentro de `ApiResult.failure`):
  /// - DioException con statusCode 422 → validación de backend (input
  ///   vacío, parámetros fuera de rango). No es retryable.
  /// - DioException con statusCode 429 → throttle:places-authed golpeado.
  ///   El caller puede hacer backoff y reintentar.
  /// - DioException con statusCode 502 → UPSTREAM_ERROR (Google 5xx o
  ///   circuit breaker). Es el trigger natural para caer al fallback
  ///   `nova_places_api`.
  ///
  /// Success con `status != ProxyStatusEnum.ok` NO es failure — puede ser
  /// `zeroResults` (no hubo predictions, lista vacía), que el caller debe
  /// tratar como "sin resultados, no como error".
  Future<ApiResult<PlaceAutocompleteResponseDM>> autocomplete(
    PlaceAutocompleteRequestDTO body,
  ) async {
    try {
      return ApiResult.success(await _client.autocomplete(body));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// Place Details.
  ///
  /// Failure modes esperados:
  /// - DioException con statusCode 404 → `status: NOT_FOUND`. El caller
  ///   debería distinguir este caso de un outage: 404 es "el place_id
  ///   dejó de existir en Google" (raro pero pasa cuando un comercio se
  ///   da de baja), mientras que 502 es "Google está caído".
  /// - DioException con statusCode 422 → `place_id` maleado. No debería
  ///   pasar en flujos normales (siempre venimos de un autocomplete).
  /// - DioException con statusCode 502 → UPSTREAM_ERROR.
  ///
  /// `sessionToken` DEBE ser el mismo UUID que se usó en el autocomplete
  /// que originó este place_id; de lo contrario Google factura el details
  /// como "sessionless" (~10x más caro).
  Future<ApiResult<PlaceDetailsResponseDM>> details({
    required String placeId,
    String? sessionToken,
    String? language,
    String? region,
  }) async {
    try {
      return ApiResult.success(
        await _client.details(
          placeId,
          sessionToken: sessionToken,
          language: language,
          region: region,
        ),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// Geocoding reverse — coords → dirección/componentes.
  ///
  /// **Endpoint público.** Se puede llamar desde pantallas pre-login
  /// (onboarding) sin que el interceptor dispare silent refresh —
  /// `/geocoding/reverse` está en el whitelist de `DioRequestHandler`.
  ///
  /// Failure modes:
  /// - DioException con statusCode 429 → throttle:geocoding-public
  ///   golpeado (límite más estricto que places-authed porque es público).
  /// - DioException con statusCode 502 → UPSTREAM_ERROR.
  Future<ApiResult<GeocodingResponseDM>> reverse(
    GeocodingReverseRequestDTO body,
  ) async {
    try {
      return ApiResult.success(await _client.reverse(body));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// Geocoding forward — query libre → dirección/componentes/coords.
  ///
  /// **Autenticado.** Edge-case: se usa cuando el usuario edita a mano
  /// una dirección y no tenemos `place_id` asociado.
  Future<ApiResult<GeocodingResponseDM>> forward(
    GeocodingForwardRequestDTO body,
  ) async {
    try {
      return ApiResult.success(await _client.forward(body));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
