import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:foodly_world/core/enums/foodly_categories_enums.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_categories/view_model/categories_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_state.dart';
part 'categories_cubit.freezed.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesVM _vm;

  CategoriesCubit(
    FoodlyCategories? initialCategory,
  )   : _vm = CategoriesVM(
          currentCategory: initialCategory,
          carouselController: CarouselSliderController(),
        ),
        super(const CategoriesState.initial(CategoriesVM())) {
    _initializeCategories();
  }

  void _initializeCategories() async {
    await Future.microtask(() => emit(_Loading(_vm)));

    await Future.microtask(() => emit(_Loaded(_vm)));
  }

  void changeCategory(FoodlyCategories category) => emit(_Loaded(_vm = _vm.copyWith(currentCategory: category)));
}
