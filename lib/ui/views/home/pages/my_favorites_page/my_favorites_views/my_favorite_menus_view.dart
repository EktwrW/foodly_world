part of '../my_favorites_page.dart';

class MyFavoriteMenusView extends StatelessWidget {
  const MyFavoriteMenusView({super.key});

  static const _padding = EdgeInsets.only(right: 8, left: 8, bottom: 44, top: 4);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FavoritesCubit, FavoritesState, List<MenuDM>>(
      selector: (state) {
        return state.vm.favoriteMenus;
      },
      builder: (context, favoriteMenus) {
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
                key: const Key('my-favs-menus-view'),
                itemCount: favoriteMenus.length,
                controller: ScrollController(),
                padding: _padding,
                separatorBuilder: (_, __) => const SizedBox(height: 6),
                itemBuilder: (context, index) {
                  final menu = favoriteMenus[index];
                  return _FavoriteMenusCard(
                    key: const Key('my-favs-menus-view'),
                    menu: menu,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _FavoriteMenusCard extends StatelessWidget {
  final MenuDM menu;

  const _FavoriteMenusCard({super.key, required this.menu});

  String get _publicMenuUrl {
    final baseUrl = di<BaseConfig>().foodlyBaseUrl;
    final menuUrl = '$baseUrl${AppRoutes.visitMenu.path.replaceFirst(':id', menu.uuid)}';
    return menuUrl;
  }

  @override
  Widget build(BuildContext context) {
    final business = menu.business;
    final currentDay = menu.business?.businessDays.currentDaySchedule;

    return Card(
      key: Key(menu.uuid),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => di<AppRouter>().appRouter.goNamed(
              AppRoutes.visitMenu.name,
              pathParameters: {AppRoutes.routeIdParam: menu.uuid},
              extra: business,
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
                          child: Text(
                            business?.name ?? '-',
                            style: FoodlyTextStyles.actionsBodyBold,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    RepaintBoundary(
                      child: SizedBox.square(
                        dimension: 33,
                        child: FavoriteButton.forMenu(
                          key: Key(menu.uuid),
                          diameter: 18,
                          iconSize: 16,
                          menu: menu,
                        ),
                      ),
                    ),
                  ],
                ).paddingAll(8),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentDay != null)
                    Row(
                      spacing: 8,
                      children: [
                        _buildStatusBadge(currentDay.currentStatus),
                        Text(
                          currentDay.formattedHours,
                          style: FoodlyTextStyles.labelBoldMini,
                        ),
                      ],
                    ),
                  SizedBox.square(
                    dimension: 28,
                    child: menu.business?.categoryAvatar ?? const SizedBox.shrink(),
                  ),
                ],
              ).paddingHorizontal(3),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomRoundedNeumorphicButton(
                    onPressed: (business?.uuid.isNotEmpty ?? false)
                        ? () => di<AppRouter>().appRouter.goNamed(AppRoutes.visitBusiness.name,
                            pathParameters: {AppRoutes.routeIdParam: business!.uuid}, extra: business)
                        : null,
                    tooltip: S.current.shareMenu,
                    iconSize: 18,
                    diameter: 18,
                    iconData: Bootstrap.shop_window,
                  ),
                  CustomRoundedNeumorphicButton(
                    onPressed: () => MenuSnackbars.showQRCodeSnackBar(context, _publicMenuUrl),
                    tooltip: S.current.shareMenu,
                    iconSize: 18,
                    diameter: 18,
                    iconData: Bootstrap.qr_code_scan,
                  ),
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
                  ),
                ],
              ).paddingBottom(3),
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
