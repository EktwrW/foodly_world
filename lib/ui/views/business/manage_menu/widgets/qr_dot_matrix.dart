import 'package:barcode/barcode.dart';
import 'package:flutter/foundation.dart' show immutable, visibleForTesting;

/// La retícula de módulos de un QR, para poder dibujarla a mano.
///
/// `BarcodeWidget` del paquete `pdf` solo sabe pintar módulos cuadrados en
/// negro, y el QR de Foodly ([FoodlyQrCard]) son **puntos redondos morados con
/// ojos circulares**. Para que el cartel impreso sea el mismo que el que se
/// descarga suelto hay que dibujarlo módulo a módulo, y para eso primero hace
/// falta la retícula.
///
/// `Barcode.make()` no devuelve módulos sueltos sino RUNS —tramos horizontales
/// del mismo color— normalizados a una caja de 1×1. De ahí se reconstruye la
/// grilla: el módulo mide lo que el run más angosto.
@immutable
class QrDotMatrix {
  const QrDotMatrix({required this.size, required this.black});

  /// Módulos por lado.
  final int size;

  /// `black[y][x]` — true si el módulo se pinta.
  final List<List<bool>> black;

  /// Lado, en módulos, de los tres ojos (patrones de posición) de un QR.
  static const eye = 7;

  bool isOn(int x, int y) => y >= 0 && y < size && x >= 0 && x < size && black[y][x];

  /// Esquinas superiores-izquierda de los tres ojos.
  List<({int x, int y})> get eyeOrigins => [
        (x: 0, y: 0),
        (x: size - eye, y: 0),
        (x: 0, y: size - eye),
      ];

  /// Si el módulo cae dentro de un ojo. Esos NO se dibujan como puntos: el ojo
  /// se pinta aparte como anillo + punto central, igual que `QrEyeShape.circle`.
  bool isInEye(int x, int y) {
    for (final o in eyeOrigins) {
      if (x >= o.x && x < o.x + eye && y >= o.y && y < o.y + eye) return true;
    }
    return false;
  }

  static QrDotMatrix of(String data) {
    final bars = Barcode.qrCode().make(data, width: 1, height: 1).whereType<BarcodeBar>().toList();

    // El run más angosto es un módulo: de ahí sale cuántos hay por lado.
    final unit = bars.map((b) => b.width).reduce((a, b) => a < b ? a : b);
    final n = (1 / unit).round();

    final grid = List.generate(n, (_) => List.filled(n, false), growable: false);
    for (final b in bars) {
      if (!b.black) continue;
      final x0 = (b.left / unit).round();
      final y0 = (b.top / unit).round();
      final w = (b.width / unit).round();
      final h = (b.height / unit).round();
      for (var dy = 0; dy < h; dy++) {
        for (var dx = 0; dx < w; dx++) {
          final x = x0 + dx, y = y0 + dy;
          if (x >= 0 && x < n && y >= 0 && y < n) grid[y][x] = true;
        }
      }
    }

    return QrDotMatrix(size: n, black: grid);
  }

  /// Solo para tests: dibuja la matriz en ASCII para poder mirarla.
  @visibleForTesting
  String toAscii() => [
        for (var y = 0; y < size; y++) [for (var x = 0; x < size; x++) black[y][x] ? '#' : '.'].join(),
      ].join('\n');
}
