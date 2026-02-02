import 'package:carousel_slider/carousel_controller.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart' show BusinessResultsViewMode;
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_vm.freezed.dart';

@freezed
class CategoriesVM with _$CategoriesVM {
  const CategoriesVM._();

  const factory CategoriesVM({
    FoodlyCategories? currentCategory,
    CarouselSliderController? carouselController,
    @Default([]) List<BusinessDM> nearbyBusinesses,
    double? latitude,
    double? longitude,
    @Default(BusinessResultsViewMode.list) BusinessResultsViewMode viewMode,
    @Default(5) double radiusDistanceInKm,
    @Default(false) bool isSwitchingRadius,
  }) = _CategoriesVM;

  List<BusinessDM> get businessesInCurrentCategory {
    if (currentCategory == null) {
      return nearbyBusinesses;
    }

    final filteredList = nearbyBusinesses.where((business) => business.categoryId == currentCategory).toList();

    return filteredList;
  }
}
