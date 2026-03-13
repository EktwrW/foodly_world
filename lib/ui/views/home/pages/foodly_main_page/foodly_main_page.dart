import 'package:animate_do/animate_do.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/widgets/business_results_view.dart';
import 'package:foodly_world/ui/views/home/widgets/home_app_bar_mobile.dart';
import 'package:foodly_world/ui/views/home/widgets/home_categories_wdg.dart';
import 'package:foodly_world/ui/views/home/widgets/main_top_offers_widget.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases_card.dart';

part '../../widgets/smart_search/widgets/smart_search_wrapper.dart';

class FoodlyMainPage extends StatelessWidget {
  const FoodlyMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (_, __) => [const Home369AppBarMobile()],
        body: _SmartSearchWrapper(
          key: const Key('voice-search-wrapper'),
          child: Column(
            children: [
              const HomeCategories(),
              Expanded(
                child: ColoredBox(
                  color: ui.NeumorphicColors.background,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Column(
                      children: [
                        Text(
                          S.current.mainPromos,
                          style: FoodlyTextStyles.sectionsTitle,
                        ).paddingOnly(bottom: 12),
                        const TopOffersWidget(),
                        Text(
                          S.current.newBranch,
                          style: FoodlyTextStyles.sectionsTitle,
                        ).paddingOnly(top: 30, bottom: 12),
                        const NewReleasesCard().paddingSymmetric(horizontal: 12),
                      ],
                    ).paddingSymmetric(vertical: 25),
                  ),
                ),
              ),
            ],
          ).paddingOnly(top: 10),
        ),
      ),
    );
  }
}
