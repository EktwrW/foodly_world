import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/app_config/app_features_dm.dart';

/// Tests de parsing para `AppFeaturesDM` (respuesta de `/config/features`).
///
/// Invariantes críticas — el feature flag es un kill-switch: si el parse
/// se rompe y caemos al `AppFeaturesDM()` default (placesProxyEnabled=true),
/// los clientes mandarían tráfico al backend proxy aunque nosotros lo
/// hayamos flipeado a false en Cloud Run para frenarlo. Ergo, el parse
/// debe ser bulletproof contra shapes inesperadas.
void main() {
  group('AppFeaturesDM.fromJson', () {
    test('parsea el shape actual del backend', () {
      const jsonStr = '{"places_proxy_enabled": true}';
      final parsed =
          AppFeaturesDM.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);
      expect(parsed.placesProxyEnabled, isTrue);
    });

    test('flag en false funciona (kill-switch activado)', () {
      const jsonStr = '{"places_proxy_enabled": false}';
      final parsed =
          AppFeaturesDM.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);
      expect(parsed.placesProxyEnabled, isFalse);
    });

    test('flag ausente cae al @Default(true)', () {
      // Scenario: backend nuevo vs cliente viejo, o backend devolvió
      // un body minimalista en una edge case. Queremos que la ausencia
      // del flag signifique "proxy activado" (default seguro: el proxy
      // existe, si falla hay fallback cliente-side).
      const jsonStr = '{}';
      final parsed =
          AppFeaturesDM.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);
      expect(parsed.placesProxyEnabled, isTrue,
          reason: 'Ausencia del flag debe caer al @Default(true)');
    });

    test('forward compat: flags futuros no rompen el parse', () {
      // El backend va a agregar más flags con el tiempo
      // (buzz_feed_v2_enabled, payments_enabled, etc.). Los clientes
      // viejos deben tolerar esas keys desconocidas sin abortar.
      // Si alguien activa `disallowUnrecognizedKeys` en el generator,
      // este test falla y hay que tomar una decisión explícita.
      const jsonStr = '''
      {
        "places_proxy_enabled": false,
        "buzz_feed_v2_enabled": true,
        "payments_enabled": false,
        "group_orders_enabled": true
      }
      ''';
      expect(
        () => AppFeaturesDM.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>),
        returnsNormally,
      );
      final parsed =
          AppFeaturesDM.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);
      expect(parsed.placesProxyEnabled, isFalse);
    });

    test('AppFeaturesDM() constructor default tiene placesProxyEnabled=true', () {
      // Safety net para `cachedOrDefaults` del AppFeaturesRepo: cuando
      // no hay cache aún, servimos `const AppFeaturesDM()`. Si este
      // default cambia por accidente, los consumers que no hayan
      // fetcheado aún de repente caerían al fallback nova_places_api
      // a cold start. Documentado acá como invariante.
      const def = AppFeaturesDM();
      expect(def.placesProxyEnabled, isTrue);
    });
  });
}
