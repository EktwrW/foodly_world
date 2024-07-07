import 'package:flutter/material.dart';
import 'package:foodly_world/ui/views/business/view_model/dashboard_vm.dart';

import 'category.dart';
import 'rating.dart';

class CategoryAndRatingWdg extends StatelessWidget {
  const CategoryAndRatingWdg({
    super.key,
    required this.vm,
  });

  final DashboardVM vm;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: vm.isEditingCategory ? 8 : 3, child: CategoryWdg(vm: vm)),
        Expanded(child: RatingWdg(vm: vm)),
      ],
    );
  }
}
