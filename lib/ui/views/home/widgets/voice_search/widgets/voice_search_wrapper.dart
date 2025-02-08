part of '../../../pages/foodly_main_page/foodly_main_page.dart';

class _VoiceSearchWrapper extends StatelessWidget {
  final Widget child;

  const _VoiceSearchWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VoiceSearchCubit, VoiceSearchState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message, vm) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            FoodlySnackbars.errorGeneric(context, message);
          },
        );
      },
      builder: (context, state) {
        final vsCubit = context.read<VoiceSearchCubit>();

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
                    shape: ui.NeumoShape.concave,
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
          searching: (_) => const Center(child: LoadingWidgetFoodlyLogo()).paddingHorizontal(context.screenWidth * .2),
          orElse: () => FadeIn(duration: Durations.medium2, child: child),
        );
      },
    );
  }
}

class BusinessResultsView extends StatelessWidget {
  final List<BusinessDM> searchResults;
  final bool isGridView;

  const BusinessResultsView({
    super.key,
    required this.searchResults,
    required this.isGridView,
  });

  @override
  Widget build(BuildContext context) {
    if (searchResults.isEmpty) {
      return Column(
        spacing: 24,
        children: [
          const Asset(FoodlyAssets.searchBusinessAgain, width: 40),
          Text(
            S.current.noRecommendationsFound,
            style: FoodlyTextStyles.actionsBody.copyWith(fontStyle: FontStyle.italic, height: 1.9),
            textAlign: TextAlign.center,
          ).paddingHorizontal(context.screenWidth * .1),
        ],
      ).paddingTop(100);
    }

    return LocalHeroScope(
      curve: Curves.decelerate,
      duration: Durations.long4,
      child: isGridView
          ? GridView.count(
              key: const ValueKey(SearchResultsViewMode.grid),
              padding: const EdgeInsets.symmetric(vertical: 16),
              crossAxisCount: 2,
              childAspectRatio: 16 / 29,
              children: searchResults
                  .map((result) => BusinessGridCard(
                        business: result,
                        heroTagPrefix: result.uuid,
                      ))
                  .toList(),
            )
          : ListView.builder(
              key: const ValueKey(SearchResultsViewMode.list),
              itemCount: searchResults.length,
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemBuilder: (context, index) {
                final business = searchResults[index];
                return BusinessListCard(
                  business: business,
                  heroTagPrefix: business.uuid,
                );
              },
            ),
    );
  }
}

class ViewModeToggleButton extends StatefulWidget {
  final bool isGrid;
  final VoidCallback onPressed;
  final double? diameter;

  const ViewModeToggleButton({
    super.key,
    required this.isGrid,
    required this.onPressed,
    this.diameter,
  });

  @override
  State<ViewModeToggleButton> createState() => _ViewModeToggleButtonState();
}

class _ViewModeToggleButtonState extends State<ViewModeToggleButton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Durations.long1);
    _rotation = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    );
  }

  @override
  void didUpdateWidget(covariant ViewModeToggleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isGrid != widget.isGrid) {
      _controller.reset(); // Reset before starting new animation
      _controller.forward(); // Start the animation
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final icon = widget.isGrid ? Bootstrap.list : Bootstrap.grid;

    return CustomRoundedNeumorphicButton(
      onPressed: widget.onPressed,
      diameter: widget.diameter ?? 26,
      depth: 3,
      shape: ui.NeumoShape.concave,
      child: AnimatedBuilder(
        animation: _rotation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _rotation.value * 2 * math.pi, // Rotate 360 degrees
            child: Icon(icon, color: FoodlyThemes.primaryFoodly),
          );
        },
      ),
    );
  }
}
