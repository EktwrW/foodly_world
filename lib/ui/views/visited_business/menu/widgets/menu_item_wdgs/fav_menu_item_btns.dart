part of '../menu_category_builder_wdg.dart';

class FavMenuItemBtns extends StatelessWidget {
  const FavMenuItemBtns({
    super.key,
    required this.item,
    required this.menuCategory,
  });

  final ItemDM item;
  final MenuCategory menuCategory;

  @override
  Widget build(BuildContext context) {
    return (menuCategory.isDrinks
            ? FavoriteButton.forDrinkItem(key: Key(item.uuid), diameter: 28, iconSize: 16, item: item)
            : menuCategory.isCombos
                ? FavoriteButton.forComboItem(key: Key(item.uuid), diameter: 28, iconSize: 16, item: item)
                : FavoriteButton.forFoodItem(key: Key(item.uuid), diameter: 28, iconSize: 16, item: item))
        .paddingOnly(top: 4, right: 2);
  }
}
