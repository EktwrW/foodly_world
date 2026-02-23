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
        ),
        BlocSelector<VisitBusinessCubit, VisitBusinessState, List<ReviewDM>>(
          selector: (state) {
            return state.vm.currentBusinessReviews ?? [];
          },
          builder: (context, currentBusinessReviews) {
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
                  enlargeFactor: .26,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
                items: currentBusinessReviews.map((review) {
                  return ReviewCard(review: review);
                }).toList(),
              ).paddingTop(8),
            );
          },
        ),
      ],
    );
  }
}
