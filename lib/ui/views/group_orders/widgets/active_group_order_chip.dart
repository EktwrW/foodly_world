import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';

/// Visual del chip "Ver pedido · €X" (spec v2 §D.1). Widget TONTO: recibe la
/// orden y el tap — la visibilidad, posición global y drag los maneja
/// GroupOrderFloatingChipHost (e2e r4: el chip es global y arrastrable).
class ActiveGroupOrderChip extends StatelessWidget {
  final GroupOrderDM order;
  final VoidCallback onTap;

  const ActiveGroupOrderChip({super.key, required this.order, required this.onTap});

  /// Estado de cocina en el chip (e2e F4b): con la orden ya confirmada, el
  /// chip informa en vez de repetir "Ver pedido" — "¡Listo!" es la señal que
  /// hace valioso el feature en mostrador y hay que verla sin entrar.
  (IconData, Color, String) get _look {
    if (!order.isConfirmed) {
      return (
        Icons.receipt_long_rounded,
        FoodlyThemes.primaryFoodly,
        '${S.current.groupOrderViewOrder} · ${formatMoney(order.subtotal, order.currency)}',
      );
    }

    return switch (order.fulfillmentStatus) {
      GroupFulfillmentStatus.preparing => (
          Icons.soup_kitchen_rounded,
          const Color(0xFFB87400),
          S.current.groupOrderChipPreparing,
        ),
      GroupFulfillmentStatus.ready => (
          Icons.room_service_rounded,
          FoodlyThemes.tertiaryFoodly,
          S.current.groupOrderChipReady,
        ),
      // Entregada en cuenta abierta = falta pagar (el chip vive hasta el
      // pago); en prepago el chip ya no se muestra.
      GroupFulfillmentStatus.delivered => (
          Icons.receipt_long_rounded,
          FoodlyThemes.primaryFoodly,
          S.current.groupOrderChipToPay(formatMoney(order.sentTotal, order.currency)),
        ),
      _ => (
          Icons.receipt_long_rounded,
          FoodlyThemes.primaryFoodly,
          S.current.groupOrderChipSent,
        ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final (icon, color, label) = _look;

    return Material(
      color: color,
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 16),
              const SizedBox(width: 6),
              Text(
                label,
                style: FoodlyTextStyles.captionBold.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
