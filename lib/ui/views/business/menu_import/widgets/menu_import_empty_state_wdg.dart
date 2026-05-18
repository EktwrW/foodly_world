import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/core_exports.dart' show AppRouter, AppRoutes, S, di;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/business/manage_menu/cubit/manage_menu_cubit.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

/// Empty state contextual del feature "Importar menú con IA" — visible
/// SOLO al manager del business cuando entra a su menú y la categoría
/// que está viendo está vacía.
///
/// **Decisión UX (PRD 2026-05-09, Decisión 2)**: el manager con menú
/// vacío debe ver primero el camino con IA porque:
///   1. Es la opción más prominente: subir 5 fotos vs. tipear 50 items.
///   2. La IA es el diferenciador del producto en este momento — exponerlo
///      al onboarding del manager mejora la activation rate.
///   3. NO bloquea el flujo manual: el FAB de "+" sigue funcionando para
///      managers que prefieren agregar uno por uno.
///
/// **Cuándo mostrarlo** (gate en el caller, no acá):
///   - manager logueado (`vm.loggerUserCanEdit`)
///   - categoría actual sin items (`categories?.isEmpty ?? false`)
///   - NO está en modo edit (cuando edita, ve los CTAs de "agregar
///     subcategoría" en lugar de este placeholder)
///
/// El visitor (no manager) sigue viendo `NoItemsViewWdg` plano que ya
/// existía — el feature de import es solo para owners del business.
class MenuImportEmptyStateWdg extends StatelessWidget {
  /// UUID del `BusinessMenu` del manager. Se pasa como path param a la
  /// ruta del flow de import.
  final String menuUuid;

  const MenuImportEmptyStateWdg({super.key, required this.menuUuid});

  /// Navega al flow del import IA y **espera el resultado**. Cuando el
  /// flow termina exitosamente (`MenuImportPage` hace `context.pop(true)`
  /// tras el bulk-import), refrescamos el menu del manager para que vea
  /// los items recién agregados sin cambiar de pantalla.
  ///
  /// **Por qué `pushNamed` y no `goNamed`** (refactor 2026-05-18):
  /// `goNamed` reemplazaba la entrada actual del stack — eso dejaba el
  /// stack como `[my-business → manage-menu-import]` y al final del flow
  /// el manager veía la pantalla del import al hacer back (en lugar de
  /// my-business directamente). Con `pushNamed`, el stack queda
  /// `[my-business → manage-menu → manage-menu-import]`. Cuando el
  /// `manage-menu-import` hace `pop(true)`, volvemos al `manage-menu`
  /// que ya está en el stack (con su State preservado pero con el
  /// `cubit.reload()` que disparamos abajo refrescando el contenido).
  /// Back desde manage-menu va a my-business como espera el manager.
  Future<void> _goToImport(BuildContext context) async {
    final cubit = context.read<ManageMenuCubit>();

    final didImport = await di<AppRouter>().appRouter.pushNamed<bool>(
          AppRoutes.manageMenuImport.name,
          pathParameters: {AppRoutes.routeIdParam: menuUuid},
        );

    if (didImport == true) {
      // El bulk-import quedó persistido en BE — refrescamos el menu
      // local para mostrar las nuevas categorías/items.
      await cubit.reload();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Hero asset purple-friendly. Si por algún motivo el asset no carga
          // (race con OTA Shorebird que no incluyó la imagen), fallback a un
          // icono purple grande para no romper la pantalla.
          Image.asset(
            'assets/images/digitalize_menu.png',
            height: 133,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => Icon(
              Bootstrap.stars,
              size: 96,
              color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            S.current.aiMenuImportEmptyStateTitle,
            style: FoodlyTextStyles.secondaryTitle.copyWith(
              color: FoodlyThemes.primaryFoodly,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            S.current.aiMenuImportEmptyStateSubtitle,
            style: FoodlyTextStyles.cardsSmallSubtitle.copyWith(
              fontSize: 13,
              color: Colors.black54,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: 330,
            child: CustomNeumorphicButton(
              onPressed: () => _goToImport(context),
              text: S.current.aiMenuImportEmptyStateCta,
              leading: const Icon(Bootstrap.stars, size: 18, color: Colors.white),
              disabled: false,
              fontSize: 14,
              bosShapeRadius: 8,
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
            ),
          ),
          const SizedBox(height: 14),
          // Hint sutil del flujo manual. NO es un botón secundario porque
          // el FAB de "+" en pantalla ya cubre eso — sería UI duplicada.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Bootstrap.info_circle, size: 14, color: Colors.black38),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  S.current.aiMenuImportEmptyStateManualHint,
                  style: FoodlyTextStyles.cardsSmallSubtitle.copyWith(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
