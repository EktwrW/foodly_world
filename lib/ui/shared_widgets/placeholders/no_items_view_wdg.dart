import 'package:flutter/material.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/placeholders/foodly_empty_view.dart';

/// El estado vacío de los menús y las promociones. Cinco pantallas lo usan.
///
/// MIGRADO A [FoodlyEmptyView] (2026-09-10). Pintaba con `NeumorphicText` y
/// Poppins traído directamente de `GoogleFonts`, no con `FoodlyTextStyles`: era
/// el sistema anterior al rediseño de septiembre. Se conserva el nombre y la
/// firma para que las cinco llamadas no cambien.
///
/// El [intent] es nuevo y por defecto es [FoodlyEmptyIntent.nuevo], que es lo
/// que eran cuatro de las cinco. La quinta —«no hay promociones en esta
/// sección», en el panel del manager y en la vista de negocio— es un vacío por
/// FILTRO y ahora lo dice: mismo widget, distinta cara, porque cambiar de
/// pestaña resuelve una cosa y no la otra.
class NoItemsViewWdg extends StatelessWidget {
  final String? text;
  final Widget? asset;
  final FoodlyEmptyIntent intent;

  const NoItemsViewWdg({
    super.key,
    this.text,
    this.asset,
    this.intent = FoodlyEmptyIntent.nuevo,
  });

  @override
  Widget build(BuildContext context) {
    return FoodlyEmptyView(
      intent: intent,
      title: text ?? S.current.noItemsYet,
      // El asset de siempre para la intención de siempre; las otras dos usan el
      // icono que les toca, que es justo lo que las distingue.
      icon: asset ?? (intent == FoodlyEmptyIntent.nuevo ? const Asset(FoodlyAssets.emptyMenu, height: 44) : null),
    );
  }
}
