import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/event_tracking_service.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/favorite_button.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

/// Small "from <currency>N" pill used on catering cards to set price
/// expectations before the user taps into the detail view. Rendered only when
/// the BE populated `min_service_price` on the business (currently only from
/// GET /business/nearby).
///
/// [currency] is the symbol the business is priced in — derived from the
/// business's country at the callsite (BusinessDM.country?.currencySymbol).
/// We pass it explicitly rather than reading the auth-session currency,
/// because this widget renders OTHER businesses' cards in the discovery
/// feed, not the logged-in user's own business.
Widget _buildMinPriceBadge(double minPrice, String currency) {
  // Locale-aware thousands separator is overkill for the price range
  // catering packages typically live in — keep it simple.
  final priceLabel =
      minPrice.truncateToDouble() == minPrice ? minPrice.toInt().toString() : minPrice.toStringAsFixed(2);
  return DecoratedBox(
    decoration: BoxDecoration(
      color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.3), width: 0.6),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Bootstrap.tag_fill, size: 10, color: FoodlyThemes.primaryFoodly),
        const SizedBox(width: 4),
        Text(
          S.current.priceFromBadge(currency, priceLabel),
          style: FoodlyTextStyles.labelBoldMini.copyWith(color: FoodlyThemes.primaryFoodly),
        ),
      ],
    ).paddingSymmetric(horizontal: 8, vertical: 2),
  );
}

class BusinessListCard extends StatelessWidget {
  final BusinessDM business;
  final String heroTagPrefix;
  final int? searchPosition;
  final String? searchQuery;

  const BusinessListCard({
    super.key,
    required this.business,
    required this.heroTagPrefix,
    this.searchPosition,
    this.searchQuery,
  });

  Widget _buildStatusBadge(BusinessStatus status) {
    final (text, color) = switch (status) {
      BusinessStatus.open => ('Open', FoodlyThemes.tertiaryFoodly),
      BusinessStatus.closed => ('Closed', FoodlyThemes.error),
      BusinessStatus.openingSoon => ('Open Soon', FoodlyThemes.warning),
    };

    return DecoratedBox(
      decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
      child: Text(text, style: FoodlyTextStyles.labelBoldMini.copyWith(color: color)).paddingSymmetric(
        horizontal: 8,
        vertical: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentDay = business.businessDays.currentDaySchedule;

    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          if (searchPosition != null) {
            di<EventTrackingService>().track(
              'search.result_clicked',
              'search_results_list',
              page: 'search_results',
              targetType: 'business',
              targetUuid: business.uuid,
              position: searchPosition,
              query: searchQuery,
              data: {'business_name': business.name},
            );
          }
          di<AppRouter>().appRouter.goNamed(AppRoutes.visitBusiness.name,
              pathParameters: {AppRoutes.routeIdParam: business.uuid}, extra: business);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  AvatarWidget(
                    avatarUrl: business.logo,
                    avatarStyle: AvatarStyle.square,
                    height: 60,
                    width: 60,
                    avatarType: AvatarType.business,
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
                  FavoriteButton.forBusinessCard(
                    key: ValueKey(business.uuid),
                    diameter: 28,
                    iconSize: 16,
                    business: business,
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
                  if (business.minServicePrice != null) ...[
                    const SizedBox(width: 4),
                    _buildMinPriceBadge(
                      business.minServicePrice!,
                      // Discovery card → other business's currency, NOT the
                      // logged-in user's. Fallback `$` matches MenuVM /
                      // AuthSessionService.currency convention.
                      business.country?.currencySymbol ?? '\$',
                    ),
                  ],
                  const Spacer(),
                  SizedBox.square(
                    dimension: 28,
                    child: business.categoryAvatar,
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
  final int? searchPosition;
  final String? searchQuery;

  const BusinessGridCard({
    super.key,
    required this.business,
    required this.heroTagPrefix,
    this.searchPosition,
    this.searchQuery,
  });

  Widget _buildStatusBadge(BusinessStatus status) {
    final (text, color) = switch (status) {
      BusinessStatus.open => ('Open', FoodlyThemes.tertiaryFoodly),
      BusinessStatus.closed => ('Closed', FoodlyThemes.error),
      BusinessStatus.openingSoon => ('Open Soon', FoodlyThemes.warning),
    };

    return DecoratedBox(
      decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
      child: Text(text, style: FoodlyTextStyles.labelBoldMini.copyWith(color: color)).paddingSymmetric(
        horizontal: 8,
        vertical: 2,
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
          onTap: () {
            if (searchPosition != null) {
              di<EventTrackingService>().track(
                'search.result_clicked',
                'search_results_list',
                page: 'search_results',
                targetType: 'business',
                targetUuid: business.uuid,
                position: searchPosition,
                query: searchQuery,
                data: {'business_name': business.name},
              );
            }
            di<AppRouter>().appRouter.goNamed(AppRoutes.visitBusiness.name,
                pathParameters: {AppRoutes.routeIdParam: business.uuid}, extra: business);
          },
          child: Column(
            spacing: 8,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: AvatarWidget(
                      avatarUrl: business.logo,
                      avatarStyle: AvatarStyle.square,
                      height: double.infinity,
                      width: double.infinity,
                      avatarType: AvatarType.business,
                    ),
                  ),
                  Positioned(
                    top: 3,
                    right: 3,
                    child: FavoriteButton.forBusinessCard(
                      key: ValueKey(business.uuid),
                      diameter: 28,
                      iconSize: 16,
                      business: business,
                    ),
                  ),
                  if (business.minServicePrice != null)
                    Positioned(
                      bottom: 6,
                      left: 6,
                      // Same comment as the list-card callsite: this is
                      // another business's badge in the discovery feed,
                      // so use that business's currency (not the auth one).
                      child: _buildMinPriceBadge(
                        business.minServicePrice!,
                        business.country?.currencySymbol ?? '\$',
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
                      SizedBox.square(
                        dimension: 28,
                        child: business.categoryAvatar,
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
