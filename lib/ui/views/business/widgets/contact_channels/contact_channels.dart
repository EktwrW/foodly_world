import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_phone_input_text.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/bloc/business_bloc.dart';
import 'package:foodly_world/ui/views/business/helpers/dashboard_helpers.dart';
import 'package:foodly_world/ui/views/business/view_model/dashboard_vm.dart';
import 'package:foodly_world/ui/views/business/widgets/business_save_and_cancel_buttons.dart';
import 'package:foodly_world/ui/views/business/widgets/business_titles_rich_text.dart';
import 'package:foodly_world/ui/views/business/widgets/contact_channels/business_email_phone.dart';

class ContactChannelsWdg extends StatelessWidget {
  final DashboardVM vm;

  const ContactChannelsWdg({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BusinessBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardSectionsTitle(firstText: 'Medios de ', secondText: 'Contacto'),
        Visibility(
          visible: vm.isEditingContactUs,
          replacement: TextButton(
            onPressed: () {
              bloc.restartContactUsControllers();
              bloc.add(const BusinessEvent.updateEditing(DashboardEditing.contactUs));
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
                  BusinessEmailAndPhoneWdg(
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
                          onSubmitted: (_) => bloc.add(const BusinessEvent.updateBusiness()),
                          autovalidateMode: vm.autovalidateMode,
                          enabled: vm.isEditingContactUs,
                          initialCountryCode: vm.businessCountryCode,
                        ),
                        DashboardSaveAndCancelButtons(
                          onSavePressed: () => bloc.add(const BusinessEvent.updateBusiness()),
                          onCancelPressed: () {
                            bloc.restartContactUsControllers();
                            bloc.add(const BusinessEvent.updateEditing(DashboardEditing.none));
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
