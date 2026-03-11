import 'dart:ui' as dart_ui show ImageFilter;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodly_world/core/core_exports.dart' show S, AppRoutes, AppRouter, di;
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/data_models/promotions/nearby_promotion_dm.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart'
    show CustomRoundedNeumorphicButton;
import 'package:foodly_world/ui/shared_widgets/buttons/favorite_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/home/widgets/top_offers/cubit/nearby_promotions_cubit.dart';
import 'package:foodly_world/ui/views/home/widgets/top_offers/cubit/nearby_promotions_state.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap, FontAwesome;

class TopOffersWidget extends StatefulWidget {
  const TopOffersWidget({super.key});

  @override
  State<TopOffersWidget> createState() => _TopOffersWidgetState();
}

class _TopOffersWidgetState extends State<TopOffersWidget> {
  static final _carouselController = CarouselSliderController();

  @override
  void initState() {
    super.initState();
    context.read<NearbyPromotionsCubit>().load();
  }

  void _onPageChanged(int index, List<NearbyPromotionDM> promotions, bool hasMore) {
    // Trigger loadMore when 3 items from the end
    if (hasMore && index >= promotions.length - 3) {
      context.read<NearbyPromotionsCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NearbyPromotionsCubit, NearbyPromotionsState>(
      builder: (context, state) {
        final vm = state.vm;
        final promotions = vm.promotions;

        // Loading skeleton
        if (vm.isLoading && promotions.isEmpty) {
          return const SizedBox(
            height: 369,
            child: Center(child: CircularProgressIndicator.adaptive()),
          );
        }

        // Error / empty state — keep the carousel height to avoid layout jump
        if (promotions.isEmpty) {
          return const SizedBox(height: 369);
        }

        return CarouselSlider(
          items: promotions.asMap().entries.map((e) => _PromoCard(promo: e.value)).toList(),
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 369,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeFactor: .15,
            viewportFraction: context.screenWidth <= 360 ? .85 : .8,
            onPageChanged: (index, _) => _onPageChanged(index, promotions, vm.hasMore),
          ),
        );
      },
    );
  }
}

class _PromoCard extends StatelessWidget {
  final NearbyPromotionDM promo;
  const _PromoCard({required this.promo});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NearbyPromotionsCubit>();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      color: ui.NeumorphicColors.decorationMaxWhiteColor,
      child: Stack(
        children: [
          Column(
            children: [
              // Media (external link, GCS image, or placeholder)
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: _buildMedia(),
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: _BackdropRoundedRectangle(promo),
          ),

          // Favorite button
          Positioned(
            right: 6,
            top: 6,
            child: UIFavoriteWidget(
              liked: promo.isFavorited,
              addFavoriteIcon: FontAwesome.heart_circle_plus_solid,
              isFavoriteIcon: FontAwesome.heart_circle_check_solid,
              onPressed: () => cubit.toggleFavorite(promo.uuid),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedia() {
    // External URL (YouTube, etc.)
    final mediaUrl = promo.mediaLink?.isNotEmpty == true ? promo.mediaLink! : promo.promoMedia?.mediaUrl;

    if (mediaUrl != null && mediaUrl.isNotEmpty) {
      return CachedNetworkImage(imageUrl: mediaUrl, fit: BoxFit.cover);
    }

    // Business logo fallback
    if (promo.businessLogo != null && promo.businessLogo!.isNotEmpty) {
      return CachedNetworkImage(imageUrl: promo.businessLogo!, fit: BoxFit.cover);
    }

    return const ColoredBox(
      color: FoodlyThemes.primaryFoodly,
      child: Center(
        child: Icon(Bootstrap.megaphone_fill, color: Colors.white, size: 40),
      ),
    );
  }
}

class _BackdropRoundedRectangle extends StatelessWidget {
  final NearbyPromotionDM promo;

  const _BackdropRoundedRectangle(this.promo);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: BackdropFilter(
              filter: dart_ui.ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                decoration: BoxDecoration(
                  color: ui.NeumorphicColors.embossMaxWhiteColor.withValues(alpha: .39),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(6),
                child: SizedBox(
                  width: constraints.maxWidth * 0.9,
                  height: constraints.maxHeight * 0.36,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Title + subtitle
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: Text(
                                promo.title,
                                style: FoodlyTextStyles.secondaryTitle.copyWith(
                                  color: FoodlyThemes.primaryFoodly,
                                  fontSize: 16,
                                  shadows: [
                                    const Shadow(
                                      color: Colors.white,
                                      offset: Offset(0, 1),
                                      blurRadius: 16,
                                    ),
                                    const Shadow(
                                      color: Colors.white,
                                      offset: Offset(0, -1),
                                      blurRadius: 16,
                                    ),
                                    const Shadow(
                                      color: Colors.white,
                                      offset: Offset(1, 0),
                                      blurRadius: 16,
                                    ),
                                  ],
                                ),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                promo.subTitle,
                                style: FoodlyTextStyles.cardsSmallSubtitle,
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Icon(
                              Bootstrap.megaphone_fill,
                              color: FoodlyThemes.tertiaryFoodly,
                              size: 16,
                            ).paddingTop(3)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Business name + rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    promo.businessName,
                    style: FoodlyTextStyles.promoBusinessName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  RatingBar.builder(
                    initialRating: promo.ratingAvg,
                    itemSize: 13,
                    minRating: 1,
                    allowHalfRating: true,
                    ignoreGestures: true,
                    itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber, size: 13),
                    onRatingUpdate: (_) {},
                  ),
                ],
              ).paddingSymmetric(horizontal: 6, vertical: 6),
              Row(
                spacing: 16,
                children: [
                  CustomRoundedNeumorphicButton(
                    onPressed: (promo.businessUuid.isNotEmpty)
                        ? () => di<AppRouter>().appRouter.goNamed(
                              AppRoutes.visitBusiness.name,
                              pathParameters: {AppRoutes.routeIdParam: promo.businessUuid},
                            )
                        : null,
                    tooltip: 'Visit Business Page',
                    iconSize: 16,
                    diameter: 16,
                    iconData: Bootstrap.shop_window,
                  ),
                  CustomRoundedNeumorphicButton(
                    onPressed: () {},
                    tooltip: S.current.generateQR,
                    iconSize: 16,
                    diameter: 16,
                    iconData: Bootstrap.fullscreen,
                  ),
                ],
              ).paddingSymmetric(horizontal: 6, vertical: 6),
            ],
          ).paddingSymmetric(horizontal: 12),
        ],
      );
    }).paddingBottom(6);
  }
}
