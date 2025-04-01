part of '../menu_category_builder_wdg.dart';

class MenuItemWdg extends StatelessWidget {
  const MenuItemWdg({
    super.key,
    required this.subCategory,
    required this.menuCategory,
    required this.vm,
    required this.item,
    required this.isLastScreenItem,
  });

  final CategoryDM subCategory;
  final MenuCategory menuCategory;
  final MenuVM vm;
  final ItemDM item;
  final bool isLastScreenItem;

  Widget get _currencyWidget => Text('${vm.currency}:', style: FoodlyTextStyles.label);
  bool get _itemNotAvailable => !item.available;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _itemNotAvailable ? .5 : 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            elevation: 2,
            color: ui.NeumoColors.decorationMaxWhiteColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: AnimatedSize(
              duration: Durations.medium3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuItemPictureWdg(
                        isEditing: item.isEditing,
                        item: item,
                        menuCategory: menuCategory,
                        subCategory: subCategory,
                      ),
                      Expanded(
                        flex: 9,
                        child: ItemNameAndDescriptionWdg(
                          item: item,
                          menuCategory: menuCategory,
                          subCategory: subCategory,
                        ),
                      ),
                      FavMenuBtns(item: item, menuCategory: menuCategory).paddingAll(2),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: !item.available ? MainAxisAlignment.center : MainAxisAlignment.start,
                    children: [
                      AdaptiveItemVersionSelector(
                        item: item,
                        menuCategory: menuCategory,
                        subCategoryUuid: subCategory.uuid,
                      ).paddingOnly(left: 10, right: 6),
                      if (item.available) const Spacer(),
                      if (item.available) _currencyWidget.paddingHorizontal(4),
                      if (item.available)
                        SizedBox(
                          width: 110,
                          height: 36,
                          child: Card.filled(
                            elevation: 3,
                            color: FoodlyThemes.tertiaryFoodly,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: Text(
                                _itemNotAvailable ? '-' : '${item.currentPrice}',
                                style: FoodlyTextStyles.bodyWhiteSemibold.copyWith(fontSize: 16.5),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ).paddingBottom(item.available ? 0 : 8),
                ],
              ).paddingRight(2),
            ),
          ).paddingOnly(left: 6, right: 6, bottom: 20),
          if (isLastScreenItem) const MenuDisclaimerWdg(),
        ],
      ),
    );
  }
}
