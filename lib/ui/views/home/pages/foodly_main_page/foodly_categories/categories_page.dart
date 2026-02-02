import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_categories/cubit/categories_cubit.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_categories/view_model/categories_vm.dart';
import 'package:foodly_world/ui/views/home/widgets/business_results_view.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

part 'widgets/categories_app_bar.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  static const radiusDistanceOptions = <double>[5, 10, 15, 25];

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final dialogService = di<DialogService>();
    final cubit = context.read<CategoriesCubit>();

    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: (vm) {
            if (vm.businessesInCurrentCategory.isNotEmpty) {
              dialogService.showLoading();
            }
          },
          loaded: (vm) {
            WidgetsBinding.instance.addPostFrameCallback((_) => vm.carouselController?.animateToPage(
                  vm.currentCategory?.index ?? 0,
                  duration: Durations.extralong1,
                  curve: Curves.decelerate,
                ));

            dialogService.hideLoading();
          },
          error: (vm, errorMessage) {
            dialogService.hideLoading();
            FoodlySnackbars.errorGeneric(context, errorMessage);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (vm) => _buildContent(cubit, vm, screenWidth, isLoading: true),
          loaded: (vm) => _buildContent(cubit, vm, screenWidth),
          error: (vm, _) => _buildContent(cubit, vm, screenWidth),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildContent(
    CategoriesCubit cubit,
    CategoriesVM vm,
    double screenWidth, {
    bool isLoading = false,
  }) {
    final locationService = di<LocationService>();

    return Scaffold(
      extendBody: true,
      appBar: _CategoriesAppBar(
        key: const Key('categories-app-bar'),
        category: vm.currentCategory,
      ),
      body: isLoading && vm.businessesInCurrentCategory.isEmpty
          ? const Center(child: CircularProgressIndicator.adaptive())
          : Column(
              children: [
                Flexible(
                  child: CarouselSlider(
                    key: const Key('categories-page-carousel-slider'),
                    items: FoodlyCategories.values
                        .map((e) => TextButton(
                              onPressed: () => cubit.changeCategory(e),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.fromLTRB(6, 6, 6, 3),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox.square(
                                    dimension: 42,
                                    child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: e == vm.currentCategory
                                              ? FoodlyThemes.primaryFoodly
                                              : FoodlyThemes.alternativeUnselectedLightColor,
                                        ),
                                        child: e.avatar.paddingAll(3)),
                                  ),
                                  SizedBox(
                                    height: 38,
                                    child: Center(
                                      child: Text(
                                        e.text,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        softWrap: false,
                                        style: FoodlyTextStyles.categoryButtonText.copyWith(
                                          color: FoodlyThemes.primaryFoodly,
                                          fontWeight: e == vm.currentCategory ? FontWeight.w600 : null,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ).paddingHorizontal(3))
                        .toList(),
                    carouselController: vm.carouselController,
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {},
                      height: 90,
                      viewportFraction: screenWidth <= 320 ? .41 : .25,
                      aspectRatio: 3.0,
                    ),
                  ).paddingBottom(12),
                ),
                Flexible(
                  child: const Text(
                    'Radio de distancia para mostrar comercios:',
                    overflow: TextOverflow.ellipsis,
                    style: FoodlyTextStyles.captionPurple,
                  ).paddingVertical(12),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        '${locationService.currentAddress}, ${locationService.currentCity}.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: FoodlyTextStyles.captionBold,
                      ).paddingRight(20),
                    ),
                    SegmentedButton<double>(
                      segments: radiusDistanceOptions
                          .map(
                            (e) => ButtonSegment<double>(
                              value: e,
                              label: Text(
                                '${(e.toInt())} km',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11.5),
                              ),
                            ),
                          )
                          .toList(),
                      selected: {vm.radiusDistanceInKm},
                      onSelectionChanged: (newSelection) {
                        final newRadius = newSelection.first;
                        cubit.toggleRadiusDistance(newRadius);
                      },
                      showSelectedIcon: false,
                      style: ButtonStyle(
                        side: const WidgetStatePropertyAll(BorderSide(color: FoodlyThemes.primaryFoodly)),
                        foregroundColor: WidgetStateProperty.resolveWith(
                          (states) {
                            return states.contains(WidgetState.selected) ? Colors.white : FoodlyThemes.primaryFoodly;
                          },
                        ),
                        backgroundColor: WidgetStateProperty.resolveWith((states) {
                          if (states.contains(WidgetState.selected)) {
                            return FoodlyThemes.primaryFoodly.withValues(alpha: .7);
                          }
                          return null;
                        }),
                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                  ],
                ).paddingHorizontal(16),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: Durations.medium2,
                    child: vm.isSwitchingRadius
                        ? const Center(child: CircularProgressIndicator.adaptive())
                        : BusinessResultsView(
                            key: const Key('categories-page-business-results-view'),
                            searchResults: vm.businessesInCurrentCategory,
                            isGridView: vm.viewMode.isGrid,
                            noResultsMessage:
                                'No hay comercios cercanos en esta categoría dentro de ${vm.radiusDistanceInKm} km.',
                          ).paddingOnly(right: 6, left: 6, top: vm.businessesInCurrentCategory.isEmpty ? 100 : 20),
                  ),
                ),
              ],
            ).paddingVertical(12),
      floatingActionButton: ViewModeToggleButton(
        isGrid: vm.viewMode.isGrid,
        onPressed: vm.businessesInCurrentCategory.isNotEmpty ? () => cubit.toggleViewMode() : null,
        diameter: 36,
      ).paddingOnly(bottom: 24, right: 12),
    );
  }
}
