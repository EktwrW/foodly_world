import 'dart:async';

import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui show NeumorphicShape;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/feed_multi_image_view/feed_multi_image_view.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases/cubit/new_releases_cubit.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases/cubit/new_releases_state.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap, Clarity;

class NewReleasesCard extends StatefulWidget {
  const NewReleasesCard({super.key});

  @override
  State<NewReleasesCard> createState() => _NewReleasesCardState();
}

class _NewReleasesCardState extends State<NewReleasesCard> {
  Timer? _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<NewReleasesCubit>().load();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted) return;
      final businesses = context.read<NewReleasesCubit>().vm.businesses;
      if (businesses.length > 1) {
        setState(() => _currentIndex = (_currentIndex + 1) % businesses.length);
      }
    });
  }

  void _navigate(int delta, int total) {
    setState(() => _currentIndex = (_currentIndex + delta + total) % total);
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewReleasesCubit, NewReleasesState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => const SizedBox.shrink(),
          loading: (_) => const _NewReleasesPlaceholder(),
          loaded: (s) {
            if (s.vm.businesses.isEmpty) return const SizedBox.shrink();
            final total = s.vm.businesses.length;
            final idx = _currentIndex.clamp(0, total - 1);
            final business = s.vm.businesses[idx];
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedSwitcher(
                  duration: Durations.long2,
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                  child: _NewReleasesCardContent(
                    key: ValueKey(business.uuid),
                    business: business,
                  ),
                ),
                if (total > 1)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      CustomRoundedNeumorphicButton(
                        onPressed: () => _navigate(-1, total),
                        iconData: Bootstrap.chevron_left,
                        diameter: 20,
                        iconSize: 20,
                        shape: ui.NeumorphicShape.concave,
                      ),
                      ...List.generate(
                        total,
                        (i) => AnimatedContainer(
                          duration: Durations.short3,
                          width: i == idx ? 18 : 7,
                          height: 7,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: i == idx
                                ? FoodlyThemes.primaryFoodly
                                : FoodlyThemes.primaryFoodly.withValues(alpha: .25),
                          ),
                        ),
                      ),
                      CustomRoundedNeumorphicButton(
                        onPressed: () => _navigate(1, total),
                        iconData: Bootstrap.chevron_right,
                        diameter: 20,
                        iconSize: 20,
                        shape: ui.NeumorphicShape.concave,
                      ),
                    ],
                  ).paddingSymmetric(vertical: 10),
              ],
            );
          },
          error: (_) => const SizedBox.shrink(),
        );
      },
    );
  }
}

class _NewReleasesCardContent extends StatelessWidget {
  final BusinessDM business;

  const _NewReleasesCardContent({required this.business, super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrls =
        business.coverImages.map((c) => c.url).whereType<String>().where((url) => url.isNotEmpty).toList();

    final category = business.categoryId;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // Header badge
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
          ),
        ),
        // Main card
        GestureDetector(
          onTap: () => di<AppRouter>().appRouter.goNamed(
                AppRoutes.visitBusiness.name,
                pathParameters: {AppRoutes.routeIdParam: business.uuid},
                extra: business,
              ),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 320,
                  child: Stack(
                    children: [
                      // Cover photos
                      SizedBox(
                        height: 270,
                        width: context.screenWidth - 32,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          child: imageUrls.isNotEmpty
                              ? FeedMultipleImageView(imageUrls: imageUrls, radius: 12)
                              : ColoredBox(
                                  color: FoodlyThemes.primaryFoodly.withValues(alpha: .15),
                                  child: const Icon(Bootstrap.shop_window, size: 64, color: Colors.white54),
                                ),
                        ),
                      ),
                      // Logo + name overlay
                      Positioned(
                        bottom: 0,
                        right: 15,
                        left: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AvatarWidget(
                              avatarUrl: business.logo,
                              width: 100,
                              height: 100,
                              avatarType: AvatarType.business,
                            ),
                            SizedBox(
                              width: context.screenWidth - 170,
                              height: 54,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    business.name ?? '',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: FoodlyTextStyles.cardSubtitle,
                                  ),
                                  RatingBar.builder(
                                    initialRating: business.rating ?? 0.0,
                                    itemSize: 12,
                                    minRating: 1,
                                    allowHalfRating: true,
                                    ignoreGestures: true,
                                    itemBuilder: (_, __) => const Icon(Icons.star, color: Colors.amber, size: 10),
                                    onRatingUpdate: (_) {},
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
                // Bottom info row
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (business.aboutUs?.isNotEmpty == true)
                            Text(
                              business.aboutUs!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          else
                            const SizedBox(height: 40),
                          Row(
                            children: [
                              if (category != null) SizedBox.square(dimension: 30, child: category.avatar),
                              Card(
                                color: FoodlyThemes.tertiaryFoodly,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(width: 4),
                                    Text(
                                      [
                                        business.city,
                                        business.country?.value,
                                      ].whereType<String>().join(', '),
                                      style: FoodlyTextStyles.captionWhite,
                                    ),
                                    const Icon(Clarity.map_marker_solid, color: Colors.white, size: 16),
                                    const SizedBox(width: 4),
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
        ),
      ],
    );
  }
}

class _NewReleasesPlaceholder extends StatelessWidget {
  const _NewReleasesPlaceholder();

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
          ),
        ),
        const Card(
          child: SizedBox(
            height: 320,
            child: Center(child: CircularProgressIndicator.adaptive()),
          ),
        ).paddingOnly(top: 25),
      ],
    );
  }
}
