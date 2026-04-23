import 'package:dio/dio.dart' show Options;
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/places_proxy/foodly_places_client.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
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
  final AuthSessionService _authSession;

  const PlacesProxyRepo({
    required FoodlyPlacesClient client,
    required AuthSessionService authSession,
  })  : _client = client,
        _authSession = authSession;

  /// Timeout defensivo por defecto para reverse-geocoding.
  ///
  /// Se aplica como `sendTimeout` + `receiveTimeout` per-request vía
  /// `Options(...)` (no en `BaseOptions`: no queremos que esto pise los
  /// timeouts de otros endpoints como uploads de imágenes que son
  /// legítimamente más lentos).
  ///
  /// **Por qué 6s:** valor establecido en prod 2026-04 tras un bug que
  /// dejaba al `LocationBloc` colgado en `_CheckingLocation` cuando Places
  /// no respondía (transición wifi↔4G, DNS lento, operador saturado). 6s
  /// es "suficientemente largo para que responda una red degradada" y
  /// "suficientemente corto para que la UI no se sienta muerta". Bajar de
  /// 3-4s es arriesgado; subir arriba de 10s rompe la percepción de UX.
  ///
  /// El caller puede pasar un `timeout` explícito si conoce su contexto
  /// (p.ej. onboarding, donde se podría tolerar un poco más porque el
  /// usuario ya está esperando un setup largo).
  static const Duration _defaultReverseTimeout = Duration(seconds: 6);

  /// Places Autocomplete.
  ///
  /// **Ramificación authed/public interna.** El repo decide a qué endpoint
  /// pegar según `AuthSessionService.isLoggedIn`:
  /// - Usuario logueado  → `/places/autocomplete`         (throttle:places-authed, Bearer)
  /// - Usuario anónimo   → `/public/places/autocomplete`  (throttle:places-public, sin Bearer)
  ///
  /// **¿Por qué acá y no en el call-site?**
  ///   1. **Seguridad por defecto:** si un consumer futuro (business_create,
  ///      branch_create, etc.) olvida ramificar estando pre-login, el 401
  ///      del endpoint authed dispara el modal de "sesión expirada" + kick
  ///      a login — exactamente el bug que se corrigió el 2026-04-23 en el
  ///      sign-up. Centralizar elimina esa clase de error por diseño.
  ///   2. **Escalabilidad:** nuevos callers heredan la decisión gratis.
  ///   3. **Encapsulación:** el call-site no debería saber que existen dos
  ///      endpoints; expresa intención ("quiero autocomplete") y el repo
  ///      resuelve el transport.
  ///   4. **Auditoría del token:** el repo garantiza que (a) la variante
  ///      authed sólo se llama con `isLoggedIn == true` (hay Bearer válido),
  ///      (b) la variante pública nunca manda token (el `DioRequestHandler`
  ///      lo stripea igual, pero tener defense-in-depth acá es barato).
  ///
  /// Failure modes esperados (dentro de `ApiResult.failure`):
  /// - DioException con statusCode 422 → validación de backend (input
  ///   vacío, parámetros fuera de rango). No es retryable.
  /// - DioException con statusCode 429 → throttle golpeado. En el flow
  ///   authed es 60/min/user; en el público es 15/min/IP + 60/hour/device-id.
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
      final response = _authSession.isLoggedIn
          ? await _client.autocomplete(body)
          : await _client.autocompletePublic(body);
      return ApiResult.success(response);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// Place Details.
  ///
  /// **Ramificación authed/public interna** — mismo criterio que
  /// `autocomplete()` (ver su docblock para el porqué).
  /// - Usuario logueado  → `/places/details/{placeId}`
  /// - Usuario anónimo   → `/public/places/details/{placeId}`
  ///
  /// **Session token consistency:** `sessionToken` DEBE ser el mismo UUID
  /// que se usó en el autocomplete que originó este place_id; de lo
  /// contrario Google factura el details como "sessionless" (~10x más
  /// caro). **Eso vale igual para ambas variantes** — Google factura por
  /// sesión sin importar si el request entró por el endpoint authed o el
  /// público (el backend pasa el token a Google idéntico en ambos casos).
  ///
  /// Failure modes esperados:
  /// - DioException con statusCode 404 → `status: NOT_FOUND`. El caller
  ///   debería distinguir este caso de un outage: 404 es "el place_id
  ///   dejó de existir en Google" (raro pero pasa cuando un comercio se
  ///   da de baja), mientras que 502 es "Google está caído".
  /// - DioException con statusCode 422 → `place_id` maleado. No debería
  ///   pasar en flujos normales (siempre venimos de un autocomplete).
  /// - DioException con statusCode 502 → UPSTREAM_ERROR.
  Future<ApiResult<PlaceDetailsResponseDM>> details({
    required String placeId,
    String? sessionToken,
    String? language,
    String? region,
  }) async {
    try {
      final response = _authSession.isLoggedIn
          ? await _client.details(
              placeId,
              sessionToken: sessionToken,
              language: language,
              region: region,
            )
          : await _client.detailsPublic(
              placeId,
              sessionToken: sessionToken,
              language: language,
              region: region,
            );
      return ApiResult.success(response);
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
  /// **Timeout defensivo obligatorio.** Se pasa como `Options(sendTimeout,
  /// receiveTimeout)` per-request — Dio cancela la conexión TCP cuando
  /// vence, a diferencia de un `.timeout()` Dart que solo cancela el Future
  /// y deja la conexión colgando. Default `_defaultReverseTimeout` (6s);
  /// ver docblock de esa constante para el porqué del valor. NO usar
  /// `null`/remover este timeout: sin él, un request colgado bloquea al
  /// `LocationBloc` en `_CheckingLocation` indefinidamente (bug prod 2026-04).
  ///
  /// Failure modes:
  /// - DioException con statusCode 429 → throttle:geocoding-public
  ///   golpeado (límite más estricto que places-authed porque es público).
  /// - DioException con statusCode 502 → UPSTREAM_ERROR.
  /// - DioException con `type == DioExceptionType.receiveTimeout` o
  ///   `sendTimeout` → el endpoint tardó más que `timeout`. El caller
  ///   debe tratarlo como un failure genérico sin retry automático (la
  ///   red está degradada; reintentar solo empeora la latencia percibida).
  Future<ApiResult<GeocodingResponseDM>> reverse(
    GeocodingReverseRequestDTO body, {
    Duration timeout = _defaultReverseTimeout,
  }) async {
    try {
      return ApiResult.success(
        await _client.reverse(
          body,
          options: Options(
            sendTimeout: timeout,
            receiveTimeout: timeout,
          ),
        ),
      );
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
