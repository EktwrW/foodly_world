part of './../../business_page.dart';

class RatingWdg extends StatelessWidget {
  const RatingWdg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BusinessBloc, BusinessState, (bool, double)>(
      selector: (state) {
        final vm = state.vm;

        return (vm.isEditingCategory, vm.currentBusiness?.rating ?? 0.0);
      },
      builder: (context, record) {
        return FadeOutRight(
          duration: Durations.medium3,
          animate: record.$1,
          child: FadeInRight(
            duration: Durations.medium3,
            child: FittedBox(
              child: Column(
                children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(text: S.current.ratingAvg, style: FoodlyTextStyles.caption),
                    TextSpan(text: ' ${record.$2}', style: FoodlyTextStyles.captionPurpleBold),
                  ])),
                  RatingBar.builder(
                    initialRating: record.$2,
                    itemSize: 18,
                    minRating: 1,
                    allowHalfRating: true,
                    ignoreGestures: true,
                    itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber, size: 16),
                    onRatingUpdate: (_) {},
                  ),
                ],
              ).paddingOnly(top: 10, right: 4),
            ),
          ),
        );
      },
    );
  }
}
