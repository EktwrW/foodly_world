part of './../../business_page.dart';

class CategoryAndRatingWdg extends StatelessWidget {
  const CategoryAndRatingWdg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BusinessBloc, BusinessState, bool>(
      selector: (state) {
        return state.vm.isEditingCategory;
      },
      builder: (context, isEditingCategory) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: isEditingCategory ? 8 : 3, child: const CategoryWdg()),
            const Expanded(child: RatingWdg()),
          ],
        );
      },
    );
  }
}
