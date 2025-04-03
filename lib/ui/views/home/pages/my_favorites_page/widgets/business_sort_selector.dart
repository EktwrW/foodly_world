part of '../my_favorites_page.dart';

class _BusinessSortSelector extends StatelessWidget {
  const _BusinessSortSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocSelector<MyFavoritesCubit, MyFavoritesState, BusinessSortType>(
          selector: (state) => state.vm.businessSortType,
          builder: (context, sortType) {
            final cubit = context.read<MyFavoritesCubit>();

            return Flexible(
              child: SegmentedButton<BusinessSortType>(
                segments: BusinessSortType.values
                    .map((type) => ButtonSegment(
                          value: type,
                          label: SizedBox(
                            width: 80,
                            child: Text(
                              type.label,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11.5),
                            ).paddingHorizontal(4),
                          ),
                        ))
                    .toList(),
                selected: {sortType},
                onSelectionChanged: (selectedSet) {
                  if (selectedSet.isNotEmpty) {
                    cubit.changeSortType(selectedSet.first);
                  }
                },
                showSelectedIcon: false,
                style: ButtonStyle(
                  side: const WidgetStatePropertyAll(BorderSide(color: FoodlyThemes.primaryFoodly)),
                  foregroundColor: WidgetStateProperty.resolveWith(
                    (states) {
                      return states.contains(WidgetState.selected) ? Colors.white : FoodlyThemes.primaryFoodly;
                    },
                  ),
                  backgroundColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return FoodlyThemes.primaryFoodly.withValues(alpha: .7);
                    }
                    return null;
                  }),
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                  visualDensity: VisualDensity.compact,
                ),
              ),
            );
          },
        ),
        BlocSelector<MyFavoritesCubit, MyFavoritesState, bool>(
          selector: (state) => state.vm.isBusinessSortAscending,
          builder: (context, isAscending) {
            final cubit = context.read<MyFavoritesCubit>();

            return InkWell(
              onTap: cubit.toggleBusinessSortDirection,
              borderRadius: BorderRadius.circular(20),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  isAscending ? CupertinoIcons.sort_up : CupertinoIcons.sort_down,
                  color: FoodlyThemes.primaryFoodly,
                  size: 22,
                ).paddingAll(6),
              ),
            );
          },
        ),
      ],
    );
  }
}
