import 'package:flutter/material.dart';
import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/like_button.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:local_hero/local_hero.dart';

class BusinessListCard extends StatelessWidget {
  final BusinessDM business;
  final String heroTagPrefix;

  const BusinessListCard({
    super.key,
    required this.business,
    required this.heroTagPrefix,
  });

  Widget _buildStatusBadge(BusinessStatus status) {
    final (text, color) = switch (status) {
      BusinessStatus.open => ('Open', FoodlyThemes.tertiaryFoodly),
      BusinessStatus.closed => ('Closed', FoodlyThemes.error),
      BusinessStatus.openingSoon => ('Open Soon', FoodlyThemes.warning),
    };

    return LocalHero(
      tag: 'status-$heroTagPrefix',
      child: DecoratedBox(
        decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
        child: Text(text, style: FoodlyTextStyles.labelBoldMini.copyWith(color: color)).paddingSymmetric(
          horizontal: 8,
          vertical: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentDay = business.businessDays.currentDaySchedule;

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                LocalHero(
                  tag: 'avatar-$heroTagPrefix',
                  child: AvatarWidget(
                    avatarUrl: business.logo,
                    avatarStyle: AvatarStyle.square,
                    height: 60,
                    width: 60,
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          business.name ?? '-',
                          style: FoodlyTextStyles.captionPurpleBold,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                business.fullAddress,
                                style: FoodlyTextStyles.cardsSmallSubtitle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                LocalHero(
                  tag: 'like-$heroTagPrefix',
                  child: LikeButton(
                    liked: true,
                    onPressed: () {},
                    diameter: 15,
                    iconSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              spacing: 8,
              children: [
                _buildStatusBadge(currentDay.currentStatus),
                Text(
                  currentDay.formattedHours,
                  style: FoodlyTextStyles.caption,
                ),
                const Spacer(),
                LocalHero(
                  tag: 'category-$heroTagPrefix',
                  child: SizedBox.square(dimension: 28, child: business.category?.icon ?? const SizedBox.shrink()),
                ),
              ],
            ),
          ),
        ],
      ).paddingAll(8),
    );
  }
}

class BusinessGridCard extends StatelessWidget {
  final BusinessDM business;
  final String heroTagPrefix;

  const BusinessGridCard({
    super.key,
    required this.business,
    required this.heroTagPrefix,
  });

  Widget _buildStatusBadge(BusinessStatus status) {
    final (text, color) = switch (status) {
      BusinessStatus.open => ('Open', FoodlyThemes.tertiaryFoodly),
      BusinessStatus.closed => ('Closed', FoodlyThemes.error),
      BusinessStatus.openingSoon => ('Open Soon', FoodlyThemes.warning),
    };

    return LocalHero(
      tag: 'status-$heroTagPrefix',
      child: DecoratedBox(
        decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
        child: Text(text, style: FoodlyTextStyles.labelBoldMini.copyWith(color: color)).paddingSymmetric(
          horizontal: 8,
          vertical: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentDay = business.businessDays.currentDaySchedule;

    return SizedBox(
      width: context.screenWidth * .43,
      child: Card(
        child: Column(
          spacing: 8,
          children: [
            Expanded(
              child: Stack(
                children: [
                  LocalHero(
                    tag: 'avatar-$heroTagPrefix',
                    child: AvatarWidget(
                      avatarUrl: business.logo,
                      avatarStyle: AvatarStyle.square,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LocalHero(
                        tag: 'like-$heroTagPrefix',
                        child: LikeButton(
                          liked: true,
                          onPressed: () {},
                          diameter: 15,
                          iconSize: 16,
                        ),
                      ),
                    ],
                  ).paddingAll(3),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    business.name ?? '-',
                    style: FoodlyTextStyles.captionPurpleBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          business.fullAddress,
                          style: FoodlyTextStyles.cardsSmallSubtitle,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingBottom(4),
            Column(
              spacing: 3,
              children: [
                Text(
                  currentDay.formattedHours,
                  style: FoodlyTextStyles.caption,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatusBadge(currentDay.currentStatus),
                    LocalHero(
                      tag: 'category-$heroTagPrefix',
                      child: SizedBox.square(dimension: 28, child: business.category?.icon ?? const SizedBox.shrink()),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ).paddingAll(8),
      ),
    );
  }
}
