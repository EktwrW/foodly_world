import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/enums/foodly_countries.dart';
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
        FoodlyPhoneInputText(
          keyString: vm.businessCountryCode,
          enabled: enabled,
          controller: vm.businessPhoneNumberController!.controller,
          focusNode: vm.businessPhoneNumberController?.focusNode,
          autovalidateMode: vm.autovalidateMode,
          onSubmitted: (value) => vm.businessCountryNode?.requestFocus(),
          initialCountryCode: cubit.currentCountryCode,
        ),
        FoodlyDropdownButtonFormField(
          value: vm.businessCountry,
          focusNode: vm.businessCountryNode,
          hintText: S.current.country,
          enabled: enabled,
          onChanged: (FoodlyCountries? newValue) {
            cubit.setBusinessCountry(newValue);
            vm.businessCityController?.focusNode?.requestFocus();
          },
          items: FoodlyCountries.values
              .map<DropdownMenuItem<FoodlyCountries>>(
                (FoodlyCountries country) => DropdownMenuItem<FoodlyCountries>(
                  value: country,
                  child: Row(
                    children: [
                      if (country.flag != null) country.flag!.paddingHorizontal(12),
                      Text(country.value),
                    ],
                  ),
                ),
              )
              .toList(),
          prefixIcon: vm.businessCountry == null ? FoodlyInputType.businessCountry.icon : null,
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
          error: (e, signUpVM) => _buildForm(signUpVM, context),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
