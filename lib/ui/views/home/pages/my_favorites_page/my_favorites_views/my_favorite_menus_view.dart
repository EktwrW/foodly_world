part of '../my_favorites_page.dart';

class MyFavoriteMenusView extends StatelessWidget {
  const MyFavoriteMenusView({super.key});

  static const _padding = EdgeInsets.only(right: 8, left: 8, bottom: 150, top: 4);

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Bootstrap.search_heart, size: 64, color: FoodlyThemes.secondaryFoodly),
              Text(
                S.current.noFavoriteMenus,
                style: FoodlyTextStyles.actionsBody.copyWith(fontStyle: FontStyle.italic, height: 1.9),
                textAlign: TextAlign.center,
              ).paddingHorizontal(context.screenWidth * .1),
            ],
          ).paddingBottom(120);
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
    // Use the flat businessUuid field on the menu — menu.business is null in
    // the favorites payload (BusinessMenuResource only ships flat
    // business_uuid / business_name, not the full BusinessDM). Without this
    // the share + QR buttons stayed disabled forever in the favorites view
    // because _publicMenuUrl resolved to ''.
    final uuid = menu.businessUuid;
    return uuid.isEmpty ? '' : 'https://menu.foodly.solutions/$uuid';
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
                            S.current.viewMenuOf,
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
                    tooltip: S.current.visitBusinessPage,
                    iconSize: 18,
                    diameter: 18,
                    iconData: Bootstrap.shop_window,
                  ),
                  CustomRoundedNeumorphicButton(
                    onPressed: () => MenuSnackbars.showQRCodeSnackBar(context, _publicMenuUrl),
                    tooltip: S.current.generateQR,
                    iconSize: 18,
                    diameter: 18,
                    iconData: Bootstrap.qr_code_scan,
                  ),
                  CustomRoundedNeumorphicButton(
                    onPressed: _publicMenuUrl.isNotEmpty
                        ? () async {
                            try {
                              await Share.share(
                                // Use flat businessName from
                                // BusinessMenuResource — menu.business is null
                                // on the favorites payload (BE doesn't ship
                                // the full BusinessDM here). Parens around ??
                                // are mandatory: ?? has LOWER precedence than
                                // `.toBold()`.
                                S.current.shareMenuMessage(
                                    (menu.businessName ?? '-').toBold(), 'Foodly'.toBold(), _publicMenuUrl),
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
      BusinessStatus.open => (S.current.open, FoodlyThemes.tertiaryFoodly),
      BusinessStatus.closed => (S.current.closed, FoodlyThemes.error),
      BusinessStatus.openingSoon => (S.current.openSoon, FoodlyThemes.warning),
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
