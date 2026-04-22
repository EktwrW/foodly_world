import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/places_proxy/place_address_component_dm.dart';
import 'package:foodly_world/data_models/places_proxy/place_dm.dart';
import 'package:foodly_world/data_models/places_proxy/place_geometry_dm.dart';
import 'package:foodly_world/ui/shared_widgets/places_autocomplete/_places_proxy_adapter.dart';
import 'package:nova_places_api/nova_places_api.dart' as nova;

/// Tests del adapter **interno y temporal** `novaPlaceFromDM` — convierte
/// `PlaceDM` (shape del proxy Foodly) a `nova.Place` (shape que leen los
/// consumers en Fase 4 mientras no cascadamos a DMs).
///
/// Invariantes que protegen — cada test cubre una expectativa que, si se
/// rompe, tira silenciosamente funcionalidad en producción:
///
///   1. **Roundtrip completo preserva todos los campos que consumers LEEN.**
///      Lista via grep al código: `geometry.location.lat/lng`,
///      `formattedAddress`, `name`, `placeId`, `formattedPhoneNumber`,
///      `addressComponents.firstWhereOrNull(... types.contains('country'|
///      'locality'|'administrative_area_level_1'|'postal_code'|'route'))`.
///
///   2. **addressComponents vacío → null** (no `[]`). Preserva la semántica
///      nova original (ver docblock del adapter).
///
///   3. **geometry null en el DM → null en el Place resultante.** Campo
///      opcional en ambos lados; el adapter no debe fabricar un Geometry
///      vacío.
///
///   4. **viewport ausente en DM → viewport degenerado NE=SW=location.**
///      `nova.Geometry.viewport` es non-null; el adapter lo satisface sin
///      inventar bounds. El test NO verifica que consumers lean viewport
///      (no lo hacen hoy) — solo que el adapter no crashea y construye
///      algo válido.
void main() {
  group('novaPlaceFromDM — roundtrip completo', () {
    test('preserva todos los campos que leen los consumers', () {
      const dm = PlaceDM(
        placeId: 'ChIJ_Covilha_PT',
        name: 'Restaurante Teste',
        formattedAddress: 'R. Exemplo 123, 6200-000 Covilhã, Portugal',
        formattedPhoneNumber: '+351 275 123 456',
        addressComponents: [
          PlaceAddressComponentDM(
            longName: '123',
            shortName: '123',
            types: ['street_number'],
          ),
          PlaceAddressComponentDM(
            longName: 'Rua Exemplo',
            shortName: 'R. Exemplo',
            types: ['route'],
          ),
          PlaceAddressComponentDM(
            longName: 'Covilhã',
            shortName: 'Covilhã',
            types: ['locality', 'political'],
          ),
          PlaceAddressComponentDM(
            longName: 'Castelo Branco',
            shortName: 'CB',
            types: ['administrative_area_level_2', 'political'],
          ),
          PlaceAddressComponentDM(
            longName: 'Portugal',
            shortName: 'PT',
            types: ['country', 'political'],
          ),
          PlaceAddressComponentDM(
            longName: '6200-000',
            shortName: '6200-000',
            types: ['postal_code'],
          ),
        ],
        geometry: PlaceGeometryDM(
          location: PlaceLatLngDM(lat: 40.2806, lng: -7.5042),
          viewport: PlaceBoundsDM(
            northeast: PlaceLatLngDM(lat: 40.2820, lng: -7.5025),
            southwest: PlaceLatLngDM(lat: 40.2795, lng: -7.5060),
          ),
          locationType: 'ROOFTOP',
        ),
        types: ['restaurant', 'food', 'establishment'],
      );

      final place = novaPlaceFromDM(dm);

      // Identificación + nombre + dirección (leen: sign_up, user_profile,
      // dashboard_helpers, location_service).
      expect(place.placeId, 'ChIJ_Covilha_PT');
      expect(place.name, 'Restaurante Teste');
      expect(place.formattedAddress, 'R. Exemplo 123, 6200-000 Covilhã, Portugal');
      expect(place.formattedPhoneNumber, '+351 275 123 456');

      // addressComponents: longName/shortName/types preservados en orden.
      final components = place.addressComponents;
      expect(components, isNotNull);
      expect(components, hasLength(6));

      final country = components!.firstWhere((c) => c.types.contains('country'));
      expect(country.shortName, 'PT');
      expect(country.longName, 'Portugal');

      final locality = components.firstWhere((c) => c.types.contains('locality'));
      expect(locality.shortName, 'Covilhã');

      final postalCode = components.firstWhere((c) => c.types.contains('postal_code'));
      expect(postalCode.longName, '6200-000');

      // Geometry.location — CRÍTICO: es lo que lee location_service.
      expect(place.geometry, isNotNull);
      expect(place.geometry!.location.lat, 40.2806);
      expect(place.geometry!.location.lng, -7.5042);
      expect(place.geometry!.locationType, 'ROOFTOP');

      // Viewport real (no degenerado) porque el DM lo traía.
      expect(place.geometry!.viewport.northeast.lat, 40.2820);
      expect(place.geometry!.viewport.southwest.lng, -7.5060);
    });
  });

  group('novaPlaceFromDM — edge cases defensivos', () {
    test('addressComponents vacío se mapea a null (preserva semántica nova)', () {
      const dm = PlaceDM(
        placeId: 'id_sin_components',
        name: 'Place sin componentes',
        formattedAddress: 'Algún lugar',
        // Default `@Default(<PlaceAddressComponentDM>[])` al omitir.
        geometry: PlaceGeometryDM(location: PlaceLatLngDM(lat: 0.1, lng: 0.2)),
      );

      final place = novaPlaceFromDM(dm);

      // Clave: nova.Place.addressComponents == null cuando no hay data,
      // NO una lista vacía. Consumers usan `?.firstWhereOrNull(...)` que
      // en ambos casos devuelve null, pero conservamos la forma nova.
      expect(place.addressComponents, isNull);
    });

    test('geometry null en el DM → geometry null en el Place resultante', () {
      const dm = PlaceDM(
        placeId: 'id_sin_geometry',
        name: 'Place sin coords',
        formattedAddress: 'Sin coords',
        // geometry: null (omitido — es nullable)
      );

      final place = novaPlaceFromDM(dm);

      expect(place.geometry, isNull);
      expect(place.placeId, 'id_sin_geometry');
      expect(place.name, 'Place sin coords');
    });

    test('viewport ausente en DM → adapter construye viewport degenerado NE=SW=location', () {
      // Google omite `viewport` en algunos Place Details — el DM lo
      // declara nullable, pero nova.Geometry.viewport es required Bounds.
      // El adapter debe fabricar un viewport degenerado (un punto) sin
      // crashear ni inventar bounds arbitrarios.
      const dm = PlaceDM(
        placeId: 'id_sin_viewport',
        geometry: PlaceGeometryDM(
          location: PlaceLatLngDM(lat: 38.7223, lng: -9.1393), // Lisboa
          // viewport: null (omitido)
        ),
      );

      final place = novaPlaceFromDM(dm);

      expect(place.geometry, isNotNull);
      expect(place.geometry!.location.lat, 38.7223);
      expect(place.geometry!.location.lng, -9.1393);

      // Viewport degenerado: NE == SW == location. Esto es aceptable
      // porque ningún consumer actual lee viewport; si en Fase 6 alguno
      // empieza a leerlo, revisar este default.
      final viewport = place.geometry!.viewport;
      expect(viewport.northeast.lat, 38.7223);
      expect(viewport.northeast.lng, -9.1393);
      expect(viewport.southwest.lat, 38.7223);
      expect(viewport.southwest.lng, -9.1393);
    });

    test('DM mínimo (solo campos required) no crashea en el adapter', () {
      // Todos los campos opcionales en null / defaults. La única
      // precondición del adapter es que exista un DM válido — PlaceDM
      // acepta este shape porque todos sus campos son opcionales o
      // tienen default.
      const dm = PlaceDM();

      final place = novaPlaceFromDM(dm);

      expect(place, isA<nova.Place>());
      expect(place.placeId, isNull);
      expect(place.name, isNull);
      expect(place.formattedAddress, isNull);
      expect(place.formattedPhoneNumber, isNull);
      expect(place.addressComponents, isNull);
      expect(place.geometry, isNull);
    });
  });
}
