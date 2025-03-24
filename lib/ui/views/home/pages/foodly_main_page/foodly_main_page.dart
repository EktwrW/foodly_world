import 'dart:math' as math;

import 'package:animate_do/animate_do.dart';
import 'package:flutter_neumo/flutter_neumo.dart' as ui;
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/cards/business_card.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/widgets/home_app_bar_mobile.dart';
import 'package:foodly_world/ui/views/home/widgets/home_categories_wdg.dart';
import 'package:foodly_world/ui/views/home/widgets/main_top_offers_widget.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases_card.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:local_hero/local_hero.dart';

part '../../widgets/smart_search/widgets/smart_search_wrapper.dart';

class FoodlyMainPage extends StatelessWidget {
  const FoodlyMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (_, __) => [const Home369AppBarMobile()],
      body: _SmartSearchWrapper(
        key: const Key('voice-search-wrapper'),
        child: Column(
          children: [
            const HomeCategories(),
            Expanded(
              child: ColoredBox(
                color: ui.NeumoColors.background,
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
      ),
    );
  }
}
