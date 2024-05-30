import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/dropdown_buttons/foodly_dropdown_button_form_field.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_phone_input_text.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/views/sign_up/cubit/sign_up_cubit.dart';
import 'package:foodly_world/ui/views/sign_up/view_model/sign_up_vm.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SignUpBusinessForm extends StatelessWidget {
  const SignUpBusinessForm({super.key});

  // TODO: move this method to business profile page:
  // Future<void> _selectDate(BuildContext context, SignUpVM vm, SignUpCubit cubit) async {
  //   final locale = Locale(cubit.lang, vm.currentCountryCode?.toUpperCase());

  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDatePickerMode: DatePickerMode.year,
  //     initialDate: DateTime(1990),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime.now(),
  //     locale: locale,
  //   );

  //   if (picked != null && picked != vm.businessDateOfOpening) {
  //     cubit.setBusinessDateOfOpening(picked);
  //   }
  //   vm.businessPhoneNumberNode?.requestFocus();
  // }

  Widget _buildForm(SignUpVM vm, BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    final enabled = !vm.tooltipActive;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                height: 140,
                width: context.screenWidth - 50,
                child: GoogleMap(
                  onMapCreated: cubit.onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: cubit.getCurrentPosition != null
                        ? LatLng(cubit.getCurrentPosition!.latitude, cubit.getCurrentPosition!.longitude)
                        : cubit.center,
                    zoom: 16.0,
                  ),
                  markers: vm.markers,
                ),
              ),
            ),
          ],
        ).paddingOnly(bottom: 30),
        FoodlyDropdownButtonFormField(
          onChanged: (FoodlyCategories? newValue) {
            cubit.setBusinessCategory(newValue);
            vm.businessNameController?.focusNode?.requestFocus();
          },
          enabled: enabled,
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
          value: vm.businessCategory,
          validatorText: S.current.pleaseSelectBusinessCategory,
          hintText: S.current.businessCategory,
          prefixIcon: vm.businessCategory == null ? const Icon(Icons.business_center_rounded) : null,
        ),
        FoodlyPrimaryInputText(
          controller: vm.businessNameController?.controller,
          focusNode: vm.businessNameController?.focusNode,
          secondaryFocusNode: vm.businessEmailController?.focusNode,
          inputTextType: FoodlyInputType.businessName,
          autovalidateMode: vm.autovalidateMode,
          enabled: enabled,
        ),
        FoodlyPrimaryInputText(
          controller: vm.businessEmailController?.controller,
          focusNode: vm.businessEmailController?.focusNode,
          secondaryFocusNode: vm.businessPhoneNumberController?.focusNode,
          inputTextType: FoodlyInputType.businessEmail,
          autovalidateMode: vm.autovalidateMode,
          enabled: enabled,
        ),
        // TODO: add this widget to business profile page:
        // StatefulBuilder(
        //   builder: (_, setNewState) {
        //     var isOpen = false;
        //     return InkWell(
        //       onFocusChange: (enabled && vm.businessDateOfOpening == null)
        //           ? (val) async {
        //               if ((vm.businessDateOfOpeningNode?.hasFocus ?? false) && !isOpen) {
        //                 setNewState(() => isOpen = true);
        //                 await _selectDate(context, vm, cubit).then((value) => setNewState(() => isOpen = false));
        //               }
        //             }
        //           : null,
        //       onTap: isOpen
        //           ? null
        //           : enabled
        //               ? () async {
        //                   setNewState(() => isOpen = true);
        //                   await _selectDate(context, vm, cubit).then((value) => setNewState(() => isOpen = false));
        //                 }
        //               : null,
        //       focusColor: Colors.transparent,
        //       splashColor: Colors.transparent,
        //       focusNode: vm.businessDateOfOpeningNode,
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Row(
        //             children: [
        //               Icon(
        //                 Bootstrap.calendar2_event_fill,
        //                 size: 24,
        //                 color: enabled ? Colors.black87 : ui.NeumorphicColors.disabled,
        //               ).paddingSymmetric(horizontal: 12),
        //               Text(
        //                 vm.businessDateOfOpening?.getStringFormat ?? 'Fecha de apertura',
        //                 style: TextStyle(
        //                   color: !enabled
        //                       ? ui.NeumorphicColors.disabled
        //                       : vm.businessDateOfOpening != null
        //                           ? Colors.black87
        //                           : FoodlyThemes.secondaryFoodly,
        //                   fontSize: 16,
        //                 ),
        //               ).paddingOnly(top: 6)
        //             ],
        //           ),
        //           Divider(
        //             color: (vm.businessDateOfOpeningNode?.hasFocus ?? false)
        //                 ? FoodlyThemes.primaryFoodly
        //                 : !enabled
        //                     ? Colors.black12
        //                     : FoodlyThemes.secondaryFoodly,
        //             height: 20,
        //             thickness: (vm.businessDateOfOpeningNode?.hasFocus ?? false) ? 2 : 1,
        //           ),
        //         ],
        //       ).paddingOnly(top: 8, bottom: 10),
        //     );
        //   },
        // ),
        FoodlyPhoneInputText(
          keyString: vm.businessCountryCode,
          enabled: enabled,
          controller: vm.businessPhoneNumberController!.controller,
          focusNode: vm.businessPhoneNumberController?.focusNode,
          autovalidateMode: vm.autovalidateMode,
          onSubmitted: (value) => vm.businessCountryController?.focusNode?.requestFocus(),
          initialCountryCode: vm.businessCountryCode ?? vm.currentCountryCode,
        ),
        FoodlyPrimaryInputText(
          controller: vm.businessCountryController?.controller,
          focusNode: vm.businessCountryController?.focusNode,
          secondaryFocusNode: vm.businessCityController?.focusNode,
          inputTextType: FoodlyInputType.businessCountry,
          autovalidateMode: vm.autovalidateMode,
          enabled: enabled,
        ),
        FoodlyPrimaryInputText(
          controller: vm.businessCityController?.controller,
          focusNode: vm.businessCityController?.focusNode,
          secondaryFocusNode: vm.businessAddressController?.focusNode,
          inputTextType: FoodlyInputType.businessCity,
          autovalidateMode: vm.autovalidateMode,
          enabled: enabled,
        ),
        FoodlyPrimaryInputText(
          controller: vm.businessAddressController?.controller,
          focusNode: vm.businessAddressController?.focusNode,
          secondaryFocusNode: vm.businessZipCodeController?.focusNode,
          inputTextType: FoodlyInputType.businessAddress,
          autovalidateMode: vm.autovalidateMode,
          enabled: enabled,
        ),
        FoodlyPrimaryInputText(
          controller: vm.businessZipCodeController?.controller,
          focusNode: vm.businessZipCodeController?.focusNode,
          inputTextType: FoodlyInputType.businessZipCode,
          autovalidateMode: vm.autovalidateMode,
          enabled: enabled,
          countryCode: vm.businessCountryCode ?? '',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: (signUpVM) => _buildForm(signUpVM, context),
          loaded: (signUpVM) => _buildForm(signUpVM, context),
          userCreated: (signUpVM) => _buildForm(signUpVM, context),
          businessCreated: (signUpVM) => _buildForm(signUpVM, context),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
