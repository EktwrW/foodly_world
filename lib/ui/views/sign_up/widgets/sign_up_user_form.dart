import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/dropdown_buttons/foodly_dropdown_button_form_field.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_phone_input_text.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/sign_up/cubit/sign_up_cubit.dart';
import 'package:foodly_world/ui/views/sign_up/view_model/sign_up_vm.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class SignUpUserForm extends StatelessWidget {
  const SignUpUserForm({super.key});

  Future<void> _selectDate(BuildContext context, SignUpVM vm, SignUpCubit cubit) async {
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
    vm.phoneNumberController?.focusNode?.requestFocus();
  }

  Widget _buildForm(SignUpVM vm, BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    final enabled = vm.roleId != null;

    return Column(
      children: [
        FoodlyPrimaryInputText(
          controller: vm.nickNameController!.controller!,
          focusNode: vm.nickNameController?.focusNode,
          secondaryFocusNode: vm.firstNameController?.focusNode,
          inputTextType: FoodlyInputType.nickName,
          autovalidateMode: vm.autovalidateMode,
          maxLength: 30,
          enabled: enabled,
        ),
        FoodlyPrimaryInputText(
          controller: vm.firstNameController!.controller!,
          focusNode: vm.firstNameController?.focusNode,
          secondaryFocusNode: vm.lastNameController?.focusNode,
          inputTextType: FoodlyInputType.firstName,
          autovalidateMode: vm.autovalidateMode,
          enabled: enabled,
        ),
        FoodlyPrimaryInputText(
          controller: vm.lastNameController!.controller!,
          focusNode: vm.lastNameController?.focusNode,
          secondaryFocusNode: vm.emailController?.focusNode,
          inputTextType: FoodlyInputType.lastName,
          autovalidateMode: vm.autovalidateMode,
          enabled: enabled,
        ),
        FoodlyPrimaryInputText(
          controller: vm.emailController!.controller!,
          focusNode: vm.emailController?.focusNode,
          secondaryFocusNode: vm.passwordController?.focusNode,
          inputTextType: FoodlyInputType.email,
          autovalidateMode: vm.autovalidateMode,
          enabled: enabled,
        ),
        FoodlyPrimaryInputText(
          controller: vm.passwordController!.controller!,
          focusNode: vm.passwordController?.focusNode,
          secondaryFocusNode: vm.dateOfBirthNode,
          inputTextType: FoodlyInputType.password,
          autovalidateMode: vm.autovalidateMode,
          obscureText: true,
          enabled: enabled,
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
                        color: enabled ? Colors.black87 : NeumorphicColors.disabled,
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
        FoodlyPhoneInputText(
          enabled: enabled,
          controller: vm.phoneNumberController?.controller,
          focusNode: vm.phoneNumberController?.focusNode,
          autovalidateMode: vm.autovalidateMode,
          onSubmitted: (value) => vm.countryNode?.requestFocus(),
          initialCountryCode: cubit.currentCountryCode.toUpperCase(),
        ),
        FoodlyDropdownButtonFormField(
          value: vm.country,
          focusNode: vm.countryNode,
          decoration: InputDecoration(
            prefixIcon: const Icon(Bootstrap.person),
            prefixIconColor: enabled ? Colors.black87 : NeumorphicColors.disabled,
            hintText: S.current.country,
            icon: FoodlyInputType.country.icon,
            iconColor: enabled ? null : NeumorphicColors.disabled,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: enabled ? 0.75 : 0.5, color: enabled ? Colors.black87 : Colors.grey),
            ),
            hintStyle: TextStyle(
              color: enabled ? FoodlyThemes.secondaryFoodly : NeumorphicColors.disabled,
            ),
          ),
          enabled: enabled,
          onChanged: (FoodlyCountries? newValue) {
            cubit.setUserCountry(newValue);
            vm.cityController?.focusNode?.requestFocus();
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
        ),
        FoodlyPrimaryInputText(
          controller: vm.cityController!.controller!,
          focusNode: vm.cityController?.focusNode,
          secondaryFocusNode: vm.zipCodeController?.focusNode,
          inputTextType: FoodlyInputType.city,
          autovalidateMode: vm.autovalidateMode,
          enabled: enabled,
        ),
        FoodlyPrimaryInputText(
          controller: vm.zipCodeController!.controller!,
          focusNode: vm.zipCodeController?.focusNode,
          secondaryFocusNode: vm.genderNode,
          inputTextType: FoodlyInputType.zipCode,
          autovalidateMode: vm.autovalidateMode,
          enabled: enabled,
          countryCode: cubit.currentCountryCode.toUpperCase(),
        ),
        DropdownButtonFormField<UserGender>(
          value: vm.gender,
          focusNode: vm.genderNode,
          decoration: InputDecoration(
            prefixIcon: const Icon(Bootstrap.person),
            prefixIconColor: enabled ? Colors.black87 : NeumorphicColors.disabled,
            hintText: S.current.gender,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: enabled ? 0.75 : 0.5, color: enabled ? Colors.black87 : Colors.grey),
            ),
            hintStyle: TextStyle(
              color: enabled ? FoodlyThemes.secondaryFoodly : NeumorphicColors.disabled,
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
              child: Text(gender.text),
            );
          }).toList(),
          autovalidateMode: vm.autovalidateMode,
          validator: (value) => value == null ? S.current.pleaseSelectAnOption : null,
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
