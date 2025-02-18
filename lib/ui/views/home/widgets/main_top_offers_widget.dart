import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumo/flutter_neumo.dart' as ui;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/like_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
//import 'package:foodly_world/ui/views/business/promotions/promotions_page.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class TopOffersWidget extends StatelessWidget {
  const TopOffersWidget({
    super.key,
  });

  static final promosCarouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: MockPromos.values
          .asMap()
          .entries
          .map(
            (e) => Card(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              color: ui.NeumoColors.decorationMaxWhiteColor,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image.asset(e.value.imageUrl, fit: BoxFit.cover, height: 160),
                              // child: PromoMedia(
                              //   externalUrl: e.value.imageUrl, //widget.promo.mediaLink ?? '',
                              //   promoMedia: null,
                              //   // widget.promo.mediaFileIsExternalLink ? null : widget.promo.promoMedia.first,
                              //   title: e.value.title, //widget.promo.title,
                              // ),
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
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    e.value.subtitle,
                                    style: FoodlyTextStyles.cardsSmallSubtitle,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const Icon(
                                    Bootstrap.megaphone_fill,
                                    color: FoodlyThemes.tertiaryFoodly,
                                    size: 16,
                                  ).paddingOnly(left: 6)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(right: 3, top: 3, child: LikeButton(liked: e.key.isOdd)),
                  Positioned(
                    top: 136,
                    left: 1,
                    child: ui.Neumo(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      style: ui.NeumoStyle(
                          depth: 1,
                          color: Colors.white.withValues(alpha: .9),
                          boxShape: ui.NeumoBoxShape.roundRect(const BorderRadius.all(Radius.circular(3)))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.value.storeName,
                            style: FoodlyTextStyles.promoBusinessName,
                          ),
                          RatingBar.builder(
                            initialRating: 4.3,
                            itemSize: 13,
                            minRating: 1,
                            allowHalfRating: true,
                            itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber, size: 13),
                            onRatingUpdate: (rating) => log('$rating'),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 4),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
      carouselController: promosCarouselController,
      options: CarouselOptions(
        height: 254,
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
