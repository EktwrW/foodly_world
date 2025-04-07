part of '../../my_favorites_page.dart';

class _MyFavoritesToggleSwitch extends StatelessWidget {
  const _MyFavoritesToggleSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MyFavoritesCubit, MyFavoritesState, int>(
      selector: (state) => state.vm.indexView,
      builder: (context, indexView) {
        final cubit = context.read<MyFavoritesCubit>();

        return SliverAppBar(
          primary: false,
          pinned: true,
          backgroundColor: Colors.transparent,
          expandedHeight: 60,
          toolbarHeight: 60,
          collapsedHeight: 60,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: BlocSelector<MyFavoritesCubit, MyFavoritesState, PageController?>(
            selector: (state) => state.vm.controller,
            builder: (context, controller) {
              return ToggleSwitch(
                initialLabelIndex: indexView,
                onToggle: (i) => cubit.changeView(i ?? 0),
                animate: true,
                animationDuration: 500,
                minHeight: 30,
                labels: MyFavoritesView.values.map((f) => f.label).toList(),
                minWidth: context.screenWidth,
                cornerRadius: 6.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white,
                totalSwitches: MyFavoritesView.values.length,
                customTextStyles: const [
                  FoodlyTextStyles.toogleButtonText,
                  FoodlyTextStyles.toogleButtonText,
                  FoodlyTextStyles.toogleButtonText,
                ],
                borderWidth: 1.5,
                borderColor: const [
                  FoodlyThemes.primaryFoodly,
                  FoodlyThemes.primaryFoodly,
                  FoodlyThemes.tertiaryFoodly,
                  FoodlyThemes.primaryFoodly,
                  FoodlyThemes.primaryFoodly,
                ],
                dividerColor: FoodlyThemes.secondaryFoodly,
                activeBgColors: const [
                  [FoodlyThemes.primaryFoodly],
                  [FoodlyThemes.primaryFoodly],
                  [FoodlyThemes.primaryFoodly],
                ],
              );
            },
          ),
        );
      },
    );
  }
}
