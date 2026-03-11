part of '../../visit_business_page.dart';

class RatingWdg extends StatelessWidget {
  const RatingWdg({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: Durations.medium3,
      child: FittedBox(
        child: BlocSelector<VisitBusinessCubit, VisitBusinessState, double>(
          selector: (state) {
            return state.vm.currentBusiness?.rating ?? 0.0;
          },
          builder: (context, rating) {
            return Column(
              children: [
                Text.rich(TextSpan(children: [
                  const TextSpan(text: 'Rating Avg:', style: FoodlyTextStyles.caption),
                  TextSpan(text: ' $rating', style: FoodlyTextStyles.captionPurpleBold),
                ])),
                RatingBar.builder(
                  initialRating: rating,
                  itemSize: 18,
                  minRating: 1,
                  allowHalfRating: true,
                  ignoreGestures: true,
                  itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber, size: 16),
                  onRatingUpdate: (_) {},
                ),
              ],
            );
          },
        ).paddingOnly(right: 4),
      ),
    );
  }
}
