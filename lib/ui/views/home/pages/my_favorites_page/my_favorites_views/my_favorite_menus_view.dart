part of '../my_favorites_page.dart';

class MyFavoriteMenusView extends StatelessWidget {
  const MyFavoriteMenusView({super.key});

  static const _padding = EdgeInsets.only(right: 8, left: 8, bottom: 44, top: 4);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MyFavoritesCubit, MyFavoritesState, List<MenuDM>>(
      selector: (state) {
        return state.vm.favoriteMenus;
      },
      builder: (context, favoriteMenus) {
        final cubit = context.read<MyFavoritesCubit>();

        if (favoriteMenus.isEmpty) {
          return Column(
            spacing: 24,
            children: [
              const Asset(FoodlyAssets.searchBusinessAgain, width: 40),
              Text(
                'Aun no tienes menús en tu lista de favoritos',
                style: FoodlyTextStyles.actionsBody.copyWith(fontStyle: FontStyle.italic, height: 1.9),
                textAlign: TextAlign.center,
              ).paddingHorizontal(context.screenWidth * .1),
            ],
          ).paddingTop(100);
        }

        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                key: const ValueKey(SearchResultsViewMode.list),
                itemCount: favoriteMenus.length,
                padding: _padding,
                separatorBuilder: (_, __) => const SizedBox(height: 4),
                itemBuilder: (context, index) {
                  final menuItem = favoriteMenus[index];
                  return _FavoriteMenusCard(
                    key: Key(menuItem.uuid),
                    menuItem: menuItem,
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}

class _FavoriteMenusCard extends StatelessWidget {
  final MenuDM menuItem;

  const _FavoriteMenusCard({super.key, required this.menuItem});

  String get _publicMenuUrl {
    final baseUrl = di<BaseConfig>().foodlyBaseUrl;
    final menuUrl = '$baseUrl${AppRoutes.visitMenu.path.replaceFirst(':id', menuItem.uuid)}';
    return menuUrl;
  }

  @override
  Widget build(BuildContext context) {
    final business = menuItem.business;
    final currentDay = menuItem.business?.businessDays.currentDaySchedule;

    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => di<AppRouter>().appRouter.goNamed(
              AppRoutes.visitMenu.name,
              pathParameters: {AppRoutes.routeIdParam: menuItem.uuid},
              extra: menuItem,
            ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [
            Flexible(
              child: ClayContainer(
                spread: 2,
                borderRadius: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.menu_book,
                      size: 36,
                      color: FoodlyThemes.primaryFoodly,
                    ),
                    Column(
                      spacing: 6,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            'Ver el menú de',
                            style: FoodlyTextStyles.homeAppBarSmallSubtitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Flexible(
                          child: Flexible(
                            child: Text(
                              business?.name ?? '-',
                              style: FoodlyTextStyles.actionsBodyBold,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox.square(
                      dimension: 33,
                      child: FavoriteButton.forMenu(
                        key: ValueKey(menuItem.uuid),
                        diameter: 18,
                        iconSize: 16,
                        menu: menuItem,
                      ),
                    ),
                  ],
                ).paddingAll(8),
              ),
            ),
            Flexible(
              child: Row(
                spacing: 8,
                children: [
                  if (currentDay != null) _buildStatusBadge(currentDay.currentStatus),
                  if (currentDay != null)
                    Text(
                      currentDay.formattedHours,
                      style: FoodlyTextStyles.caption,
                    ),
                  const Spacer(),
                  SizedBox.square(dimension: 28, child: menuItem.business?.category?.icon ?? const SizedBox.shrink()),
                  CustomRoundedNeumorphicButton(
                    onPressed: _publicMenuUrl.isNotEmpty
                        ? () async {
                            try {
                              await Share.share(
                                S.current.shareMenuMessage(
                                    business?.name ?? '-'.toBold(), ('Foodly').toBold(), _publicMenuUrl),
                                subject: S.current.shareMenuSubject,
                              );
                            } catch (e) {
                              di<Logger>().e('Error sharing menu: $e');

                              if (context.mounted) {
                                FoodlySnackbars.errorGeneric(context, S.current.shareMenuError);
                              }
                            }
                          }
                        : null,
                    tooltip: S.current.shareMenu,
                    iconSize: 18,
                    diameter: 18,
                    iconData: Bootstrap.send,
                  ).paddingRight(7),
                ],
              ),
            ),
          ],
        ).paddingAll(8),
      ),
    );
  }

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
}
