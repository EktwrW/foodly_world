import 'package:flutter/material.dart';
import 'package:foodly_world/core/consts/foodly_regex.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/utils/form_validations.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart' as ui;

class FoodlyPrimaryInputText extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? secondaryFocusNode;
  final String? Function(String?)? validator;
  final FoodlyInputType inputTextType;
  final bool obscureText;
  final AutovalidateMode autovalidateMode;
  final String? initialValue;
  final String countryCode;
  final double? height;
  final int? maxLength;
  final bool enabled;
  final bool autofocus;
  final int? minLines;
  final int? maxLines;
  final Widget? label;
  final String? labelText;
  final String? hintText;

  const FoodlyPrimaryInputText({
    super.key,
    required this.controller,
    required this.focusNode,
    this.secondaryFocusNode,
    this.validator,
    required this.inputTextType,
    this.obscureText = false,
    required this.autovalidateMode,
    this.initialValue,
    this.countryCode = '',
    this.height,
    this.maxLength,
    this.enabled = false,
    this.autofocus = false,
    this.minLines,
    this.maxLines,
    this.label,
    this.labelText,
    this.hintText,
  });

  bool get isPassword => inputTextType == FoodlyInputType.password || inputTextType == FoodlyInputType.confirmPassword;

  @override
  Widget build(BuildContext context) {
    if (isPassword) {
      final showPassword = ValueNotifier(false);

      return ValueListenableBuilder(
        valueListenable: showPassword,
        builder: (_, showPasswordValue, __) {
          return SizedBox(
            height: height ?? 70,
            child: TextFormField(
              enabled: enabled,
              keyboardType: inputTextType.textInputType,
              initialValue: initialValue,
              maxLength: maxLength,
              focusNode: focusNode,
              onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              onTapOutside: (event) => focusNode?.unfocus(),
              onFieldSubmitted: (value) {
                secondaryFocusNode?.requestFocus();
              },
              controller: controller,
              obscureText: !showPasswordValue,
              autovalidateMode: autovalidateMode,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                hintText: hintText ?? inputTextType.text,
                hintStyle: TextStyle(
                  color: enabled ? FoodlyThemes.secondaryFoodly : ui.NeumorphicColors.disabled,
                ),
                prefixIcon: inputTextType.icon,
                prefixIconColor: enabled ? Colors.black87 : ui.NeumorphicColors.disabled,
                suffixIcon: isPassword
                    ? InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () => showPassword.value = !showPasswordValue,
                        child: Icon(showPasswordValue ? AntDesign.eye_invisible_fill : AntDesign.eye_fill))
                    : null,
                border: const UnderlineInputBorder(),
                focusColor: FoodlyThemes.primaryFoodly,
                errorMaxLines: 2,
                errorStyle: FoodlyTextStyles.errorInputText,
                contentPadding: const EdgeInsets.only(top: 15),
              ),
              validator: (value) {
                final notValue = value == null || value.isEmpty;

                switch (inputTextType) {
                  case FoodlyInputType.password:
                    if (notValue) return S.current.pleaseEnterPassword;

                    return !FormValidations.isPasswordValid(value) ? S.current.passwordInstructions : null;

                  default:
                    return null;
                }
              },
            ),
          );
        },
      );
    }

    return SizedBox(
      height: minLines != null ? (minLines! * 40) : height ?? 70,
      child: TextFormField(
        enabled: enabled,
        autofocus: autofocus,
        keyboardType: inputTextType.textInputType,
        initialValue: initialValue,
        maxLength: maxLength,
        focusNode: focusNode,
        onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        onTapOutside: (event) => focusNode?.unfocus(),
        onFieldSubmitted: (value) {
          secondaryFocusNode?.requestFocus();
        },
        controller: controller,
        obscureText: obscureText,
        autovalidateMode: autovalidateMode,
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          hintText: hintText ?? inputTextType.text,
          hintStyle: TextStyle(
            color: enabled ? FoodlyThemes.secondaryFoodly : ui.NeumorphicColors.disabled,
          ),
          label: label,
          labelText: labelText,
          prefixIcon: inputTextType.icon,
          border: const UnderlineInputBorder(),
          focusColor: FoodlyThemes.primaryFoodly,
          prefixIconColor: enabled ? Colors.black87 : ui.NeumorphicColors.disabled,
          errorMaxLines: 2,
          errorStyle: const TextStyle(fontSize: 10.0),
          contentPadding: const EdgeInsets.only(top: 15),
        ),
        validator: (value) {
          final notValue = value == null || value.isEmpty;

          switch (inputTextType) {
            case FoodlyInputType.nickName:
              if (notValue) return S.current.pleaseEnterNickName;

              if (value.length < 3) {
                return S.current.mustContainAtLeast3Characters;
              }

              return !FormValidations.isUserNameValid(value) ? S.current.canNotContainSpecialCharactersBut_ : null;

            case FoodlyInputType.firstName:
              if (notValue) return S.current.pleaseEnterYourName;

              if (value.length < 2) {
                return S.current.mustContainAtLeastTwoCharacters;
              }

              return !FormValidations.isNameValid(value) ? S.current.onlyContainLetters : null;

            case FoodlyInputType.lastName:
              if (notValue) return S.current.pleaseEnterYourLastName;

              if (value.length < 2) {
                return S.current.mustContainAtLeastTwoCharacters;
              }

              return !FormValidations.isNameValid(value) ? S.current.onlyContainLetters : null;

            case FoodlyInputType.email:
              if (notValue) return S.current.pleaseEnterEmail;

              return !FormValidations.isEmailValid(value) ? S.current.enterAValidEmail : null;

            case FoodlyInputType.zipCode:
              if (notValue) return S.current.pleaseEnterPostalCode;

              return !FormValidations.validateFormWithCountryCode(value, countryCode, FoodlyRegex.postalCodeRegex)
                  ? S.current.enterAValidPostalCode
                  : null;

            case FoodlyInputType.phone:
              if (notValue) return S.current.pleaseEnterPhoneNumber;

              return !FormValidations.validateFormWithCountryCode(value, countryCode, FoodlyRegex.phoneNumberRegex)
                  ? S.current.enterAValidPhoneNumber
                  : null;

            case FoodlyInputType.businessName:
              if (notValue) return S.current.pleaseAddYourBusinessName;

              return null;

            case FoodlyInputType.businessEmail:
              if (notValue) return S.current.pleaseEnterEmail;

              return !FormValidations.isEmailValid(value) ? S.current.enterAValidEmail : null;

            case FoodlyInputType.businessPhone:
              if (notValue) return S.current.pleaseEnterPhoneNumber;

              return !FormValidations.validateFormWithCountryCode(value, countryCode, FoodlyRegex.phoneNumberRegex)
                  ? S.current.enterAValidPhoneNumber
                  : null;

            case FoodlyInputType.businessCountry:
              if (notValue) return S.current.pleaseAddYourBusinessCountry;

              return null;

            case FoodlyInputType.businessAddress:
              if (notValue) return S.current.pleaseAddYourBusinessAddress;

              return null;

            case FoodlyInputType.businessZipCode:
              if (notValue) return S.current.pleaseEnterPostalCode;

              if (!FoodlyRegex.postalCodeRegex.containsKey(countryCode)) {
                return S.current.zipCodeNotAvailable;
              }

              return !FormValidations.validateFormWithCountryCode(value, countryCode, FoodlyRegex.postalCodeRegex)
                  ? S.current.enterAValidPostalCode
                  : null;

            default:
              return null;
          }
        },
      ),
    );
  }
}
