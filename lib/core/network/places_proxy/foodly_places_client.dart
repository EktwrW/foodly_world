import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/places_proxy/geocoding_response_dm.dart';
import 'package:foodly_world/data_models/places_proxy/place_autocomplete_response_dm.dart';
import 'package:foodly_world/data_models/places_proxy/place_details_response_dm.dart';
import 'package:foodly_world/data_transfer_objects/places_proxy/geocoding_forward_request_dto.dart';
import 'package:foodly_world/data_transfer_objects/places_proxy/geocoding_reverse_request_dto.dart';
import 'package:foodly_world/data_transfer_objects/places_proxy/place_autocomplete_request_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'foodly_places_client.g.dart';

/// Retrofit client abstracto contra el backend Foodly Places Proxy.
///
/// **Superficie:** cuatro endpoints que reemplazan 1:1 los llamados que hoy
/// hacemos a `maps.googleapis.com` desde el cliente Flutter (Places
/// Autocomplete, Place Details, Geocoding reverse, Geocoding forward).
///
/// **Auth por endpoint** (ver `be-foodly/routes/api.php`):
/// - `/places/autocomplete`              → group `throttle:places-authed` (requiere Bearer)
/// - `/places/details/{id}`              → group `throttle:places-authed` (requiere Bearer)
/// - `/geocoding/forward`                → group `throttle:places-authed` (requiere Bearer)
/// - `/geocoding/reverse`                → **PÚBLICO**, throttle:geocoding-public
/// - `/public/places/autocomplete`       → **PÚBLICO**, throttle:places-public (signup)
/// - `/public/places/details/{placeId}`  → **PÚBLICO**, throttle:places-public (signup)
///
/// El endpoint reverse debe poder llamarse desde pantallas PRE-login
/// (onboarding/signup) cuando el usuario aún no tiene sesión — por eso lo
/// montamos público en backend y lo agregamos al whitelist del
/// `DioRequestHandler` para que **no** dispare silent refresh si el device
/// tiene un access token expirado en memoria (reverse geocoding en el
/// bootstrap no tiene por qué bloquearse por eso).
///
/// **Autocomplete / Details — ¿por qué dos variantes?** El sign-up también
/// es pre-login: el usuario escribe su dirección *antes* de crear la cuenta.
/// La variante `/public/places/*` se monta con throttle más estricto
/// (15/min/IP + 60/hour/device-id vs 60/min/user del authed) para
/// limitar exposición al abuso sin auth. La decisión "authed vs public"
/// NO vive acá — la resuelve `PlacesProxyRepo` leyendo `AuthSessionService.isLoggedIn`
/// para que el call-site no tenga que saber que hay dos endpoints. Ver
/// docblock de `PlacesProxyRepo.autocomplete/details` para el porqué.
///
/// Ver memoria: "Interceptor Dio — whitelist exacto, nunca endsWith".
///
/// **Contratos de respuesta:** todos los endpoints devuelven un envelope
/// `{status, ...}` donde `status` es un string Google passthrough
/// (`OK`, `ZERO_RESULTS`, `OVER_QUERY_LIMIT`, `NOT_FOUND`, `UPSTREAM_ERROR`,
/// etc.). El enum `ProxyStatusEnum` tiene `unknownEnumValue` defensivo
/// para no abortar el parse si Google introduce un valor nuevo.
///
/// **HTTP status codes** (manejo por Dio/interceptor):
/// - 200 OK       → parse normal
/// - 404 NOT_FOUND → solo `/places/details/{id}` lo emite; Dio lo convierte
///   en `DioException` y el Repo lo mapea a `ApiResult.failure` con tag
///   `notFound` para que la UI distinga "no existe" de "outage".
/// - 422 INVALID_REQUEST → solo `/places/details/{id}` con `place_id`
///   maleado; nunca debería suceder en prod porque siempre venimos de un
///   autocomplete prediction — lo dejamos como failure genérico.
/// - 502 UPSTREAM_ERROR → Google devolvió 5xx o el servicio explotó; el
///   Repo lo mapea a `ApiResult.failure` con `upstreamError` para diferenciar
///   de un 4xx.
///
/// **NOTA sobre el feature flag:** no hacemos la decisión "proxy vs
/// nova_places_api directo" acá. Eso vive en el Repo, que lee `AppFeaturesDM`
/// desde `ConfigFeaturesRepo`. Este client es tonto — si lo llamás, pega
/// al backend y punto.
@RestApi()
abstract class FoodlyPlacesClient {
  factory FoodlyPlacesClient(Dio dio) = _FoodlyPlacesClient;

  /// Places Autocomplete — devuelve una lista de `predictions` rankeadas
  /// por Google. Usá `sessionToken` (UUID) para toda una sesión de typing
  /// del usuario; eso hace que Google cobre la sesión entera como un solo
  /// "Autocomplete + Details" en lugar de N autocompletes sueltos.
  ///
  /// El body va como JSON (`@Body()`), no como form-data — el backend hace
  /// `$request->validate([...])` que acepta ambos, pero JSON es más limpio
  /// y nos da el mismo request payload tanto para autocomplete como para
  /// geocoding (consistencia interna del client).
  @POST('/places/autocomplete')
  Future<PlaceAutocompleteResponseDM> autocomplete(
    @Body() PlaceAutocompleteRequestDTO body,
  );

  /// Place Details — recupera el Place completo (name, formatted_address,
  /// geometry, phone numbers, address components) dado un `place_id`
  /// obtenido previamente de autocomplete.
  ///
  /// `placeId` va en el path; los demás parámetros son opcionales y van
  /// como query string. El `sessionToken` debe ser el MISMO que se usó en
  /// autocomplete para que la facturación sea "session-billed" y no un
  /// details suelto (~10x más caro).
  ///
  /// Validación en backend:
  /// `preg_match('/^[A-Za-z0-9_\-]+$/', $placeId)` — si el id viene maleado
  /// el backend responde 422 INVALID_REQUEST.
  @GET('/places/details/{placeId}')
  Future<PlaceDetailsResponseDM> details(
    @Path('placeId') String placeId, {
    @Query('sessionToken') String? sessionToken,
    @Query('language') String? language,
    @Query('region') String? region,
  });

  /// Places Autocomplete — variante PÚBLICA (sin Bearer). Se llama desde
  /// el flujo de sign-up donde el usuario todavía no tiene cuenta creada.
  ///
  /// Mismo contrato de request/response que `autocomplete()`. El backend
  /// delega al mismo `PlacesController::autocomplete`; la diferencia es
  /// sólo el middleware (`throttle:places-public` en vez de
  /// `throttle:places-authed` + `auth:sanctum`).
  ///
  /// **NO llamar directo.** El consumer correcto es
  /// `PlacesProxyRepo.autocomplete`, que decide authed vs public según
  /// `AuthSessionService.isLoggedIn`. Exponer el método en el client es
  /// un "leak" necesario del lado Retrofit (no hay forma de que una misma
  /// abstracción llame dos paths distintos) pero el call-site jamás debe
  /// decidir cuál usar.
  @POST('/public/places/autocomplete')
  Future<PlaceAutocompleteResponseDM> autocompletePublic(
    @Body() PlaceAutocompleteRequestDTO body,
  );

  /// Place Details — variante PÚBLICA (sin Bearer). Ver docblock de
  /// `autocompletePublic` para el porqué de la variante.
  ///
  /// Contrato idéntico a `details()`: `placeId` en path, resto como query.
  @GET('/public/places/details/{placeId}')
  Future<PlaceDetailsResponseDM> detailsPublic(
    @Path('placeId') String placeId, {
    @Query('sessionToken') String? sessionToken,
    @Query('language') String? language,
    @Query('region') String? region,
  });

  /// Geocoding reverse — coords → dirección/componentes.
  ///
  /// **Público** (sin Bearer). Ver docblock de clase. El DTO contiene
  /// `lat`/`lng` como double + `language`/`region` opcionales.
  ///
  /// `options` permite al caller pasar `Options(sendTimeout:..., receiveTimeout:...)`
  /// per-request. Es la forma idiomática de timeoutear un endpoint específico
  /// en Dio sin tocar `BaseOptions` globales (que afectarían a todos los
  /// endpoints de la app). CRÍTICO para este endpoint: si el request queda
  /// colgado, el `LocationBloc` se congela en `_CheckingLocation` y el botón
  /// de current location queda en "Verificando ubicación..." hasta que el
  /// usuario mate la app. Bug reproducido en prod 2026-04. El `PlacesProxyRepo`
  /// siempre le pasa un timeout defensivo (default 6s); no dejar `null`.
  @POST('/geocoding/reverse')
  Future<GeocodingResponseDM> reverse(
    @Body() GeocodingReverseRequestDTO body, {
    @DioOptions() Options? options,
  });

  /// Geocoding forward — query libre → dirección/componentes/coords.
  ///
  /// **Autenticado** (Bearer requerido). Se usa en el edge case en el que
  /// el usuario edita manualmente una dirección y no tenemos `place_id`
  /// asociado — p.ej. "Av. Providencia 1234, Santiago" — y querramos
  /// obtener lat/lng para el business.
  @POST('/geocoding/forward')
  Future<GeocodingResponseDM> forward(
    @Body() GeocodingForwardRequestDTO body,
  );
}
