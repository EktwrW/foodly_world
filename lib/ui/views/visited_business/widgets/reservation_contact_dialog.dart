import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui show NeumorphicColors, NeumorphicShape;
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/users/me_repo.dart';
import 'package:foodly_world/core/routing/app_router.dart' show rootNavigatorKey;
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show di;
import 'package:foodly_world/core/utils/form_validations.dart';
import 'package:foodly_world/data_transfer_objects/user/user_body_update_dto.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_phone_input_text.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

/// Dominio del email relay de "Ocultar mi correo" de Apple. Cuando el email del
/// usuario es de este dominio, le pedimos un email de contacto real para la
/// reserva (el comercio necesita poder contactarlo).
const _kApplePrivateRelayDomain = '@privaterelay.appleid.com';

/// Resultado del diálogo de contacto pre-reserva.
class ReservationContactResult {
  /// Teléfono COMPLETO (código de país + número, ej. '+5491123456789') a
  /// adjuntar como snapshot de la reserva → es lo que llega al comercio para
  /// que pueda contactar al cliente. Null si no se pidió teléfono.
  final String? phone;

  /// Solo la parte NACIONAL del número (sin código de país), para guardar en el
  /// perfil del usuario. Mantiene el mismo formato que el resto de la app
  /// (signup guarda `controller.text`, el número nacional), evitando mezclar
  /// código de país con número en la columna `phone`.
  final String? phoneNational;

  /// ISO del país del teléfono (ej. 'AR'), para guardar en el perfil junto al
  /// nacional, así no se pierde el prefijo.
  final String? phoneCountryCode;

  /// Email de contacto a adjuntar como snapshot. Null si el email del usuario
  /// ya era válido (no relay).
  final String? contactEmail;

  /// True si el usuario marcó "guardar en perfil" (solo aplica al teléfono).
  final bool saveToProfile;

  const ReservationContactResult({
    this.phone,
    this.phoneNational,
    this.phoneCountryCode,
    this.contactEmail,
    this.saveToProfile = false,
  });
}

/// Resuelve el contacto necesario para una reserva.
///
/// - Si el usuario ya tiene teléfono y un email no-relay → no muestra nada y
///   devuelve un resultado vacío (el backend usará el contacto del perfil).
/// - Si falta teléfono o el email es relay → abre el diálogo. Devuelve null si
///   el usuario cancela (la reserva NO debe continuar).
/// - Si pidió guardar el teléfono en el perfil, lo persiste antes de devolver.
Future<ReservationContactResult?> resolveReservationContact(BuildContext context) async {
  final user = di<AuthSessionService>().userSessionDM?.user;
  final needPhone = (user?.phone?.isEmpty ?? true);
  final needEmail = user?.email?.toLowerCase().endsWith(_kApplePrivateRelayDomain) ?? false;

  if (!needPhone && !needEmail) return const ReservationContactResult();

  // OJO: el `context` del call site puede venir del botón de un SnackBar, que
  // se monta en el overlay del ScaffoldMessenger (por encima del Navigator) y
  // NO tiene Navigator ancestro → showDialog explota. Usamos el navigator raíz
  // global (mismo que DialogService), con el context recibido como fallback.
  final dialogContext = rootNavigatorKey.currentContext ?? context;

  if (!dialogContext.mounted) {
    return null;
  }
  final result = await showDialog<ReservationContactResult>(
    context: dialogContext,
    barrierDismissible: false,
    builder: (_) => ReservationContactDialog(needPhone: needPhone, needEmail: needEmail),
  );

  // OJO: NO guardamos en perfil acá. Hacerlo antes de crear la reserva dispara
  // setSession → refresh del router → se recrea la ruta/cubit de la reserva y
  // se pierde el VM (date/time/size quedan null). El guardado se hace DESPUÉS
  // de crear la reserva, vía [maybeSaveReservationContactToProfile].
  return result;
}

/// Persiste el teléfono en el perfil si el usuario lo pidió. Se llama DESPUÉS
/// de crear la reserva (ver nota en [resolveReservationContact]). Solo el
/// teléfono: el email de contacto es por-reserva (cambiar el email de la cuenta
/// tiene guardas de re-auth aparte). Actualiza la sesión local con copyWith
/// para no tocar el token vigente.
Future<void> maybeSaveReservationContactToProfile(ReservationContactResult contact) async {
  // Guardamos la parte NACIONAL (sin código de país) para no mezclar formatos
  // con el resto de la app (signup guarda el número nacional).
  final national = contact.phoneNational;
  if (!contact.saveToProfile || (national?.isEmpty ?? true)) return;

  final iso = contact.phoneCountryCode;
  final res = await di<MeRepo>().updateProfile(
    UserBodyUpdateDTO(phone: national, phoneCountryCode: iso),
  );
  res.whenOrNull(success: (_) {
    final current = di<AuthSessionService>().userSessionDM;
    if (current != null) {
      di<AuthSessionService>().setSession(
        current.copyWith(user: current.user.copyWith(phone: national, phoneCountryCode: iso)),
      );
    }
  });
}

class ReservationContactDialog extends StatefulWidget {
  final bool needPhone;
  final bool needEmail;

  const ReservationContactDialog({super.key, required this.needPhone, required this.needEmail});

  @override
  State<ReservationContactDialog> createState() => _ReservationContactDialogState();
}

class _ReservationContactDialogState extends State<ReservationContactDialog> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  String _completePhone = '';
  // Parte nacional del número (sin código de país). Validamos por largo (≥7).
  String _phoneNationalNumber = '';
  // ISO del país elegido en el input (ej. 'AR'), para guardar en el perfil.
  String _phoneCountryIso = '';
  bool _phoneTouched = false;
  bool _saveToProfile = true;

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submit() {
    // Validamos el teléfono con el helper (regex del país o min 7 dígitos).
    // Marcamos _phoneTouched para que el campo pase a modo always y muestre su
    // propio error. El validator del IntlPhoneField puede no dispararse solo si
    // el usuario nunca tocó el campo, por eso este guard es la puerta final.
    if (widget.needPhone && !FormValidations.isPhoneNumberValid(_phoneNationalNumber)) {
      setState(() => _phoneTouched = true);
      return;
    }

    // Valida el resto (email, si aplica).
    if (!(_formKey.currentState?.validate() ?? false)) return;

    Navigator.of(context).pop(ReservationContactResult(
      // Completo (con código país) para el snapshot que ve el comercio.
      phone: widget.needPhone ? _completePhone : null,
      // Nacional (sin código país) para guardar en el perfil.
      phoneNational: widget.needPhone ? _phoneNationalNumber : null,
      // Nunca persistimos un ISO vacío: '' no es null, y luego rompería el
      // IntlPhoneField (initialCountryCode inválido). Lo normalizamos a null.
      phoneCountryCode: (widget.needPhone && _phoneCountryIso.isNotEmpty) ? _phoneCountryIso : null,
      contactEmail: widget.needEmail ? _emailController.text.trim() : null,
      saveToProfile: widget.needPhone && _saveToProfile,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ui.NeumorphicColors.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.current.reservationContactTitle,
                textAlign: TextAlign.center,
                style: FoodlyTextStyles.confirmationTextPrimary,
              ),
              const SizedBox(height: 8),
              Text(
                S.current.reservationContactBody,
                textAlign: TextAlign.center,
                style: const TextStyle(height: 1.35),
              ),
              const SizedBox(height: 16),
              if (widget.needPhone)
                FoodlyPhoneInputText(
                  enabled: true,
                  controller: _phoneController,
                  // Tras un submit fallido pasamos a `always` para que el campo
                  // muestre su propio error aunque el usuario no lo haya tocado.
                  autovalidateMode: _phoneTouched ? AutovalidateMode.always : AutovalidateMode.onUserInteraction,
                  // País del usuario (de su dirección principal) si lo tiene; si
                  // es null (típico en altas sociales), FoodlyPhoneInputText cae
                  // al país del dispositivo. Evita el hardcode 'PT' que guardaba
                  // mal el ISO. OJO: UserDM no tiene `country` propio — vive en
                  // las direcciones (AddressDM.country) vía principalAddress.
                  initialCountryCode: di<AuthSessionService>().userSessionDM?.user.currentPhoneCountryCode,
                  onChanged: (phone) => setState(() {
                    _completePhone = phone.completeNumber;
                    _phoneNationalNumber = phone.number;
                    _phoneCountryIso = phone.countryISOCode;
                  }),
                ),
              if (widget.needEmail)
                FoodlyPrimaryInputText(
                  enabled: true,
                  controller: _emailController,
                  inputTextType: FoodlyInputType.email,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  showLeading: false,
                  labelText: S.current.email,
                ),
              if (widget.needPhone)
                InkWell(
                  onTap: () => setState(() => _saveToProfile = !_saveToProfile),
                  child: Row(
                    children: [
                      Checkbox(
                        value: _saveToProfile,
                        onChanged: (value) => setState(() => _saveToProfile = value ?? false),
                      ),
                      Expanded(child: Text(S.current.saveToProfileForReservations)),
                    ],
                  ),
                ).paddingTop(4),
              const SizedBox(height: 16),
              CustomNeumorphicButton(
                onPressed: _submit,
                text: S.current.submit,
                shape: ui.NeumorphicShape.convex,
                disabled: false,
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(S.current.cancel, style: FoodlyTextStyles.loginCTATextButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
