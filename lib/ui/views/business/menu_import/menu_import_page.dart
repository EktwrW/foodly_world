import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart'
    show di, AppRouter, AuthSessionService, MainDrawerCubit;
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/business/menu_import/cubit/menu_import_cubit.dart';
import 'package:foodly_world/ui/views/business/menu_import/widgets/menu_import_review_view.dart';
import 'package:foodly_world/ui/views/business/menu_import/widgets/menu_import_success_dialog.dart';
import 'package:go_router/go_router.dart' show GoRouterHelper;
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;

/// Pantalla 1 del flow "Importar menú con IA" — el manager elige fotos
/// del menú (cámara o galería), las ve como thumbnails reordenables, lee
/// el disclaimer de IA, y dispara el upload + parse al pegarle a "Analizar".
///
/// **Diseño visual** (mantiene 100% el lenguaje Foodly):
///   - AppBar simple con título purple primary.
///   - Hero card al tope con el `digitalize_menu.png` + título grande +
///     disclaimer prominente sobre el comportamiento de la IA.
///   - Lista horizontal de fotos seleccionadas con dismiss "X" en cada una.
///   - 2 CTAs neumorphic en row: "📷 Cámara" / "🖼 Galería".
///   - Botón "Analizar" sticky al fondo (solo aparece si hay >=1 foto).
///   - Durante upload/parse: overlay con progress lineal + mensaje
///     contextual ("Subiendo 3 de 10...", "Analizando 2 de 10...").
///
/// **Por qué un solo Scaffold con un BlocConsumer en vez de pantallas
/// separadas para cada estado del cubit:** los estados `picking`,
/// `uploading` y `parsing` son TRANSICIONES sobre la misma pantalla —
/// el manager no se va a otra ruta, solo ve overlays y mensajes
/// progresivos. Cuando llega a `reviewing`, el `BlocListener` navega a
/// la pantalla 2.
class MenuImportPage extends StatelessWidget {
  /// UUID del `BusinessMenu` al que se va a importar. Se pasa como path
  /// param desde la ruta — el caller lo recibe del context del manager
  /// (su menú activo).
  final String businessMenuUuid;

  const MenuImportPage({super.key, required this.businessMenuUuid});

  @override
  Widget build(BuildContext context) {
    // **Locale del app pasado al cubit** (fix 2026-05-18): antes el
    // cubit usaba default `'es'` siempre, lo que hacía que Gemini
    // recibiera "Idioma de los nombres: en Español" en el prompt aunque
    // el manager tuviera la app en PT. Síntoma: 63 items en PT (porque
    // ya eran legibles en PT) + 1 item "Menu Monreal" que Gemini
    // decidió describir en ES siguiendo la instrucción del prompt. Fix:
    // tomar el primary tag del locale activo (`pt_PT` → `pt`, `es-AR`
    // → `es`) y pasarlo al cubit que lo pasa al BE en cada parse.
    final localeTag = Localizations.localeOf(context).languageCode.toLowerCase();
    final supportedLocale = ['es', 'pt', 'en'].contains(localeTag) ? localeTag : 'es';

    return BlocProvider(
      create: (_) => MenuImportCubit(locale: supportedLocale),
      child: _MenuImportView(businessMenuUuid: businessMenuUuid),
    );
  }
}

class _MenuImportView extends StatelessWidget {
  final String businessMenuUuid;
  const _MenuImportView({required this.businessMenuUuid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ui.NeumorphicColors.decorationMaxWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        leading: CustomRoundedNeumorphicButton(
          iconSize: 26,
          diameter: 32,
          shape: ui.NeumorphicShape.concave,
          iconData: Bootstrap.caret_left_fill,
          onPressed: () {
            if (context.canPop()) {
              di<AppRouter>().removeLastRouteHistory();
              context.pop();
            } else {
              di<AppRouter>().goBackToLastRoute();
            }
          },
        ).paddingOnly(left: 16, top: 8, bottom: 8),
        leadingWidth: 60,
        elevation: 0,
        title: Text(
          S.current.aiMenuImportTitle,
          style: FoodlyTextStyles.secondaryTitle.copyWith(
            color: FoodlyThemes.primaryFoodly,
            fontSize: 19,
          ),
        ),
        iconTheme: const IconThemeData(color: FoodlyThemes.primaryFoodly),
      ),
      body: BlocConsumer<MenuImportCubit, MenuImportState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (message, _) {
              FoodlySnackbars.errorGeneric(context, message);
            },
            done: (vm) {
              final stats = vm.bulkStats;
              if (stats == null) return;
              MenuImportSuccessDialog.show(
                context,
                stats: stats,
                onViewMenu: () {
                  // **Refactor 2026-05-18 (segundo intento):** ahora que
                  // `MenuImportEmptyStateWdg._goToImport` navega con
                  // `pushNamed` (apila), el stack es
                  // `[my-business → manage-menu → manage-menu-import]`.
                  // Para volver al manage-menu (que ya está en el stack
                  // con su State preservado) y disparar refresh para
                  // mostrar los items recién creados, hacemos
                  // `context.pop(true)`. El `true` lo lee el empty state
                  // del manage-menu (que awaitea el pushNamed) para
                  // llamar `ManageMenuCubit.reload()` y refetch del BE.
                  //
                  // Versión anterior con `context.goNamed(manageMenu)`
                  // dejaba la pantalla del import-page en el stack
                  // (go_router mantiene los hermanos del shell), así
                  // que back desde manage-menu volvía a la pantalla del
                  // import — bug que reportó Hector.
                  Navigator.of(context, rootNavigator: true).pop(); // dialog
                  if (context.canPop()) {
                    context.pop(true); // pop manage-menu-import → manage-menu reload
                    di<AppRouter>().removeLastRouteHistory();
                  } else {
                    di<AppRouter>().removeLastRouteHistory();
                    Future.delayed(const Duration(milliseconds: 150), () {
                      final business = di<AuthSessionService>().userSessionDM?.user.business.firstOrNull;
                      final menu = business?.menus.firstOrNull;

                      if (menu != null && context.mounted) {
                        context.goNamed(
                          AppRoutes.manageMenu.name,
                          pathParameters: {AppRoutes.routeIdParam: menu.uuid},
                          extra: business,
                        );
                      } else if (context.mounted) {
                        context.goNamed(AppRoutes.myBusiness.name, pathParameters: {
                          AppRoutes.routeIdParam: di<AuthSessionService>().userSessionDM?.user.business.first.uuid ?? ''
                        });
                      }
                    });
                    context.read<MainDrawerCubit>().updateSelectedIndex(1);
                  }
                },
              );
            },
          );
        },
        builder: (context, state) {
          // Dispatcher según state: la review/confirming/done se renderiza
          // en `MenuImportReviewView`; el resto en la Pantalla 1 (upload).
          return state.maybeWhen(
            reviewing: (vm) => MenuImportReviewView(
              businessMenuUuid: businessMenuUuid,
              parsedGroups: vm.parsedGroups,
            ),
            confirming: (vm) => MenuImportReviewView(
              businessMenuUuid: businessMenuUuid,
              parsedGroups: vm.parsedGroups,
              confirmingInProgress: true,
            ),
            done: (vm) => MenuImportReviewView(
              businessMenuUuid: businessMenuUuid,
              parsedGroups: vm.parsedGroups,
              // Mantenemos el confirming overlay activo en `done` para
              // que el manager NO vea la pantalla "viva" mientras el
              // dialog Foodly de éxito se monta encima — evita un
              // flash visual de transición.
              confirmingInProgress: true,
            ),
            orElse: () => Stack(
              children: [
                _UploadFormBody(state: state, businessMenuUuid: businessMenuUuid),
                if (_isProcessing(state)) _ProcessingOverlay(state: state),
              ],
            ),
          );
        },
      ),
    );
  }

  bool _isProcessing(MenuImportState state) =>
      state.maybeWhen(uploading: (_) => true, parsing: (_) => true, orElse: () => false);
}

// ─────────────────────────────────────────────────────────────────────────
// Body — hero card + disclaimer + thumbs + CTAs + analizar
// ─────────────────────────────────────────────────────────────────────────

class _UploadFormBody extends StatelessWidget {
  final MenuImportState state;
  final String businessMenuUuid;
  const _UploadFormBody({required this.state, required this.businessMenuUuid});

  @override
  Widget build(BuildContext context) {
    final vm = state.vm;
    final hasFiles = vm.selectedFiles.isNotEmpty;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _HeroCard(),
          const SizedBox(height: 20),
          const _AiDisclaimerCard(),
          const SizedBox(height: 24),
          if (hasFiles) ...[
            _SectionLabel(text: S.current.aiMenuImportSelectedPhotosLabel(vm.selectedFiles.length)),
            const SizedBox(height: 12),
            _SelectedPhotosStrip(files: vm.selectedFiles),
            const SizedBox(height: 20),
          ],
          _PickerActions(),
          if (hasFiles) ...[
            const SizedBox(height: 28),
            _AnalyzeButton(businessMenuUuid: businessMenuUuid),
          ],
        ],
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/digitalize_menu.png',
            height: 140,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          Text(
            S.current.aiMenuImportHeroTitle,
            style: FoodlyTextStyles.secondaryTitle.copyWith(
              color: FoodlyThemes.primaryFoodly,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            S.current.aiMenuImportHeroSubtitle,
            style: FoodlyTextStyles.cardsSmallSubtitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Disclaimer obligatorio sobre el comportamiento de la IA. NO es
/// dismissible — el manager tiene que verlo cada vez que entra al flow
/// para gestionar expectativas correctamente.
///
/// Texto deliberadamente firme pero amigable: "puede cometer errores"
/// (legalmente seguro) + "revisá antes de confirmar" (acción clara).
class _AiDisclaimerCard extends StatelessWidget {
  const _AiDisclaimerCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.18),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Bootstrap.info_circle_fill,
            size: 20,
            color: FoodlyThemes.primaryFoodly,
          ).paddingTop(2),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.current.aiMenuImportDisclaimer,
                  style: FoodlyTextStyles.cardsSmallSubtitle.copyWith(
                    color: FoodlyThemes.primaryFoodly,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  S.current.aiMenuImportTips,
                  style: FoodlyTextStyles.cardsSmallSubtitle.copyWith(
                    fontSize: 12,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});
  @override
  Widget build(BuildContext context) => Text(
        text,
        style: FoodlyTextStyles.secondaryTitle.copyWith(
          fontSize: 14,
          color: Colors.black87,
        ),
      );
}

/// Strip horizontal de thumbnails. Cada foto tiene un botón "X" para
/// removerla antes del upload. Las fotos en `selectedFiles` aún NO
/// están subidas a GCS — son solo paths locales del image_picker.
class _SelectedPhotosStrip extends StatelessWidget {
  final List<File> files;
  const _SelectedPhotosStrip({required this.files});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: files.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) => _PhotoThumbnail(file: files[index], index: index),
      ),
    );
  }
}

class _PhotoThumbnail extends StatelessWidget {
  final File file;
  final int index;
  const _PhotoThumbnail({required this.file, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(
            file,
            width: 96,
            height: 96,
            fit: BoxFit.cover,
            // Defensivo: si el File se invalidó por algún motivo entre
            // el pick y el render, evitamos un crash de pintar un null.
            errorBuilder: (_, __, ___) => Container(
              width: 96,
              height: 96,
              color: Colors.grey.shade200,
              child: const Icon(Bootstrap.image, color: Colors.grey),
            ),
          ),
        ),
        Positioned(
          right: -8,
          top: -8,
          child: GestureDetector(
            onTap: () => context.read<MenuImportCubit>().removeFile(index),
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.16),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: const Icon(Bootstrap.x, size: 16, color: FoodlyThemes.primaryFoodly),
            ),
          ),
        ),
      ],
    );
  }
}

/// 2 CTAs en row: cámara + galería. Reusan el `CustomRoundedNeumorphicButton`
/// existente para consistencia visual con el resto del proyecto.
class _PickerActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MenuImportCubit>();

    return Row(
      children: [
        Expanded(
            child: _PickerActionButton(
          icon: Bootstrap.camera_fill,
          label: S.current.aiMenuImportCamera,
          onTap: () => cubit.pickFromCamera(),
        )),
        const SizedBox(width: 12),
        Expanded(
            child: _PickerActionButton(
          icon: Bootstrap.images,
          label: S.current.aiMenuImportGallery,
          onTap: () => cubit.pickFromGallery(),
        )),
      ],
    );
  }
}

class _PickerActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _PickerActionButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.18),
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 26, color: FoodlyThemes.primaryFoodly),
            const SizedBox(height: 8),
            Text(
              label,
              style: FoodlyTextStyles.cardsSmallSubtitle.copyWith(
                color: FoodlyThemes.primaryFoodly,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Botón sticky "Analizar con IA". Solo aparece si hay >=1 foto. Dispara
/// el pipeline upload → parse → review.
class _AnalyzeButton extends StatelessWidget {
  final String businessMenuUuid;
  const _AnalyzeButton({required this.businessMenuUuid});

  @override
  Widget build(BuildContext context) {
    return CustomNeumorphicButton(
      onPressed: () => context.read<MenuImportCubit>().startImport(businessMenuUuid),
      text: S.current.aiMenuImportAnalyzeCta,
      leading: const Icon(Bootstrap.stars, size: 19, color: Colors.white),
      disabled: false,
      fontSize: 14,
      bosShapeRadius: 8,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Processing overlay — visible durante upload + parse
// ─────────────────────────────────────────────────────────────────────────

/// Overlay con backdrop semi-transparente que tapa la pantalla mientras
/// el cubit está en `uploading` o `parsing`. Muestra:
///   - icono animado purple
///   - mensaje contextual ("Subiendo X de Y" / "Analizando X de Y")
///   - LinearProgressIndicator real con el progress
///   - subtítulo "Esto puede tardar unos segundos por foto" para gestionar
///     expectativas (el parse con visión puede ser lento)
class _ProcessingOverlay extends StatelessWidget {
  final MenuImportState state;
  const _ProcessingOverlay({required this.state});

  @override
  Widget build(BuildContext context) {
    final vm = state.vm;
    final isUploading = state.maybeWhen(uploading: (_) => true, orElse: () => false);

    final title = isUploading
        ? S.current.aiMenuImportUploading(vm.currentStepIndex, vm.currentStepTotal)
        : S.current.aiMenuImportParsing(vm.currentStepIndex, vm.currentStepTotal);

    final subtitle = isUploading ? S.current.aiMenuImportUploadingHint : S.current.aiMenuImportParsingHint;

    final progress = vm.currentStepTotal == 0 ? null : (vm.currentStepIndex / vm.currentStepTotal).clamp(0.0, 1.0);

    return Positioned.fill(
      child: ColoredBox(
        color: Colors.black.withValues(alpha: 0.45),
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 56,
                  height: 56,
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    valueColor: AlwaysStoppedAnimation(FoodlyThemes.primaryFoodly),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  title,
                  style: FoodlyTextStyles.secondaryTitle.copyWith(
                    color: FoodlyThemes.primaryFoodly,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: FoodlyTextStyles.cardsSmallSubtitle.copyWith(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 18),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor: FoodlyThemes.primaryFoodly.withValues(alpha: 0.12),
                    valueColor: const AlwaysStoppedAnimation(FoodlyThemes.primaryFoodly),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
