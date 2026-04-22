import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/places_proxy/place_autocomplete_response_dm.dart';
import 'package:foodly_world/data_models/places_proxy/place_details_response_dm.dart';
import 'package:foodly_world/data_models/places_proxy/proxy_status_enum.dart';

/// Tests de parsing JSON para los envelopes de Places (`/places/autocomplete`
/// y `/places/details/{placeId}`) contra fixtures extraídos del smoke test
/// real de Covilhã (Fase 2, 2026-04-22).
///
/// Invariantes que protegen:
/// 1. Happy path — lo que el backend nos devuelve hoy se parsea sin
///    pérdida de información.
/// 2. Forward compat — campos nuevos que el backend agregue en el futuro
///    no rompen el parse (Freezed/json_serializable ignora claves
///    desconocidas por default, pero si alguien pasa
///    `disallowUnrecognizedKeys: true` esto se rompe).
/// 3. Null/ausencia defensiva — campos opcionales ausentes no tiran NPE,
///    listas faltantes caen al `@Default([])`.
/// 4. Estructura anidada — geometry.location.lat/lng, address_components
///    con types[], structured_formatting con main_text/secondary_text.
void main() {
  group('PlaceAutocompleteResponseDM.fromJson', () {
    test('parsea happy path con una prediction completa', () {
      const jsonStr = '''
      {
        "status": "OK",
        "predictions": [
          {
            "place_id": "ChIJ_Covilha_PT",
            "description": "Covilhã, Portugal",
            "structured_formatting": {
              "main_text": "Covilhã",
              "secondary_text": "Portugal"
            },
            "types": ["locality", "political", "geocode"]
          }
        ]
      }
      ''';

      final parsed =
          PlaceAutocompleteResponseDM.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);

      expect(parsed.status, ProxyStatusEnum.ok);
      expect(parsed.predictions, hasLength(1));

      final p = parsed.predictions.first;
      expect(p.placeId, 'ChIJ_Covilha_PT');
      expect(p.description, 'Covilhã, Portugal');
      expect(p.types, ['locality', 'political', 'geocode']);
      expect(p.structuredFormatting?.mainText, 'Covilhã');
      expect(p.structuredFormatting?.secondaryText, 'Portugal');
    });

    test('ZERO_RESULTS con lista de predictions vacía', () {
      // Google devuelve ZERO_RESULTS con "predictions": [] cuando el
      // input no matchea nada. La UI debe mostrar empty state, no error.
      const jsonStr = '{"status": "ZERO_RESULTS", "predictions": []}';
      final parsed =
          PlaceAutocompleteResponseDM.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);

      expect(parsed.status, ProxyStatusEnum.zeroResults);
      expect(parsed.status.isEmpty, isTrue);
      expect(parsed.predictions, isEmpty);
    });

    test('predictions ausente cae al @Default([]) sin NPE', () {
      // Edge case: backend devuelve solo status (p.ej. un UPSTREAM_ERROR
      // que el proxy emitió antes de siquiera intentar la query).
      const jsonStr = '{"status": "UPSTREAM_ERROR"}';
      final parsed =
          PlaceAutocompleteResponseDM.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);

      expect(parsed.status, ProxyStatusEnum.upstreamError);
      expect(parsed.predictions, isEmpty);
    });

    test('structured_formatting ausente → null (no rompe)', () {
      // Google a veces omite structured_formatting en matches tipo
      // "plus_code" o "postal_code" que no tienen jerarquía main/sec.
      const jsonStr = '''
      {
        "status": "OK",
        "predictions": [
          {
            "place_id": "ChIJ_onlyId",
            "description": "Solo descripción",
            "types": []
          }
        ]
      }
      ''';
      final parsed =
          PlaceAutocompleteResponseDM.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);
      expect(parsed.predictions.first.structuredFormatting, isNull);
    });

    test('forward compat: next_page_token y otras keys futuras son ignoradas', () {
      // Google puede agregar next_page_token para paginación (hoy no lo
      // usamos). El parser debe ignorarlo silenciosamente; si alguien
      // activa disallowUnrecognizedKeys este test falla y hay que tomar
      // la decisión explícita de si extender el DM o seguir ignorando.
      const jsonStr = '''
      {
        "status": "OK",
        "predictions": [],
        "next_page_token": "CmRaAAAAabcdef",
        "generated_new_google_field": {"foo": "bar"}
      }
      ''';
      expect(
        () => PlaceAutocompleteResponseDM.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>),
        returnsNormally,
      );
    });
  });

  group('PlaceDetailsResponseDM.fromJson', () {
    test('parsea happy path con geometry + address_components + phones', () {
      // Fixture representativo del smoke test de Fase 2: Covilhã con
      // coords reales y al menos 2 address_components (locality + country).
      const jsonStr = '''
      {
        "status": "OK",
        "result": {
          "place_id": "ChIJ_Covilha_full",
          "name": "Covilhã",
          "formatted_address": "Covilhã, Portugal",
          "formatted_phone_number": "275 330 600",
          "international_phone_number": "+351 275 330 600",
          "geometry": {
            "location": {"lat": 40.2791, "lng": -7.5063},
            "viewport": {
              "northeast": {"lat": 40.3204, "lng": -7.4512},
              "southwest": {"lat": 40.2378, "lng": -7.5614}
            },
            "location_type": "APPROXIMATE"
          },
          "address_components": [
            {
              "long_name": "Covilhã",
              "short_name": "Covilhã",
              "types": ["locality", "political"]
            },
            {
              "long_name": "Portugal",
              "short_name": "PT",
              "types": ["country", "political"]
            }
          ],
          "types": ["locality", "political"]
        }
      }
      ''';

      final parsed =
          PlaceDetailsResponseDM.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);
      expect(parsed.status, ProxyStatusEnum.ok);
      expect(parsed.result, isNotNull);

      final r = parsed.result!;
      expect(r.placeId, 'ChIJ_Covilha_full');
      expect(r.name, 'Covilhã');
      expect(r.formattedAddress, 'Covilhã, Portugal');
      expect(r.formattedPhoneNumber, '275 330 600');
      expect(r.internationalPhoneNumber, '+351 275 330 600');

      // geometry y su location deben estar presentes y parseados.
      expect(r.geometry?.location.lat, closeTo(40.2791, 1e-6));
      expect(r.geometry?.location.lng, closeTo(-7.5063, 1e-6));
      expect(r.geometry?.locationType, 'APPROXIMATE');
      expect(r.geometry?.viewport, isNotNull);
      expect(r.geometry?.viewport?.northeast?.lat, closeTo(40.3204, 1e-6));

      // address_components debe tener 2 entradas con types[] completos.
      expect(r.addressComponents, hasLength(2));
      final country = r.addressComponents.firstWhere(
        (c) => c.types.contains('country'),
      );
      expect(country.shortName, 'PT');
      expect(country.longName, 'Portugal');
    });

    test('NOT_FOUND con result: null (HTTP 404 ya lo convirtió el Dio, pero cubrimos defensivo)', () {
      // En producción este body llega como DioException porque el
      // backend responde 404; pero si algún día se decide devolver
      // 200+status=NOT_FOUND, el parser no debe romper.
      const jsonStr = '{"status": "NOT_FOUND", "result": null}';
      final parsed =
          PlaceDetailsResponseDM.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);

      expect(parsed.status, ProxyStatusEnum.notFound);
      expect(parsed.result, isNull);
      expect(parsed.status.isEmpty, isTrue,
          reason: 'notFound debe clasificarse como empty, no como error');
    });

    test('result con campos opcionales ausentes no rompe', () {
      // Min viable Place: solo place_id y formatted_address. Sin
      // phones, sin viewport, sin bounds. Todos esos campos son
      // nullable en el DM, así que deben quedar null sin NPE.
      const jsonStr = '''
      {
        "status": "OK",
        "result": {
          "place_id": "ChIJ_minimal",
          "formatted_address": "Alguna dirección",
          "geometry": {
            "location": {"lat": 0.0, "lng": 0.0}
          }
        }
      }
      ''';
      final parsed =
          PlaceDetailsResponseDM.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);

      final r = parsed.result!;
      expect(r.name, isNull);
      expect(r.formattedPhoneNumber, isNull);
      expect(r.internationalPhoneNumber, isNull);
      expect(r.geometry?.viewport, isNull);
      expect(r.geometry?.bounds, isNull);
      expect(r.addressComponents, isEmpty);
      expect(r.types, isEmpty);
    });
  });
}
