import 'package:flutter/material.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

class CreateCategoryContainer extends StatelessWidget {
  final Widget child;

  const CreateCategoryContainer({
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
