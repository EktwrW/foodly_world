import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';

/// F4a — ¿cuándo se puede encadenar otra ronda (o abrir otra cuenta)?
///
/// EL BUG (reportado en device). "Otra ronda" SOLO vivía dentro del sheet de
/// "pago exitoso", que ve quien paga. Si pagaba otro comensal, al resto de la
/// mesa no le quedaba ninguna puerta: volvían al menú, el FAB seguía
/// mostrando la orden activa y los devolvía a la que ya estaba pagada.
///
/// El predicado espeja `createNextRound` del backend —`confirmed`/`completed`
/// más saldada o cerrada— y le suma UNA condición propia: entregada.
/// Encadenar con la anterior todavía en cocina cambia el carrito activo y le
/// tapa al comensal el seguimiento de lo que aún no llegó.
void main() {
  GroupOrderDM orden({
    GroupOrderStatus status = GroupOrderStatus.confirmed,
    GroupFulfillmentStatus? entrega = GroupFulfillmentStatus.delivered,
    double pagado = 9,
    double total = 9,
    DateTime? cerradaEn,
  }) =>
      GroupOrderDM(
        uuid: 'o1',
        status: status,
        fulfillmentStatus: entrega,
        totalAmount: total,
        totalPaid: pagado,
        closedAt: cerradaEn,
      );

  group('se puede', () {
    test('confirmada, entregada y pagada entera', () {
      expect(orden().canStartNextRound, isTrue);
    });

    test('completada, entregada y pagada entera', () {
      expect(orden(status: GroupOrderStatus.completed).canStartNextRound, isTrue);
    });

    test('cobrada EN CAJA: totalPaid es 0 y aun así cuenta como saldada', () {
      // Sin mirar `closedAt`, una mesa que paga en efectivo —el desenlace más
      // común en un restaurante tradicional— no podría abrir la siguiente.
      final enCaja = orden(pagado: 0, cerradaEn: DateTime(2026, 8, 22));

      expect(enCaja.isSettled, isTrue);
      expect(enCaja.canStartNextRound, isTrue);
    });
  });

  group('no se puede', () {
    test('todavía en cocina: encadenar taparía el seguimiento', () {
      expect(orden(entrega: GroupFulfillmentStatus.preparing).canStartNextRound, isFalse);
      expect(orden(entrega: GroupFulfillmentStatus.ready).canStartNextRound, isFalse);
    });

    test('sin estado de entrega: el negocio ni tocó la comanda', () {
      expect(orden(entrega: null).canStartNextRound, isFalse);
    });

    test('con saldo pendiente, aunque esté entregada', () {
      expect(orden(pagado: 4).canStartNextRound, isFalse);
    });

    test('abierta o bloqueada: el backend responde 409 previous_round_open', () {
      expect(orden(status: GroupOrderStatus.open).canStartNextRound, isFalse);
      expect(orden(status: GroupOrderStatus.locked).canStartNextRound, isFalse);
      expect(orden(status: GroupOrderStatus.paying).canStartNextRound, isFalse);
    });

    test('cancelada o expirada: no hay mesa que continuar', () {
      expect(orden(status: GroupOrderStatus.cancelled).canStartNextRound, isFalse);
      expect(orden(status: GroupOrderStatus.expired).canStartNextRound, isFalse);
    });

    test('orden vacía sin pagos: saldo cero no es lo mismo que saldada', () {
      // totalPaid 0 y totalRemaining 0 sin `closedAt` es una orden en la que
      // nadie pagó nada, no una cuenta cerrada.
      final vacia = orden(pagado: 0, total: 0);

      expect(vacia.isSettled, isFalse);
      expect(vacia.canStartNextRound, isFalse);
    });
  });
}
