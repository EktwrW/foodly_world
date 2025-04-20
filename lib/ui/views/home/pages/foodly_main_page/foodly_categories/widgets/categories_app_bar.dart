part of '../categories_page.dart';

class _CategoriesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final FoodlyCategories? category;

  const _CategoriesAppBar({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: SizedBox.expand(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: UIDecorations.GLASSMORPHIC_PURPLE_GRADIENT,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
      ),
      leadingWidth: 71,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: CustomRoundedNeumorphicButton(
              shape: ui.NeumoShape.concave,
              iconSize: 26,
              diameter: 30,
              iconData: Bootstrap.caret_left_fill,
              onPressed: () {
                di<AppRouter>().goBackToLastRoute(context);
              },
            ).paddingSymmetric(vertical: 8, horizontal: 12),
          ),
        ],
      ),
      toolbarHeight: 86,
      centerTitle: true,
      title: Column(
        spacing: 12,
        children: [
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15, child: Asset(FoodlyAssets.logoWhite)),
              Text(
                S.current.categories,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: FoodlyTextStyles.secondaryTitle.copyWith(color: Colors.white, fontSize: 18),
              )
            ],
          ),
          Text(
            category?.text ?? '-',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: FoodlyTextStyles.secondaryTitle.copyWith(color: FoodlyThemes.primaryLighten73, fontSize: 14),
          )
        ],
      ).paddingTop(6),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        SizedBox.square(
          dimension: 48,
          child: category?.avatar,
        ).paddingRight(12),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(86);
}
