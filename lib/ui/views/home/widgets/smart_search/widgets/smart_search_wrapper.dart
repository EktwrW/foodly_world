part of '../../../pages/foodly_main_page/foodly_main_page.dart';

class _SmartSearchWrapper extends StatelessWidget {
  final Widget child;

  const _SmartSearchWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SmartSearchCubit, SmartSearchState>(
      listener: (context, state) {
        final dialogService = di<DialogService>();

        state.whenOrNull(
          searchComplete: (_) => dialogService.hideLoading(),
          error: (message, vm) {
            dialogService.hideLoading();
            // Mic permission denied is handled by the voice button — it shows
            // a richer snackbar with an Open Settings action. Skip generic error.
            if (vm.micPermissionDenied) return;
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            FoodlySnackbars.errorGeneric(context, message);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          searchComplete: (vm) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
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
                ],
              ),
              Expanded(
                child: BusinessResultsView(
                  searchResults: vm.searchResults,
                  isGridView: vm.viewMode.isGrid,
                ),
              ),
            ],
          ).paddingOnly(right: 6, left: 6, top: 12),
          searching: (_) => const Center(child: LoadingWidgetFoodlyLogo()).paddingHorizontal(context.screenWidth * .3),
          orElse: () => FadeIn(duration: Durations.medium2, child: child),
        );
      },
    );
  }
}
