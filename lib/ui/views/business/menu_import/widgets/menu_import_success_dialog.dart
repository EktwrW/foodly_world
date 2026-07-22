import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/menu_import/menu_import_bulk_response_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;

/// Dialog Foodly de éxito que se muestra al manager cuando el bulk-import
/// termina con éxito (state `done` del MenuImportCubit).
///
/// **Decisiones de UX:**
///   1. **No dismissible por tap fuera (`barrierDismissible: false`):**
///      el manager debe ver explícitamente las stats — se ganó esa pantalla
///      después de subir N fotos y editar items. Cerrarla por accidente
///      al tocar fondo es UX pobre.
///   2. **Solo 1 CTA primario:** "Ver mi menú" (no hay segundo botón
///      ambiguo). Cerrar el dialog por sí solo lleva al manager de
///      vuelta al flow del manage menu (Navigator.pop hasta volver).
///   3. **Stats reales del BE, no del FE:** mostramos `stats.totalItems` /
///      `stats.totalCategories` que el BE calculó (puede diferir de lo
///      que el manager creyó que iba a importar — dedupe via ILIKE filtra
///      duplicados con items que ya tenía manualmente).
///   4. **Mensaje de "podés editar después":** importante para gestionar
///      expectativas. La IA no es perfecta — el manager va a querer
///      ajustar items, agregar fotos, reordenar. No queremos que sienta
///      que esto es "todo o nada".
///
/// Llamado desde el dispatcher de `MenuImportPage` cuando el state cambia
/// a `done`. Al cerrar (touch del CTA), el listener limpia el cubit
/// (`resetAll()`) y hace Navigator.pop hasta volver a la pantalla previa
/// al flow de import.
class MenuImportSuccessDialog extends StatelessWidget {
  final MenuImportBulkStatsDM stats;

  /// Callback que ejecuta el "ir a ver el menú": el caller decide la
  /// navegación correcta (volver al manage menu, refrescar la lista, etc.).
  /// El dialog NO sabe de routing.
  final VoidCallback onViewMenu;

  const MenuImportSuccessDialog({
    super.key,
    required this.stats,
    required this.onViewMenu,
  });

  /// Helper para mostrar el dialog. Wraps `showDialog` con el
  /// `barrierDismissible: false` y `barrierColor` Foodly.
  static Future<void> show(
    BuildContext context, {
    required MenuImportBulkStatsDM stats,
    required VoidCallback onViewMenu,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.55),
      builder: (_) => MenuImportSuccessDialog(stats: stats, onViewMenu: onViewMenu),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SuccessIcon(),
            const SizedBox(height: 18),
            Text(
              S.current.aiMenuImportSuccessTitle,
              style: FoodlyTextStyles.secondaryTitle.copyWith(
                color: FoodlyThemes.primaryFoodly,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              S.current.aiMenuImportSuccessSubtitle(
                stats.totalItems,
                stats.totalCategories,
              ),
              style: FoodlyTextStyles.cardsSmallSubtitle.copyWith(
                fontSize: 13,
                color: Colors.black87,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Breakdown opcional — solo si hay >1 tipo de creación.
            // Para un manager con menu nuevo es redundante (todo nuevo);
            // para uno con menú parcial, le ayuda a entender qué cosas
            // se crearon vs qué reusó por ILIKE find-or-create.
            if (_hasBreakdown(stats)) ...[
              _StatsBreakdown(stats: stats),
              const SizedBox(height: 16),
            ],
            Text(
              S.current.aiMenuImportSuccessHint,
              style: FoodlyTextStyles.cardsSmallSubtitle.copyWith(
                fontSize: 12,
                color: Colors.black54,
                height: 1.4,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: CustomNeumorphicButton(
                onPressed: onViewMenu,
                text: S.current.aiMenuImportSuccessCta,
                leading: const Icon(Bootstrap.check2_circle, size: 18, color: Colors.white),
                disabled: false,
                fontSize: 14,
                bosShapeRadius: 8,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// True si hay >=2 tipos de items creados — vale la pena el detalle.
  static bool _hasBreakdown(MenuImportBulkStatsDM s) {
    var nonZero = 0;
    if (s.foodItemsCreated > 0) nonZero++;
    if (s.drinkItemsCreated > 0) nonZero++;
    if (s.combosCreated > 0) nonZero++;
    return nonZero >= 2;
  }
}

class _SuccessIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: FoodlyThemes.tertiaryFoodly.withValues(alpha: 0.15),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Bootstrap.check2_circle,
        size: 44,
        color: FoodlyThemes.tertiaryFoodly,
      ),
    );
  }
}

class _StatsBreakdown extends StatelessWidget {
  final MenuImportBulkStatsDM stats;
  const _StatsBreakdown({required this.stats});

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    if (stats.foodItemsCreated > 0) {
      rows.add(_StatRow(
        icon: Bootstrap.egg_fried,
        label: S.current.aiMenuImportSuccessStatFood(stats.foodItemsCreated),
      ));
    }
    if (stats.drinkItemsCreated > 0) {
      rows.add(_StatRow(
        icon: Bootstrap.cup_straw,
        label: S.current.aiMenuImportSuccessStatDrinks(stats.drinkItemsCreated),
      ));
    }
    if (stats.combosCreated > 0) {
      rows.add(_StatRow(
        icon: Bootstrap.gift_fill,
        label: S.current.aiMenuImportSuccessStatCombos(stats.combosCreated),
      ));
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          for (var i = 0; i < rows.length; i++) ...[
            rows[i],
            if (i < rows.length - 1) const SizedBox(height: 6),
          ],
        ],
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final IconData icon;
  final String label;
  const _StatRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: FoodlyThemes.primaryFoodly),
        const SizedBox(width: 10),
        Text(
          label,
          style: FoodlyTextStyles.cardsSmallSubtitle.copyWith(
            fontSize: 13,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
