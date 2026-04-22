import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_features_dm.freezed.dart';
part 'app_features_dm.g.dart';

/// Runtime feature flags expuestos por `GET /api/config/features`.
///
/// **Propósito:** kill-switches instantáneos sin publicar un patch
/// Shorebird. El único flag hoy es `places_proxy_enabled` — si algún día
/// el proxy backend tiene un outage catastrófico, flipping a `false` en
/// Cloud Run (un `gcloud run services update --update-env-vars`) hace
/// que los clientes caigan en fallback a nova_places_api en ~60 segundos
/// (que es el `max-age` del Cache-Control que devuelve el endpoint).
///
/// **Shape tolerante a keys futuras:** el backend puede agregar flags
/// nuevos (`buzz_feed_v2_enabled`, `payments_enabled`, etc.) sin romper
/// clientes viejos. `@JsonSerializable(ignoreUnannotated: false)` no es
/// necesario — Freezed/json_serializable ignora keys desconocidas por
/// default. Lo que SÍ hacemos es darle `@Default` a cada flag para que
/// un backend que aún no devolvió el flag (servido desde CDN antes del
/// deploy) no rompa el parsing.
///
/// **Cache client-side:** el Repo hace un cache en memoria de 5 min para
/// evitar hit al backend en cada pantalla. El backend ya setea
/// Cache-Control: public, max-age=60 pero el HTTP cache de Dio en
/// Flutter no es trivial — mejor cache en memoria explícito.
@freezed
class AppFeaturesDM with _$AppFeaturesDM {
  const factory AppFeaturesDM({
    /// Controla si la app usa el backend Foodly Places Proxy
    /// (true → nuestro proxy; false → nova_places_api directo).
    /// Default true — asumimos proxy activo; si el backend jamás
    /// respondió (cold start fallido) caemos a modo proxy de todas formas
    /// y, si el proxy falla, el interceptor del repo genera failure que
    /// el caller puede manejar.
    @JsonKey(name: 'places_proxy_enabled') @Default(true) bool placesProxyEnabled,
  }) = _AppFeaturesDM;

  factory AppFeaturesDM.fromJson(Map<String, dynamic> json) => _$AppFeaturesDMFromJson(json);
}
