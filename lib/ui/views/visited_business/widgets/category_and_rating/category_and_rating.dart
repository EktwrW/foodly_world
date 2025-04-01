part of '../../visit_business_page.dart';

class _CategoryAndRatingWdg extends StatelessWidget {
  const _CategoryAndRatingWdg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 3, child: CategoryWdg()),
        Expanded(child: RatingWdg()),
      ],
    );
  }
}
