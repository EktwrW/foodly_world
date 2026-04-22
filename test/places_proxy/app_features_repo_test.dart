import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/app_config/app_features_repo.dart';
import 'package:foodly_world/core/network/app_config/config_features_client.dart';
import 'package:foodly_world/data_models/app_config/app_features_dm.dart';

/// Fake manual del `ConfigFeaturesClient`. Preferimos subclass sobre
/// mocktail aquí porque:
///   - El contrato es de 1 método (getFeatures) — un mock library es
///     overkill.
///   - No hay dev_dependency de mocktail/mockito en pubspec todavía;
///     agregarla solo para este test sería deuda injustificada.
///
/// El fake tracea hits al backend (`hitCount`) y permite setear la
/// respuesta programada (`responseQueue`) o un throw programado
/// (`throwOnNext`). Eso nos alcanza para validar todas las ramas del
/// cache del Repo.
class _FakeConfigFeaturesClient implements ConfigFeaturesClient {
  int hitCount = 0;
  final List<AppFeaturesDM> responseQueue = [];
  Object? throwOnNext;

  @override
  Future<AppFeaturesDM> getFeatures() async {
    hitCount++;
    if (throwOnNext != null) {
      final e = throwOnNext!;
      throwOnNext = null;
      throw e;
    }
    if (responseQueue.isEmpty) {
      throw StateError('Fake agotado: el test no encoló suficientes responses');
    }
    return responseQueue.removeAt(0);
  }
}

/// Tests del comportamiento de cache in-memory del `AppFeaturesRepo`.
///
/// Invariantes que protegen:
/// 1. Cache hit: un segundo getFeatures() dentro del TTL no pega al
///    backend.
/// 2. forceRefresh: bypass explícito del cache.
/// 3. invalidate(): tira el cache.
/// 4. Failure-no-tumba-cache: si el backend falla después de un success
///    previo, seguimos sirviendo el snapshot exitoso hasta que el
///    caller invalide o se cumpla otro fetch.
/// 5. cachedOrDefaults: sin cache aún, devuelve los defaults del DM
///    (placesProxyEnabled=true).
void main() {
  late _FakeConfigFeaturesClient fake;
  late AppFeaturesRepo repo;

  setUp(() {
    fake = _FakeConfigFeaturesClient();
    repo = AppFeaturesRepo(client: fake);
  });

  group('cache hit vs miss', () {
    test('primer getFeatures pega al backend; segundo dentro del TTL sirve cache', () async {
      fake.responseQueue.add(const AppFeaturesDM(placesProxyEnabled: false));

      final first = await repo.getFeatures();
      final second = await repo.getFeatures();

      expect(fake.hitCount, 1, reason: 'El segundo fetch debe ser cache hit');
      first.when(
        success: (data) => expect(data.placesProxyEnabled, isFalse),
        failure: (_) => fail('Se esperaba success'),
      );
      second.when(
        success: (data) => expect(data.placesProxyEnabled, isFalse),
        failure: (_) => fail('Se esperaba success del cache'),
      );
    });

    test('forceRefresh=true fuerza un hit al backend aunque el cache esté fresco', () async {
      fake.responseQueue.add(const AppFeaturesDM(placesProxyEnabled: true));
      fake.responseQueue.add(const AppFeaturesDM(placesProxyEnabled: false));

      await repo.getFeatures();
      final refreshed = await repo.getFeatures(forceRefresh: true);

      expect(fake.hitCount, 2);
      refreshed.when(
        success: (data) => expect(data.placesProxyEnabled, isFalse,
            reason: 'El forceRefresh debe traer el nuevo valor'),
        failure: (_) => fail('Se esperaba success'),
      );
    });

    test('invalidate() elimina el cache y el próximo getFeatures pega al backend', () async {
      fake.responseQueue.add(const AppFeaturesDM(placesProxyEnabled: true));
      fake.responseQueue.add(const AppFeaturesDM(placesProxyEnabled: false));

      await repo.getFeatures();
      repo.invalidate();
      await repo.getFeatures();

      expect(fake.hitCount, 2);
    });
  });

  group('resiliencia ante failures', () {
    test('failure sin cache previo devuelve ApiResult.failure', () async {
      fake.throwOnNext = Exception('network down');

      final result = await repo.getFeatures();

      result.when(
        success: (_) => fail('Se esperaba failure'),
        failure: (e) => expect(e.error, isA<Exception>()),
      );
      expect(fake.hitCount, 1);
    });

    test('failure después de un success NO tumba el cache — seguimos sirviendo lo bueno', () async {
      // Scenario crítico: si hay un blip pasajero del backend, el repo
      // NO debe "olvidarse" del último valor exitoso. De lo contrario
      // toda la UI que consulta el flag de repente pierde fuente de
      // verdad y cae al AppFeaturesDM() default — que quizás contradice
      // lo que el admin acaba de setear en Cloud Run.
      fake.responseQueue.add(const AppFeaturesDM(placesProxyEnabled: false));
      await repo.getFeatures();

      fake.throwOnNext = Exception('transient 502');
      // forceRefresh para ir al backend (si no, devuelve cache).
      final failing = await repo.getFeatures(forceRefresh: true);
      failing.when(
        success: (_) => fail('Se esperaba failure'),
        failure: (_) {}, // ok
      );

      // El siguiente getFeatures sin forceRefresh DEBE servir el cache
      // previo (el snapshot exitoso con placesProxyEnabled=false).
      final cached = await repo.getFeatures();
      cached.when(
        success: (data) => expect(data.placesProxyEnabled, isFalse,
            reason: 'El cache previo debe sobrevivir a un failure transient'),
        failure: (_) => fail('El cache previo debe seguir vivo'),
      );
    });
  });

  group('cachedOrDefaults', () {
    test('sin ningún fetch, devuelve los defaults del DM', () {
      // placesProxyEnabled=true por @Default en AppFeaturesDM.
      expect(repo.cachedOrDefaults.placesProxyEnabled, isTrue);
    });

    test('después de un fetch exitoso, devuelve el valor cacheado', () async {
      fake.responseQueue.add(const AppFeaturesDM(placesProxyEnabled: false));
      await repo.getFeatures();
      expect(repo.cachedOrDefaults.placesProxyEnabled, isFalse);
    });

    test('después de invalidate(), vuelve a los defaults del DM', () async {
      fake.responseQueue.add(const AppFeaturesDM(placesProxyEnabled: false));
      await repo.getFeatures();
      repo.invalidate();
      expect(repo.cachedOrDefaults.placesProxyEnabled, isTrue);
    });
  });
}
