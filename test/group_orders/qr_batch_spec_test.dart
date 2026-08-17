import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/services/pending_table.dart';
import 'package:foodly_world/ui/views/business/manage_menu/widgets/qr_batch_spec.dart';

/// Fase 3 — el lote de QRs por mesa.
///
/// Acá vive lo que se puede razonar sin PDF ni pantalla: qué mesas entran y qué
/// URL lleva cada QR. Importa que esté bien porque el resultado se IMPRIME: un
/// error acá son 40 carteles mal pegados en 40 mesas.
void main() {
  const menuUrl = 'https://menu.foodly.solutions/abc-123';

  group('labelsForRange', () {
    test('arma el rango inclusivo con prefijo', () {
      expect(
        QrBatchSpec.labelsForRange(from: 1, to: 4, prefix: 'Mesa'),
        ['Mesa 1', 'Mesa 2', 'Mesa 3', 'Mesa 4'],
      );
    });

    test('sin prefijo deja solo el número', () {
      expect(QrBatchSpec.labelsForRange(from: 7, to: 9, prefix: ''), ['7', '8', '9']);
    });

    test('recorta espacios del prefijo', () {
      expect(QrBatchSpec.labelsForRange(from: 1, to: 1, prefix: '  Terraza  '), ['Terraza 1']);
    });

    test('un rango de una sola mesa es válido', () {
      expect(QrBatchSpec.labelsForRange(from: 5, to: 5, prefix: 'Mesa'), ['Mesa 5']);
    });

    test('rango invertido devuelve vacío en vez de una lista rara', () {
      expect(QrBatchSpec.labelsForRange(from: 10, to: 3, prefix: 'Mesa'), isEmpty);
    });

    test('mesas desde 0 o negativas no tienen sentido', () {
      expect(QrBatchSpec.labelsForRange(from: 0, to: 5, prefix: 'Mesa'), isEmpty);
      expect(QrBatchSpec.labelsForRange(from: -3, to: 5, prefix: 'Mesa'), isEmpty);
    });

    test('respeta el tope de páginas', () {
      expect(QrBatchSpec.labelsForRange(from: 1, to: QrBatchSpec.maxTables, prefix: 'Mesa').length,
          QrBatchSpec.maxTables);
      expect(QrBatchSpec.labelsForRange(from: 1, to: QrBatchSpec.maxTables + 1, prefix: 'Mesa'), isEmpty);
    });
  });

  group('urlForTable', () {
    test('agrega ?t= al menú', () {
      expect(
        QrBatchSpec.urlForTable(menuUrl: menuUrl, label: 'Mesa 12'),
        'https://menu.foodly.solutions/abc-123?t=Mesa+12',
      );
    });

    /// El QR impreso tiene que sobrevivir el viaje completo: lo que codifica
    /// acá es lo que PendingTable lee del otro lado.
    test('lo que codifica el QR es lo que PendingTable recupera', () {
      final url = QrBatchSpec.urlForTable(menuUrl: menuUrl, label: 'Mesa 12');

      PendingTable.clear();
      PendingTable.captureFromUri(Uri.parse(url));
      expect(PendingTable.forBusiness('abc-123'), 'Mesa 12');
      PendingTable.clear();
    });

    test('sin etiqueta devuelve el menú sin tocar (QR genérico)', () {
      expect(QrBatchSpec.urlForTable(menuUrl: menuUrl, label: ''), menuUrl);
      expect(QrBatchSpec.urlForTable(menuUrl: menuUrl, label: '   '), menuUrl);
    });

    /// Truncar al imprimir y no al pedir: si no, se imprimen 200 carteles con
    /// una mesa que el backend después rechaza con 422.
    test('trunca a la capacidad de group_orders.table_label', () {
      final url = QrBatchSpec.urlForTable(menuUrl: menuUrl, label: 'M' * 50);
      expect(Uri.parse(url).queryParameters['t']!.length, PendingTable.maxLength);
    });

    test('escapa caracteres que romperían la URL', () {
      final url = QrBatchSpec.urlForTable(menuUrl: menuUrl, label: 'Mesa & Barra');
      expect(Uri.parse(url).queryParameters['t'], 'Mesa & Barra');
    });
  });
}
