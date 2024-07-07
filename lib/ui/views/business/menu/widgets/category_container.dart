part of '../menu_screen.dart';

class CategoryContainer extends StatelessWidget {
  final Widget child;

  const CategoryContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: FoodlyThemes.primaryFoodly, width: 1.5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: child,
    );
  }
}
