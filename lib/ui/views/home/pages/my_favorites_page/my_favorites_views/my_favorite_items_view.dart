part of '../my_favorites_page.dart';

class MyFavoriteItemsView extends StatelessWidget {
  const MyFavoriteItemsView({super.key});

  static const _padding = EdgeInsets.only(right: 8, left: 8, bottom: 150, top: 4);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FavoritesCubit, FavoritesState, List<FavoriteItemDM>>(
      selector: (state) => state.vm.favoriteItems,
      builder: (context, favoriteItems) {
        if (favoriteItems.isEmpty) {
          return Column(
            spacing: 24,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Bootstrap.search_heart, size: 64, color: FoodlyThemes.secondaryFoodly),
              Text(
                S.current.noFavoriteItems,
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
                key: const ValueKey(BusinessResultsViewMode.list),
                controller: ScrollController(),
                itemCount: favoriteItems.length,
                padding: _padding,
                separatorBuilder: (_, __) => const SizedBox(height: 6),
                itemBuilder: (context, index) {
                  final favoriteItemDM = favoriteItems[index];
                  return _FavoriteItemsCard(
                    key: Key('my-items-from: ${favoriteItemDM.business?.uuid}'),
                    favoriteItemDM: favoriteItemDM,
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

class _FavoriteItemsCard extends StatelessWidget {
  final FavoriteItemDM favoriteItemDM;

  const _FavoriteItemsCard({super.key, required this.favoriteItemDM});

  String get _publicMenuUrl {
    final uuid = favoriteItemDM.business?.uuid ?? '';
    return uuid.isEmpty ? '' : 'https://menu.foodly.solutions/$uuid';
  }

  static const _divider = Expanded(child: Divider(color: FoodlyThemes.primaryFoodly, thickness: 1.8));

  @override
  Widget build(BuildContext context) {
    final business = favoriteItemDM.business;

    return Card(
      margin: const EdgeInsets.only(top: 24),
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          Flexible(
            child: InkWell(
              onTap: () => di<AppRouter>().appRouter.goNamed(
                    AppRoutes.visitMenu.name,
                    pathParameters: {AppRoutes.routeIdParam: favoriteItemDM.menuUuid},
                    extra: business,
                  ),
              child: MyFavoritesBusinessMiniCard(business: business, key: key),
            ),
          ),
          if (favoriteItemDM.favoriteFoodItems.isNotEmpty) ...[
            _buildMenuCategoryTitle(MenuCategory.food),
            _buildMenuCategoryItems(
              favoriteItemDM.favoriteFoodItems,
              business?.country?.currencySymbol,
              MenuCategory.food,
            ),
          ],
          if (favoriteItemDM.favoriteDrinkItems.isNotEmpty) ...[
            _buildMenuCategoryTitle(MenuCategory.drinks),
            _buildMenuCategoryItems(
              favoriteItemDM.favoriteDrinkItems,
              business?.country?.currencySymbol,
              MenuCategory.drinks,
            ),
          ],
          if (favoriteItemDM.favoriteComboItems.isNotEmpty) ...[
            _buildMenuCategoryTitle(MenuCategory.combos),
            _buildMenuCategoryItems(
              favoriteItemDM.favoriteComboItems,
              business?.country?.currencySymbol,
              MenuCategory.combos,
            ),
          ],
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
                              // Precedence: ?? lower than `.toBold()`, so bold
                              // was only being applied to the '-' fallback.
                              // Wrap the nullable resolution in parens so the
                              // actual business name gets bolded too.
                              S.current.shareMenuMessage(
                                  (business?.name ?? '-').toBold(), 'Foodly'.toBold(), _publicMenuUrl),
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
            ).paddingBottom(16),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCategoryItems(
    List<ItemDM> favoriteItems,
    String? currency,
    MenuCategory menuCategory,
  ) {
    return AnimatedSize(
      key: ValueKey(menuCategory),
      duration: Durations.long1,
      curve: Curves.decelerate,
      child: Column(
        key: Key(menuCategory.text),
        children: favoriteItems
            .map((item) => VisitedMenuItemWdg(
                  key: Key(item.uuid),
                  item: item,
                  menuCategory: menuCategory,
                  isLastScreenItem: false,
                  currency: currency,
                  margin: EdgeInsets.zero,
                ))
            .toList(),
      ),
    );
  }

  Widget _buildMenuCategoryTitle(MenuCategory menuCategory) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _divider,
          Expanded(
            flex: 3,
            child: Center(
              child: ui.NeumorphicText(
                menuCategory.text,
                style: const ui.NeumorphicStyle(color: FoodlyThemes.primaryFoodly),
                textStyle: ui.NeumorphicTextStyle(
                  fontFamily: GoogleFonts.poppinsTextTheme().bodyLarge?.fontFamily,
                  fontSize: FoodlyTextStyles.sectionsTitle.fontSize,
                  fontWeight: FoodlyTextStyles.sectionsTitle.fontWeight,
                ),
              ).paddingSymmetric(horizontal: 16),
            ),
          ),
          _divider,
        ],
      ).paddingOnly(top: 8, right: 12, left: 12);
}
