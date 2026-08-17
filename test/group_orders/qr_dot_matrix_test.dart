import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/ui/views/business/manage_menu/widgets/qr_dot_matrix.dart';

/// La retícula del QR, que es lo que después se dibuja punto por punto.
///
/// Si esto se reconstruye mal, el QR impreso no se lee — y el error aparece
/// recién cuando alguien apunta el móvil a un cartel ya pegado en la mesa.
void main() {
  const url = 'https://menu.foodly.solutions/abc-123?t=Mesa+12';

  test('la matriz es cuadrada y de un tamaño válido de QR', () {
    final m = QrDotMatrix.of(url);

    // Las versiones de QR van de 21 (v1) a 177 (v40), de 4 en 4.
    expect(m.size, greaterThanOrEqualTo(21));
    expect(m.size, lessThanOrEqualTo(177));
    expect((m.size - 21) % 4, 0, reason: '${m.size} no es un tamaño de versión de QR');
    expect(m.black.length, m.size);
    expect(m.black.every((row) => row.length == m.size), isTrue);
  });

  /// Los tres patrones de posición son la firma de un QR bien formado: anillo
  /// de 7×7 con centro macizo de 3×3. Si no están, no se reconstruyó bien.
  test('los tres ojos tienen la forma canónica', () {
    final m = QrDotMatrix.of(url);

    for (final o in m.eyeOrigins) {
      // Borde exterior del ojo, encendido en las cuatro esquinas.
      expect(m.isOn(o.x, o.y), isTrue, reason: 'esquina del ojo en $o');
      expect(m.isOn(o.x + 6, o.y), isTrue);
      expect(m.isOn(o.x, o.y + 6), isTrue);
      expect(m.isOn(o.x + 6, o.y + 6), isTrue);

      // Anillo blanco intermedio.
      expect(m.isOn(o.x + 1, o.y + 1), isFalse, reason: 'anillo blanco en $o');

      // Centro macizo 3×3.
      for (var dy = 2; dy <= 4; dy++) {
        for (var dx = 2; dx <= 4; dx++) {
          expect(m.isOn(o.x + dx, o.y + dy), isTrue, reason: 'centro del ojo en $o');
        }
      }
    }
  });

  test('isInEye cubre los tres ojos y nada del centro', () {
    final m = QrDotMatrix.of(url);

    expect(m.isInEye(0, 0), isTrue);
    expect(m.isInEye(m.size - 1, 0), isTrue);
    expect(m.isInEye(0, m.size - 1), isTrue);

    // La esquina inferior derecha NO lleva ojo en un QR.
    expect(m.isInEye(m.size - 1, m.size - 1), isFalse);
    expect(m.isInEye(m.size ~/ 2, m.size ~/ 2), isFalse);
  });

  test('hay módulos encendidos fuera de los ojos (los datos existen)', () {
    final m = QrDotMatrix.of(url);

    var fuera = 0;
    for (var y = 0; y < m.size; y++) {
      for (var x = 0; x < m.size; x++) {
        if (m.isOn(x, y) && !m.isInEye(x, y)) fuera++;
      }
    }
    expect(fuera, greaterThan(50));
  });

  test('URLs distintas dan matrices distintas', () {
    final a = QrDotMatrix.of('$url&x=1').toAscii();
    final b = QrDotMatrix.of('$url&x=2').toAscii();

    expect(a, isNot(b));
  });

  test('una URL más larga necesita una versión mayor', () {
    final corta = QrDotMatrix.of('https://menu.foodly.solutions/a?t=1');
    final larga = QrDotMatrix.of('https://menu.foodly.solutions/${'x' * 200}?t=Mesa+100');

    expect(larga.size, greaterThan(corta.size));
  });
}
