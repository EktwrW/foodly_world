part of '../../visit_business_page.dart';

class RatingWdg extends StatelessWidget {
  const RatingWdg({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: Durations.medium3,
      child: FittedBox(
        child: Column(
          children: [
            const Text.rich(TextSpan(children: [
              TextSpan(text: 'Rating Avg:', style: FoodlyTextStyles.caption),
              TextSpan(text: ' 4.3', style: FoodlyTextStyles.captionPurpleBold),
            ])),
            RatingBar.builder(
              initialRating: 4.3,
              itemSize: 18,
              minRating: 1,
              allowHalfRating: true,
              itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber, size: 16),
              onRatingUpdate: (rating) {},
            ),
          ],
        ).paddingOnly(right: 4),
      ),
    );
  }
}
