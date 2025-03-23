import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_neumo/flutter_neumo.dart' as ui;
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_categories/cubit/categories_cubit.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_categories/view_model/categories_vm.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

part 'widgets/categories_app_bar.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final dialogService = di<DialogService>();
    final cubit = context.read<CategoriesCubit>();

    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: (vm) => dialogService.showLoading(),
          loaded: (vm) {
            WidgetsBinding.instance.addPostFrameCallback((_) => vm.carouselController?.animateToPage(
                  vm.currentCategory?.index ?? 0,
                  duration: Durations.extralong1,
                  curve: Curves.decelerate,
                ));

            dialogService.hideLoading();
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (vm) => _buildContent(cubit, vm, screenWidth),
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
    double screenWidth,
  ) {
    return Scaffold(
      appBar: _CategoriesAppBar(
        key: const Key('categories-app-bar'),
        category: vm.currentCategory,
      ),
      body: Column(
        children: [
          CarouselSlider(
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
                                child: e.icon.paddingAll(3)),
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
          ),
        ],
      ).paddingVertical(12),
    );
  }
}
