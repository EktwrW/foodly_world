part of '../my_favorites_page.dart';

class MyFavoriteBusinessesView extends StatelessWidget {
  const MyFavoriteBusinessesView({
    super.key,
  });

  static const _gridAndListPadding = EdgeInsets.only(right: 8, left: 8, bottom: 150, top: 4);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FavoritesCubit, FavoritesState, List<BusinessDM>>(
      selector: (state) => state.vm.sortedFavoriteBusinesses,
      builder: (context, favoriteBusinesses) {
        if (favoriteBusinesses.isEmpty) {
          if (context.read<FavoritesCubit>().isStartingFavorites) {
            return const Center(child: CircularProgressIndicator.adaptive()).paddingBottom(120);
          }

          return FoodlyEmptyView(
            title: S.current.favBusinessesEmptyTitle,
            subtitle: S.current.favBusinessesEmptyBody,
            icon: const Icon(Bootstrap.shop_window, size: 40, color: FoodlyThemes.primaryFoodly),
          ).paddingBottom(120);
        }

        return BlocSelector<FavoritesCubit, FavoritesState, bool>(
          selector: (state) => state.vm.isGridView,
          builder: (context, isGridView) {
            final cubit = di<FavoritesCubit>();

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const _BusinessSortSelector(key: Key('business-sort-selector')),
                    ViewModeToggleButton(
                      isGrid: isGridView,
                      onPressed: cubit.toggleViewMode,
                    ),
                  ],
                ).paddingAll(16),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: Durations.medium2,
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: Tween<double>(begin: 0.97, end: 1.0).animate(
                          CurvedAnimation(parent: animation, curve: Curves.easeOut),
                        ),
                        child: child,
                      ),
                    ),
                    child: isGridView
                        ? GridView.count(
                            key: const ValueKey(BusinessResultsViewMode.grid),
                            padding: _gridAndListPadding,
                            crossAxisCount: columnasDeRejilla(context.screenWidth),
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            childAspectRatio: 17 / 29,
                            children: favoriteBusinesses
                                .map((business) => BusinessGridCard(
                                      key: Key(business.uuid),
                                      business: business,
                                      heroTagPrefix: business.uuid,
                                    ))
                                .toList(),
                          )
                        : ListView.separated(
                            key: const ValueKey(BusinessResultsViewMode.list),
                            itemCount: favoriteBusinesses.length,
                            padding: _gridAndListPadding,
                            separatorBuilder: (_, __) => const SizedBox(height: 6),
                            itemBuilder: (context, index) {
                              final business = favoriteBusinesses[index];
                              return BusinessListCard(
                                key: Key(business.uuid),
                                business: business,
                                heroTagPrefix: business.uuid,
                              );
                            },
                          ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
