import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';

/// Línea de carrito en una orden grupal: cantidad, nombre del ítem, notas
/// opcionales y total de línea. Opcionalmente muestra el avatar de quién lo
/// pidió. Estilo Foodly (Card temada + FoodlyTextStyles).
///
/// `onRemove` se muestra solo cuando la orden está OPEN (editable).
/// `onToggleShared` (F2c): alterna "compartido con la mesa"; null = sin toggle.
class GroupOrderItemTile extends StatelessWidget {
  final GroupOrderItemDM item;
  final String currency;
  final VoidCallback? onRemove;
  final VoidCallback? onToggleShared;

  const GroupOrderItemTile({
    super.key,
    required this.item,
    this.currency = 'EUR',
    this.onRemove,
    this.onToggleShared,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            // Badge de cantidad
            Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('${item.quantity}×', style: FoodlyTextStyles.labelPurpleBold),
            ),
            const SizedBox(width: 12),
            // Nombre + notas
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          item.name,
                          style: FoodlyTextStyles.labelBold,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Badge "Compartido" (F2c): se reparte entre todos.
                      if (item.shared) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: FoodlyThemes.tertiaryFoodly.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            S.current.groupOrderSharedBadge,
                            style: FoodlyTextStyles.captionPurpleBold,
                          ),
                        ),
                      ],
                    ],
                  ),
                  if ((item.notes ?? '').trim().isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        item.notes!.trim(),
                        style: FoodlyTextStyles.caption,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Total de línea
            Text(formatMoney(item.lineTotal, currency), style: FoodlyTextStyles.itemPriceBold),
            // Toggle compartido (F2c, solo editable): resalta si está activo.
            if (onToggleShared != null)
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: IconButton(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  tooltip: S.current.groupOrderShareItemTooltip,
                  onPressed: onToggleShared,
                  icon: Icon(
                    item.shared ? Icons.group_rounded : Icons.group_outlined,
                    size: 18,
                    color: item.shared ? FoodlyThemes.primaryFoodly : FoodlyThemes.secondaryFoodly,
                  ),
                ),
              ),
            // Botón de eliminar (solo si editable)
            if (onRemove != null)
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: IconButton(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: onRemove,
                  icon: const Icon(Icons.close_rounded, size: 18, color: FoodlyThemes.secondaryFoodly),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
