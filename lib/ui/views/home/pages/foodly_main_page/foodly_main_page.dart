import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/widgets/home_app_bar_mobile.dart';
import 'package:foodly_world/ui/views/home/widgets/home_categories_wdg.dart';
import 'package:foodly_world/ui/views/home/widgets/main_app_top_offers_widget.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases_card.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';

class FoodlyMainPage extends StatelessWidget {
  const FoodlyMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [const Home369AppBarMobile()],
      body: Column(
        children: [
          const HomeCategories(),
          Expanded(
            child: ColoredBox(
              color: NeumorphicColors.background,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      S.current.mainPromos,
                      style: FoodlyTextStyles.sectionsTitle,
                    ).paddingOnly(bottom: 12),
                    const TopOffersWidget(),
                    Text(
                      S.current.news,
                      style: FoodlyTextStyles.sectionsTitle,
                    ).paddingOnly(top: 25, bottom: 12),
                    const NewReleasesCard().paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
                    Text(
                      S.current.tendencies,
                      style: FoodlyTextStyles.sectionsTitle,
                    ).paddingOnly(top: 25),
                    const Text(
                            'DEV: Implementar aca carrusel con nuevos comercios y tendencias de las apps del ecosistema 369')
                        .paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
                  ],
                ).paddingSymmetric(vertical: 25),
              ),
            ),
          ),
        ],
      ).paddingOnly(top: 10),
    );
  }
}
