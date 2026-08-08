import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';

import 'group_order_fixtures.dart';

/// Los fixtures también se testean.
///
/// Su única razón de existir es que sea IMPOSIBLE construir un estado que el
/// backend no produce. Si estas garantías se rompen, los tests que dependen
/// de ellos vuelven a dar verde sobre escenarios inexistentes — que es
/// exactamente lo que pasó cuatro veces el 2026-08-06.
void main() {
  group('GroupOrders (fixtures)', () {
    test('una cuenta abierta confirmada SIEMPRE tiene importe', () {
      final o = GroupOrders.openTab(items: [GroupOrders.sentItem(price: 26)]);

      expect(o.status, GroupOrderStatus.confirmed);
      expect(o.confirmedAt, isNotNull);
      expect(o.totalAmount, 26, reason: 'sendBatch deja total_amount = subtotal.');
    });

    test('ENTREGADA implica que todos los ítems vivos están entregados', () {
      final o = GroupOrders.openTab(
        fulfillment: GroupFulfillmentStatus.delivered,
        items: [
          GroupOrders.sentItem(uuid: 'a'),
          GroupOrders.sentItem(uuid: 'b', batch: 2),
        ],
      );

      expect(
        o.sentItems.every((i) => i.deliveredAt != null),
        isTrue,
        reason: 'maybeAutoDeliver no admite una orden entregada con ítems sin entregar.',
      );
      expect(o.allItemsDelivered, isTrue);
    });

    test('lo anulado no suma al importe ni bloquea la entrega', () {
      final o = GroupOrders.openTab(
        fulfillment: GroupFulfillmentStatus.delivered,
        items: [
          GroupOrders.sentItem(uuid: 'a', price: 30),
          GroupOrders.sentItem(uuid: 'b', price: 99, voided: true),
        ],
      );

      expect(o.totalAmount, 30);
      expect(o.liveItems.length, 1);
    });

    test('un carrito abierto NO tiene importe congelado', () {
      final o = GroupOrders.openCart();

      expect(o.status, GroupOrderStatus.open);
      expect(o.totalAmount, 0, reason: 'El importe se fija al enviar, no antes.');
      expect(o.subtotal, greaterThan(0));
      expect(o.isTracking, isFalse, reason: 'Todavía es carrito.');
    });

    test('una cuenta saldada deja de estar viva', () {
      final o = GroupOrders.settledTab();

      expect(o.isFullyPaid, isTrue);
      expect(o.totalRemaining, 0);
      expect(o.isTracking, isFalse);
    });

    test('una cuenta con saldo pendiente sigue viva', () {
      final o = GroupOrders.openTab(
        fulfillment: GroupFulfillmentStatus.delivered,
        items: [GroupOrders.sentItem(price: 40)],
        paid: 15,
      );

      expect(o.totalRemaining, 25);
      expect(o.isTracking, isTrue);
    });

    test('una orden prepaga llega al panel PAGADA y sin tandas', () {
      final o = GroupOrders.perRound(items: [GroupOrders.pendingItem(price: 17)]);

      expect(o.isOpenTab, isFalse);
      expect(o.confirmedAt, isNotNull, reason: 'La confirma el webhook al cobrar.');
      expect(o.isFullyPaid, isTrue, reason: 'En prepago, pagar ES la comanda.');
      expect(o.items.every((i) => !i.isSent), isTrue);
      expect(
        o.kitchenItems.length,
        1,
        reason: 'Sin sentAt, la comanda es la orden entera: filtrar por él la vaciaba.',
      );
    });

    test('en prepago un ítem "enviado" es un estado imposible', () {
      expect(
        () => GroupOrders.perRound(items: [GroupOrders.sentItem()]),
        throwsA(isA<AssertionError>()),
      );
    });

    test('los ítems enviados llevan SIEMPRE sentAt y batchNo juntos', () {
      final i = GroupOrders.sentItem(batch: 3);

      expect(i.isSent, isTrue);
      expect(i.batchNo, 3);
      expect(GroupOrders.pendingItem().isSent, isFalse);
      expect(GroupOrders.pendingItem().batchNo, isNull);
    });
  });
}
