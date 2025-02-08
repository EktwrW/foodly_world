part of '../user_profile_page.dart';

class _UserReviews extends StatelessWidget {
  const _UserReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Asset(FoodlyAssets.noCustomerReviewsYet, width: 40),
        Flexible(
          child: Text(
            S.current.userReviewsPlaceholder,
            textAlign: TextAlign.center,
            style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.primaryFoodly),
          ).paddingTop(8),
        ),
      ],
    ).paddingVertical(16);
  }
}
