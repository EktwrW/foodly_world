part of '../../visit_business_page.dart';

class CategoryWdg extends StatelessWidget {
  const CategoryWdg({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VisitBusinessCubit, VisitBusinessState, FoodlyCategories?>(
      selector: (state) => state.vm.currentBusiness?.category,
      builder: (context, category) {
        return Row(
          children: [
            SizedBox.square(dimension: 30, child: category?.icon ?? const SizedBox.shrink()),
            Text(category?.text ?? '-').paddingLeft(8),
          ],
        );
      },
    ).paddingRight(16);
  }
}
