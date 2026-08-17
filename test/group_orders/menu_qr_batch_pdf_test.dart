import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/ui/views/business/manage_menu/widgets/menu_qr_batch_pdf.dart';
import 'package:foodly_world/ui/views/business/manage_menu/widgets/qr_batch_spec.dart';

/// Fase 3 — el PDF del lote se genera de verdad.
///
/// No se verifica el aspecto (eso se mira imprimiendo), pero sí que el
/// documento salga bien formado y con una página por mesa. Es la clase de error
/// que, sin test, se descubre con 40 carteles ya impresos.
void main() {
  const menuUrl = 'https://menu.foodly.solutions/abc-123';

  Future<List<int>> buildFor(List<String> labels, {String business = 'Tasca do Zé'}) {
    return MenuQrBatchPdf.build(
      businessName: business,
      labels: labels,
      urlForLabel: (l) => QrBatchSpec.urlForTable(menuUrl: menuUrl, label: l),
      scanHint: 'Escanea para ver la carta',
      poweredBy: 'Con la tecnología de',
    );
  }

  /// `%PDF-` al principio y `%%EOF` al final: si falta alguno, el archivo no
  /// abre en ningún visor.
  void expectWellFormedPdf(List<int> bytes) {
    expect(String.fromCharCodes(bytes.take(5)), '%PDF-');
    expect(String.fromCharCodes(bytes.skip(bytes.length - 8)), contains('%%EOF'));
  }

  test('un lote de una mesa produce un PDF válido', () async {
    final bytes = await buildFor(['Mesa 1']);

    expectWellFormedPdf(bytes);
    expect(bytes.length, greaterThan(1000), reason: 'un PDF con un QR no puede ser trivialmente chico');
  });

  /// Cuatro carteles por hoja A4: mismo tamaño físico que un A6 por página,
  /// pero una cuarta parte de las hojas y sin depender de que el usuario
  /// encuentre la opción "4 por hoja" del diálogo de impresión.
  test('agrupa de a cuatro carteles por hoja', () async {
    final content = String.fromCharCodes(await buildFor(
      QrBatchSpec.labelsForRange(from: 1, to: 8, prefix: 'Mesa'),
    ));
    final pages = RegExp(r'/Type\s*/Page[^s]').allMatches(content).length;

    expect(pages, 2, reason: '8 mesas entran en 2 hojas');
  });

  test('una hoja incompleta no estira los carteles que sí hay', () async {
    for (final (mesas, hojas) in [(1, 1), (3, 1), (5, 2), (7, 2)]) {
      final content = String.fromCharCodes(await buildFor(
        QrBatchSpec.labelsForRange(from: 1, to: mesas, prefix: 'Mesa'),
      ));
      final pages = RegExp(r'/Type\s*/Page[^s]').allMatches(content).length;

      expect(pages, hojas, reason: '$mesas mesas -> $hojas hojas');
    }
  });

  /// El caso que motivó toda la fase: 40 mesas en UN archivo, no 40 archivos.
  test('40 mesas entran en un solo documento y a tiempo', () async {
    final reloj = Stopwatch()..start();
    final bytes = await buildFor(QrBatchSpec.labelsForRange(from: 1, to: 40, prefix: 'Mesa'));
    reloj.stop();

    expectWellFormedPdf(bytes);
    final pages = RegExp(r'/Type\s*/Page[^s]').allMatches(String.fromCharCodes(bytes)).length;
    expect(pages, 10, reason: '40 mesas en 10 hojas, no en 40');

    // Holgado a propósito: la máquina de CI es más lenta que la de desarrollo.
    // Solo interesa detectar un derrumbe de orden de magnitud.
    expect(reloj.elapsed, lessThan(const Duration(seconds: 20)));
  });

  test('el tope del lote también se puede generar', () async {
    final labels = QrBatchSpec.labelsForRange(from: 1, to: QrBatchSpec.maxTables, prefix: 'Mesa');

    expectWellFormedPdf(await buildFor(labels));
  });

  test('sin logos y con nombre vacío sigue generando (no revienta por faltantes)', () async {
    expectWellFormedPdf(await buildFor(['Mesa 1'], business: ''));
  });

  test('nombres con acentos y ñ no rompen la fuente estándar', () async {
    expectWellFormedPdf(await buildFor(['Mesa 1'], business: 'Señor Ñandú — Café & Sidrería'));
  });

  /// Las fuentes estándar del PDF cubren Latin-1: acentos y ñ salen, pero el
  /// guion largo y las comillas curvas no, y el paquete deja un HUECO en vez de
  /// avisar fuerte. En pantalla sería un detalle; acá va impreso y pegado en la
  /// mesa, así que se degradan a ASCII antes de dibujar.
  group('printable', () {
    test('deja intacto lo que la fuente sí sabe dibujar', () {
      for (final ok in ['Señor Ñandú', 'Café', 'Sidrería & Tapas', 'Mesa 12', 'Tasca do Zé']) {
        expect(MenuQrBatchPdf.printable(ok), ok);
      }
    });

    test('reemplaza la puntuación tipográfica que quedaría en blanco', () {
      expect(MenuQrBatchPdf.printable('Café — Bar'), 'Café - Bar');
      expect(MenuQrBatchPdf.printable('El “Rincón”'), 'El "Rincón"');
      expect(MenuQrBatchPdf.printable('D’Angelo'), "D'Angelo");
      expect(MenuQrBatchPdf.printable('Tapas… y más'), 'Tapas... y más');
    });

    test('no deja ningún carácter fuera de Latin-1 de los que reemplaza', () {
      const crudo = 'A—B–C“D”E‘F’G…H•I·J';
      final limpio = MenuQrBatchPdf.printable(crudo);

      for (final c in ['—', '–', '“', '”', '‘', '’', '…', '•', '·']) {
        expect(limpio, isNot(contains(c)), reason: '$c debía haberse reemplazado');
      }
    });
  });
}
