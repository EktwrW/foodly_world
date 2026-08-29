import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

class FoodlyDropdownButtonFormField<T> extends StatelessWidget {
  final bool enabled;
  final T? value;
  final Widget? prefixIcon;
  final void Function(T?)? onChanged;
  final InputBorder? enabledBorder;
  final List<DropdownMenuItem<T>>? items;
  final String? validatorText;
  final String? hintText;
  final InputDecoration? decoration;
  final FocusNode? focusNode;
  final Widget? decorationIcon;
  final Widget? primaryIcon;
  final Widget? hint;
  final double? height;
  final double? width;
  final String? Function(T?)? validator;
  final EdgeInsetsGeometry? padding;
  final double? iconSize;
  final EdgeInsetsGeometry? contentPadding;

  const FoodlyDropdownButtonFormField({
    super.key,
    required this.enabled,
    this.value,
    this.prefixIcon,
    this.onChanged,
    this.enabledBorder,
    this.items,
    this.validatorText,
    this.hintText,
    this.decoration,
    this.focusNode,
    this.decorationIcon,
    this.primaryIcon,
    this.height = 73,
    this.width,
    this.validator,
    this.padding,
    this.iconSize,
    this.hint,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: DropdownButtonFormField<T>(
        initialValue: value,
        focusNode: focusNode,
        padding: padding,
        iconSize: iconSize ?? 24,
        icon: primaryIcon,
        hint: hint,
        decoration: decoration ??
            InputDecoration(
              enabled: enabled,
              prefixIcon: prefixIcon,
              prefixIconColor: enabled ? Colors.black87 : ui.NeumorphicColors.disabled,
              hintText: hintText,
              icon: decorationIcon,
              errorStyle: FoodlyTextStyles.errorInputText,
              enabledBorder: enabledBorder,
              hintStyle: TextStyle(
                color: enabled ? FoodlyThemes.secondaryFoodlyText : ui.NeumorphicColors.disabled,
                fontSize: 12,
              ),
              contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
        onChanged: enabled ? onChanged : null,
        items: items,
        validator: validator ?? (value) => value == null ? (validatorText ?? S.current.pleaseSelectAnOption) : null,
      ),
    );
  }
}
