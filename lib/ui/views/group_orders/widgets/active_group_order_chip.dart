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

  @override
  Widget build(BuildContext context) {
    return Material(
      color: FoodlyThemes.primaryFoodly,
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
              const Icon(Icons.receipt_long_rounded, color: Colors.white, size: 16),
              const SizedBox(width: 6),
              Text(
                '${S.current.groupOrderViewOrder} · ${formatMoney(order.subtotal, order.currency)}',
                style: FoodlyTextStyles.captionBold.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
