import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumo/flutter_neumo.dart' as ui;
import 'package:foodly_world/core/enums/foodly_categories_enums.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
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
  final carouselController = CarouselSliderController();
  final current = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(gradient: UIDecorations.GLASSMORPHIC_PURPLE_GRADIENT),
      child: Column(
        children: [
          CarouselSlider(
            items: FoodlyCategories.values
                .map((e) => ui.NeumoRadio<FoodlyCategories>(
                      onChanged: (value) {
                        log('pressed: $e');
                        log('$value');
                        context.goNamed(AppRoutes.categories.name, extra: e);
                      },
                      value: e,
                      padding: const EdgeInsets.all(4),
                      style: const ui.NeumoRadioStyle(
                          shape: ui.NeumoShape.concave,
                          intensity: .6,
                          unselectedDepth: 2,
                          unselectedColor: ui.NeumoColors.decorationMaxWhiteColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox.square(dimension: 48, child: e.icon).paddingTop(4),
                          SizedBox(
                            width: 92,
                            height: 33,
                            child: Center(
                              child: Text(
                                e.text,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                softWrap: false,
                                style: FoodlyTextStyles.categoryButtonText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).paddingOnly(top: 10, bottom: 8))
                .toList(),
            carouselController: carouselController,
            options: CarouselOptions(
              onPageChanged: (index, reason) => current.value = index,
              height: 118,
              viewportFraction: context.isFoldableInHalfView ? .41 : .33,
              aspectRatio: 3.0,
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (kIsWeb)
                  InkWell(
                    onTap: () => carouselController.previousPage(duration: Durations.medium4, curve: Curves.linear),
                    child: const Icon(Bootstrap.caret_left_fill, color: ui.NeumoColors.decorationMaxWhiteColor)
                        .paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
                  ),
                ...FoodlyCategories.values.asMap().entries.map(
                  (entry) {
                    return GestureDetector(
                      onTap: () {
                        carouselController.animateToPage(
                          entry.key,
                          duration: Durations.long2,
                          curve: Curves.decelerate,
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
                            width: thisIsCurrent ? 10 : 7.5,
                            height: 12,
                            margin: kIsWeb
                                ? const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0)
                                : const EdgeInsets.all(7.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black)
                                  .withValues(alpha: thisIsCurrent ? 0.8 : 0.3),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                if (kIsWeb)
                  InkWell(
                    onTap: () => carouselController.nextPage(duration: Durations.medium4, curve: Curves.linear),
                    child: const Icon(Bootstrap.caret_right_fill, color: ui.NeumoColors.decorationMaxWhiteColor)
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
