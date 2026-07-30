import 'package:foodly_world/core/enums/foodly_enums.dart' show BusinessResultsViewMode;
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/data_models/service_packages/service_package_dm.dart' show ServiceType;
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/carousel/foodly_carousel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_vm.freezed.dart';

/// Ordering used by the Catering & Chefs vertical in [CategoriesPage].
/// Maps 1:1 to the `ordering` query param on GET /business/nearby:
///   distance     → closest first (default)
///   priceAsc     → cheapest min_service_price first
///   ratingDesc   → highest rating_avg first
enum DiscoveryOrdering {
  distance,
  priceAsc,
  ratingDesc;

  String get apiValue => switch (this) {
        DiscoveryOrdering.distance => 'distance',
        DiscoveryOrdering.priceAsc => 'price_asc',
        DiscoveryOrdering.ratingDesc => 'rating_desc',
      };

  String get label => switch (this) {
        DiscoveryOrdering.distance => S.current.orderingDistance,
        DiscoveryOrdering.priceAsc => S.current.orderingPriceAsc,
        DiscoveryOrdering.ratingDesc => S.current.orderingRatingDesc,
      };
}

@freezed
abstract class CategoriesVM with _$CategoriesVM {
  const CategoriesVM._();

  const factory CategoriesVM({
    FoodlyCategories? currentCategory,
    FoodlyCarouselController? carouselController,
    @Default([]) List<BusinessDM> nearbyBusinesses,
    double? latitude,
    double? longitude,
    @Default(BusinessResultsViewMode.list) BusinessResultsViewMode viewMode,
    // **Default 10 km (2026-05-19):** subido desde 5 km original para mitigar
    // la sensación de "Foodly no tiene cobertura" durante el bootstrap, donde
    // hay pocos negocios por ciudad. Con 5 km, un negocio a 7 km del usuario
    // quedaba escondido y el discovery se sentía vacío sin estarlo. El
    // selector visible (`radiusDistanceOptions = [5, 10, 15, 25]` en
    // `categories_page.dart`) permite al usuario bajar a 5 km cuando quiera
    // resultados más cercanos. Cuando la densidad de negocios por ciudad
    // crezca lo suficiente, considerar volver a 5 km como default.
    @Default(10) double radiusDistanceInKm,
    @Default(false) bool isSwitchingRadius,
    // Catering & Chefs — active service_type chip (null = "All").
    ServiceType? selectedServiceType,
    // Discovery ordering (distance | priceAsc | ratingDesc).
    @Default(DiscoveryOrdering.distance) DiscoveryOrdering ordering,
  }) = _CategoriesVM;

  bool get isCateringCategory => currentCategory?.isCateringOrChefs ?? false;

  List<BusinessDM> get businessesInCurrentCategory {
    if (currentCategory == null) {
      return nearbyBusinesses;
    }

    final filteredList = nearbyBusinesses.where((business) => business.categoryId == currentCategory).toList();

    return filteredList;
  }
}
