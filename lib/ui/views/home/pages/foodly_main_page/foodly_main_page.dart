import 'package:animate_do/animate_do.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/layout/content_column.dart';
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
                    padding: const EdgeInsets.only(bottom: 120),
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
                        ).paddingOnly(top: 26, bottom: 12),
                        // 18 y no 12: es `UIDimens.SCREEN_PADDING_MOB`, el margen
                        // con el que respira el resto de la app, asi que la
                        // seccion deja de ir mas pegada al borde que todo lo
                        // demas. Solo esta seccion — el carrusel de promos de
                        // arriba tiene su propio ritmo y no se toca.
                        // Techo de ancho, y el MISMO que su placeholder: sin
                        // esto, en una tableta la tarjeta cargada se estira a
                        // 1244 px y su portada 4:3 pide 933 de alto, mientras
                        // el vacio se queda en 420. Pasar de uno a otro seria
                        // un salto brutal.
                        const ContentColumn(
                          maxWidth: UIDimens.NEW_RELEASES_MAX_WIDTH,
                          child: NewReleasesCard(),
                        ).paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
                      ],
                    ).paddingSymmetric(vertical: 25),
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
