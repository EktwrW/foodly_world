import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/like_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class TopOffersWidget extends StatelessWidget {
  const TopOffersWidget({
    super.key,
  });

  static final promosCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: MockPromos.values
          .asMap()
          .entries
          .map(
            (e) => NeumorphicButton(
              padding: EdgeInsets.zero,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              style: const NeumorphicStyle(
                  shape: NeumorphicShape.concave, color: NeumorphicColors.decorationMaxWhiteColor),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Image.asset(e.value.imageUrl, fit: BoxFit.cover, height: 160),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 5,
                            child: Neumorphic(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              style: NeumorphicStyle(
                                  color: Colors.white70,
                                  boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.all(Radius.circular(3)))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.value.storeName,
                                    style: FoodlyTextStyles.promoBusinessName,
                                  ),
                                  RatingBar.builder(
                                    initialRating: 4.3,
                                    itemSize: 12,
                                    minRating: 1,
                                    allowHalfRating: true,
                                    itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber, size: 10),
                                    onRatingUpdate: (rating) => log('$rating'),
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 4),
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: Text(
                                e.value.title,
                                style: FoodlyTextStyles.promoTitle,
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    e.value.subtitle,
                                    style: FoodlyTextStyles.promoSubtitle,
                                  ),
                                  Icon(
                                    Bootstrap.megaphone_fill,
                                    color: Colors.green[700],
                                    size: 14,
                                  ).paddingOnly(left: 6)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(right: 5, top: 5, child: LikeWidget(like: e.key.isOdd)),
                ],
              ),
            ),
          )
          .toList(),
      carouselController: promosCarouselController,
      options: CarouselOptions(
        height: 230,
        autoPlay: true,
        enlargeCenterPage: true,
        enlargeFactor: .15,
        viewportFraction: context.screenWidth <= 320 ? .85 : .75,
      ),
    );
  }
}

// TODO: remove when real promos are ready
enum MockPromos {
  sushi('assets/images/sushi.webp', 'Sushi bar SA', 'Promo Dinner', 'This weekend'),
  pizza('assets/images/pizza.jpg', 'Pizza Italiana SA', 'Free drink cup', 'Fridays and Saturdays'),
  breakfast('assets/images/breakfast.webp', "Tiffany's SA", '2 x 1 in breakfast', 'And coffee free'),
  grill('assets/images/parrilla.jpg', 'Grill Masters LLC', '20% discount', 'Promo code'),
  market('assets/images/market.jpg', 'Maxim Supermarket SA', '3 x 2 for all fresh', 'This month');

  final String imageUrl;
  final String storeName;
  final String title;
  final String subtitle;
  const MockPromos(this.imageUrl, this.storeName, this.title, this.subtitle);
}
