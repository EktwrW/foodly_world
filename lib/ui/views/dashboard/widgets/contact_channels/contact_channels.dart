import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_phone_input_text.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:foodly_world/ui/views/dashboard/helpers/dashboard_helpers.dart';
import 'package:foodly_world/ui/views/dashboard/view_model/dashboard_vm.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/contact_channels/dashboard_email_phone.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_save_and_cancel_buttons.dart';
import 'package:foodly_world/ui/views/dashboard/widgets/dashboard_titles_rich_text.dart';

class ContactChannelsWdg extends StatelessWidget {
  final DashboardVM vm;

  const ContactChannelsWdg({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DashboardBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardSectionsTitle(firstText: 'Medios de ', secondText: 'Contacto'),
        Visibility(
          visible: vm.isEditingContactUs,
          replacement: TextButton(
            onPressed: () {
              bloc.restartContactUsControllers();
              bloc.add(const DashboardEvent.updateEditing(DashboardEditing.contactUs));
            },
            focusNode: vm.businessEmailCtrl?.focusNode,
            child: Row(
              children: [
                if (bloc.contactUsIsEmpty)
                  FadeIn(
                    child: const Text(
                      'Agregar canales de contacto',
                      style: FoodlyTextStyles.profileSectionTextButton,
                    ),
                  )
                else
                  DashboardEmailAndPhoneWdg(
                    email: vm.currentBusiness?.email ?? '',
                    phoneNumber: vm.currentBusiness?.phoneNumber ?? '',
                  )
              ],
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: FadeIn(
                  child: Form(
                    key: vm.contactUsFormKey,
                    autovalidateMode: vm.autovalidateMode,
                    child: Column(
                      children: [
                        FoodlyPrimaryInputText(
                          controller: vm.businessEmailCtrl?.controller,
                          hintText: vm.currentBusiness?.email,
                          focusNode: vm.businessEmailCtrl?.focusNode,
                          secondaryFocusNode: vm.businessPhoneCtrl?.focusNode,
                          inputTextType: FoodlyInputType.businessEmail,
                          autovalidateMode: vm.autovalidateMode,
                          enabled: vm.isEditingContactUs,
                        ),
                        FoodlyPhoneInputText(
                          controller: vm.businessPhoneCtrl?.controller,
                          hintText: vm.currentBusiness?.phoneNumber,
                          focusNode: vm.businessPhoneCtrl?.focusNode,
                          onSubmitted: (_) => bloc.add(const DashboardEvent.updateBusiness()),
                          autovalidateMode: vm.autovalidateMode,
                          enabled: vm.isEditingContactUs,
                          initialCountryCode: vm.businessCountryCode,
                        ),
                        DashboardSaveAndCancelButtons(
                          onSavePressed: () => bloc.add(const DashboardEvent.updateBusiness()),
                          onCancelPressed: () {
                            bloc.restartContactUsControllers();
                            bloc.add(const DashboardEvent.updateEditing(DashboardEditing.none));
                          },
                          recordControllers: DashboardHelpers.contactChannelsFieldControllers(vm),
                        ),
                      ],
                    ).paddingTop(8),
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
