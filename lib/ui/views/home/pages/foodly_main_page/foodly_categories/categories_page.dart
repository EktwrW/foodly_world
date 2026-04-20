import 'dart:async';

import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/places/location_details_dm.dart';
import 'package:foodly_world/data_models/service_packages/service_package_dm.dart' show ServiceType;
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/carousel/foodly_carousel.dart';
import 'package:foodly_world/ui/shared_widgets/shimmer/home_shimmer_widgets.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_categories/cubit/categories_cubit.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_categories/view_model/categories_vm.dart';
import 'package:foodly_world/ui/views/home/widgets/business_results_view.dart';
import 'package:foodly_world/ui/views/home/widgets/main_search_widget.dart' show CurrentLocationButton;
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

part 'widgets/categories_app_bar.dart';
part 'widgets/catering_filters_bar.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  static const radiusDistanceOptions = <double>[5, 10, 15, 25];

  StreamSubscription<LocationDetailsDM>? _locationSub;

  @override
  void initState() {
    super.initState();
    _locationSub = di<LocationService>().locationChanged.listen((locationDM) {
      final pos = locationDM.position;
      if (pos != null && mounted) {
        context.read<CategoriesCubit>().refreshWithNewLocation(pos.latitude, pos.longitude);
      }
    });
  }

  @override
  void dispose() {
    _locationSub?.cancel();
    super.dispose();
  }

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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        final router = di<AppRouter>();

        // Shell routes are blocked by their own PopScope(canPop: false).
        // For other routes (categories, visit-business, etc.), navigate back.
        if (!router.isOnShellRoute) {
          router.goBackToLastRoute();
        }
      },
      child: Scaffold(
        extendBody: true,
        appBar: _CategoriesAppBar(
          key: const Key('categories-app-bar'),
          category: vm.currentCategory,
        ),
        body: isLoading && vm.businessesInCurrentCategory.isEmpty
            ? (vm.viewMode.isGrid ? const BusinessGridShimmer() : const BusinessListShimmer())
            : Column(
                children: [
                  FoodlyCarousel(
                    key: const Key('categories-page-carousel'),
                    controller: vm.carouselController,
                    height: 90,
                    viewportFraction: screenWidth <= 320 ? .41 : .25,
                    itemSpacing: 3,
                    items: FoodlyCategories.activeCategories
                        .map((e) => TextButton(
                              onPressed: () => cubit.changeCategory(e),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.fromLTRB(6, 6, 6, 0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox.square(
                                    dimension: 42,
                                    child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          boxShadow: e != vm.currentCategory
                                              ? null
                                              : [
                                                  BoxShadow(
                                                    color: FoodlyThemes.primaryFoodly.withValues(alpha: .3),
                                                    blurRadius: 6,
                                                    offset: const Offset(0, 3),
                                                  )
                                                ],
                                          shape: BoxShape.circle,
                                          color: e == vm.currentCategory
                                              ? FoodlyThemes.primaryFoodly
                                              : FoodlyThemes.alternativeUnselectedLightColor,
                                        ),
                                        child: e.avatar.paddingAll(3)),
                                  ),
                                  Flexible(
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
                            ))
                        .toList(),
                  ),
                  const CurrentLocationButton().paddingSymmetric(horizontal: 12, vertical: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: Text(
                          S.current.radiusDistanceLabel,
                          overflow: TextOverflow.ellipsis,
                          style: FoodlyTextStyles.captionPurple,
                          maxLines: 2,
                        ),
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
                  if (vm.isCateringCategory)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: _CateringFiltersBar(
                        key: const Key('categories-page-catering-filters-bar'),
                        selectedServiceType: vm.selectedServiceType,
                        ordering: vm.ordering,
                        onServiceTypeSelected: cubit.selectServiceType,
                        onOrderingChanged: cubit.changeOrdering,
                      ),
                    ),
                  Expanded(
                    flex: 7,
                    child: AnimatedSwitcher(
                      duration: Durations.medium2,
                      child: vm.isSwitchingRadius
                          ? (vm.viewMode.isGrid ? const BusinessGridShimmer() : const BusinessListShimmer())
                          : BusinessResultsView(
                              key: const Key('categories-page-business-results-view'),
                              searchResults: vm.businessesInCurrentCategory,
                              isGridView: vm.viewMode.isGrid,
                              noResultsMessage: S.current.noNearbyBusinessesInCategory(vm.radiusDistanceInKm),
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
      ),
    );
  }
}
