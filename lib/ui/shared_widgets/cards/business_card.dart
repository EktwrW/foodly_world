import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/favorite_button.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
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
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => di<AppRouter>().appRouter.goNamed(AppRoutes.visitBusiness.name,
            pathParameters: {AppRoutes.routeIdParam: business.uuid}, extra: business),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  LocalHero(
                    tag: 'avatar-$heroTagPrefix',
                    child: AvatarWidget(
                      avatarUrl: business.logo,
                      avatarStyle: AvatarStyle.square,
                      height: 60,
                      width: 60,
                      avatarType: AvatarType.business,
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
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
                    child: FavoriteButton.forBusinessCard(
                      key: ValueKey(business.uuid),
                      diameter: 28,
                      iconSize: 16,
                      business: business,
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
                    style: FoodlyTextStyles.labelBoldMini,
                  ),
                  const Spacer(),
                  LocalHero(
                    tag: 'category-$heroTagPrefix',
                    child: SizedBox.square(
                      dimension: 28,
                      child: business.categoryAvatar,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).paddingAll(8),
      ),
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
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () => di<AppRouter>().appRouter.goNamed(AppRoutes.visitBusiness.name,
              pathParameters: {AppRoutes.routeIdParam: business.uuid}, extra: business),
          child: Column(
            spacing: 8,
            children: [
              Stack(
                children: [
                  LocalHero(
                    tag: 'avatar-$heroTagPrefix',
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: AvatarWidget(
                        avatarUrl: business.logo,
                        avatarStyle: AvatarStyle.square,
                        height: double.infinity,
                        width: double.infinity,
                        avatarType: AvatarType.business,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 3,
                    right: 3,
                    child: LocalHero(
                      tag: 'like-$heroTagPrefix',
                      child: FavoriteButton.forBusinessCard(
                        key: ValueKey(business.uuid),
                        diameter: 28,
                        iconSize: 16,
                        business: business,
                      ),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      business.name ?? '-',
                      style: FoodlyTextStyles.captionPurpleBold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            business.fullAddress,
                            style: FoodlyTextStyles.cardsSmallSubtitle,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ).paddingBottom(4),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                spacing: 6,
                children: [
                  Text(
                    currentDay.formattedHours,
                    style: FoodlyTextStyles.labelBoldMini,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatusBadge(currentDay.currentStatus),
                      LocalHero(
                        tag: 'category-$heroTagPrefix',
                        child: SizedBox.square(
                          dimension: 28,
                          child: business.categoryAvatar,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ).paddingAll(8),
        ),
      ),
    );
  }
}
