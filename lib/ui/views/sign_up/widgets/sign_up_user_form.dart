import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumo/flutter_neumo.dart' as ui;
import 'package:foodly_world/core/blocs/check_availabilities/check_availabilities_cubit.dart';
import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/view_models/user_profile_vm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/animations/animated_opacity.dart';
import 'package:foodly_world/ui/shared_widgets/dropdown_buttons/foodly_dropdown_button_form_field.dart';
import 'package:foodly_world/ui/shared_widgets/places_autocomplete/places_autocomplete_wdg.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_phone_input_text.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/sign_up/cubit/sign_up_cubit.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class SignUpUserForm extends StatelessWidget {
  const SignUpUserForm({super.key});

  Future<void> _selectDate(BuildContext context, UserProfileVM vm, SignUpCubit cubit) async {
    final locale = Locale(cubit.lang, cubit.currentCountryCode.toUpperCase());

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.year,
      initialDate: DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: locale,
    );

    if (picked != null && picked != vm.dateOfBirth) {
      cubit.updateDateOfBirth(picked);
    }
    vm.genderNode?.requestFocus();
  }

  Widget _buildForm(UserProfileVM vm, BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    final enabled = vm.roleId != null;

    return Column(
      children: [
        BlocProvider(
          create: (context) => CheckAvailabilitiesCubit(),
          child: BlocBuilder<CheckAvailabilitiesCubit, CheckAvailabilitiesState>(
            builder: (context, state) {
              final checkUsernameCubit = context.read<CheckAvailabilitiesCubit>();

              return FoodlyPrimaryInputText(
                onChanged: (p0) {
                  context.read<CheckAvailabilitiesCubit>().onTextChanged(p0);
                },
                controller: vm.nickNameController!.controller!,
                focusNode: vm.nickNameController?.focusNode,
                secondaryFocusNode: vm.firstNameController?.focusNode,
                inputTextType: FoodlyInputType.nickName,
                autovalidateMode: AutovalidateMode.always,
                maxLength: 30,
                enabled: enabled,
                showLeading: false,
                trailing: Stack(
                  alignment: Alignment.center,
                  children: [
                    FoodlyAnimatedOpacity(
                      key: const Key('check-username-signup-initial'),
                      visible: checkUsernameCubit.isInitialState,
                      child: Icon(Bootstrap.search,
                          size: 20, color: enabled ? FoodlyThemes.primaryFoodly : ui.NeumoColors.disabled),
                    ),
                    FoodlyAnimatedOpacity(
                      key: const Key('check-username-signup-loading'),
                      visible: checkUsernameCubit.isLoading,
                      child: const SizedBox.square(
                          dimension: 20, child: CircularProgressIndicator.adaptive(strokeWidth: 2.5)),
                    ),
                    FoodlyAnimatedOpacity(
                      key: const Key('check-username-signup-available'),
                      visible: checkUsernameCubit.isAvailable,
                      child: const Icon(Bootstrap.check2_circle, size: 24, color: FoodlyThemes.tertiaryFoodly),
                    ),
                    FoodlyAnimatedOpacity(
                      key: const Key('check-username-signup-unavailable'),
                      visible: checkUsernameCubit.isUnavailable,
                      child: const Icon(Bootstrap.x_circle, size: 21, color: FoodlyThemes.error),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        FoodlyPrimaryInputText(
          controller: vm.firstNameController!.controller!,
          focusNode: vm.firstNameController?.focusNode,
          secondaryFocusNode: vm.lastNameController?.focusNode,
          inputTextType: FoodlyInputType.firstName,
          autovalidateMode: vm.autovalidateMode,
          enabled: enabled,
          showLeading: false,
        ),
        FoodlyPrimaryInputText(
          controller: vm.lastNameController!.controller!,
          focusNode: vm.lastNameController?.focusNode,
          secondaryFocusNode: vm.emailController?.focusNode,
          inputTextType: FoodlyInputType.lastName,
          autovalidateMode: vm.autovalidateMode,
          enabled: enabled,
          showLeading: false,
        ),
        FoodlyPrimaryInputText(
          controller: vm.emailController!.controller!,
          focusNode: vm.emailController?.focusNode,
          secondaryFocusNode: vm.passwordController?.focusNode,
          inputTextType: FoodlyInputType.email,
          autovalidateMode: vm.autovalidateMode,
          enabled: enabled,
          showLeading: false,
        ),
        FoodlyPrimaryInputText(
          controller: vm.passwordController!.controller!,
          focusNode: vm.passwordController?.focusNode,
          secondaryFocusNode: vm.placesFocusNode,
          inputTextType: FoodlyInputType.password,
          autovalidateMode: vm.autovalidateMode,
          obscureText: true,
          enabled: enabled,
        ),
        PlacesAutocompleteWdg(
          key: const Key('find-user-location'),
          language: cubit.lang,
          disabled: !enabled,
          focusNode: vm.placesFocusNode,
          components: FoodlyCountries.USA.apiComponents,
          onPickedPlaceDetail: (place) {
            cubit.updateUserLocationFromPlacesAPI(place);
            di<LocationService>().updateLocationFromPlace(place);
            di<Logger>().i('$place');
          },
          hintText: S.current.findAndCompleteAddress,
        ).paddingOnly(top: 12, bottom: 20),
        FoodlyDropdownButtonFormField(
          value: vm.country,
          focusNode: vm.countryNode,
          decoration: InputDecoration(
            prefixIcon: vm.country?.flag?.paddingAll(10) ?? FoodlyInputType.country.icon,
            prefixIconColor: enabled ? Colors.black87 : ui.NeumoColors.disabled,
            hintText: S.current.country,
            contentPadding: const EdgeInsets.only(top: 12),
            iconColor: enabled ? null : ui.NeumoColors.disabled,
            enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(width: enabled ? 0.7 : 0.35, color: enabled ? Colors.black87 : ui.NeumoColors.disabled),
            ),
            hintStyle: TextStyle(
              color: enabled ? FoodlyThemes.secondaryFoodly : ui.NeumoColors.disabled,
              fontSize: 14,
            ),
          ),
          enabled: enabled,
          onChanged: (FoodlyCountries? newValue) {
            cubit.setUserCountry(newValue);
            vm.addressController?.focusNode?.requestFocus();
          },
          items: FoodlyCountries.values
              .map<DropdownMenuItem<FoodlyCountries>>(
                (FoodlyCountries country) => DropdownMenuItem<FoodlyCountries>(
                  value: country,
                  child: Text(country.value, style: FoodlyTextStyles.actionsBody),
                ),
              )
              .toList(),
        ),
        FoodlyPrimaryInputText(
          controller: vm.addressController!.controller!,
          focusNode: vm.addressController?.focusNode,
          secondaryFocusNode: vm.cityController?.focusNode,
          inputTextType: FoodlyInputType.address,
          autovalidateMode: vm.autovalidateMode,
          enabled: enabled,
          maxLines: 1,
          showLeading: false,
        ),
        FoodlyPrimaryInputText(
          controller: vm.cityController!.controller!,
          focusNode: vm.cityController?.focusNode,
          secondaryFocusNode: vm.zipCodeController?.focusNode,
          inputTextType: FoodlyInputType.city,
          autovalidateMode: vm.autovalidateMode,
          enabled: enabled,
          showLeading: false,
        ),
        FoodlyPrimaryInputText(
          controller: vm.zipCodeController!.controller!,
          focusNode: vm.zipCodeController?.focusNode,
          secondaryFocusNode: vm.phoneNumberController?.focusNode,
          inputTextType: FoodlyInputType.zipCode,
          autovalidateMode: vm.autovalidateMode,
          enabled: enabled,
          countryCode: cubit.currentCountryCode.toUpperCase(),
          showLeading: false,
        ),
        FoodlyPhoneInputText(
          enabled: enabled,
          controller: vm.phoneNumberController?.controller,
          focusNode: vm.phoneNumberController?.focusNode,
          autovalidateMode: vm.autovalidateMode,
          onSubmitted: (value) => vm.dateOfBirthNode?.requestFocus(),
          initialCountryCode: cubit.currentCountryCode.toUpperCase(),
        ),
        StatefulBuilder(
          builder: (_, setState) {
            var isOpen = false;
            return InkWell(
              onFocusChange: (enabled && vm.dateOfBirth == null)
                  ? (val) async {
                      if ((vm.dateOfBirthNode?.hasFocus ?? false) && !isOpen) {
                        setState(() => isOpen = true);
                        await _selectDate(context, vm, cubit).then((value) => setState(() => isOpen = false));
                      }
                    }
                  : null,
              onTap: isOpen
                  ? null
                  : enabled
                      ? () async {
                          setState(() => isOpen = true);
                          await _selectDate(context, vm, cubit).then((value) => setState(() => isOpen = false));
                        }
                      : null,
              focusColor: Colors.transparent,
              splashColor: Colors.transparent,
              focusNode: vm.dateOfBirthNode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Bootstrap.calendar2_event,
                        size: 24,
                        color: enabled ? Colors.black87 : ui.NeumoColors.disabled,
                      ).paddingSymmetric(horizontal: 12),
                      Text(
                        vm.dateOfBirth?.getStringFormat ?? S.current.dateOfBirth,
                        style: !enabled
                            ? FoodlyTextStyles.disabledText
                            : vm.dateOfBirth != null
                                ? FoodlyTextStyles.inputTextValue
                                : FoodlyTextStyles.hintText,
                      ).paddingOnly(top: 6)
                    ],
                  ),
                  Divider(
                    color: (vm.dateOfBirthNode?.hasFocus ?? false)
                        ? FoodlyThemes.primaryFoodly
                        : !enabled
                            ? Colors.black12
                            : FoodlyThemes.secondaryFoodly,
                    height: 20,
                    thickness: (vm.dateOfBirthNode?.hasFocus ?? false) ? 2 : 1,
                  ),
                ],
              ).paddingOnly(top: 8, bottom: 10),
            );
          },
        ),
        DropdownButtonFormField<UserGender>(
          value: vm.gender,
          focusNode: vm.genderNode,
          disabledHint: Text(
            S.current.gender,
            style: FoodlyTextStyles.disabledText,
          ),
          decoration: InputDecoration(
            prefix: const SizedBox.shrink(),
            prefixIconColor: enabled ? Colors.black87 : ui.NeumoColors.disabled,
            hintText: S.current.gender,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: enabled ? 0.75 : 0.5, color: enabled ? Colors.black87 : Colors.grey),
            ),
            hintStyle: FoodlyTextStyles.hintText.copyWith(
              color: enabled ? FoodlyThemes.secondaryFoodly : ui.NeumoColors.disabled,
            ),
          ),
          onChanged: enabled
              ? (UserGender? newValue) {
                  cubit.setUserGender(newValue);
                }
              : null,
          items: vm.userGenders.map<DropdownMenuItem<UserGender>>((UserGender gender) {
            return DropdownMenuItem<UserGender>(
              value: gender,
              child: Text(gender.text, style: FoodlyTextStyles.inputTextValue),
            );
          }).toList(),
          autovalidateMode: vm.autovalidateMode,
          validator: (value) => value == null ? S.current.pleaseSelectAnOption : null,
        ).paddingBottom(10),
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
          businessCreationFinished: (signUpVM) => _buildForm(signUpVM, context),
          error: (e, signUpVM) => _buildForm(signUpVM, context),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
