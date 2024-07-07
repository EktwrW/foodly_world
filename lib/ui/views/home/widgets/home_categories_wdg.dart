import 'package:carousel_slider/carousel_slider.dart';
import 'package:foodly_world/core/enums/foodly_categories_enums.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({
    super.key,
  });

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  final buttonCarouselController = CarouselController();
  final current = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: FoodlyThemes.primaryFoodly,
      child: Column(
        children: [
          CarouselSlider(
            items: FoodlyCategories.values
                .map((e) => NeumorphicRadio(
                      padding: const EdgeInsets.all(8),
                      style: const NeumorphicRadioStyle(
                          shape: NeumorphicShape.convex,
                          intensity: .6,
                          unselectedColor: NeumorphicColors.decorationMaxWhiteColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox.square(dimension: 50, child: e.icon),
                          SizedBox(
                            width: 80,
                            height: 24,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Text(
                                    e.text,
                                    textAlign: TextAlign.center,
                                    style: FoodlyTextStyles.categoryButtonText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ).paddingOnly(top: 14, bottom: 10))
                .toList(),
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              onPageChanged: (index, reason) => current.value = index,
              height: 120,
              viewportFraction: context.screenWidth <= 320 ? .4 : .3,
              aspectRatio: 3.0,
            ),
          ),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => buttonCarouselController.previousPage(duration: Durations.medium4, curve: Curves.linear),
                  child: const Icon(Bootstrap.caret_left_fill, color: NeumorphicColors.decorationMaxWhiteColor)
                      .paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
                ),
                ...FoodlyCategories.values.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () {
                      buttonCarouselController.animateToPage(entry.key);
                      current.value = entry.key;
                    },
                    child: ValueListenableBuilder(
                        valueListenable: current,
                        builder: (_, value, __) {
                          final thisIsCurrent = value == entry.key;

                          return AnimatedContainer(
                            key: Key('${entry.key}'),
                            duration: Durations.medium4,
                            width: thisIsCurrent ? 10 : 7.5,
                            height: 12,
                            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black)
                                    .withOpacity(thisIsCurrent ? 0.8 : 0.3)),
                          );
                        }),
                  );
                }),
                InkWell(
                  onTap: () => buttonCarouselController.nextPage(duration: Durations.medium4, curve: Curves.linear),
                  child: const Icon(Bootstrap.caret_right_fill, color: NeumorphicColors.decorationMaxWhiteColor)
                      .paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
                ),
              ],
            ).paddingOnly(bottom: 6),
          ),
        ],
      ),
    );
  }
}
