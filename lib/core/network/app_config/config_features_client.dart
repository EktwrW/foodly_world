import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/app_config/app_features_dm.dart';
import 'package:retrofit/retrofit.dart';

part 'config_features_client.g.dart';

/// Retrofit client abstracto contra `GET /api/config/features`.
///
/// **Endpoint público** — throttle:120,1 en backend. Ver
/// `be-foodly/routes/api.php`. No requiere Bearer; el
/// `DioRequestHandler` lo tiene whitelisted para no inyectar auth ni
/// disparar silent refresh durante el bootstrap.
///
/// **Por qué existe:** kill-switch runtime sin publicar un patch
/// Shorebird. Hoy expone `places_proxy_enabled` (flipping a `false` en
/// Cloud Run vía `gcloud run services update --update-env-vars` hace que
/// los clientes caigan en fallback a `nova_places_api` en ~60 segundos).
/// El backend devuelve `Cache-Control: public, max-age=60` pero el Repo
/// cachea en memoria 5 min para evitar hit en cada pantalla.
///
/// **Aislado del FoodlyPlacesClient** aunque vivan en la misma Fase 3
/// porque semánticamente son cosas distintas: uno es "feature flags de la
/// app" (y mañana puede exponer `buzz_feed_v2_enabled`,
/// `payments_enabled`, etc.), el otro es "proxy de mapas". Acoplarlos en
/// un mismo client sería deuda desde el día cero.
@RestApi()
abstract class ConfigFeaturesClient {
  factory ConfigFeaturesClient(Dio dio) = _ConfigFeaturesClient;

  @GET('/config/features')
  Future<AppFeaturesDM> getFeatures();
}
