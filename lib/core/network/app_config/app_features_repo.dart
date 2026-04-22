import 'package:foodly_world/core/network/app_config/config_features_client.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/data_models/app_config/app_features_dm.dart';

/// Repositorio de feature flags runtime.
///
/// **Cache in-memory de 5 min.** El backend ya setea
/// `Cache-Control: public, max-age=60` en `/config/features` pero el HTTP
/// cache de Dio en Flutter no es trivial (hay que agregar un interceptor
/// con política por URL), así que cacheamos explícito en memoria con un
/// TTL más generoso (5 min vs 60s del backend). El tradeoff:
///   - +4 min de retraso máximo para que un kill-switch flipping tome
///     efecto en clientes con la app abierta.
///   - -N hits al backend por sesión (cada BLoC que chequea el flag en
///     su build).
/// 5 min lo consideramos aceptable: si necesitamos un rollback más
/// urgente, el usuario puede cerrar y reabrir la app (cold start cachea
/// de cero) o —en el peor caso— publicamos un Shorebird patch.
///
/// **No-throw en la superficie pública.** `getFeatures()` devuelve
/// `ApiResult`. Los consumidores (location_service, signup_cubit) deben
/// tener un default seguro si el fetch falla:
///   - placesProxyEnabled por DEFAULT true (ver `AppFeaturesDM`), así
///     que si el flag no se pudo fetchear asumimos proxy activo.
///   - Si el proxy falla, los callers caen al fallback nova_places_api
///     gracias al ApiResult.failure del PlacesProxyRepo — NO es
///     responsabilidad de este repo gatillar ese fallback.
///
/// **Por qué no persistir a disco (Hive/shared_prefs):** el riesgo es
/// servir un flag viejo desde disco después de un rollback crítico —
/// exactly the opposite de lo que el kill-switch pretende. El trade-off
/// "cold start hit al backend cada vez vs riesgo de servir flags
/// stale en offline" lo resolvemos a favor de la consistencia: en
/// offline usamos los defaults del Freezed (placesProxyEnabled = true)
/// y punto.
class AppFeaturesRepo {
  final ConfigFeaturesClient _client;

  /// Último fetch exitoso cacheado en memoria. `null` → todavía no
  /// fetcheado (o fetch falló y seguimos sin cache).
  AppFeaturesDM? _cached;

  /// Timestamp del último fetch exitoso. Usado con `_cacheTtl` para
  /// decidir cuándo revalidar.
  DateTime? _cachedAt;

  /// TTL del cache en memoria. Ver docblock de clase.
  static const Duration _cacheTtl = Duration(minutes: 5);

  AppFeaturesRepo({required ConfigFeaturesClient client}) : _client = client;

  /// Versión cacheada (síncrona) del último fetch exitoso. Útil en los
  /// callers que quieren consultar el flag sin esperar I/O y están ok
  /// con usar el default de `AppFeaturesDM` si todavía no se fetcheó.
  ///
  /// Convención: si no hay cache, devuelve `const AppFeaturesDM()` con
  /// los defaults del Freezed (placesProxyEnabled = true). Esto evita
  /// que los callers tengan que hacer null-checks y tener una "ruta
  /// sin flags" distinta de "flags defaults".
  AppFeaturesDM get cachedOrDefaults => _cached ?? const AppFeaturesDM();

  /// Fuerza el próximo `getFeatures()` a ir al backend, ignorando el
  /// cache. Útil en un "pull to refresh" admin o en tests.
  void invalidate() {
    _cached = null;
    _cachedAt = null;
  }

  /// Fetchea feature flags. Si el cache está fresco (< 5 min),
  /// devuelve la copia cacheada sin hit al backend. Si no, fetchea y
  /// refresca el cache en caso de éxito.
  ///
  /// En failure NO invalida el cache previo — seguimos sirviendo el
  /// último éxito hasta que un fetch nuevo lo reemplace o el caller
  /// llame `invalidate()` explícito.
  Future<ApiResult<AppFeaturesDM>> getFeatures({bool forceRefresh = false}) async {
    if (!forceRefresh && _isCacheFresh()) {
      return ApiResult.success(_cached!);
    }

    try {
      final features = await _client.getFeatures();
      _cached = features;
      _cachedAt = DateTime.now();
      return ApiResult.success(features);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  bool _isCacheFresh() {
    if (_cached == null || _cachedAt == null) return false;
    return DateTime.now().difference(_cachedAt!) < _cacheTtl;
  }
}
