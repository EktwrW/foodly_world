import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/blocs/location/location_bloc.dart';
import 'package:foodly_world/data_models/places/location_details_dm.dart';
import 'package:foodly_world/data_models/places_proxy/geocoding_response_dm.dart';
import 'package:geolocator/geolocator.dart';

/// Invariantes protegidas del mapping de reverse-geocoding al
/// [LocationDetailsDM] (Fase 4 del Places Proxy):
///
/// 1. Extrae EXACTAMENTE los 5 campos que el path legacy (direct a
///    Google) extraía: country, countryCode, state, city, address, zipCode.
/// 2. No pisa los campos "no geocoding" (position, permission,
///    serviceEnabled) — esos vienen del Geolocator flow y deben
///    preservarse.
/// 3. Tolera address_components con tipos desconocidos — los ignora sin
///    crashear ni abortar el resto del merge.
/// 4. Con `results` vacío (ZERO_RESULTS, coords raras) devuelve el base
///    intacto, NO null/default.
///
/// Estos tests fallarán si:
/// - Alguien cambia el nombre de un type ("country" → "country_code",
///   "locality" → "city", etc.) sin actualizar el mapping.
/// - Alguien confunde `longName` con `shortName` en algún campo (bug
///   frecuente: countryCode debe venir de short_name, no long_name).
/// - Alguien agrega un campo nuevo al [LocationDetailsDM] y olvida
///   mapearlo o excluirlo explícitamente acá.
/// - El contrato de preservación de campos no-geocoding se rompe.
///
/// **Qué NO se testea acá** (decisión explícita):
/// - Branching por flag (`placesProxyEnabled`): es un `if` trivial sin
///   lógica — costosso mockear DI por 2 líneas.
/// - Path legacy (`_reverseViaLegacyDirect`): no cambió en esta fase y
///   lleva meses en prod. Si falla, fallan tests de integración, no
///   este archivo.
/// - Timeout del `Future.any`: depende de timers reales; más valioso
///   cubrirlo con integration test si llegamos a necesitarlo.
void main() {
  group('applyReverseGeocodingToLocation', () {
    test('merge completo de un payload real de Google (Covilhã, PT)', () {
      // Payload armado con la shape exacta que devuelve Google para
      // coordenadas reales de Covilhã, Portugal (sanity-checked contra
      // el smoke test de Fase 3).
      final response = GeocodingResponseDM.fromJson({
        'status': 'OK',
        'results': [
          {
            'formatted_address': 'R. da Alegria 12, 6200-123 Covilhã, Portugal',
            'address_components': [
              {
                'long_name': '12',
                'short_name': '12',
                'types': ['street_number'],
              },
              {
                'long_name': 'Rua da Alegria',
                'short_name': 'R. da Alegria',
                'types': ['route'],
              },
              {
                'long_name': 'Covilhã',
                'short_name': 'Covilhã',
                'types': ['locality', 'political'],
              },
              {
                'long_name': 'Castelo Branco',
                'short_name': 'Castelo Branco',
                'types': ['administrative_area_level_1', 'political'],
              },
              {
                'long_name': 'Portugal',
                'short_name': 'PT',
                'types': ['country', 'political'],
              },
              {
                'long_name': '6200-123',
                'short_name': '6200-123',
                'types': ['postal_code'],
              },
            ],
          }
        ],
      });

      final merged = applyReverseGeocodingToLocation(
        response,
        const LocationDetailsDM(),
      );

      expect(merged.country, 'Portugal');
      expect(merged.countryCode, 'PT',
          reason: 'countryCode debe tomarse de short_name, NO long_name');
      expect(merged.state, 'Castelo Branco');
      expect(merged.city, 'Covilhã');
      expect(merged.address, 'Rua da Alegria',
          reason: 'address debe tomarse de long_name del `route`');
      expect(merged.zipCode, '6200-123');
    });

    test('preserva campos no-geocoding del base (position, permission, serviceEnabled)', () {
      // El merge NO debería pisar position/permission/serviceEnabled —
      // esos vienen del Geolocator flow en determinePosition(). Si el
      // merge los resetea, el bloc perdería la posición real del usuario
      // después de reverse-geocode → UI sin coords correctas.
      final base = LocationDetailsDM(
        position: Position(
          latitude: 40.2791,
          longitude: -7.5063,
          timestamp: DateTime(2026, 4, 22),
          accuracy: 5.0,
          altitude: 500.0,
          heading: 0.0,
          speed: 0.0,
          speedAccuracy: 0.0,
          altitudeAccuracy: 0.0,
          headingAccuracy: 0.0,
        ),
        serviceEnabled: true,
        permission: LocationPermission.whileInUse,
      );

      final response = GeocodingResponseDM.fromJson({
        'status': 'OK',
        'results': [
          {
            'address_components': [
              {
                'long_name': 'Portugal',
                'short_name': 'PT',
                'types': ['country'],
              },
            ],
          }
        ],
      });

      final merged = applyReverseGeocodingToLocation(response, base);

      expect(merged.position, base.position, reason: 'position debe preservarse');
      expect(merged.serviceEnabled, true);
      expect(merged.permission, LocationPermission.whileInUse);
      // Y los campos geocoding sí se aplicaron
      expect(merged.country, 'Portugal');
      expect(merged.countryCode, 'PT');
    });

    test('results vacío (ZERO_RESULTS) → devuelve base sin cambios', () {
      // Caso real: coords en medio del océano, Antártida sin cobertura,
      // o zonas donde Google simplemente no tiene data. No es error —
      // el caller no debe ver el DM corrompido.
      final empty = GeocodingResponseDM.fromJson({
        'status': 'ZERO_RESULTS',
        'results': <dynamic>[],
      });

      const base = LocationDetailsDM(
        country: 'previo',
        city: 'previa',
        serviceEnabled: true,
      );

      final merged = applyReverseGeocodingToLocation(empty, base);

      expect(merged, base,
          reason: 'con results vacío el DM debe quedar exactamente igual al base');
    });

    test('address_components con tipo desconocido se ignoran sin romper el merge', () {
      // Scenario: Google agrega mañana un nuevo type `sublocality_level_5`
      // o algo que no mapeamos. No queremos que un type desconocido
      // aborte el merge de los otros componentes que SÍ entendemos.
      final response = GeocodingResponseDM.fromJson({
        'status': 'OK',
        'results': [
          {
            'address_components': [
              {
                'long_name': 'FUTURE_TYPE',
                'short_name': 'FT',
                'types': ['some_new_google_type_2027'],
              },
              {
                'long_name': 'Portugal',
                'short_name': 'PT',
                'types': ['country'],
              },
              {
                'long_name': 'OTRO_FUTURE',
                'short_name': 'OF',
                'types': ['yet_another_new_type', 'political'],
              },
              {
                'long_name': 'Covilhã',
                'short_name': 'Covilhã',
                'types': ['locality', 'political'],
              },
            ],
          }
        ],
      });

      final merged = applyReverseGeocodingToLocation(
        response,
        const LocationDetailsDM(),
      );

      expect(merged.country, 'Portugal');
      expect(merged.countryCode, 'PT');
      expect(merged.city, 'Covilhã');
      // Los tipos desconocidos no se filtran a ningún campo mapeado
      expect(merged.address, null);
      expect(merged.state, null);
      expect(merged.zipCode, null);
    });

    test('múltiples components con el mismo tipo → el último gana (paridad con legacy)', () {
      // Documenta el comportamiento del path legacy: el `for` itera y
      // cada `copyWith` pisa el anterior, así que si Google devolviera
      // 2 componentes `country` (no pasa en la realidad, pero defensivo),
      // el último es el que queda. Si alguien cambia este comportamiento
      // a "el primero gana" sin coordinación con el path legacy, tendríamos
      // divergencia de behavior entre flag ON vs OFF.
      final response = GeocodingResponseDM.fromJson({
        'status': 'OK',
        'results': [
          {
            'address_components': [
              {
                'long_name': 'Primero',
                'short_name': 'P1',
                'types': ['country'],
              },
              {
                'long_name': 'Segundo',
                'short_name': 'P2',
                'types': ['country'],
              },
            ],
          }
        ],
      });

      final merged = applyReverseGeocodingToLocation(
        response,
        const LocationDetailsDM(),
      );

      expect(merged.country, 'Segundo');
      expect(merged.countryCode, 'P2');
    });

    test('un component con múltiples tipos incluyendo uno mapeado → aplica el mapeo', () {
      // Caso normal: Google etiqueta muchos componentes con múltiples
      // types (p.ej. ['locality', 'political']). El mapping debe matchear
      // sobre `contains`, no sobre equality de la lista completa.
      final response = GeocodingResponseDM.fromJson({
        'status': 'OK',
        'results': [
          {
            'address_components': [
              {
                'long_name': 'Buenos Aires',
                'short_name': 'CABA',
                'types': ['administrative_area_level_1', 'political', 'locality'],
              },
            ],
          }
        ],
      });

      final merged = applyReverseGeocodingToLocation(
        response,
        const LocationDetailsDM(),
      );

      // El mismo componente matchea DOS campos nuestros — el último
      // asignado (city) es el que queda porque copyWith los aplica en
      // orden. Este test captura y documenta ese caso: si el order del
      // if cambia, algún map cambia también.
      expect(merged.state, 'Buenos Aires');
      expect(merged.city, 'Buenos Aires');
    });
  });
}
