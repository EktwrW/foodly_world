import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:foodly_world/core/enums/foodly_categories_enums.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart' show BusinessResultsViewMode;
import 'package:foodly_world/core/network/business/business_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart'
    show LocalStorageService, di, FoodlyStrings, Logger;
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_categories/view_model/categories_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_state.dart';
part 'categories_cubit.freezed.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesVM _vm;
  final BusinessRepo _businessRepo;
  final Logger _logger = di<Logger>();

  CategoriesCubit(
    FoodlyCategories? initialCategory,
    BusinessRepo businessRepo,
    double latitude,
    double longitude,
  )   : _vm = CategoriesVM(
          currentCategory: initialCategory,
          carouselController: CarouselSliderController(),
          latitude: latitude,
          longitude: longitude,
        ),
        _businessRepo = businessRepo,
        super(const CategoriesState.initial(CategoriesVM())) {
    fetchNearbyBusinesses(latitude: _vm.latitude!, longitude: _vm.longitude!);
  }

  void changeCategory(FoodlyCategories category) async {
    await di<LocalStorageService>().saveString(FoodlyStrings.LAST_CATEGORY_VISITED, category.name);

    emit(_Loaded(_vm = _vm.copyWith(currentCategory: category)));
  }

  Future<void> fetchNearbyBusinesses({
    required double latitude,
    required double longitude,
    double? radius,
    int? categoryId,
    int? limit,
    bool switchingRadius = false,
  }) async {
    if (!switchingRadius) {
      await Future.microtask(() => emit(_Loading(_vm)));
    } else {
      emit(_Loaded(_vm = _vm.copyWith(isSwitchingRadius: true)));
    }

    if (_vm.currentCategory == null) {
      await di<LocalStorageService>().getString(FoodlyStrings.LAST_CATEGORY_VISITED).then((lastCategoryViewedName) {
        if (lastCategoryViewedName != null) {
          final lastCategoryViewed = FoodlyCategories.values.firstWhere(
            (category) => category.name == lastCategoryViewedName,
            orElse: () => FoodlyCategories.international,
          );
          _vm = _vm.copyWith(currentCategory: lastCategoryViewed);
        }
      });
    }

    await _businessRepo
        .fetchNearbyBusinesses(
      latitude: latitude,
      longitude: longitude,
      radius: radius,
      categoryId: categoryId,
      limit: limit,
    )
        .then((result) {
      return result.when(
        success: (data) async {
          log('${data.business}');

          await Future.microtask(() => emit(_Loaded(_vm = _vm.copyWith(
                nearbyBusinesses: data.business,
                isSwitchingRadius: false,
              ))));
        },
        failure: (error) async {
          await Future.microtask(() => emit(_Error(
                _vm = _vm.copyWith(isSwitchingRadius: false),
                error.errorMsg,
              )));
          _logger.e('Error fetching nearby businesses: ${error.errorMsg}');
        },
      );
    });
  }

  void refreshWithNewLocation(double latitude, double longitude) {
    _vm = _vm.copyWith(latitude: latitude, longitude: longitude);
    fetchNearbyBusinesses(latitude: latitude, longitude: longitude);
  }

  void toggleViewMode() {
    final newViewMode =
        _vm.viewMode == BusinessResultsViewMode.grid ? BusinessResultsViewMode.list : BusinessResultsViewMode.grid;

    _vm = _vm.copyWith(viewMode: newViewMode);
    emit(_Loaded(_vm));
  }

  void toggleRadiusDistance(double newRadiusInKm) {
    _vm = _vm.copyWith(radiusDistanceInKm: newRadiusInKm, isSwitchingRadius: true);

    fetchNearbyBusinesses(
      latitude: _vm.latitude!,
      longitude: _vm.longitude!,
      radius: newRadiusInKm,
      switchingRadius: true,
    );
  }
}
