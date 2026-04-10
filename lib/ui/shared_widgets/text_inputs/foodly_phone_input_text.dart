import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/form_validations.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class FoodlyPhoneInputText extends StatelessWidget {
  final bool enabled;
  final String? keyString;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final void Function(String)? onSubmitted;
  final void Function(PhoneNumber)? onChanged;
  final String? initialCountryCode;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final double hintTextSize;

  const FoodlyPhoneInputText({
    super.key,
    required this.enabled,
    this.keyString,
    this.controller,
    this.focusNode,
    this.autovalidateMode,
    this.onSubmitted,
    this.onChanged,
    this.initialCountryCode,
    this.hintText,
    this.contentPadding,
    this.hintTextSize = 14,
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
        disableLengthCheck: true,
        invalidNumberMessage: S.current.enterAValidPhoneNumber,
        validator: (p0) {
          if (p0?.number.isEmpty ?? true) return S.current.pleaseEnterPhoneNumber;

          // p0.countryCode is the dial code (e.g. '54'), not the ISO code ('AR').
          // Resolve to ISO so the regex map key matches.
          final isoCode = FoodlyRegex.dialCodeToIso[p0?.countryCode];
          if (isoCode == null) {
            // Country not in our supported list — skip our regex, accept the number.
            return null;
          }

          return !FormValidations.validateFormWithCountryCode(p0?.number ?? '', isoCode, FoodlyRegex.phoneNumberRegex)
              ? S.current.enterAValidPhoneNumber
              : null;
        },
        dropdownTextStyle: TextStyle(
          color: !enabled ? ui.NeumorphicColors.disabled : Colors.black,
          fontSize: 12.3,
        ),
        flagsButtonPadding: const EdgeInsets.only(left: 8, right: 4),
        textInputAction: TextInputAction.next,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          hintText: hintText ?? FoodlyInputType.businessPhone.text,
          hintStyle: TextStyle(
            letterSpacing: 0,
            color: enabled ? FoodlyThemes.secondaryFoodly : ui.NeumorphicColors.disabled,
            fontSize: hintTextSize,
          ),
          labelStyle: TextStyle(
            color: enabled ? FoodlyThemes.primaryFoodly.withValues(alpha: .63) : ui.NeumorphicColors.disabled,
            fontSize: hintTextSize,
          ),
          prefixIcon: FoodlyInputType.businessPhone.icon,
          prefixIconColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.error)) return FoodlyThemes.error;
            if (states.contains(WidgetState.focused)) return FoodlyThemes.primaryFoodly;
            if (states.contains(WidgetState.disabled)) return ui.NeumorphicColors.disabled;
            return Colors.black87;
          }),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: FoodlyThemes.primaryFoodly),
          ),
          focusColor: FoodlyThemes.primaryFoodly,
          errorMaxLines: 2,
          errorStyle: FoodlyTextStyles.errorInputText,
          contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
        initialCountryCode: initialCountryCode ?? di<LocationService>().currentCountryCode,
      ),
    );
  }
}
