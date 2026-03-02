import 'package:clay_containers/widgets/clay_text.dart' show ClayText;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart'
    show BlocSelector, FavoritesCubit, FavoritesState;
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart' show Asset, AssetData;
import 'package:foodly_world/data_models/promotions/promotion_dm.dart' show BusinessDM, PromotionDM;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart' show FoodlyThemes;
import 'package:foodly_world/ui/views/home/pages/my_favorites_page/my_favorites_views/widgets/my_favorites_business_mini_card.dart';
import 'package:foodly_world/ui/views/home/pages/saved_promotions_page/cubit/saved_promotions_view_cubit.dart';
import 'package:foodly_world/ui/views/home/widgets/secondary_main_app_bar.dart';
import 'package:foodly_world/ui/views/visited_business/promotions/promotions_page.dart' show PromotionCard;
import 'package:toggle_switch/toggle_switch.dart' show ToggleSwitch;

part 'widgets/saved_promotions_toggle_switch.dart';
part 'widgets/business_with_promos_card.dart';
part 'widgets/saved_promotions_view.dart';

class SavedPromotionsPage extends StatelessWidget {
  const SavedPromotionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocSelector<FavoritesCubit, FavoritesState, List<PromotionDM>>(
        selector: (state) => state.vm.favoritePromotions,
        builder: (context, favoritePromotions) {
          // Filtramos las promociones en dos categorías
          final currentPromos = favoritePromotions.where((p) => p.isActive).toList();
          final upcomingPromos = favoritePromotions.where((p) => p.isUpcoming).toList();

          // Si no hay promociones guardadas, mostrar placeholder
          if (currentPromos.isEmpty && upcomingPromos.isEmpty) {
            return const Scaffold(
              appBar: SecondaryMainAppBar(
                key: Key('promotions-app-bar'),
                actionText: 'Saved Promotions',
              ),
              body: _EmptyListPlaceholder(
                text: 'Aun no tienes promociones guardadas',
                key: Key('saved-promos-placeholder'),
              ),
            );
          }

          // Usamos BlocProvider para crear/reutilizar el cubit
          return BlocProvider(
            create: (context) => SavedPromotionsViewCubit(currentPromos, upcomingPromos),
            child: Builder(
              builder: (context) {
                // Actualizamos el cubit cuando cambian las promociones favoritas
                context.read<SavedPromotionsViewCubit>().updatePromotions(currentPromos, upcomingPromos);

                return Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: const SecondaryMainAppBar(
                    key: Key('promotions-app-bar'),
                    actionText: 'Saved Promotions',
                  ),
                  body: BlocBuilder<SavedPromotionsViewCubit, SavedPromotionsViewState>(
                    builder: (context, state) {
                      final cubit = context.read<SavedPromotionsViewCubit>();
                      final vm = state.vm;

                      // Verificamos si ambas categorías están vacías después de quitar favoritos
                      if (vm.currentPromos.isEmpty && vm.upcomingPromos.isEmpty) {
                        return const _EmptyListPlaceholder(
                          text: 'Aun no tienes promociones guardadas',
                          key: Key('saved-promos-placeholder'),
                        );
                      }

                      final savedPromotionsViews = [
                        _SavedPromotionsView(
                          key: Key('saved-current-promos-${vm.currentPromos.length}'),
                          businesses: vm.businessesWithCurrentPromos,
                          promos: vm.currentPromos,
                          title: 'Estas son tus Promociones Vigentes',
                        ),
                        _SavedPromotionsView(
                          key: Key('saved-upcoming-promos-${vm.upcomingPromos.length}'),
                          businesses: vm.businessesWithUpcomingPromos,
                          promos: vm.upcomingPromos,
                          title: 'Estas son tus Próximas Promociones',
                        ),
                      ];

                      return NestedScrollView(
                        controller: ScrollController(),
                        headerSliverBuilder: (_, __) => const [
                          _SavedPromotionsToggleSwitch(key: Key('saved-promos-toggle-switch')),
                        ],
                        body: SizedBox.fromSize(
                          size: Size(context.screenWidth, context.screenHeight),
                          child: PageView.builder(
                            controller: vm.controller,
                            physics: const PageScrollPhysics(),
                            itemCount: savedPromotionsViews.length,
                            itemBuilder: (context, index) => savedPromotionsViews[index],
                            onPageChanged: (i) => cubit.changeView(i),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _EmptyListPlaceholder extends StatelessWidget {
  final String text;
  final AssetData assetData;

  const _EmptyListPlaceholder({
    super.key,
    required this.text,
    // ignore: unused_element_parameter
    this.assetData = FoodlyAssets.searchBusinessAgain,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight - (kToolbarHeight * 4),
      child: Column(
        spacing: 24,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Asset(assetData, width: 40),
          Center(
            child: Text(
              text,
              style: FoodlyTextStyles.actionsBody.copyWith(fontStyle: FontStyle.italic, height: 1.9),
              textAlign: TextAlign.center,
            ).paddingHorizontal(24),
          ),
        ],
      ),
    );
  }
}
