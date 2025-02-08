part of '../menu_category_builder_wdg.dart';

class MenuDisclaimerWdg extends StatelessWidget {
  const MenuDisclaimerWdg({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      key: UniqueKey(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.current.businessInfoNote,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: FoodlyTextStyles.captionPurpleBold,
          ).paddingBottom(12),
          Text.rich(TextSpan(
            style: FoodlyTextStyles.caption,
            children: [
              const WidgetSpan(
                child: Asset(FoodlyAssets.logo, height: 13),
                alignment: PlaceholderAlignment.middle,
              ),
              TextSpan(
                text: ' ${S.current.businessDisclaimer}',
              ),
            ],
          )).paddingRight(100),
        ],
      ).paddingOnly(top: 32, left: 16, bottom: 24),
    );
  }
}
