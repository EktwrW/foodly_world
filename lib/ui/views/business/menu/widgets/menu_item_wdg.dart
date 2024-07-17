part of 'menu_category_builder_wdg.dart';

class MenuItemWdg extends StatelessWidget {
  const MenuItemWdg({
    super.key,
    required this.subCategory,
    required this.menuCategory,
    required this.vm,
    required this.item,
  });

  final Category subCategory;
  final MenuCategory menuCategory;
  final MenuVM vm;
  final ItemDM item;

  static const _itemHeight = 162.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: _itemHeight,
          child: Card(
            elevation: 2,
            color: ui.NeumorphicColors.decorationMaxWhiteColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.only(right: 5, left: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 110,
                      height: 100,
                      margin: const EdgeInsets.only(top: 10, left: 10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      clipBehavior: Clip.hardEdge,
                      child: CachedNetworkImage(
                        imageUrl: item.referencePhotos.first,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClayText(item.name,
                              textColor: FoodlyThemes.primaryFoodly,
                              style: FoodlyTextStyles.labelPurpleBold.copyWith(
                                letterSpacing: .75,
                                fontSize: 14,
                              )).paddingTop(8),
                          Text(
                            item.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: FoodlyTextStyles.caption,
                          ).paddingVertical(5),
                        ],
                      ).paddingHorizontal(10),
                    ),
                    IconButton(
                      onPressed: () {},
                      color: Colors.transparent,
                      icon: Icon(
                        subCategory.items.indexOf(item).isEven
                            ? FontAwesome.heart_circle_plus_solid
                            : FontAwesome.heart_circle_check_solid,
                        color: subCategory.items.indexOf(item).isEven
                            ? const Color(0xFFB5B4B4)
                            : FoodlyThemes.primaryFoodly,
                        size: 22,
                      ),
                    ).paddingAll(2),
                  ],
                ),
                Row(
                  children: [
                    AdaptiveItemVersionSelector(
                      item: item,
                      menuCategory: menuCategory,
                      subCategoryName: subCategory.name,
                    ).paddingOnly(left: 10, right: 6),
                    const Spacer(),
                    Text(
                      '${vm.currency}:',
                      style: FoodlyTextStyles.label,
                    ).paddingHorizontal(4),
                    SizedBox(
                      width: 110,
                      height: 36,
                      child: Card.filled(
                        elevation: 3,
                        color: FoodlyThemes.tertiaryFoodly,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: Text(
                            '${item.currentPrice}',
                            style: FoodlyTextStyles.bodyWhiteSemibold.copyWith(fontSize: 16.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ).paddingBottom(context.isSmallWidthPhone ? 6 : 0),
              ],
            ).paddingRight(2),
          ),
        ).paddingOnly(left: 6, right: 6),
      ],
    ).paddingBottom(12);
  }
}
