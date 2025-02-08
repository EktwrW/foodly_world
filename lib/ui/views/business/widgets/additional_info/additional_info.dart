import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/save_and_cancel_buttons.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/shared_widgets/texts/foodly_sections_text_wdgs.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/bloc/business_bloc.dart';
import 'package:foodly_world/ui/views/business/view_model/business_vm.dart';

class AdditionalInfoWdg extends StatelessWidget {
  final BusinessVM vm;

  const AdditionalInfoWdg({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BusinessBloc>();
    void onPressed() {
      vm.businessAdditionalInfoCtrl?.controller?.text = vm.currentBusiness?.additionalInfo ?? '';
      bloc.add(const BusinessEvent.updateEditing(DashboardEditing.additionalInfo));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FoodlySectionsTitle(
          firstText: '${S.current.dashboardAdditionalInformationText1} ',
          secondText: S.current.dashboardAdditionalInformationText2,
          onPressed: !vm.loggedUserCanEdit || vm.isEditingAdditionalInfo ? null : onPressed,
        ),
        Visibility(
          visible: vm.isEditingAdditionalInfo,
          replacement: TextButton(
            onPressed: onPressed,
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
                    key: vm.addInfoFormKey,
                    autovalidateMode: vm.autovalidateMode,
                    child: Column(
                      children: [
                        FoodlyPrimaryInputText(
                          controller: vm.businessAdditionalInfoCtrl?.controller,
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
                        SaveAndCancelButtons(
                          onSavePressed: () => bloc.add(const BusinessEvent.updateBusiness()),
                          onCancelPressed: () {
                            vm.businessAdditionalInfoCtrl?.controller?.clear();
                            bloc.add(const BusinessEvent.updateEditing(DashboardEditing.none));
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
