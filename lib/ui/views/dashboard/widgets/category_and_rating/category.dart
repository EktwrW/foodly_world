import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/dropdown_buttons/foodly_dropdown_button_form_field.dart';
import 'package:foodly_world/ui/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:foodly_world/ui/views/dashboard/view_model/dashboard_vm.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_save_and_cancel_buttons.dart';

class CategoryWdg extends StatelessWidget {
  final DashboardVM vm;

  const CategoryWdg({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DashboardBloc>();

    if (vm.isEditingCategory) {
      return FadeIn(
        child: Column(
          children: [
            FoodlyDropdownButtonFormField<FoodlyCategories>(
              onChanged: (FoodlyCategories? category) =>
                  category != null ? bloc.add(DashboardEvent.setCategory(category)) : null,
              enabled: vm.isEditingCategory,
              items: FoodlyCategories.values.map<DropdownMenuItem<FoodlyCategories>>((category) {
                return DropdownMenuItem<FoodlyCategories>(
                  value: category,
                  child: Row(
                    children: [
                      SizedBox.square(dimension: 30, child: category.icon).paddingSymmetric(horizontal: 10),
                      Text(category.text),
                    ],
                  ),
                );
              }).toList(),
              value: vm.newCategory ?? vm.currentBusiness?.category,
              validatorText: S.current.pleaseSelectBusinessCategory,
              hintText: S.current.businessCategory,
            ),
            DasboardSaveAndCancelButtons(
              onSavePressed: () => bloc.add(const DashboardEvent.updateBusiness()),
              onCancelPressed: () {
                bloc.add(const DashboardEvent.updateEditing(DashboardEditing.none));
              },
              showSaveButton: vm.newCategory != null && vm.newCategory != vm.currentBusiness?.category,
            ),
          ],
        ).paddingRight(16),
      );
    }
    return FadeIn(
      child: MaterialButton(
        onPressed: () => bloc.add(const DashboardEvent.updateEditing(DashboardEditing.category)),
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            SizedBox.square(dimension: 30, child: vm.currentBusiness?.category?.icon ?? const SizedBox.shrink()),
            Text(vm.currentBusiness?.category?.text ?? '').paddingLeft(8),
          ],
        ),
      ),
    ).paddingRight(16);
  }
}
