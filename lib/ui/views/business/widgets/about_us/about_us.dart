import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/save_and_cancel_buttons.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/shared_widgets/texts/foodly_sections_text_wdgs.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/bloc/business_bloc.dart';
import 'package:foodly_world/ui/views/business/view_model/business_vm.dart';

class AboutUsWdg extends StatelessWidget {
  const AboutUsWdg({
    super.key,
    required this.vm,
  });

  final BusinessVM vm;

  void onPressed(BusinessBloc bloc) {
    vm.businessAboutUsCtrl?.controller?.text = vm.currentBusiness?.aboutUs ?? '';
    bloc.add(const BusinessEvent.updateEditing(DashboardEditing.aboutUs));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BusinessBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FoodlySectionsTitle(
          firstText: '${S.current.about} ',
          secondText: S.current.us,
          onPressed: !vm.loggedUserCanEdit || vm.isEditingAboutUs ? null : () => onPressed(bloc),
        ),
        Visibility(
          visible: vm.isEditingAboutUs,
          replacement: TextButton(
            onPressed: () => onPressed(bloc),
            focusNode: vm.businessAddressCtrl?.focusNode,
            child: Row(
              children: [
                Expanded(
                  child: FadeIn(
                    child: Text(
                      vm.currentBusiness?.aboutUs ?? S.current.addADescription,
                      style: (vm.currentBusiness?.aboutUs?.isNotEmpty ?? false)
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
                    key: vm.aboutUsFormKey,
                    autovalidateMode: vm.autovalidateMode,
                    child: Column(
                      children: [
                        FoodlyPrimaryInputText(
                          controller: vm.businessAboutUsCtrl?.controller,
                          focusNode: vm.businessAboutUsCtrl?.focusNode,
                          inputTextType: FoodlyInputType.businessAboutUs,
                          autovalidateMode: vm.autovalidateMode,
                          minLines: 3,
                          autofocus: true,
                          maxLines: 3,
                          maxLength: 250,
                          enabled: vm.isEditingAboutUs,
                          hintText: vm.currentBusiness?.aboutUs,
                        ),
                        SaveAndCancelButtons(
                          onSavePressed: () => bloc.add(const BusinessEvent.updateBusiness()),
                          onCancelPressed: () {
                            vm.businessAboutUsCtrl?.controller?.clear();
                            bloc.add(const BusinessEvent.updateEditing(DashboardEditing.none));
                          },
                          recordControllers: [
                            (
                              vm.businessAboutUsCtrl?.controller ?? TextEditingController(),
                              vm.currentBusiness?.aboutUs ?? '',
                            )
                          ],
                        ),
                      ],
                    ).paddingTop(9),
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
