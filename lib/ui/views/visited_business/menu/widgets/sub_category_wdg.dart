part of 'visited_menu_category_builder_wdg.dart';

class SubCategoryWdg extends StatelessWidget {
  final CategoryDM? subCategory;
  final MenuCategory menuCategory;
  final VisitedMenuCubit cubit;
  final bool isLastSubCategory;

  const SubCategoryWdg({
    super.key,
    this.subCategory,
    required this.menuCategory,
    required this.cubit,
    required this.isLastSubCategory,
  });

  static const _divider = Expanded(child: Divider(color: FoodlyThemes.primaryFoodly, thickness: 1.8));

  @override
  Widget build(BuildContext context) {
    final vm = cubit.state.vm;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: _buildTitleDisplayView(),
        ),
        const SizedBox(height: 30),
        if (subCategory?.items.isNotEmpty ?? false)
          ...subCategory!.items.mapIndexed(
            (i, item) => VisitedMenuItemWdg(
              key: Key(item.uuid),
              menuCategory: menuCategory,
              vm: vm,
              item: item,
              isLastScreenItem: isLastSubCategory && ((subCategory!.items.length - 1) == i),
            ),
          ),
      ],
    ).paddingBottom(20);
  }

  Widget _buildTitleDisplayView() {
    return FadeIn(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _divider,
          Expanded(
            flex: subCategory?.editingName == true ? 4 : 3,
            child: Center(
              child: ui.NeumorphicText(
                subCategory?.name ?? '',
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
      ).paddingOnly(top: 24, right: 12, left: 12),
    );
  }
}
