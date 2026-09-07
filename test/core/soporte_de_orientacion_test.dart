import 'dart:ui' show Size;

import 'package:flutter/services.dart' show DeviceOrientation;
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/utils/soporte_de_orientacion.dart';

/// Quién puede girar la pantalla.
///
/// El teléfono NO se toca: la app está en producción bloqueada en vertical y
/// así se queda. Lo que cambia es que una tableta pueda girar — sin eso, el
/// `NavigationRail` de la home, que solo aparece en apaisado, era código
/// inalcanzable.
void main() {
  const soloVertical = [DeviceOrientation.portraitUp];

  group('teléfonos: siguen clavados en vertical', () {
    const telefonos = <String, Size>{
      'iPhone SE': Size(375, 667),
      'iPhone 16 Pro': Size(402, 874),
      'iPhone 16 Pro Max': Size(440, 956),
      'Pixel 7': Size(412, 915),
      'un teléfono ya girado': Size(874, 402),
    };

    for (final entrada in telefonos.entries) {
      test('${entrada.key} → solo vertical', () {
        expect(orientacionesPermitidas(entrada.value), soloVertical);
      });
    }
  });

  group('tabletas: pueden girar', () {
    const tabletas = <String, Size>{
      'iPad mini vertical': Size(744, 1133),
      'iPad Air vertical': Size(820, 1180),
      'iPad Pro 12.9" apaisado': Size(1366, 1024),
      'tableta Android sw600dp': Size(600, 960),
      'tableta Android apaisada': Size(1280, 800),
    };

    for (final entrada in tabletas.entries) {
      test('${entrada.key} → las cuatro', () {
        expect(orientacionesPermitidas(entrada.value), DeviceOrientation.values);
      });
    }
  });

  group('ante la duda, vertical', () {
    test('sin tamaño', () => expect(orientacionesPermitidas(null), soloVertical));
    test('tamaño cero', () => expect(orientacionesPermitidas(Size.zero), soloVertical));
    test('altura negativa', () => expect(orientacionesPermitidas(const Size(800, -1)), soloVertical));
  });

  /// El umbral es el `sw600dp` de Android: por debajo, recursos de teléfono.
  test('el umbral es justo el que usa el sistema para pantalla grande', () {
    expect(kLadoCortoDeTableta, 600);
    expect(orientacionesPermitidas(const Size(599, 900)), soloVertical);
    expect(orientacionesPermitidas(const Size(600, 900)), DeviceOrientation.values);
  });
}
