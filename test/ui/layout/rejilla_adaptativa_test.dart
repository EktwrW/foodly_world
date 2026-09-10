import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/ui/shared_widgets/layout/rejilla_adaptativa.dart';

/// Las rejillas de negocios tenían `crossAxisCount: 2` clavado, así que en una
/// tableta salían dos cards enormes en vez de más cards del tamaño de siempre.
///
/// Lo primero que miden estos tests es que el TELÉFONO no se mueva: la app está
/// en producción con dos columnas y ahí se queda.
void main() {
  group('en teléfono siguen siendo dos, sin excepción', () {
    for (final ancho in [320.0, 375.0, 402.0, 430.0, 440.0, 599.0]) {
      test('a $ancho px → 2 columnas', () {
        expect(columnasDeRejilla(ancho), kColumnasEnTelefono);
      });
    }
  });

  group('en tablet caben más, del mismo tamaño', () {
    const esperado = <String, (double, int)>{
      'iPad mini vertical': (744, 3),
      'iPad Air vertical': (820, 4),
      'iPad Pro 11" vertical': (834, 4),
      'iPad Pro 12.9" horizontal': (1366, 6),
      'tableta Android sw600dp': (600, 3),
    };

    esperado.forEach((nombre, caso) {
      final (ancho, columnas) = caso;
      test('$nombre ($ancho px) → $columnas columnas', () {
        expect(columnasDeRejilla(ancho), columnas);
      });
    });
  });

  test('la card se queda en el ancho de un teléfono, no crece', () {
    for (final ancho in [744.0, 820.0, 1024.0, 1366.0]) {
      final anchoDeCard = ancho / columnasDeRejilla(ancho);

      expect(anchoDeCard, greaterThanOrEqualTo(kAnchoDeCardDeNegocio),
          reason: 'a $ancho px la card quedó por debajo del ancho de teléfono');
      expect(anchoDeCard, lessThan(kAnchoDeCardDeNegocio * 2),
          reason: 'a $ancho px la card se estiró al doble: cabía otra columna');
    }
  });

  test('hay tope: una pantalla enorme no se convierte en mosaico', () {
    expect(columnasDeRejilla(4000), kColumnasMaximas);
  });

  test('nunca baja de dos, ni con un ancho absurdo', () {
    expect(columnasDeRejilla(0), kColumnasEnTelefono);
    expect(columnasDeRejilla(-100), kColumnasEnTelefono);
  });
}
