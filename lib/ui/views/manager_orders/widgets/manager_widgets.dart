import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';

/// F4a — widgets del panel "Órdenes en vivo" (maquetas v3): badge de
/// fulfillment con código de color, chips de ronda/mesa y tarjeta de orden.

const Color kManagerAmber = Color(0xFFB87400);

/// Badge de estado con el código de color aprobado:
/// plum (confirmada) → ámbar (preparando) → verde (lista) → gris (entregada).
class ManagerFulfillmentBadge extends StatelessWidget {
  final GroupFulfillmentStatus? status;

  const ManagerFulfillmentBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final (label, fg, bg) = switch (status) {
      GroupFulfillmentStatus.preparing => (
          S.current.managerBadgePreparing,
          kManagerAmber,
          const Color(0xFFF5A623).withValues(alpha: 0.15),
        ),
      GroupFulfillmentStatus.ready => (
          S.current.managerBadgeReady,
          const Color(0xFF0B8A40),
          FoodlyThemes.tertiaryFoodly.withValues(alpha: 0.14),
        ),
      GroupFulfillmentStatus.delivered => (
          S.current.managerBadgeDelivered,
          FoodlyThemes.secondaryFoodly,
          FoodlyThemes.secondaryFoodly.withValues(alpha: 0.15),
        ),
      null => (
          S.current.managerBadgeConfirmed,
          FoodlyThemes.primaryFoodly,
          FoodlyThemes.primaryFoodly.withValues(alpha: 0.10),
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
      child: Text(
        label,
        style: FoodlyTextStyles.captionBold.copyWith(color: fg, fontSize: 9.5, letterSpacing: 0.3),
      ),
    );
  }
}

/// Stepper de fulfillment (maqueta 2): 4 pasos, hechos en verde, actual en
/// plum con halo; los saltados quedan sin marcar (sin timestamp, honesto).
class ManagerFulfillmentStepper extends StatelessWidget {
  final GroupFulfillmentStatus? status;

  const ManagerFulfillmentStepper({super.key, required this.status});

  int get _stage => switch (status) {
        null => 0,
        GroupFulfillmentStatus.preparing => 1,
        GroupFulfillmentStatus.ready => 2,
        GroupFulfillmentStatus.delivered => 3,
      };

  @override
  Widget build(BuildContext context) {
    final labels = [
      S.current.managerBadgeConfirmed,
      S.current.managerBadgePreparing,
      S.current.managerBadgeReady,
      S.current.managerBadgeDelivered,
    ];
    final icons = [
      Icons.check_rounded,
      Icons.soup_kitchen_outlined,
      Icons.notifications_active_outlined,
      Icons.check_rounded,
    ];

    Widget dot(int i) {
      final isDone = i < _stage || (i == 0) || (i == 3 && _stage == 3);
      final isNow = i == _stage && _stage != 3;
      final bg = isNow
          ? FoodlyThemes.primaryFoodly
          : isDone
              ? FoodlyThemes.tertiaryFoodly
              : FoodlyThemes.primaryFoodly.withValues(alpha: 0.08);
      final fg = (isNow || isDone) ? Colors.white : FoodlyThemes.primaryFoodly;

      return Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: bg,
                shape: BoxShape.circle,
                boxShadow: isNow
                    ? [
                        BoxShadow(
                          color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.25),
                          spreadRadius: 4,
                        ),
                      ]
                    : const [],
              ),
              child: Icon(icons[i], size: 16, color: fg),
            ),
            const SizedBox(height: 4),
            Text(
              labels[i],
              style: FoodlyTextStyles.captionBold.copyWith(
                fontSize: 7.5,
                color: isNow ? FoodlyThemes.primaryFoodly : FoodlyThemes.secondaryFoodly,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.15)),
      ),
      child: Row(children: [for (var i = 0; i < 4; i++) dot(i)]),
    );
  }
}

/// Chip pequeño (RONDA N / MESA X) — mismo lenguaje que los tags del cliente.
class ManagerMiniChip extends StatelessWidget {
  final String text;
  final Color color;

  const ManagerMiniChip({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: FoodlyTextStyles.captionBold.copyWith(color: color, fontSize: 8.5),
      ),
    );
  }
}

/// e2e F4b: con ítems sin servir, una orden marcada ENTREGADA se muestra
/// como PREPARANDO (la tanda nueva revive la comanda) — nunca "terminada".
GroupFulfillmentStatus? _activeStatus(GroupOrderDM order) =>
    order.fulfillmentStatus == GroupFulfillmentStatus.delivered
        ? GroupFulfillmentStatus.preparing
        : order.fulfillmentStatus;

/// F4b — estado de COBRO de la orden (maqueta C1): en cuenta abierta la
/// mesa come antes de pagar, así que el manager necesita ver de un vistazo
/// qué mesas deben plata. En prepago siempre está pagada.
class ManagerPaymentBadge extends StatelessWidget {
  final GroupOrderDM order;

  const ManagerPaymentBadge({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    // F4b: la mesa avisó que paga en el mostrador y está esperando. Va
    // PRIMERO: mientras dure la espera es lo único que el mesero necesita
    // saber de esta orden, y un "POR PAGAR" genérico no le dice que hay
    // alguien parado en la caja.
    if (order.isAwaitingCashPayment) {
      return _badge(
        Icons.storefront_rounded,
        kManagerAmber,
        S.current.managerAwaitingCashBadge,
      );
    }

    // Cobrada FUERA de Foodly: `total_paid` es 0 por definición, así que sin
    // esto una cuenta cerrada en caja mostraba "POR PAGAR" para siempre —
    // sobre mesas que el negocio efectivamente cobró, y en el desenlace que
    // va a ser el más común (e2e 2026-08-08).
    if (order.closedReason == 'paid_offline') {
      return _badge(
        Icons.payments_rounded,
        const Color(0xFF0B8A40),
        S.current.managerClosedPaidOffline,
      );
    }
    if (order.closedReason == 'unpaid') {
      return _badge(
        Icons.report_gmailerrorred_rounded,
        const Color(0xFFB3261E),
        S.current.managerClosedUnpaid,
      );
    }

    // total_paid cubre el total => PAGADA. En per_round es el caso normal
    // (la comanda nace del pago); en open_tab, solo tras cobrar la cuenta.
    // Usa el epsilon del DM: con un céntimo de redondeo en un split de 3, el
    // `>=` crudo dejaba "POR PAGAR" sobre una cuenta saldada.
    final paid = order.isFullyPaid;

    if (paid) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle_rounded, size: 13, color: Color(0xFF0B8A40)),
          const SizedBox(width: 4),
          Text(
            S.current.managerPaidComplete,
            style: FoodlyTextStyles.captionBold
                .copyWith(color: const Color(0xFF0B8A40), fontSize: 10),
          ),
        ],
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF1DC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kManagerAmber.withValues(alpha: 0.6)),
      ),
      child: Text(
        S.current.managerUnpaidBadge,
        style: FoodlyTextStyles.captionBold.copyWith(color: kManagerAmber, fontSize: 10),
      ),
    );
  }

  Widget _badge(IconData icon, Color color, String text) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: color),
          const SizedBox(width: 4),
          Text(
            text,
            style: FoodlyTextStyles.captionBold.copyWith(color: color, fontSize: 10),
          ),
        ],
      );
}

/// Tarjeta de orden de la lista (maqueta 1): id/ronda/mesa + badge + meta +
/// total + línea de pago.
class ManagerOrderCard extends StatelessWidget {
  final GroupOrderDM order;
  final VoidCallback onTap;

  const ManagerOrderCard({super.key, required this.order, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // e2e F4b: "terminada" = entregada Y sin nada esperando en cocina. Con
    // tandas, una orden marcada ENTREGADA que recibe ítems nuevos volvía a
    // estar activa pero se veía opaca y con el chip verde (tarjeta fantasma).
    //
    // 2026-08-08: la condición era `allItemsDelivered`, que exige checklist
    // NO vacío. Una orden con la comanda vacía —p. ej. con todo anulado—
    // caía a false y el panel la degradaba a PREPARANDO pese a estar
    // ENTREGADA y pagada en la base. "Nada pendiente" es la pregunta real.
    final delivered = order.fulfillmentStatus == GroupFulfillmentStatus.delivered &&
        !order.hasPendingKitchenItems;

    return Opacity(
      opacity: delivered ? 0.55 : 1,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.15)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        order.businessName.isNotEmpty ? order.businessName : order.uuid.substring(0, 8),
                        style: FoodlyTextStyles.labelBold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 6),
                    if (order.roundNumber > 1)
                      ManagerMiniChip(
                        text: S.current.managerRound(order.roundNumber),
                        color: FoodlyThemes.secondaryFoodly,
                      ),
                    if ((order.tableLabel ?? '').isNotEmpty) ...[
                      const SizedBox(width: 4),
                      ManagerMiniChip(
                        text: order.tableLabel!.toUpperCase(),
                        color: FoodlyThemes.primaryFoodly,
                      ),
                    ],
                    const Spacer(),
                    // Con ítems pendientes el badge NUNCA dice ENTREGADA.
                    ManagerFulfillmentBadge(
                      status: delivered ? order.fulfillmentStatus : _activeStatus(order),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      S.current.managerGuestsMeta(order.participants.length, order.items.length),
                      style: FoodlyTextStyles.caption,
                    ),
                    const Spacer(),
                    Text(
                      formatMoney(order.totalAmount, order.currency),
                      style: FoodlyTextStyles.itemPricePurpleBold,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    // F4b: en cuenta abierta el cobro es al final — badge
                    // POR PAGAR (ámbar punteado) hasta que entre el pago.
                    ManagerPaymentBadge(order: order),
                    const Spacer(),
                    Text(
                      S.current
                          .managerItemsDelivered(order.deliveredItemsCount, order.liveItemsCount),
                      style: FoodlyTextStyles.caption.copyWith(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
