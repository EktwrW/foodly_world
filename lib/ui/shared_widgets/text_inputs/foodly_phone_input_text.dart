import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/form_validations.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class FoodlyPhoneInputText extends StatefulWidget {
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

  /// Si es `true`, el error ≥7 se muestra en vivo apenas el usuario tipea,
  /// independientemente del [autovalidateMode]. Pensado para contextos donde el
  /// teléfono se edita aislado (perfil, diálogo de reserva).
  ///
  /// Si es `false` (default), el error solo se muestra cuando el
  /// [autovalidateMode] ya está activo (≠ disabled), es decir, después del
  /// primer submit. Esto preserva el comportamiento "silencio hasta enviar" de
  /// los forms multi-campo (signup, contact us), donde el resto de los campos
  /// tampoco muestran error hasta presionar enviar.
  final bool liveValidation;

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
    this.liveValidation = false,
  });

  @override
  State<FoodlyPhoneInputText> createState() => _FoodlyPhoneInputTextState();
}

class _FoodlyPhoneInputTextState extends State<FoodlyPhoneInputText> {
  // El error inline de intl_phone_field 3.2.0 aparece un dígito tarde: su
  // `TextFormField.validator` devuelve un `validatorMessage` cacheado que el
  // paquete recalcula con `await widget.validator(...)` dentro de su propio
  // `onChanged`. El await difiere a un microtask, así que el FormField se pinta
  // con el mensaje del keystroke anterior. En 3.2.0 no podemos forzar la
  // re-validación desde afuera (no expone `formFieldKey` ni `key` en el field).
  //
  // Fix independiente del paquete: calculamos el error NOSOTROS, de forma
  // síncrona, en cada cambio, y lo inyectamos vía `decoration.errorText`. Como
  // `InputDecoration.copyWith(errorText: field.errorText)` conserva nuestro
  // errorText cuando el del FormField es null (`null ?? nuestro`), en el
  // keystroke en que el número pasa a inválido —cuando el cache del paquete aún
  // está en null— el nuestro se muestra al instante. Esto es solo display: NO
  // tocamos el `validator`, así que el gateo por `formKey.validate()` (signup,
  // etc.) sigue intacto.
  // Último número nacional reportado por onChanged. Fallback para cuando el
  // caller no pasa `controller` (no podríamos leer el texto en build).
  String? _lastNumber;

  void _onChanged(PhoneNumber phone) {
    widget.onChanged?.call(phone);
    _lastNumber = phone.number;
    if (mounted) setState(() {});
  }

  /// Error ≥7 calculado del valor ACTUAL (controller o último onChanged), NO de
  /// un cache. Clave para que en el submit de un form —cuando se activa la
  /// autovalidación— el error aparezca aunque el usuario jamás haya tocado el
  /// campo (p.ej. teléfono vacío en "Crear Usuario").
  String? get _currentError {
    final number = widget.controller?.text ?? _lastNumber ?? '';
    if (number.isEmpty) return S.current.pleaseEnterPhoneNumber;
    // Largo ≥7 (validar estructura por país daba falsos rechazos, sobre todo AR).
    return FormValidations.isPhoneNumberValid(number) ? null : S.current.enterAValidPhoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    // Solo pintamos nuestro error en vivo si el caller lo pidió (liveValidation)
    // o si la autovalidación ya está activa (post-submit en los forms). Así los
    // forms multi-campo no muestran el error del teléfono antes de enviar.
    final showError = widget.liveValidation || widget.autovalidateMode != AutovalidateMode.disabled;

    return SizedBox(
      height: 70,
      child: IntlPhoneField(
        key: Key(widget.keyString ?? 'countryCode'),
        enabled: widget.enabled,
        controller: widget.controller,
        focusNode: widget.focusNode,
        autovalidateMode: widget.autovalidateMode,
        disableLengthCheck: true,
        invalidNumberMessage: S.current.enterAValidPhoneNumber,
        validator: (p0) {
          if (p0?.number.isEmpty ?? true) return S.current.pleaseEnterPhoneNumber;

          // Validación simple por largo (≥7 dígitos): validar estructura por
          // país generaba falsos rechazos (sobre todo Argentina).
          return FormValidations.isPhoneNumberValid(p0?.number ?? '') ? null : S.current.enterAValidPhoneNumber;
        },
        dropdownTextStyle: TextStyle(
          color: !widget.enabled ? ui.NeumorphicColors.disabled : Colors.black,
          fontSize: 12.3,
        ),
        flagsButtonPadding: const EdgeInsets.only(left: 8, right: 4),
        textInputAction: TextInputAction.next,
        onSubmitted: widget.onSubmitted,
        onChanged: _onChanged,
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          // Error síncrono propio (ver _currentError): mata el lag de un dígito del
          // validador interno del paquete. Solo se muestra cuando el FormField
          // no tiene su propio error (copyWith conserva `null ?? nuestro`), y
          // según `showError` para no regañar antes de enviar en los forms.
          errorText: showError ? _currentError : null,
          hintText: widget.hintText ?? FoodlyInputType.businessPhone.text,
          hintStyle: TextStyle(
            letterSpacing: 0,
            color: widget.enabled ? FoodlyThemes.secondaryFoodly : ui.NeumorphicColors.disabled,
            fontSize: widget.hintTextSize,
          ),
          labelStyle: TextStyle(
            color: widget.enabled ? FoodlyThemes.primaryFoodly.withValues(alpha: .63) : ui.NeumorphicColors.disabled,
            fontSize: widget.hintTextSize,
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
          contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
        initialCountryCode: widget.initialCountryCode ?? di<LocationService>().currentCountryCode,
      ),
    );
  }
}
