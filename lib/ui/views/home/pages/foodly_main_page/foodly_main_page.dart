import 'package:animate_do/animate_do.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/placeholders/foodly_empty_view.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/widgets/business_results_view.dart';
import 'package:foodly_world/ui/views/home/widgets/home_app_bar_mobile.dart';
import 'package:foodly_world/ui/views/home/widgets/home_categories_wdg.dart';
import 'package:foodly_world/ui/views/home/widgets/main_top_offers_widget.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases_card.dart';
import 'package:foodly_world/ui/views/home/widgets/smart_search/widgets/smart_search_snackbars.dart';

part '../../widgets/smart_search/widgets/smart_search_wrapper.dart';

class FoodlyMainPage extends StatelessWidget {
  const FoodlyMainPage({super.key});

  (double, double) _labelsTopAndBottomPadding(BuildContext ctx) {
    if (ctx.isTablet) {
      return (48, 18);
    }
    return (26, 12);
  }

  @override
  Widget build(BuildContext context) {
    final labelsTopAndBottomPadding = _labelsTopAndBottomPadding(context);
    final newReleaseCardHorizPAdding = context.isTablet ? UIDimens.SCREEN_PADDING_TABLET : UIDimens.SCREEN_PADDING_MOB;

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
                    padding: const EdgeInsets.only(bottom: 120),
                    child: Column(
                      children: [
                        Text(
                          S.current.mainPromos,
                          style: FoodlyTextStyles.sectionsTitle,
                        ).paddingOnly(bottom: labelsTopAndBottomPadding.$2),
                        const TopOffersWidget(),
                        Text(
                          S.current.newBranch,
                          style: FoodlyTextStyles.sectionsTitle,
                        ).paddingOnly(top: labelsTopAndBottomPadding.$1, bottom: labelsTopAndBottomPadding.$2),
                        ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                              width: context.isTablet ? context.screenWidth * .86 : double.infinity,
                            ),
                            child: const NewReleasesCard().paddingSymmetric(horizontal: newReleaseCardHorizPAdding)),
                      ],
                    ).paddingSymmetric(vertical: 26),
                  ),
                ),
              ),
            ],
          ).paddingOnly(top: 6),
        ),
      ),
    );
  }
}
