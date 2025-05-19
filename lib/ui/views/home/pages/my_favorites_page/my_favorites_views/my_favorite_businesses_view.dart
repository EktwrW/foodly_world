part of '../my_favorites_page.dart';

class MyFavoriteBusinessesView extends StatelessWidget {
  const MyFavoriteBusinessesView({
    super.key,
  });

  static const _gridAndListPadding = EdgeInsets.only(right: 8, left: 8, bottom: 44, top: 4);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FavoritesCubit, FavoritesState, List<BusinessDM>>(
      selector: (state) => state.vm.sortedFavoriteBusinesses,
      builder: (context, favoriteBusinesses) {
        if (favoriteBusinesses.isEmpty) {
          return Column(
            spacing: 24,
            children: [
              const Asset(FoodlyAssets.searchBusinessAgain, width: 40),
              Text(
                'Aun no tienes negocios en tu lista de favoritos',
                style: FoodlyTextStyles.actionsBody.copyWith(fontStyle: FontStyle.italic, height: 1.9),
                textAlign: TextAlign.center,
              ).paddingHorizontal(context.screenWidth * .1),
            ],
          ).paddingTop(100);
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
                  child: LocalHeroScope(
                    curve: Curves.fastEaseInToSlowEaseOut,
                    duration: Durations.extralong2,
                    createRectTween: (begin, end) {
                      return MaterialRectCenterArcTween(begin: begin, end: end);
                    },
                    child: isGridView
                        ? GridView.count(
                            key: const ValueKey(SearchResultsViewMode.grid),
                            padding: _gridAndListPadding,
                            crossAxisCount: 2,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            childAspectRatio: 18 / 29,
                            children: favoriteBusinesses
                                .map((result) => BusinessGridCard(
                                      business: result,
                                      heroTagPrefix: result.uuid,
                                    ))
                                .toList(),
                          )
                        : ListView.separated(
                            key: const ValueKey(SearchResultsViewMode.list),
                            itemCount: favoriteBusinesses.length,
                            padding: _gridAndListPadding,
                            separatorBuilder: (_, __) => const SizedBox(height: 4),
                            itemBuilder: (context, index) {
                              final business = favoriteBusinesses[index];
                              return BusinessListCard(
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
