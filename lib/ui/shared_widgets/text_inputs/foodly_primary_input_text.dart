import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/consts/foodly_regex.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart' show FoodlyInputType;
import 'package:foodly_world/core/utils/form_validations.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart';

export 'package:foodly_world/core/enums/foodly_enums.dart' show FoodlyInputType;

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
  final Widget? trailing;
  final Widget? leading;
  final bool showLeading;
  final void Function(String)? onChanged;
  final double? hintTextSize;
  final Function(String)? onFieldSubmitted;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final void Function()? onTap;
  final Widget? counter;
  final BoxConstraints? prefixIconConstraints;
  final TextStyle? style;
  final BoxConstraints? suffixIconConstraints;
  final void Function()? onEditingComplete;
  final bool hideCurrentSnackBarWhenOnTap;
  final double? minLinesHeightFactorReference;
  final bool isUnavailable;
  final bool isUnderlineStyle;

  const FoodlyPrimaryInputText({
    super.key,
    this.controller,
    this.focusNode,
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
    this.trailing,
    this.showLeading = true,
    this.onChanged,
    this.hintTextSize = 14,
    this.onFieldSubmitted,
    this.leading,
    this.border,
    this.contentPadding,
    this.onTap,
    this.counter,
    this.prefixIconConstraints,
    this.style = const TextStyle(fontSize: 14),
    this.suffixIconConstraints,
    this.onEditingComplete,
    this.hideCurrentSnackBarWhenOnTap = true,
    this.minLinesHeightFactorReference,
    this.isUnavailable = false,
    this.isUnderlineStyle = false,
  });

  double get _getMinLinesHeightFactor => minLinesHeightFactorReference ?? 40;

  @override
  Widget build(BuildContext context) {
    final inputDecoration = isUnderlineStyle
        ? InputDecoration(
            fillColor: Colors.transparent,
            hintText: hintText ?? inputTextType.text,
            hintStyle: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: enabled ? FoodlyThemes.secondaryFoodlyText : ui.NeumorphicColors.disabled,
              fontSize: hintTextSize,
            ),
            label: label,
            labelText: labelText,
            prefixIcon: showLeading ? leading : inputTextType.icon,
            suffixIconConstraints: suffixIconConstraints,
            suffixIcon: trailing,
            border: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: FoodlyThemes.primaryFoodly),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: FoodlyThemes.error),
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: FoodlyThemes.error),
            ),
            disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ui.NeumorphicColors.disabled),
            ),
            focusColor: FoodlyThemes.primaryFoodly,
            prefixIconColor: WidgetStateColor.resolveWith((states) {
              if (states.contains(WidgetState.error)) return FoodlyThemes.error;
              if (states.contains(WidgetState.focused)) return FoodlyThemes.primaryFoodly;
              if (states.contains(WidgetState.disabled)) return ui.NeumorphicColors.disabled;
              return Colors.black87;
            }),
            errorMaxLines: 2,
            errorStyle: const TextStyle(fontSize: 10.0),
            contentPadding: contentPadding ?? const EdgeInsets.only(top: 15, right: 6),
            counter: counter,
            prefixIconConstraints: prefixIconConstraints,
          )
        : InputDecoration(
            fillColor: Colors.transparent,
            hintText: hintText ?? inputTextType.text,
            hintStyle: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: enabled ? FoodlyThemes.secondaryFoodlyText : ui.NeumorphicColors.disabled,
              fontSize: hintTextSize,
            ),
            labelStyle: TextStyle(
              color: enabled ? FoodlyThemes.primaryFoodly.withValues(alpha: .70) : ui.NeumorphicColors.disabled,
              fontSize: hintTextSize,
            ),
            label: label,
            labelText: labelText,
            prefixIcon: showLeading ? leading : inputTextType.icon,
            suffixIconConstraints: suffixIconConstraints,
            suffixIcon: trailing,
            prefixIconColor: WidgetStateColor.resolveWith((states) {
              if (states.contains(WidgetState.error)) return FoodlyThemes.error;
              if (states.contains(WidgetState.focused)) return FoodlyThemes.primaryFoodly;
              if (states.contains(WidgetState.disabled)) return ui.NeumorphicColors.disabled;
              return Colors.black87;
            }),
            errorMaxLines: 2,
            errorStyle: const TextStyle(fontSize: 10.0),
            contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            counter: counter,
            prefixIconConstraints: prefixIconConstraints,
          );

    if (inputTextType.isPassword) {
      final showPassword = ValueNotifier(false);

      return ValueListenableBuilder(
        valueListenable: showPassword,
        builder: (_, showPasswordValue, __) {
          return SizedBox(
            height: height ?? 73,
            child: TextFormField(
              enabled: enabled,
              keyboardType: inputTextType.textInputType,
              initialValue: initialValue,
              maxLength: maxLength,
              onEditingComplete: onEditingComplete,
              focusNode: focusNode,
              onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              onFieldSubmitted: (value) {
                onFieldSubmitted?.call(value);
                secondaryFocusNode?.requestFocus();
              },
              controller: controller,
              obscureText: !showPasswordValue,
              obscuringCharacter: '*',
              style: const TextStyle(letterSpacing: 5),
              autovalidateMode: autovalidateMode,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                hintText: hintText ?? inputTextType.text,
                hintStyle: TextStyle(
                  letterSpacing: 0,
                  color: enabled ? FoodlyThemes.secondaryFoodlyText : ui.NeumorphicColors.disabled,
                  fontSize: hintTextSize,
                ),
                labelStyle: TextStyle(
                  color: enabled ? FoodlyThemes.primaryFoodly.withValues(alpha: .70) : ui.NeumorphicColors.disabled,
                  fontSize: hintTextSize,
                ),
                prefixIcon: inputTextType.icon,
                prefixIconColor: WidgetStateColor.resolveWith((states) {
                  if (states.contains(WidgetState.error)) return FoodlyThemes.error;
                  if (states.contains(WidgetState.focused)) return FoodlyThemes.primaryFoodly;
                  if (states.contains(WidgetState.disabled)) return ui.NeumorphicColors.disabled;
                  return Colors.black87;
                }),
                suffixIcon: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () => showPassword.value = !showPasswordValue,
                    child: Icon(showPasswordValue ? AntDesign.eye_invisible_fill : AntDesign.eye_fill)),
                errorMaxLines: 2,
                errorStyle: FoodlyTextStyles.errorInputText,
                contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
              validator: validator ??
                  (value) {
                    final notValue = value == null || value.isEmpty;

                    if (notValue) return S.current.pleaseEnterPassword;

                    return !FormValidations.isPasswordValid(value) ? S.current.passwordInstructions : null;
                  },
            ),
          );
        },
      );
    }

    return SizedBox(
      height: minLines != null ? (minLines! * _getMinLinesHeightFactor) : height ?? 70,
      child: TextFormField(
        enabled: enabled,
        autofocus: autofocus,
        keyboardType: inputTextType.textInputType,
        initialValue: initialValue,
        maxLength: maxLength,
        focusNode: focusNode,
        onEditingComplete: onEditingComplete,
        onTap: () {
          onTap?.call();
          if ((focusNode?.canRequestFocus ?? false) && !(focusNode?.hasFocus ?? false)) {
            focusNode?.requestFocus();
          }
          if (hideCurrentSnackBarWhenOnTap) ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
          if (controller != null) {
            final trimmed = controller!.text.trim();
            if (trimmed != controller!.text) {
              controller!.value = controller!.value.copyWith(
                text: trimmed,
                selection: TextSelection.collapsed(offset: trimmed.length),
              );
            }
          }
        },
        maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
        onFieldSubmitted: (value) {
          onFieldSubmitted?.call(value);
          secondaryFocusNode?.requestFocus();
        },
        onChanged: onChanged,
        controller: controller,
        style: style?.copyWith(overflow: TextOverflow.ellipsis),
        obscureText: obscureText,
        autovalidateMode: autovalidateMode,
        minLines: minLines,
        maxLines: maxLines,
        decoration: inputDecoration,
        validator: validator ??
            (value) {
              final notValue = value == null || value.isEmpty;

              if (!enabled) return null;

              switch (inputTextType) {
                case FoodlyInputType.nickName:
                  if (notValue) return S.current.pleaseEnterNickName;

                  if (value.length < 3) {
                    return S.current.mustContainAtLeast3Characters;
                  }

                  if (isUnavailable) {
                    return S.current.usernameNotAvailable;
                  }

                  return !FormValidations.isUserNameValid(value) ? S.current.canNotContainSpecialCharactersBut_ : null;

                case FoodlyInputType.firstName:
                  if (notValue) return S.current.pleaseEnterYourName;

                  final trimmedFirst = value.trim();
                  if (trimmedFirst.length < 2) {
                    return S.current.mustContainAtLeastTwoCharacters;
                  }

                  return !FormValidations.isNameValid(trimmedFirst) ? S.current.onlyContainLetters : null;

                case FoodlyInputType.lastName:
                  if (notValue) return S.current.pleaseEnterYourLastName;

                  final trimmedLast = value.trim();
                  if (trimmedLast.length < 2) {
                    return S.current.mustContainAtLeastTwoCharacters;
                  }

                  return !FormValidations.isNameValid(trimmedLast) ? S.current.onlyContainLetters : null;

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

                case FoodlyInputType.youtubeUrl:
                  if (notValue) return S.current.addYoutubeUrl;

                  final isValidUrl = FormValidations.isYoutubeUrlValid(value);
                  return !isValidUrl ? S.current.invalidYoutubeUrl : null;

                default:
                  return null;
              }
            },
      ),
    );
  }
}
