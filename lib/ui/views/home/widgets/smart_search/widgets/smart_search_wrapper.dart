part of '../../../pages/foodly_main_page/foodly_main_page.dart';

class _SmartSearchWrapper extends StatelessWidget {
  final Widget child;

  const _SmartSearchWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SmartSearchCubit, SmartSearchState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message, vm) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            FoodlySnackbars.errorGeneric(context, message);
          },
        );
      },
      builder: (context, state) {
        final vsCubit = context.read<SmartSearchCubit>();

        return state.maybeWhen(
          searchComplete: (vm) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomRoundedNeumorphicButton(
                    onPressed: () => vsCubit.clearSearch(),
                    diameter: 26,
                    depth: 3,
                    shape: ui.NeumorphicShape.concave,
                    child: const Icon(Bootstrap.eraser_fill, color: FoodlyThemes.primaryFoodly),
                  ).paddingAll(6),
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          '${S.current.resultsFor}:',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FoodlyTextStyles.captionPurpleBold,
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                vm.searchedText,
                                maxLines: 6,
                                overflow: TextOverflow.ellipsis,
                                style: FoodlyTextStyles.caption,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ).paddingHorizontal(6),
                  ),
                  ViewModeToggleButton(
                    isGrid: vm.viewMode.isGrid,
                    onPressed: vsCubit.toggleViewMode,
                  ).paddingAll(6),
                ],
              ),
              Expanded(
                child: BusinessResultsView(
                  searchResults: vm.searchResults,
                  isGridView: vm.viewMode.isGrid,
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 6, vertical: 24),
          searching: (_) => const Center(child: LoadingWidgetFoodlyLogo()).paddingHorizontal(context.screenWidth * .3),
          orElse: () => FadeIn(duration: Durations.medium2, child: child),
        );
      },
    );
  }
}
