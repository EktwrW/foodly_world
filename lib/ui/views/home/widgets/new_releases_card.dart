import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/consts/foodly_mocks.dart';
import 'package:foodly_world/core/enums/foodly_categories_enums.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/image/feed_multi_image_view/feed_multi_image_view.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart' show Clarity;
import 'package:neumorphic_ui/neumorphic_ui.dart';

class NewReleasesCard extends StatelessWidget {
  const NewReleasesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Card(
            color: FoodlyThemes.primaryFoodly,
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.current.newBranch, style: FoodlyTextStyles.cardsHeader).paddingOnly(top: 3),
                ],
              ),
            )),
        Card(
          child: Column(
            children: [
              SizedBox(
                height: 320,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 270,
                      width: context.screenWidth - 40,
                      child: const ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: FeedMultipleImageView(
                          imageUrls: FoodlyMocks.BUSINESS_PICTURES_1,
                          radius: 12,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 15,
                      left: 0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            child: Asset(
                              FoodlyAssets.logoRamalha,
                              width: 100,
                            ),
                          ),
                          SizedBox(
                            width: context.screenWidth - 170,
                            height: 54,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Panaderia Ramalha',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: FoodlyTextStyles.cardSubtitle,
                                ),
                                RatingBar.builder(
                                  initialRating: 4.3,
                                  itemSize: 12,
                                  minRating: 1,
                                  allowHalfRating: true,
                                  itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber, size: 10),
                                  onRatingUpdate: (rating) {},
                                ),
                              ],
                            ).paddingOnly(left: 12, top: 4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(S.current.mockTextNewReleasesCard),
                        Row(
                          children: [
                            SizedBox.square(dimension: 30, child: FoodlyCategories.bakery.icon),
                            Card(
                              color: FoodlyThemes.tertiaryFoodly,
                              child: const Row(
                                children: [
                                  SizedBox(width: 4),
                                  Text('Covilha, 6200-507 ', style: FoodlyTextStyles.captionWhite),
                                  Icon(Clarity.map_marker_solid, color: Colors.white, size: 16),
                                  SizedBox(width: 4),
                                ],
                              ).paddingAll(3),
                            ).paddingOnly(left: 4),
                            const Spacer(),
                            const Text.rich(
                              TextSpan(
                                text: '+ info',
                                style: FoodlyTextStyles.cardTextButtonBlue,
                              ),
                            ).paddingOnly(right: 10),
                          ],
                        ).paddingOnly(top: 4),
                      ],
                    ),
                  ),
                ],
              ).paddingAll(12),
            ],
          ),
        ).paddingOnly(top: 25),
      ],
    );
  }
}
