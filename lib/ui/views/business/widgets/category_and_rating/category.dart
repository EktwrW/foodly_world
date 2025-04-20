import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/category_extension.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/save_and_cancel_buttons.dart';
import 'package:foodly_world/ui/shared_widgets/dropdown_buttons/foodly_dropdown_button_form_field.dart';
import 'package:foodly_world/ui/views/business/bloc/business_bloc.dart';
import 'package:foodly_world/ui/views/business/view_model/business_vm.dart';

class CategoryWdg extends StatelessWidget {
  final BusinessVM vm;

  const CategoryWdg({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BusinessBloc>();

    if (vm.isEditingCategory) {
      return Form(
        key: vm.categoryFormKey,
        autovalidateMode: vm.autovalidateMode,
        child: FadeIn(
          child: Column(
            children: [
              FoodlyDropdownButtonFormField<FoodlyCategories>(
                onChanged: (FoodlyCategories? category) =>
                    category != null ? bloc.add(BusinessEvent.setCategory(category)) : null,
                enabled: vm.isEditingCategory,
                items: FoodlyCategories.values.map<DropdownMenuItem<FoodlyCategories>>((category) {
                  return DropdownMenuItem<FoodlyCategories>(
                    value: category,
                    child: Row(
                      children: [
                        SizedBox.square(dimension: 30, child: category.avatar).paddingSymmetric(horizontal: 10),
                        Text(category.text),
                      ],
                    ),
                  );
                }).toList(),
                value: vm.newCategory ?? vm.currentBusiness?.category?.id,
                validatorText: S.current.pleaseSelectBusinessCategory,
                hintText: S.current.businessCategory,
              ),
              SaveAndCancelButtons(
                onSavePressed: () => bloc.add(const BusinessEvent.updateBusiness()),
                onCancelPressed: () {
                  bloc.add(const BusinessEvent.updateEditing(DashboardEditing.none));
                },
                showSaveButton: vm.newCategory != null && vm.newCategory != vm.currentBusiness?.category?.id,
              ),
            ],
          ).paddingRight(16),
        ),
      );
    }
    return FadeIn(
      child: MaterialButton(
        onPressed: () => bloc.add(const BusinessEvent.updateEditing(DashboardEditing.category)),
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            SizedBox.square(dimension: 30, child: vm.currentBusiness?.category?.avatar ?? const SizedBox.shrink()),
            Text(vm.currentBusiness?.category?.id?.text ?? '').paddingLeft(8),
          ],
        ),
      ),
    ).paddingRight(16);
  }
}
