import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/services/pending_table.dart';

/// Fase 2 — la mesa viaja del QR a la orden.
///
/// El QR pegado en la mesa puede llevar `?t={mesa}`. El dato tiene que
/// sobrevivir el salto de `publicMenu` → `visitBusiness`, que arma el destino
/// con `replaceFirst(':id', uuid)` y DESCARTA el query string. De ahí que se
/// estacione en el redirect global, igual que el código de invitación.
///
/// Estas son las funciones puras de ese estacionamiento.
void main() {
  setUp(PendingTable.clear);
  tearDown(PendingTable.clear);

  const uuid = 'abc-123';

  group('captureFromUri', () {
    test('estaciona la mesa de /{businessUuid}?t=', () {
      PendingTable.captureFromUri(Uri.parse('/$uuid?t=12'));
      expect(PendingTable.forBusiness(uuid), '12');
    });

    test('la URL completa del App Link (host incluido) también captura', () {
      PendingTable.captureFromUri(Uri.parse('https://menu.foodly.solutions/$uuid?t=Mesa%207'));
      expect(PendingTable.forBusiness(uuid), 'Mesa 7');
    });

    test('sin ?t= no estaciona nada', () {
      PendingTable.captureFromUri(Uri.parse('/$uuid'));
      expect(PendingTable.label, isNull);
    });

    test('ignora paths que no son de un solo segmento', () {
      for (final path in ['/', '/main/home/x/foodly-main-page?t=5', '/join/ABC123?t=5']) {
        PendingTable.captureFromUri(Uri.parse(path));
        expect(PendingTable.label, isNull, reason: 'no debía capturar en $path');
      }
    });

    test('recorta espacios', () {
      PendingTable.captureFromUri(Uri.parse('/$uuid?t=%20%20Mesa%203%20%20'));
      expect(PendingTable.forBusiness(uuid), 'Mesa 3');
    });

    test('un ?t= vacío o solo espacios no estaciona', () {
      for (final q in ['t=', 't=%20%20']) {
        PendingTable.captureFromUri(Uri.parse('/$uuid?$q'));
        expect(PendingTable.label, isNull, reason: 'no debía capturar con $q');
      }
    });

    /// El backend rechaza caracteres de control con 422. Si el cliente los
    /// mandara, un QR mal impreso dejaría al comensal sin poder crear la orden.
    /// La mesa es un extra: nunca debe bloquear el pedido.
    test('limpia caracteres de control en vez de dejar que revienten el request', () {
      PendingTable.captureFromUri(Uri.parse('/$uuid?t=Mesa%207%0D%0ABcc:%20x'));
      expect(PendingTable.forBusiness(uuid), 'Mesa 7Bcc: x');
      expect(PendingTable.label, isNot(contains('\r')));
      expect(PendingTable.label, isNot(contains('\n')));
    });

    test('si tras limpiar no queda nada, no estaciona', () {
      PendingTable.captureFromUri(Uri.parse('/$uuid?t=%0D%0A'));
      expect(PendingTable.label, isNull);
    });

    /// `group_orders.table_label` es varchar(30): se recorta acá para que una
    /// URL manipulada degrade a una mesa truncada y no a un 422.
    test('trunca a la capacidad de la columna', () {
      final largo = 'M' * 50;
      PendingTable.captureFromUri(Uri.parse('/$uuid?t=$largo'));
      expect(PendingTable.label!.length, PendingTable.maxLength);
    });

    test('un escaneo nuevo reemplaza al anterior', () {
      PendingTable.captureFromUri(Uri.parse('/$uuid?t=5'));
      PendingTable.captureFromUri(Uri.parse('/$uuid?t=9'));
      expect(PendingTable.forBusiness(uuid), '9');
    });
  });

  group('emparejamiento con el negocio', () {
    /// Lo que evita el bug feo: escanear en un bar y pedir en el de enfrente
    /// NO debe colar "Mesa 7" en la comanda del segundo.
    test('la mesa no se entrega a un negocio distinto del que la capturó', () {
      PendingTable.captureFromUri(Uri.parse('/$uuid?t=7'));

      expect(PendingTable.forBusiness('otro-negocio'), isNull);
      expect(PendingTable.forBusiness(uuid), '7');
    });

    test('clearFor solo limpia si coincide el negocio', () {
      PendingTable.captureFromUri(Uri.parse('/$uuid?t=7'));

      PendingTable.clearFor('otro-negocio');
      expect(PendingTable.forBusiness(uuid), '7', reason: 'no debía limpiar la de otro negocio');

      PendingTable.clearFor(uuid);
      expect(PendingTable.forBusiness(uuid), isNull);
    });
  });
}
