import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/item_version_badge.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;

/// Línea de carrito en una orden grupal: cantidad, nombre del ítem, notas
/// opcionales y total de línea. Opcionalmente muestra el avatar de quién lo
/// pidió. Estilo Foodly (Card temada + FoodlyTextStyles).
///
/// `onRemove` se muestra solo cuando la orden está OPEN (editable). Es un
/// `Future` a propósito (e2e r6): mientras el borrado viaja, la X se vuelve
/// un spinner y se ignoran re-taps.
/// `onToggleShared` (F2c): alterna "compartido con la mesa"; null = sin toggle.
class GroupOrderItemTile extends StatefulWidget {
  final GroupOrderItemDM item;
  final String currency;
  final Future<void> Function()? onRemove;
  final VoidCallback? onToggleShared;

  /// e2e F4a: check verde cuando el negocio marcó el ítem como ENTREGADO
  /// (visible para el cliente con la orden confirmada).
  final bool delivered;

  const GroupOrderItemTile({
    super.key,
    required this.item,
    this.currency = 'EUR',
    this.onRemove,
    this.onToggleShared,
    this.delivered = false,
  });

  @override
  State<GroupOrderItemTile> createState() => _GroupOrderItemTileState();
}

class _GroupOrderItemTileState extends State<GroupOrderItemTile> {
  bool _removing = false;

  GroupOrderItemDM get item => widget.item;
  String get currency => widget.currency;
  Future<void> Function()? get onRemove => widget.onRemove;
  VoidCallback? get onToggleShared => widget.onToggleShared;

  Future<void> _onRemoveTap() async {
    if (_removing || onRemove == null) return;
    setState(() => _removing = true);
    try {
      await onRemove!();
    } finally {
      if (mounted) setState(() => _removing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 6, 6, 10),
        child: Column(
          children: [
            // Badge "Compartido" (F2c): se reparte entre todos.
            // Tooltip por TAP (e2e r7: el concepto confundía con
            // "yo invito") — explica qué significa compartir.

            Visibility(
              visible: item.shared,
              replacement: const SizedBox(height: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Tooltip(
                    message: S.current.groupOrderSharedBadgeTooltip,
                    triggerMode: TooltipTriggerMode.tap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: FoodlyThemes.tertiaryFoodly.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            S.current.groupOrderSharedBadge,
                            style: FoodlyTextStyles.captionPurpleBold.copyWith(fontSize: 11),
                          ),
                          const SizedBox(width: 3),
                          const Icon(Icons.info_outline_rounded, size: 11, color: FoodlyThemes.primaryFoodly),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
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
                            child: Column(
                              spacing: 3,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: FoodlyTextStyles.homeAppBarSmallSubtitle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // Tamaño elegido (mediana/grande) — pegado al nombre
                                // porque es parte de QUÉ se pidió, no de su estado.
                                if (item.hasVersion) ...[
                                  ItemVersionBadge(item: item, dimmed: item.isVoided),
                                ],
                              ],
                            ),
                          ),

                          if (widget.delivered && !item.isVoided) ...[
                            const SizedBox(width: 6),
                            const Icon(Icons.check_circle_rounded, size: 15, color: FoodlyThemes.tertiaryFoodly),
                          ],
                          // F4b.1: el negocio anuló este plato — sigue visible,
                          // pero no se cobra (transparencia con el comensal).
                          if (item.isVoided) ...[
                            const SizedBox(width: 6),
                            const Icon(Icons.block_rounded, size: 14, color: Color(0xFFB3261E)),
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
                      // Motivo de la anulación (o el texto genérico).
                      if (item.isVoided)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            (item.voidedReason ?? '').trim().isNotEmpty
                                ? item.voidedReason!.trim()
                                : S.current.groupOrderItemVoided,
                            style: FoodlyTextStyles.captionBold.copyWith(color: const Color(0xFFB3261E), fontSize: 10),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Total de línea — tachado y sin sumar si el negocio lo anuló.
                Text(
                  formatMoney(item.lineTotal, currency),
                  style: item.isVoided
                      ? FoodlyTextStyles.itemPriceBold.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: FoodlyThemes.secondaryFoodly,
                        )
                      : FoodlyTextStyles.itemPriceBold,
                ),
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
                // Botón de eliminar (solo si editable) — spinner mientras el
                // borrado está en vuelo (e2e r6: evita re-taps por la espera).
                if (onRemove != null)
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints.tightFor(height: 18, width: 18),
                    onPressed: _removing ? null : _onRemoveTap,
                    icon: _removing
                        ? const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: FoodlyThemes.secondaryFoodly,
                            constraints: BoxConstraints.tightFor(width: 16, height: 16),
                          )
                        : const Icon(Bootstrap.trash3, size: 16, color: FoodlyThemes.secondaryFoodly),
                  ).paddingLeft(6),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
