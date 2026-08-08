// ignore_for_file: avoid_redundant_argument_values

import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';

/// Constructores de órdenes para tests, que aplican los MISMOS invariantes
/// que garantiza el backend.
///
/// Por qué existe (2026-08-06): en una sola jornada aparecieron cuatro
/// fixtures que describían estados imposibles, y dos de ellos escondían bugs
/// reales mientras el test daba verde:
///
///  · una orden con `fulfillment = delivered` y los ítems SIN entregar —
///    imposible: `maybeAutoDeliver` solo marca la orden entregada cuando
///    todos los ítems vivos lo están. Ese fixture hacía que el chip pareciera
///    correcto mientras leía el estado agregado en vez de los ítems.
///  · una cuenta abierta `confirmed` con `totalAmount = 0` — imposible:
///    `sendBatch` deja `total_amount = subtotal`. Ese hacía que el test del
///    TTL de 12h pasara SIN llegar a evaluar el TTL.
///
/// La regla: **si el backend no puede producir ese estado, el test no está
/// probando lo que dice probar.** Construí los fixtures desde acá.
class GroupOrders {
  GroupOrders._();

  static final DateTime _t0 = DateTime(2026, 8, 5, 20);

  /// Ítem en el carrito: nadie lo envió a cocina todavía.
  static GroupOrderItemDM pendingItem({
    String uuid = 'i-pending',
    double price = 20,
    String? participantUuid,
  }) =>
      GroupOrderItemDM(
        uuid: uuid,
        name: 'Plato',
        unitPricePreview: price,
        participantUuid: participantUuid,
      );

  /// Ítem enviado a cocina. `sentAt` y `batchNo` van SIEMPRE juntos: el
  /// backend los escribe en la misma operación (`sendBatch`).
  static GroupOrderItemDM sentItem({
    String uuid = 'i-sent',
    double price = 20,
    int batch = 1,
    bool delivered = false,
    bool voided = false,
    String? participantUuid,
  }) =>
      GroupOrderItemDM(
        uuid: uuid,
        name: 'Plato',
        unitPricePreview: price,
        participantUuid: participantUuid,
        sentAt: _t0,
        batchNo: batch,
        deliveredAt: delivered ? _t0 : null,
        voidedAt: voided ? _t0 : null,
      );

  /// Carrito de cuenta abierta: aún no se envió nada, la orden está `open` y
  /// por eso NO tiene importe congelado (`total_amount` se fija al enviar).
  static GroupOrderDM openCart({
    String uuid = 'o-cart',
    List<GroupOrderItemDM>? items,
    GroupPaymentMode mode = GroupPaymentMode.openTab,
  }) {
    final list = items ?? [pendingItem()];

    return GroupOrderDM(
      uuid: uuid,
      status: GroupOrderStatus.open,
      paymentMode: mode,
      subtotal: _sum(list),
      items: list,
    );
  }

  /// Cuenta abierta con al menos una tanda enviada.
  ///
  /// Invariantes que impone, y que el backend garantiza:
  ///  · `status = confirmed` y `confirmedAt` no nulo (lo pone el primer envío);
  ///  · `totalAmount` = suma de lo ENVIADO y no anulado (`recomputeSubtotal`);
  ///  · si [fulfillment] es `delivered`, TODOS los ítems enviados y vivos
  ///    quedan entregados — `maybeAutoDeliver` no admite otra cosa.
  static GroupOrderDM openTab({
    String uuid = 'o-tab',
    required List<GroupOrderItemDM> items,
    GroupFulfillmentStatus? fulfillment,
    double paid = 0,
    Duration age = const Duration(minutes: 20),
    DateTime? billRequestedAt,
  }) {
    final resolved = fulfillment == GroupFulfillmentStatus.delivered
        ? items
            .map((i) => i.isSent && !i.isVoided && i.deliveredAt == null
                ? i.copyWith(deliveredAt: _t0)
                : i)
            .toList()
        : items;

    final billable = resolved.where((i) => i.isSent && !i.isVoided);

    return GroupOrderDM(
      uuid: uuid,
      status: GroupOrderStatus.confirmed,
      paymentMode: GroupPaymentMode.openTab,
      fulfillmentStatus: fulfillment,
      confirmedAt: DateTime.now().subtract(age),
      billRequestedAt: billRequestedAt,
      subtotal: _sum(resolved.where((i) => !i.isVoided)),
      totalAmount: _sum(billable),
      totalPaid: paid,
      items: resolved,
    );
  }

  /// Orden PREPAGA (`per_round`): pagar ES la comanda.
  ///
  /// Invariantes que impone, y que el backend garantiza:
  ///  · **ningún ítem lleva `sentAt`** — en prepago no existen las tandas, y
  ///    `sent_at` es siempre null. Filtrar la comanda por él dejó el checklist
  ///    vacío y rompió el modo entero (e2e 2026-08-06);
  ///  · llega al panel PAGADA (`totalPaid == totalAmount`): es el webhook de
  ///    Stripe el que la confirma, así que `confirmedAt` no es nulo;
  ///  · si [fulfillment] es `delivered`, todos los ítems vivos quedan
  ///    entregados — `maybeAutoDeliver` no admite otra cosa.
  static GroupOrderDM perRound({
    String uuid = 'o-round',
    List<GroupOrderItemDM>? items,
    GroupFulfillmentStatus? fulfillment,
    int round = 1,
  }) {
    final base = items ?? [pendingItem()];

    // No es una formalidad: un ítem "enviado" en prepago describe un estado
    // que el backend no puede producir, y un test montado sobre él daría
    // verde sobre un escenario inexistente.
    assert(
      base.every((i) => !i.isSent),
      'En prepago no hay tandas: ningún ítem puede llevar sentAt.',
    );

    final resolved = fulfillment == GroupFulfillmentStatus.delivered
        ? base
            .map((i) => !i.isVoided && i.deliveredAt == null ? i.copyWith(deliveredAt: _t0) : i)
            .toList()
        : base;

    final total = _sum(resolved.where((i) => !i.isVoided));

    return GroupOrderDM(
      uuid: uuid,
      status: GroupOrderStatus.confirmed,
      paymentMode: GroupPaymentMode.perRound,
      fulfillmentStatus: fulfillment,
      confirmedAt: _t0,
      roundNumber: round,
      subtotal: total,
      totalAmount: total,
      totalPaid: total,
      items: resolved,
    );
  }

  /// Cuenta abierta ya saldada: la mesa pagó y se fue.
  static GroupOrderDM settledTab({
    String uuid = 'o-settled',
    List<GroupOrderItemDM>? items,
  }) {
    final list = items ?? [sentItem(delivered: true)];
    final total = _sum(list.where((i) => i.isSent && !i.isVoided));

    return openTab(
      uuid: uuid,
      items: list,
      fulfillment: GroupFulfillmentStatus.delivered,
      paid: total,
    );
  }

  static double _sum(Iterable<GroupOrderItemDM> items) =>
      items.fold<double>(0, (acc, i) => acc + i.lineTotal);
}
