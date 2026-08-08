import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';

import 'fixtures/group_order_fixtures.dart';

/// F4b — cerrar una cuenta cobrada FUERA de Foodly, y editar el carrito de
/// una cuenta abierta ya confirmada.
///
/// Las dos reglas viven en el DM (`canBeClosedByBusiness`, `isEditableCart`)
/// y espejan guards del backend: si la UI ofrece algo que el BE rechaza, el
/// negocio se come un 409 tras una acción que parecía válida.
void main() {
  setUpAll(() async => S.load(const Locale('es')));

  group('canBeClosedByBusiness', () {
    test('cuenta abierta viva y sin cobrar por la app: SÍ se puede cerrar', () {
      final o = GroupOrders.openTab(
        items: [GroupOrders.sentItem(delivered: true)],
        fulfillment: GroupFulfillmentStatus.delivered,
      );

      expect(o.canBeClosedByBusiness, isTrue);
    });

    test('con pagos por Foodly NO se puede: sería cobrar dos veces', () {
      final o = GroupOrders.openTab(
        items: [GroupOrders.sentItem(price: 40, delivered: true)],
        fulfillment: GroupFulfillmentStatus.delivered,
        paid: 10,
      );

      expect(
        o.canBeClosedByBusiness,
        isFalse,
        reason: 'Marcar "cobrada en caja" algo ya cobrado por la app deja al '
            'comensal pagando dos veces; el BE también lo rechaza con 409.',
      );
    });

    test('una cuenta ya saldada tampoco se cierra a mano', () {
      expect(GroupOrders.settledTab().canBeClosedByBusiness, isFalse);
    });

    test('en prepago por ronda no aplica: el cobro es previo', () {
      final o = GroupOrders.openCart(mode: GroupPaymentMode.perRound);

      expect(o.canBeClosedByBusiness, isFalse);
    });

    test('un carrito sin enviar todavía no es una cuenta que cerrar', () {
      expect(GroupOrders.openCart().canBeClosedByBusiness, isFalse);
    });
  });

  // e2e 2026-08-08 — la UI no puede ofrecer lo que el backend rechazaría.
  // Tres regresiones del mismo día tenían esta forma: guarda cambiada de un
  // solo lado, botón visible, 409 al tocarlo.
  group('paridad con las guardas del backend', () {
    test('anular ítems: en prepago la orden llegó al panel PORQUE se pagó', () {
      final pagada = GroupOrders.openTab(
        items: [GroupOrders.sentItem(price: 30, delivered: true)],
        fulfillment: GroupFulfillmentStatus.delivered,
        paid: 30,
      );

      expect(
        pagada.canVoidItems,
        isFalse,
        reason: 'Ofrecerlo hacía que el manager confirmara y recibiera un 409.',
      );
      expect(
        GroupOrders.openTab(items: [GroupOrders.sentItem()]).canVoidItems,
        isTrue,
        reason: 'Sin dinero dentro sí se puede anular.',
      );
    });

    test('pedida la cuenta ya no se anula (la cuenta está congelada)', () {
      final conCuenta = GroupOrders.openTab(
        items: [GroupOrders.sentItem(delivered: true)],
        fulfillment: GroupFulfillmentStatus.delivered,
        billRequestedAt: DateTime(2026, 8, 8, 22),
      );

      expect(conCuenta.canVoidItems, isFalse);
    });

    test('cuenta cerrada: el comensal NO ve el CTA de pagar habilitado', () {
      final cerrada = GroupOrders.openTab(
        items: [GroupOrders.sentItem(delivered: true)],
        fulfillment: GroupFulfillmentStatus.delivered,
      ).copyWith(status: GroupOrderStatus.completed);

      expect(cerrada.isTerminal, isTrue);
      expect(
        cerrada.openTabCtaState,
        OpenTabCtaState.billed,
        reason: 'Tras cerrar en caja el CTA seguía activo y el tap daba 409.',
      );
      expect(cerrada.canVoidItems, isFalse);
      expect(cerrada.canBeClosedByBusiness, isFalse, reason: 'Ya está cerrada.');
    });

    test('con un pago EN CURSO no se ofrece cerrar la cuenta', () {
      final enCurso = GroupOrders.openTab(
        items: [GroupOrders.sentItem(delivered: true)],
        fulfillment: GroupFulfillmentStatus.delivered,
      ).copyWith(participants: const [
        GroupOrderParticipantDM(
          uuid: 'p1',
          displayName: 'Ana',
          paymentStatus: GroupPaymentStatus.processing,
        ),
      ]);

      expect(enCurso.hasProcessingPayment, isTrue);
      expect(
        enCurso.canBeClosedByBusiness,
        isFalse,
        reason: 'El BE lo rechaza; ofrecerlo daba 409 tras elegir el motivo.',
      );
    });
  });

  group('isEditableCart — la mesa sigue viva tras la primera tanda', () {
    test('cuenta abierta confirmada: se puede invitar y editar el carrito', () {
      final o = GroupOrders.openTab(items: [GroupOrders.sentItem()]);

      expect(o.isOpen, isFalse, reason: 'Confirmada desde el primer envío.');
      expect(
        o.isEditableCart,
        isTrue,
        reason: 'Usar isOpen dejaba a la mesa sin poder sumar gente ni quitar '
            'ítems justo cuando más lo necesita.',
      );
    });

    test('pedida la cuenta, se congela', () {
      final o = GroupOrders.openTab(
        items: [GroupOrders.sentItem(delivered: true)],
        fulfillment: GroupFulfillmentStatus.delivered,
        billRequestedAt: DateTime(2026, 8, 5, 22),
      );

      expect(o.isEditableCart, isFalse);
    });

    test('un carrito abierto siempre es editable, en cualquier modo', () {
      for (final mode in GroupPaymentMode.values) {
        expect(GroupOrders.openCart(mode: mode).isEditableCart, isTrue, reason: mode.name);
      }
    });

    test('en prepago, confirmada YA no se edita (el cobro fue antes)', () {
      final o = GroupOrders.openCart(mode: GroupPaymentMode.perRound)
          .copyWith(status: GroupOrderStatus.confirmed);

      expect(o.isEditableCart, isFalse);
    });
  });

  // e2e 2026-08-06 — la comanda del negocio es lo que llegó a COCINA.
  // Contar el carrito hacía que el panel dijera "2/5 entregados" incluyendo
  // platos que la mesa todavía no había pedido, y que un postre en el
  // carrito impidiera dar la comanda por servida.
  group('la comanda del manager solo cuenta lo enviado', () {
    test('los ítems del carrito NO entran en el checklist', () {
      final o = GroupOrders.openTab(
        items: [
          GroupOrders.sentItem(uuid: 's1', delivered: true, participantUuid: 'p1'),
          GroupOrders.sentItem(uuid: 's2', delivered: true, participantUuid: 'p1'),
          GroupOrders.pendingItem(uuid: 'c1', participantUuid: 'p1'),
          GroupOrders.pendingItem(uuid: 'c2', participantUuid: 'p1'),
        ],
      );

      expect(o.liveItemsCount, 2, reason: 'Solo lo que la cocina recibió.');
      expect(o.deliveredItemsCount, 2);
      expect(
        o.allItemsDelivered,
        isTrue,
        reason: 'Un postre en el carrito no puede bloquear una tanda ya servida.',
      );
      expect(o.kitchenItemsFor('p1').length, 2);
    });

    test('lo anulado sigue sin contar', () {
      final o = GroupOrders.openTab(
        items: [
          GroupOrders.sentItem(uuid: 's1', delivered: true),
          GroupOrders.sentItem(uuid: 's2', voided: true),
          GroupOrders.pendingItem(uuid: 'c1'),
        ],
      );

      expect(o.liveItemsCount, 1);
      expect(o.allItemsDelivered, isTrue);
    });

    // 2026-08-08 — la UI no contradice al backend cuando no tiene qué objetar.
    test('una comanda VACÍA no tiene nada pendiente (no degrada a preparando)',
        () {
      // Caso real: dos órdenes de prepago quedaron etiquetadas como cuenta
      // abierta por el backfill; sus ítems no tienen sent_at, así que el
      // checklist queda vacío. El panel las mostraba PREPARANDO estando
      // ENTREGADAS y pagadas en la base.
      final o = GroupOrders.openTab(
        items: [GroupOrders.pendingItem(uuid: 'c1')],
        fulfillment: GroupFulfillmentStatus.delivered,
      );

      expect(o.kitchenItems, isEmpty);
      expect(o.allItemsDelivered, isFalse, reason: 'No hay nada que entregar.');
      expect(
        o.hasPendingKitchenItems,
        isFalse,
        reason: 'Y tampoco hay nada esperando: la orden está terminada.',
      );
    });

    test('con algo esperando en cocina SÍ hay pendiente', () {
      final o = GroupOrders.openTab(
        items: [
          GroupOrders.sentItem(uuid: 's1', delivered: true),
          GroupOrders.sentItem(uuid: 's2', batch: 2),
        ],
      );

      expect(o.hasPendingKitchenItems, isTrue,
          reason: 'La tanda 2 revive la comanda: la tarjeta no puede decir terminada.');
    });

    test('con una tanda a medio servir, el checklist lo refleja', () {
      final o = GroupOrders.openTab(
        items: [
          GroupOrders.sentItem(uuid: 's1', delivered: true),
          GroupOrders.sentItem(uuid: 's2', batch: 2),
          GroupOrders.pendingItem(uuid: 'c1'),
        ],
      );

      expect(o.liveItemsCount, 2);
      expect(o.deliveredItemsCount, 1);
      expect(o.allItemsDelivered, isFalse);
    });
  });
}
