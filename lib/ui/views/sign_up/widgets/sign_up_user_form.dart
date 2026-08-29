import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/blocs/check_availabilities/check_availabilities_cubit.dart';
import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/view_models/user_profile_vm.dart';
import 'package:foodly_world/ui/shared_widgets/animations/animated_opacity.dart';
import 'package:foodly_world/ui/shared_widgets/dropdown_buttons/foodly_dropdown_button_form_field.dart';
import 'package:foodly_world/ui/shared_widgets/places_autocomplete/places_autocomplete_wdg.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_phone_input_text.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/sign_up/cubit/sign_up_cubit.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;

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
      spacing: 9,
      children: [
        BlocProvider(
          create: (context) => CheckAvailabilitiesCubit(),
          child: BlocBuilder<CheckAvailabilitiesCubit, CheckAvailabilitiesState>(
            builder: (context, state) {
              final checkUsernameCubit = context.read<CheckAvailabilitiesCubit>();

              return FoodlyPrimaryInputText(
                onChanged: (p0) => checkUsernameCubit.onTextChanged(p0),
                controller: vm.nickNameController!.controller!,
                focusNode: vm.nickNameController?.focusNode,
                secondaryFocusNode: vm.firstNameController?.focusNode,
                inputTextType: FoodlyInputType.nickName,
                autovalidateMode: AutovalidateMode.always,
                maxLength: 30,
                enabled: enabled,
                isUnavailable: state.isUnavailable,
                showLeading: false,
                trailing: Stack(
                  alignment: Alignment.center,
                  children: [
                    FoodlyAnimatedOpacity(
                      key: const Key('check-username-signup-initial'),
                      visible: state.isInitialState,
                      child: Icon(Bootstrap.search,
                          size: 20, color: enabled ? FoodlyThemes.primaryFoodly : ui.NeumorphicColors.disabled),
                    ),
                    FoodlyAnimatedOpacity(
                      key: const Key('check-username-signup-loading'),
                      visible: state.isLoading,
                      child: const SizedBox.square(
                          dimension: 20, child: CircularProgressIndicator.adaptive(strokeWidth: 2.5)),
                    ),
                    FoodlyAnimatedOpacity(
                      key: const Key('check-username-signup-available'),
                      visible: state.isAvailable,
                      child: const Icon(Bootstrap.check2_circle, size: 24, color: FoodlyThemes.tertiaryFoodly),
                    ),
                    FoodlyAnimatedOpacity(
                      key: const Key('check-username-signup-unavailable'),
                      visible: state.isUnavailable,
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
          labelText: S.current.firstName,
        ),
        FoodlyPrimaryInputText(
          controller: vm.lastNameController!.controller!,
          focusNode: vm.lastNameController?.focusNode,
          secondaryFocusNode: vm.emailController?.focusNode,
          inputTextType: FoodlyInputType.lastName,
          autovalidateMode: vm.autovalidateMode,
          enabled: enabled,
          showLeading: false,
          labelText: S.current.lastName,
        ),
        // Social sign-ups (Google, etc.) already have their identity verified
        // by the provider — asking them to invent a password creates friction
        // and leads to forgotten credentials. Skip the password field and
        // focus-chain directly from email → places.
        FoodlyPrimaryInputText(
          controller: vm.emailController!.controller!,
          focusNode: vm.emailController?.focusNode,
          secondaryFocusNode:
              cubit.isGoogleSignIn ? vm.placesFocusNode : vm.passwordController?.focusNode,
          inputTextType: FoodlyInputType.email,
          autovalidateMode: vm.autovalidateMode,
          enabled: enabled,
          showLeading: false,
          labelText: S.current.email,
        ),
        if (!cubit.isGoogleSignIn)
          FoodlyPrimaryInputText(
            controller: vm.passwordController!.controller!,
            focusNode: vm.passwordController?.focusNode,
            secondaryFocusNode: vm.placesFocusNode,
            inputTextType: FoodlyInputType.password,
            autovalidateMode: vm.autovalidateMode,
            obscureText: true,
            enabled: enabled,
            labelText: S.current.password,
          ),
        PlacesAutocompleteWdg(
          key: const Key('find-user-location'),
          language: cubit.lang,
          disabled: !enabled,
          focusNode: vm.placesFocusNode,
          onPickedPlaceDetail: (place) {
            cubit.updateUserLocationFromPlacesAPI(place);
            di<LocationService>().updateLocationFromPlace(place);
          },
          hintText: S.current.findAndCompleteAddress,
        ).paddingOnly(bottom: 20),
        FoodlyDropdownButtonFormField(
          value: vm.country,
          focusNode: vm.countryNode,
          decoration: InputDecoration(
            enabled: enabled,
            prefixIcon: vm.country?.flag?.paddingAll(10) ?? FoodlyInputType.country.icon,
            prefixIconColor: enabled ? Colors.black87 : ui.NeumorphicColors.disabled,
            hintText: S.current.country,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            iconColor: enabled ? null : ui.NeumorphicColors.disabled,
            hintStyle: TextStyle(
              color: enabled ? FoodlyThemes.secondaryFoodlyText : ui.NeumorphicColors.disabled,
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
                  child: Text(country.name, style: FoodlyTextStyles.actionsBody),
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
          labelText: S.current.address,
        ),
        FoodlyPrimaryInputText(
          controller: vm.cityController!.controller!,
          focusNode: vm.cityController?.focusNode,
          secondaryFocusNode: vm.zipCodeController?.focusNode,
          inputTextType: FoodlyInputType.city,
          autovalidateMode: vm.autovalidateMode,
          enabled: enabled,
          showLeading: false,
          labelText: S.current.city,
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
          labelText: S.current.zipCode,
          // Dirección opcional en el alta email/contraseña: el bloque de
          // dirección (dirección/ciudad ya eran opcionales) deja de ser
          // obligatorio. El usuario puede usar el autocomplete o completarlo
          // luego en su perfil. El teléfono SÍ sigue siendo obligatorio (lo
          // valida FoodlyPhoneInputText) por la verificación SMS de identidad.
          validator: (_) => null,
        ),
        FoodlyPhoneInputText(
          key: Key('phone_input_${cubit.currentCountryCode}'),
          enabled: enabled,
          controller: vm.phoneNumberController?.controller,
          focusNode: vm.phoneNumberController?.focusNode,
          autovalidateMode: vm.autovalidateMode,
          onSubmitted: (value) async {
            await _selectDate(context, vm, cubit);
          },
          onChanged: (phone) {
            cubit.setPhoneIsoCode(phone.countryISOCode);
            cubit.setCompletePhone(phone.completeNumber);
          },
          initialCountryCode: cubit.currentCountryCode.toUpperCase(),
        ),
        SizedBox(
          height: 70,
          child: vm.dateOfBirthNode == null
              ? const SizedBox.shrink()
              : ListenableBuilder(
                  listenable: vm.dateOfBirthNode!,
                  builder: (context, _) {
                    final hasFocus = vm.dateOfBirthNode!.hasFocus;
                    return InkWell(
                      onTap: enabled
                          ? () async {
                              await _selectDate(context, vm, cubit);
                            }
                          : null,
                      focusColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      focusNode: vm.dateOfBirthNode,
                      child: InputDecorator(
                        isFocused: hasFocus,
                        isEmpty: vm.dateOfBirth == null,
                        decoration: InputDecoration(
                          hintText: S.current.dateOfBirth,
                          hintStyle: TextStyle(
                            color: enabled ? FoodlyThemes.secondaryFoodlyText : ui.NeumorphicColors.disabled,
                            fontSize: 14,
                          ),
                          prefixIcon: const Icon(Bootstrap.calendar2_event, size: 22),
                          prefixIconColor: hasFocus
                              ? FoodlyThemes.primaryFoodly
                              : enabled
                                  ? Colors.black87
                                  : ui.NeumorphicColors.disabled,
                          enabled: enabled,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        ),
                        child: vm.dateOfBirth != null
                            ? Text(
                                vm.dateOfBirth!.getStringFormat,
                                style: !enabled ? FoodlyTextStyles.disabledText : FoodlyTextStyles.inputTextValue,
                              )
                            : const SizedBox.shrink(),
                      ),
                    );
                  },
                ),
        ),
        DropdownButtonFormField<UserGender>(
          initialValue: vm.gender,
          focusNode: vm.genderNode,
          disabledHint: Text(
            S.current.gender,
            style: FoodlyTextStyles.disabledText,
          ),
          hint: Text(
            S.current.gender,
            style: FoodlyTextStyles.hintText.copyWith(
              color: enabled ? FoodlyThemes.secondaryFoodlyText : ui.NeumorphicColors.disabled,
              fontSize: 14,
            ),
          ),
          decoration: InputDecoration(
            enabled: enabled,
            prefix: const SizedBox.shrink(),
            prefixIconColor: enabled ? Colors.black87 : ui.NeumorphicColors.disabled,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            hintText: S.current.gender,
            hintStyle: FoodlyTextStyles.hintText.copyWith(
              color: enabled ? FoodlyThemes.secondaryFoodlyText : ui.NeumorphicColors.disabled,
              fontSize: 14,
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
          // Género opcional para TODOS (privacidad / minimización de datos).
          // El usuario lo puede setear luego desde su perfil.
          validator: (_) => null,
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
