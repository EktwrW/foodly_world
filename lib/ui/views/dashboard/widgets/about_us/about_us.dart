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

class AboutUsWdg extends StatelessWidget {
  const AboutUsWdg({
    super.key,
    required this.vm,
  });

  final DashboardVM vm;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DashboardBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DashboardTitleRichText(firstText: '${S.current.about} ', secondText: S.current.us, topPadding: 26),
        Visibility(
          visible: vm.isEditingAboutUs,
          replacement: TextButton(
            onPressed: () {
              vm.businessAboutUsCtrl?.controller?.text = vm.currentBusiness?.aboutUs ?? '';
              bloc.add(const DashboardEvent.updateEditing(DashboardEditing.aboutUs));
            },
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
                    key: vm.formKey,
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
                        DasboardSaveAndCancelButtons(
                          onSavePressed: () => bloc.add(const DashboardEvent.updateBusiness()),
                          onCancelPressed: () {
                            vm.businessAboutUsCtrl?.controller?.clear();
                            bloc.add(const DashboardEvent.updateEditing(DashboardEditing.none));
                          },
                          recordControllers: [
                            (
                              vm.businessAboutUsCtrl?.controller ?? TextEditingController(),
                              vm.currentBusiness?.aboutUs ?? '',
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
