import 'package:clay_containers/widgets/clay_text.dart' show ClayText;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show FavoritesCubit, FavoritesState, S;
import 'package:foodly_world/data_models/favorites/saved_promotions_response_dm.dart' show SavedPromoBusinessDM;
import 'package:foodly_world/data_models/promotions/nearby_promotion_dm.dart' show NearbyPromotionDM;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart' show FoodlyThemes;
import 'package:foodly_world/ui/views/home/pages/my_favorites_page/my_favorites_views/widgets/my_favorites_business_mini_card.dart';
import 'package:foodly_world/ui/views/home/pages/saved_promotions_page/cubit/saved_promotions_view_cubit.dart';
import 'package:foodly_world/ui/views/home/widgets/main_top_offers_widget.dart' show NearbyPromoCard;
import 'package:foodly_world/ui/views/home/widgets/secondary_main_app_bar.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;
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
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, favState) {
          final favoritePromotions = favState.vm.favoritePromotions;
          final favoritePromoBusinesses = favState.vm.favoritePromoBusinesses;

          // Filtramos las promociones en dos categorías
          final currentPromos = favoritePromotions.where((p) => p.isActive).toList();
          final upcomingPromos = favoritePromotions.where((p) => p.isUpcoming).toList();

          // Si no hay promociones guardadas, mostrar placeholder
          if (currentPromos.isEmpty && upcomingPromos.isEmpty) {
            return Scaffold(
              appBar: SecondaryMainAppBar(
                key: const Key('promotions-app-bar'),
                actionText: S.current.savedPromotions,
              ),
              body: _EmptyListPlaceholder(
                key: const Key('saved-promos-placeholder'),
                text: S.current.noSavedPromotions,
              ),
            );
          }

          // Usamos BlocProvider para crear/reutilizar el cubit
          return BlocProvider(
            create: (context) => SavedPromotionsViewCubit(currentPromos, upcomingPromos, favoritePromoBusinesses),
            child: Builder(
              builder: (context) {
                // Actualizamos el cubit cuando cambian las promociones favoritas
                context
                    .read<SavedPromotionsViewCubit>()
                    .updatePromotions(currentPromos, upcomingPromos, favoritePromoBusinesses);

                return Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: SecondaryMainAppBar(
                    key: const Key('promotions-app-bar'),
                    actionText: S.current.savedPromotions,
                  ),
                  body: BlocBuilder<SavedPromotionsViewCubit, SavedPromotionsViewState>(
                    builder: (context, state) {
                      final cubit = context.read<SavedPromotionsViewCubit>();
                      final vm = state.vm;

                      // Verificamos si ambas categorías están vacías después de quitar favoritos
                      if (vm.currentPromos.isEmpty && vm.upcomingPromos.isEmpty) {
                        return _EmptyListPlaceholder(
                          text: S.current.noSavedPromotions,
                          key: const Key('saved-promos-placeholder'),
                        );
                      }

                      final savedPromotionsViews = [
                        _SavedPromotionsView(
                          key: Key('saved-current-promos-${vm.currentPromos.length}'),
                          businesses: vm.businessesWithCurrentPromos,
                          promos: vm.currentPromos,
                          title: S.current.savedPromotionsCurrent,
                        ),
                        _SavedPromotionsView(
                          key: Key('saved-upcoming-promos-${vm.upcomingPromos.length}'),
                          businesses: vm.businessesWithUpcomingPromos,
                          promos: vm.upcomingPromos,
                          title: S.current.savedPromotionsUpcoming,
                        ),
                      ];

                      return CustomScrollView(
                        controller: ScrollController(),
                        slivers: [
                          const _SavedPromotionsToggleSwitch(key: Key('saved-promos-toggle-switch')),
                          SliverToBoxAdapter(
                            child: SizedBox.fromSize(
                              size: Size(context.screenWidth, context.screenHeight),
                              child: PageView.builder(
                                controller: vm.controller,
                                physics: const PageScrollPhysics(),
                                itemCount: savedPromotionsViews.length,
                                itemBuilder: (context, index) => savedPromotionsViews[index],
                                onPageChanged: (i) => cubit.changeView(i),
                              ).paddingBottom(140),
                            ),
                          ),
                        ],
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

  const _EmptyListPlaceholder({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight - (kToolbarHeight * 4),
      child: Column(
        spacing: 24,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Bootstrap.bookmark_heart, size: 64, color: FoodlyThemes.secondaryFoodly),
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
