part of '../saved_promotions_page.dart';

enum SavedPromotionsIndexView {
  currentPromos,
  upcomingPromos;

  String get label => switch (this) {
        currentPromos => 'Vigentes',
        upcomingPromos => 'Próximas',
      };
}

class _SavedPromotionsToggleSwitch extends StatelessWidget {
  const _SavedPromotionsToggleSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SavedPromotionsViewCubit, SavedPromotionsViewState, int>(
      selector: (state) => state.vm.indexView,
      builder: (context, indexView) {
        final cubit = context.read<SavedPromotionsViewCubit>();

        return SliverAppBar(
          primary: false,
          pinned: true,
          backgroundColor: Colors.transparent,
          expandedHeight: 60,
          toolbarHeight: 60,
          collapsedHeight: 60,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: BlocSelector<SavedPromotionsViewCubit, SavedPromotionsViewState, PageController?>(
            selector: (state) => state.vm.controller,
            builder: (context, controller) {
              return ToggleSwitch(
                initialLabelIndex: indexView,
                onToggle: (i) {
                  cubit.changeView(i ?? 0);
                  controller?.animateToPage(i ?? 0, duration: Durations.short4, curve: Curves.decelerate);
                },
                animate: true,
                animationDuration: 500,
                minHeight: 30,
                labels: SavedPromotionsIndexView.values.map((f) => f.label).toList(),
                minWidth: context.screenWidth,
                cornerRadius: 6.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white,
                totalSwitches: SavedPromotionsIndexView.values.length,
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
