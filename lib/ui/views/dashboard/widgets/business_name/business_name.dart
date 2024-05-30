import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:foodly_world/ui/views/dashboard/view_model/dashboard_vm.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_save_and_cancel_buttons.dart';

class BusinessNameWdg extends StatelessWidget {
  final DashboardVM vm;

  const BusinessNameWdg({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DashboardBloc>();

    return Visibility(
      visible: vm.isEditingName,
      replacement: InkWell(
        onTap: () {
          vm.businessNameCtrl?.controller?.text = vm.currentBusiness?.name ?? '';
          bloc.add(const DashboardEvent.updateEditing(DashboardEditing.name));
        },
        focusNode: vm.businessNameCtrl?.focusNode,
        child: SizedBox(
          width: double.infinity,
          height: 35,
          child: Center(
            child: FadeIn(
              child: Text(
                vm.currentBusiness?.name ?? '',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: FoodlyTextStyles.cardSubtitle.copyWith(color: Colors.black),
              ),
            ),
          ),
        ).paddingBottom(5),
      ),
      child: Row(
        children: [
          Expanded(
            child: FadeIn(
              child: Form(
                key: vm.formKey,
                autovalidateMode: vm.autovalidateMode,
                child: Column(
                  children: [
                    FoodlyPrimaryInputText(
                      controller: vm.businessNameCtrl?.controller,
                      focusNode: vm.businessNameCtrl?.focusNode,
                      inputTextType: FoodlyInputType.businessName,
                      autovalidateMode: vm.autovalidateMode,
                      autofocus: true,
                      maxLength: 33,
                      enabled: vm.isEditingName,
                      hintText: vm.currentBusiness?.name,
                    ),
                    DashboardSaveAndCancelButtons(
                      onSavePressed: () => bloc.add(const DashboardEvent.updateBusiness()),
                      onCancelPressed: () {
                        vm.businessNameCtrl?.controller?.clear();
                        bloc.add(const DashboardEvent.updateEditing(DashboardEditing.none));
                      },
                      recordControllers: [
                        (
                          vm.businessNameCtrl?.controller ?? TextEditingController(),
                          vm.currentBusiness?.name ?? '',
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ).paddingBottom(6),
    );
  }
}
