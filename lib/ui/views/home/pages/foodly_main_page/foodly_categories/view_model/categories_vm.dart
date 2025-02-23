import 'package:carousel_slider/carousel_controller.dart';
import 'package:foodly_world/core/enums/foodly_categories_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_vm.freezed.dart';

@freezed
class CategoriesVM with _$CategoriesVM {
  const CategoriesVM._();

  const factory CategoriesVM({
    FoodlyCategories? currentCategory,
    CarouselSliderController? carouselController,
  }) = _CategoriesVM;
}
