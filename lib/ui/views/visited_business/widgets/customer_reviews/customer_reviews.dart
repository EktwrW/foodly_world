part of '../../visit_business_page.dart';

class _CustomerReviewsWdg extends StatelessWidget {
  const _CustomerReviewsWdg({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FoodlySectionsTitle(
          firstText: '${S.current.dashboardReviewsOfOurCustomersText1} ',
          secondText: S.current.dashboardReviewsOfOurCustomersText2,
        ),
        Visibility(
          visible: false,
          //visible: vm.currentBusiness?.reviews?.isEmpty ?? true,
          replacement: const ReviewCard(),
          child: Center(
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
        ),
      ],
    );
  }
}
