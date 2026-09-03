import 'dart:async' show Completer;
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/painting.dart' show ImageConfiguration, ImageStreamListener;
import 'package:foodly_world/core/enums/foodly_enums.dart' show BusinessResultsViewMode;
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/business/business_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart'
    show LocalStorageService, di, FoodlyStrings, Logger;
import 'package:foodly_world/core/services/foodly_image_cache.dart';
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/data_models/service_packages/service_package_dm.dart' show ServiceType;
import 'package:foodly_world/ui/shared_widgets/carousel/foodly_carousel.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_categories/view_model/categories_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_cubit.freezed.dart';
part 'categories_state.dart';

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
          carouselController: FoodlyCarouselController(),
          latitude: latitude,
          longitude: longitude,
        ),
        _businessRepo = businessRepo,
        super(const CategoriesState.initial(CategoriesVM())) {
    _initViewMode().then((_) {
      fetchNearbyBusinesses(latitude: _vm.latitude!, longitude: _vm.longitude!);
    });
  }

  Future<void> _initViewMode() async {
    final saved = await di<LocalStorageService>().getString(FoodlyStrings.PREFERRED_VIEW_MODE);
    if (saved == BusinessResultsViewMode.grid.name) {
      _vm = _vm.copyWith(viewMode: BusinessResultsViewMode.grid);
    }
  }

  void changeCategory(FoodlyCategories category) async {
    await di<LocalStorageService>().saveString(FoodlyStrings.LAST_CATEGORY_VISITED, category.name);

    // Switching AWAY from catering clears the service_type/ordering filters so
    // they don't persist silently when the user comes back. Reuse defaults.
    final leavingCatering = _vm.isCateringCategory && !category.isCateringOrChefs;

    _vm = _vm.copyWith(
      currentCategory: category,
      selectedServiceType: leavingCatering ? null : _vm.selectedServiceType,
      ordering: leavingCatering ? DiscoveryOrdering.distance : _vm.ordering,
    );

    emit(_Loaded(_vm));
  }

  /// Catering & Chefs — toggle the active service_type chip. Passing the
  /// currently selected type clears the filter ("All" behaviour).
  void selectServiceType(ServiceType? type) {
    final newType = (_vm.selectedServiceType == type) ? null : type;
    _vm = _vm.copyWith(selectedServiceType: newType, isSwitchingRadius: true);
    emit(_Loaded(_vm));
    fetchNearbyBusinesses(
      latitude: _vm.latitude!,
      longitude: _vm.longitude!,
      radius: _vm.radiusDistanceInKm,
      switchingRadius: true,
    );
  }

  /// Catering & Chefs — switch between distance / price_asc / rating_desc.
  void changeOrdering(DiscoveryOrdering ordering) {
    if (_vm.ordering == ordering) return;
    _vm = _vm.copyWith(ordering: ordering, isSwitchingRadius: true);
    emit(_Loaded(_vm));
    fetchNearbyBusinesses(
      latitude: _vm.latitude!,
      longitude: _vm.longitude!,
      radius: _vm.radiusDistanceInKm,
      switchingRadius: true,
    );
  }

  Future<void> fetchNearbyBusinesses({
    required double latitude,
    required double longitude,
    double? radius,
    int? categoryId,
    int? limit,
    bool switchingRadius = false,
  }) async {
    final effectiveRadius = radius ?? _vm.radiusDistanceInKm;

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

    // Catering-only filters: the BE ignores these when the category is not
    // Catering, but we still guard here so we don't spam the network with
    // values that are about to be discarded.
    final isCatering = _vm.isCateringCategory;
    final serviceTypeParam = isCatering ? _vm.selectedServiceType?.apiValue : null;
    final orderingParam = isCatering && _vm.ordering != DiscoveryOrdering.distance ? _vm.ordering.apiValue : null;

    await _businessRepo
        .fetchNearbyBusinesses(
      latitude: latitude,
      longitude: longitude,
      radius: effectiveRadius,
      categoryId: categoryId,
      limit: limit,
      serviceType: serviceTypeParam,
      ordering: orderingParam,
    )
        .then((result) {
      return result.when(
        success: (data) async {
          log('${data.business}');

          await _precacheBusinessImages(data.business);
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
    di<LocalStorageService>().saveString(FoodlyStrings.PREFERRED_VIEW_MODE, newViewMode.name);
  }

  Future<void> _precacheBusinessImages(List<BusinessDM> businesses) {
    final futures = <Future<void>>[];
    for (final b in businesses) {
      final f = _precacheUrlFuture(b.logo);
      if (f != null) futures.add(f);
      for (final img in b.coverImages) {
        final f2 = _precacheUrlFuture(img.url);
        if (f2 != null) futures.add(f2);
      }
    }
    if (futures.isEmpty) return Future.value();
    return Future.wait(futures).timeout(const Duration(seconds: 4), onTimeout: () => []);
  }

  Future<void>? _precacheUrlFuture(String? url) {
    if (url == null) return null;
    final uri = Uri.tryParse(url);
    if (uri == null || !uri.hasScheme || uri.path.length <= 1) return null;
    final lp = uri.path.toLowerCase();
    if (lp.endsWith('.mp4') || lp.endsWith('.mov') || lp.endsWith('.webm') || lp.endsWith('.m4v')) return null;
    final completer = Completer<void>();
    final stream = CachedNetworkImageProvider(url, cacheManager: FoodlyImageCache.manager).resolve(const ImageConfiguration());
    stream.addListener(ImageStreamListener(
      (_, __) {
        if (!completer.isCompleted) completer.complete();
      },
      onError: (_, __) {
        if (!completer.isCompleted) completer.complete();
      },
    ));
    return completer.future;
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
