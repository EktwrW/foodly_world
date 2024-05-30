import 'package:flutter/material.dart';
import 'package:foodly_world/core/consts/foodly_regex.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/location_service.dart';
import 'package:foodly_world/core/utils/form_validations.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart' as ui;
import 'package:intl_phone_field/intl_phone_field.dart';

class FoodlyPhoneInputText extends StatelessWidget {
  final bool enabled;
  final String? keyString;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final void Function(String)? onSubmitted;
  final String? initialCountryCode;
  final String? hintText;

  const FoodlyPhoneInputText({
    super.key,
    required this.enabled,
    this.keyString,
    this.controller,
    this.focusNode,
    this.autovalidateMode,
    this.onSubmitted,
    this.initialCountryCode,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: IntlPhoneField(
        key: Key(keyString ?? 'countryCode'),
        enabled: enabled,
        controller: controller,
        focusNode: focusNode,
        autovalidateMode: autovalidateMode,
        invalidNumberMessage: S.current.enterAValidPhoneNumber,
        validator: (p0) {
          if (p0?.number.isEmpty ?? true) return S.current.pleaseEnterPhoneNumber;

          return !FormValidations.validateFormWithCountryCode(
                  p0?.number ?? '', p0?.countryCode ?? '', FoodlyRegex.phoneNumberRegex)
              ? S.current.enterAValidPhoneNumber
              : null;
        },
        dropdownTextStyle: TextStyle(
          color: !enabled ? ui.NeumorphicColors.disabled : Colors.black,
        ),
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: hintText ?? FoodlyInputType.businessPhone.text,
          hintStyle: TextStyle(color: enabled ? FoodlyThemes.secondaryFoodly : ui.NeumorphicColors.disabled),
          border: const UnderlineInputBorder(),
          errorMaxLines: 2,
          errorStyle: FoodlyTextStyles.errorInputText,
          contentPadding: const EdgeInsets.only(top: 15),
        ),
        initialCountryCode: initialCountryCode ?? di<LocationService>().currentCountryCode,
      ),
    );
  }
}
