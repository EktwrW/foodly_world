import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

/// Tamaño del ítem (mediana / grande) junto al nombre.
///
/// Sólo aparece cuando hay algo que decir: regular es la versión por defecto
/// y etiquetarla llenaría de ruido una lista donde casi todo es regular.
///
/// No es decorativo. En la barra alguien tiene que servir la grande, y hasta
/// ahora el manager veía "Super Bock" a secas: idéntico a una regular, con
/// una diferencia de 3,00 € que nadie podía notar mirando la comanda.
class ItemVersionBadge extends StatelessWidget {
  final GroupOrderItemDM item;

  /// Atenuado cuando el ítem ya está entregado o anulado, para no competir
  /// con el tachado de la fila.
  final bool dimmed;

  const ItemVersionBadge({super.key, required this.item, this.dimmed = false});

  @override
  Widget build(BuildContext context) {
    if (!item.hasVersion) return const SizedBox.shrink();

    final color = dimmed ? FoodlyThemes.secondaryFoodly : FoodlyThemes.primaryFoodly;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      decoration: BoxDecoration(
        border: Border.all(color: color.withValues(alpha: 0.45)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        item.version!.text.toUpperCase(),
        style: FoodlyTextStyles.captionBold.copyWith(
          color: color,
          fontSize: 9,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
