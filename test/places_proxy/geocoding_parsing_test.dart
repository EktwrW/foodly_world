import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/places_proxy/geocoding_response_dm.dart';
import 'package:foodly_world/data_models/places_proxy/proxy_status_enum.dart';

/// Tests de parsing para el envelope compartido de Geocoding reverse y
/// forward (`/geocoding/reverse` y `/geocoding/forward`).
///
/// Google devuelve la misma shape para ambos: `{status, results[]}`,
/// donde cada result tiene place_id + formatted_address + geometry +
/// address_components + types.
///
/// Diferencia con Place Details (además del envelope: `result` vs
/// `results`): Geocoding omite `name` y los `formatted_phone_number`
/// — solo devuelve info de dirección/coords. Por eso los consumers
/// (LocationBloc, signup auto-fill) SOLO leen addressComponents +
/// formattedAddress + geometry.
void main() {
  group('GeocodingResponseDM.fromJson — reverse geocoding', () {
    test('parsea el shape típico: coords → dirección con postal_code', () {
      // Fixture basado en reverse geocoding real de un punto en Viseu
      // (uno de los que smoke-testeamos contra prod en Fase 2).
      const jsonStr = '''
      {
        "status": "OK",
        "results": [
          {
            "place_id": "ChIJ_viseu_rua",
            "formatted_address": "R. da Alegria 25, 3510-111 Viseu, Portugal",
            "geometry": {
              "location": {"lat": 40.661, "lng": -7.912},
              "location_type": "ROOFTOP"
            },
            "address_components": [
              {"long_name": "25", "short_name": "25", "types": ["street_number"]},
              {"long_name": "Rua da Alegria", "short_name": "R. da Alegria", "types": ["route"]},
              {"long_name": "Viseu", "short_name": "Viseu", "types": ["locality", "political"]},
              {"long_name": "Viseu", "short_name": "Viseu", "types": ["administrative_area_level_1", "political"]},
              {"long_name": "3510-111", "short_name": "3510-111", "types": ["postal_code"]},
              {"long_name": "Portugal", "short_name": "PT", "types": ["country", "political"]}
            ],
            "types": ["street_address"]
          }
        ]
      }
      ''';

      final parsed =
          GeocodingResponseDM.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);
      expect(parsed.status, ProxyStatusEnum.ok);
      expect(parsed.results, hasLength(1));

      final r = parsed.results.first;
      expect(r.placeId, 'ChIJ_viseu_rua');
      expect(r.formattedAddress, contains('Viseu'));
      expect(r.geometry?.location.lat, closeTo(40.661, 1e-3));
      expect(r.geometry?.location.lng, closeTo(-7.912, 1e-3));
      expect(r.geometry?.locationType, 'ROOFTOP');
      expect(r.types, ['street_address']);

      // Patrón de consumo real (location_bloc / signup auto-fill): buscar
      // el postal_code y el country en address_components.
      final postalCode = r.addressComponents.firstWhere(
        (c) => c.types.contains('postal_code'),
      );
      expect(postalCode.longName, '3510-111');

      final country = r.addressComponents.firstWhere(
        (c) => c.types.contains('country'),
      );
      expect(country.shortName, 'PT');
    });

    test('ZERO_RESULTS con results: [] (coords en el medio del océano)', () {
      const jsonStr = '{"status": "ZERO_RESULTS", "results": []}';
      final parsed =
          GeocodingResponseDM.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);

      expect(parsed.status, ProxyStatusEnum.zeroResults);
      expect(parsed.results, isEmpty);
      expect(parsed.status.isEmpty, isTrue);
    });

    test('results ausente cae al @Default([]) sin NPE', () {
      // Defensivo: si alguien del backend deja de devolver `results` en
      // un status no-OK, el parser no debe explotar.
      const jsonStr = '{"status": "UPSTREAM_ERROR"}';
      final parsed =
          GeocodingResponseDM.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);

      expect(parsed.status, ProxyStatusEnum.upstreamError);
      expect(parsed.results, isEmpty);
    });
  });

  group('GeocodingResponseDM.fromJson — forward geocoding', () {
    test('parsea múltiples matches para una query libre', () {
      // Forward devuelve a menudo >1 result cuando la query es ambigua
      // (p.ej. "Santiago" puede ser Santiago de Chile o Santiago de
      // Compostela). La UI elige results[0] por convención; los tests
      // verifican que el orden se respete y no se pierdan items.
      const jsonStr = '''
      {
        "status": "OK",
        "results": [
          {
            "place_id": "ChIJ_santiago_chile",
            "formatted_address": "Santiago, Región Metropolitana, Chile",
            "geometry": {
              "location": {"lat": -33.4489, "lng": -70.6693}
            },
            "address_components": [],
            "types": ["locality", "political"]
          },
          {
            "place_id": "ChIJ_santiago_spain",
            "formatted_address": "15700 Santiago de Compostela, A Coruña, España",
            "geometry": {
              "location": {"lat": 42.8782, "lng": -8.5448}
            },
            "address_components": [],
            "types": ["locality", "political"]
          }
        ]
      }
      ''';

      final parsed =
          GeocodingResponseDM.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);
      expect(parsed.results, hasLength(2));
      expect(parsed.results[0].placeId, 'ChIJ_santiago_chile');
      expect(parsed.results[1].placeId, 'ChIJ_santiago_spain');
      // `results[0]` es el "best match" por convención Google — lo
      // verificamos mirando las coords (Santiago de Chile).
      expect(parsed.results.first.geometry?.location.lat, closeTo(-33.44, 0.01));
    });

    test('status futuro desconocido cae a unknown sin perder results', () {
      // Este es el test clave del unknownEnumValue: aunque status
      // venga raro, la lista de results debe parsearse. Si se rompe,
      // el usuario pierde datos en pantalla por un status inesperado.
      const jsonStr = '''
      {
        "status": "MAYBE_SOON_FROM_GOOGLE",
        "results": [
          {
            "place_id": "ChIJ_something",
            "formatted_address": "Alguna dir",
            "geometry": {"location": {"lat": 1.0, "lng": 2.0}},
            "address_components": [],
            "types": []
          }
        ]
      }
      ''';

      final parsed =
          GeocodingResponseDM.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);
      expect(parsed.status, ProxyStatusEnum.unknown);
      expect(parsed.results, hasLength(1),
          reason: 'unknown status NO debe hacer perder la lista de results');
      expect(parsed.results.first.placeId, 'ChIJ_something');
    });
  });
}
