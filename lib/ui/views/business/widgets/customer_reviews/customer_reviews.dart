part of '../../business_page.dart';

class CustomerReviewsWdg extends StatelessWidget {
  const CustomerReviewsWdg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FoodlySectionsTitle(
          firstText: '${S.current.dashboardReviewsOfOurCustomersText1} ',
          secondText: S.current.dashboardReviewsOfOurCustomersText2,
        ).paddingBottom(8),
        BlocSelector<BusinessBloc, BusinessState, List<ReviewDM>>(
          selector: (state) {
            return state.vm.currentBusiness?.reviews ?? [];
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
              child: FoodlyCarousel(
                key: const Key('business-reviews-carousel'),
                height: 273,
                enableInfiniteScroll: false,
                autoPlay: true,
                viewportFraction: 0.99,
                items: currentBusinessReviews.map((review) {
                  return ReviewCard(review: review);
                }).toList(),
              ),
            );
          },
        ),
      ],
    );
  }
}
