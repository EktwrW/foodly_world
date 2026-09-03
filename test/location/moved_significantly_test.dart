import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/services/location_service.dart';
import 'package:geolocator/geolocator.dart';

Position _p(double lat, double lng) => Position(
      latitude: lat,
      longitude: lng,
      timestamp: DateTime(2026, 9, 3),
      accuracy: 10,
      altitude: 0,
      altitudeAccuracy: 0,
      heading: 0,
      headingAccuracy: 0,
      speed: 0,
      speedAccuracy: 0,
    );

void main() {
  test('sin posición anterior siempre hay que cargar', () {
    expect(LocationService.movedSignificantly(null, _p(40.28, -7.50)), isTrue);
  });

  test('sin posición nueva no hay nada que recargar', () {
    expect(LocationService.movedSignificantly(_p(40.28, -7.50), null), isFalse);
  });

  test('el mismo sitio con otra precisión (a 40 m) no recarga', () {
    // ~40 m al norte en Covilhã
    expect(LocationService.movedSignificantly(_p(40.2800, -7.5000), _p(40.28036, -7.5000)), isFalse);
  });

  test('a 300 m (misma zona con otra precisión) no recarga', () {
    expect(LocationService.movedSignificantly(_p(40.2800, -7.5000), _p(40.2827, -7.5000)), isFalse);
  });

  test('a 1,5 km sí recarga', () {
    expect(LocationService.movedSignificantly(_p(40.2800, -7.5000), _p(40.2935, -7.5000)), isTrue);
  });
}
