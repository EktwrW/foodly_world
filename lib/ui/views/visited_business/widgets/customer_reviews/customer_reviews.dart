part of '../../visit_business_page.dart';

class _VisitorCustomerReviewsWdg extends StatelessWidget {
  const _VisitorCustomerReviewsWdg({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FoodlySectionsTitle(
          firstText: '${S.current.dashboardReviewsOfOurCustomersText1} ',
          secondText: S.current.dashboardReviewsOfOurCustomersText2,
        ).paddingBottom(8),
        BlocSelector<VisitBusinessCubit, VisitBusinessState, (List<ReviewDM>, bool, bool)>(
          selector: (state) => (
            state.vm.currentBusinessReviews ?? [],
            state.vm.canLoadMoreReviews,
            state.vm.isLoadingMoreReviews,
          ),
          builder: (context, data) {
            final (currentBusinessReviews, canLoadMoreReviews, isLoadingMoreReviews) = data;

            return Visibility(
              visible: currentBusinessReviews.isNotEmpty,
              replacement: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Asset(FoodlyAssets.noCustomerReviewsYet, width: 40),
                    Flexible(
                      child: Text(
                        S.current.thereAreNoCustomerReviewsYet,
                        style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.primaryFoodly),
                      ).paddingTop(8),
                    ),
                  ],
                ).paddingVertical(16),
              ),
              child: CarouselSlider(
                key: const Key('visited-business-reviews-carousel-slider'),
                options: CarouselOptions(
                  height: 290,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.93,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  enlargeFactor: .26,
                  onPageChanged: (index, _) {
                    if (index >= currentBusinessReviews.length - 3 && canLoadMoreReviews) {
                      context.read<VisitBusinessCubit>().fetchMoreReviews();
                    }
                  },
                ),
                items: [
                  ...currentBusinessReviews.map((review) {
                    return ReviewCard(
                      review: review,
                      onEdit: () {
                        VisitedBusinessSnackbars.showInputReviewWdg(context, existingReview: review);
                      },
                      onDelete: () {
                        VisitedBusinessSnackbars.showDeleteReviewConfirmation(
                          context,
                          context.read<VisitBusinessCubit>(),
                          review,
                        );
                      },
                    );
                  }),
                  if (isLoadingMoreReviews)
                    const Center(
                      child: SizedBox.square(
                        dimension: 36,
                        child: CircularProgressIndicator.adaptive(
                            strokeWidth: 3, valueColor: AlwaysStoppedAnimation<Color>(FoodlyThemes.primaryFoodly)),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
