import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:foodly_world/ui/views/dashboard/view_model/dashboard_vm.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_save_and_cancel_buttons.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_titles_rich_text.dart';

class AdditionalInfoWdg extends StatelessWidget {
  final DashboardVM vm;

  const AdditionalInfoWdg({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DashboardBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DashboardTitleRichText(
          firstText: '${S.current.dashboardAdditionalInformationText1} ',
          secondText: S.current.dashboardAdditionalInformationText2,
        ),
        Visibility(
          visible: vm.isEditingAdditionalInfo,
          replacement: TextButton(
            onPressed: () {
              vm.businessAdditionalInfoCtrl?.controller?.text = vm.currentBusiness?.additionalInfo ?? '';
              bloc.add(const DashboardEvent.updateEditing(DashboardEditing.additionalInfo));
            },
            focusNode: vm.businessAdditionalInfoCtrl?.focusNode,
            child: Row(
              children: [
                Expanded(
                  child: FadeIn(
                    child: Text(
                      vm.currentBusiness?.additionalInfo ?? S.current.addAdditionalInformation,
                      style: (vm.currentBusiness?.additionalInfo?.isNotEmpty ?? false)
                          ? FoodlyTextStyles.actionsBody
                          : FoodlyTextStyles.profileSectionTextButton,
                    ),
                  ),
                )
              ],
            ),
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
                          controller: vm.businessAdditionalInfoCtrl!.controller!,
                          focusNode: vm.businessAdditionalInfoCtrl?.focusNode,
                          inputTextType: FoodlyInputType.businessAdditionalInfo,
                          autovalidateMode: vm.autovalidateMode,
                          minLines: 2,
                          autofocus: true,
                          maxLines: 2,
                          maxLength: 100,
                          enabled: vm.isEditingAdditionalInfo,
                          hintText: vm.currentBusiness?.additionalInfo,
                        ),
                        DasboardSaveAndCancelButtons(
                          onSavePressed: () => bloc.add(const DashboardEvent.updateBusiness()),
                          onCancelPressed: () {
                            vm.businessAdditionalInfoCtrl?.controller?.clear();
                            bloc.add(const DashboardEvent.updateEditing(DashboardEditing.none));
                          },
                          recordControllers: [
                            (
                              vm.businessAdditionalInfoCtrl?.controller ?? TextEditingController(),
                              vm.currentBusiness?.additionalInfo ?? '',
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
