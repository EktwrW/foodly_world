import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/carousel/foodly_carousel.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({
    super.key,
  });

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  final carouselController = FoodlyCarouselController();
  final current = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(gradient: UIDecorations.GLASSMORPHIC_PURPLE_GRADIENT),
      child: Column(
        children: [
          FoodlyCarousel(
            controller: carouselController,
            onPageChanged: (index) => current.value = index,
            height: 106,
            viewportFraction: context.isFoldableInHalfView ? .41 : .3,
            itemSpacing: 6,
            items: FoodlyCategories.activeCategories
                .map((e) => InkWell(
                      onTap: () {
                        context.goNamed(AppRoutes.categories.name, extra: e.index);

                        di<LocalStorageService>().saveString(FoodlyStrings.LAST_CATEGORY_VISITED, e.name);
                      },
                      splashFactory: InkRipple.splashFactory,
                      splashColor: Colors.white,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color: ui.NeumorphicColors.embossMaxWhiteColor.withValues(alpha: .36),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: .5),
                                shape: BoxShape.circle,
                              ),
                              child: SizedBox.square(
                                dimension: 46,
                                child: e.avatar.paddingAll(.5),
                              ),
                            ),
                            SizedBox(
                              width: 93,
                              child: Center(
                                child: Text(
                                  e.text,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                  style: FoodlyTextStyles.categoryButtonText.copyWith(
                                    color: Colors.white,
                                    fontSize: 10.5,
                                  ),
                                ).paddingTop(1),
                              ),
                            ),
                          ],
                        ).paddingOnly(top: 6, bottom: 8),
                      ),
                    ))
                .toList(),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (kIsWeb)
                  InkWell(
                    onTap: () => carouselController.previousPage(),
                    child: const Icon(Bootstrap.caret_left_fill, color: ui.NeumorphicColors.decorationMaxWhiteColor)
                        .paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
                  ),
                ...FoodlyCategories.activeCategories.asMap().entries.map(
                  (entry) {
                    return GestureDetector(
                      onTap: () {
                        carouselController.animateToPage(
                          entry.key,
                          duration: Durations.long2,
                        );
                        current.value = entry.key;
                      },
                      child: ValueListenableBuilder(
                        valueListenable: current,
                        builder: (_, value, __) {
                          final thisIsCurrent = value == entry.key;

                          return AnimatedContainer(
                            key: Key('${entry.key}'),
                            duration: Durations.medium4,
                            width: thisIsCurrent ? 16 : 7.5,
                            height: 7.5,
                            margin: kIsWeb
                                ? const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0)
                                : const EdgeInsets.all(7.0),
                            decoration: BoxDecoration(
                              color: (Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black)
                                  .withValues(alpha: thisIsCurrent ? 0.8 : 0.3),
                              borderRadius: thisIsCurrent ? BorderRadius.circular(4) : BorderRadius.circular(10),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                if (kIsWeb)
                  InkWell(
                    onTap: () => carouselController.nextPage(),
                    child: const Icon(Bootstrap.caret_right_fill, color: ui.NeumorphicColors.decorationMaxWhiteColor)
                        .paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
                  ),
              ],
            ).paddingOnly(bottom: 5),
          ),
        ],
      ),
    );
  }
}
