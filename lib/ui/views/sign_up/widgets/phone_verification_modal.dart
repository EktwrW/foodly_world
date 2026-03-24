import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/sign_up/cubit/phone_verification_cubit.dart';
import 'package:foodly_world/ui/views/sign_up/cubit/phone_verification_state.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneVerificationModal extends StatefulWidget {
  final String initialPhone;
  final String? countryCode;
  final ValueChanged<String> onVerified;
  final VoidCallback onClose;

  const PhoneVerificationModal({
    required this.initialPhone,
    required this.onVerified,
    required this.onClose,
    this.countryCode,
    super.key,
  });

  @override
  State<PhoneVerificationModal> createState() => _PhoneVerificationModalState();
}

class _PhoneVerificationModalState extends State<PhoneVerificationModal> {
  late final TextEditingController _otpController;
  final _otpFocusNode = FocusNode();
  String _completePhone = '';
  String _verificationId = '';
  int _secondsLeft = 60;
  Timer? _timer;

  // Derived display values for the IntlPhoneField
  late String _displayIsoCode;
  late String _displayNationalNumber;

  @override
  void initState() {
    super.initState();
    _otpController = TextEditingController();

    final rawPhone = widget.initialPhone.trim();

    if (rawPhone.startsWith('+')) {
      // Already a complete international number from onChanged — use directly.
      // Parse it to extract the ISO code and national number for the display field.
      _completePhone = rawPhone;
      try {
        final parsed = PhoneNumber.fromCompleteNumber(completeNumber: rawPhone);
        _displayIsoCode = parsed.countryISOCode;
        _displayNationalNumber = parsed.number;
      } catch (_) {
        _displayIsoCode = widget.countryCode ?? 'PT';
        _displayNationalNumber = rawPhone;
      }
    } else {
      // Fallback: raw national number — build complete number from country + digits.
      final isoCode = widget.countryCode?.isNotEmpty == true ? widget.countryCode! : 'PT';
      final country = countries.firstWhere(
        (c) => c.code == isoCode,
        orElse: () => countries.firstWhere((c) => c.code == 'PT'),
      );
      _displayIsoCode = isoCode;
      _displayNationalNumber = rawPhone;
      _completePhone = '+${country.dialCode}$rawPhone';
    }
  }

  @override
  void dispose() {
    _otpController.dispose();
    _otpFocusNode.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startCountdown() {
    _timer?.cancel();
    setState(() => _secondsLeft = 60);
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) {
        t.cancel();
        return;
      }
      setState(() {
        if (_secondsLeft > 0) {
          _secondsLeft--;
        } else {
          t.cancel();
        }
      });
    });
  }

  void _onPhoneChanged(PhoneNumber phone) {
    _completePhone = phone.completeNumber;
  }

  void _sendCode(BuildContext context) {
    if (_completePhone.isEmpty) return;
    context.read<PhoneVerificationCubit>().sendCode(_completePhone);
    _otpController.clear();
  }

  void _verifyCode(BuildContext context) {
    final code = _otpController.text.trim();
    if (code.length != 6) return;
    context.read<PhoneVerificationCubit>().verifyCode(verificationId: _verificationId, smsCode: code);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhoneVerificationCubit, PhoneVerificationState>(
      listener: (context, state) {
        if (state is PhoneVerCodeSent) {
          _verificationId = state.verificationId;
          _startCountdown();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) _otpFocusNode.requestFocus();
          });
        } else if (state is PhoneVerVerified) {
          widget.onVerified(state.idToken);
        }
      },
      builder: (context, state) {
        final isLoading = state is PhoneVerSendingCode || state is PhoneVerVerifying;
        final codeSent = state is PhoneVerCodeSent ||
            state is PhoneVerVerifying ||
            (state is PhoneVerError && _verificationId.isNotEmpty);

        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Icon(Icons.verified_user_rounded, color: FoodlyThemes.primaryFoodly, size: 22),
                    const SizedBox(width: 8),
                    Text(S.current.verifyPhone, style: FoodlyTextStyles.loginCTATextButton),
                    const Spacer(),
                    IconButton(
                      onPressed: isLoading ? null : widget.onClose,
                      icon: const Icon(Icons.close, size: 24),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                if (!codeSent) ...[
                  // ── Phase 1: enter / confirm phone ──────────────────────
                  Text(
                    S.current.confirmPhoneForVerification,
                    style: FoodlyTextStyles.cardsSmallSubtitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  IntlPhoneField(
                    initialValue: _displayNationalNumber,
                    initialCountryCode: _displayIsoCode,
                    onChanged: _onPhoneChanged,
                    decoration: InputDecoration(
                      labelText: S.current.phoneNumber,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    ),
                    onSubmitted: (_) => _sendCode(context),
                  ),
                  const SizedBox(height: 30),
                  _ActionButton(
                    label: S.current.sendVerificationCode,
                    loading: isLoading,
                    onPressed: () => _sendCode(context),
                  ),
                ] else ...[
                  // ── Phase 2: enter OTP ───────────────────────────────────
                  Text(
                    S.current.enterCodeSentTo(_completePhone),
                    style: FoodlyTextStyles.cardsSmallSubtitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _otpController,
                    focusNode: _otpFocusNode,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 6,
                    autofillHints: const [AutofillHints.oneTimeCode],
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: 12),
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: '------',
                      hintStyle: TextStyle(
                        fontSize: 28,
                        letterSpacing: 12,
                        color: Colors.grey.shade400,
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onChanged: (v) {
                      if (v.length == 6) _verifyCode(context);
                    },
                  ),
                  const SizedBox(height: 16),
                  _ActionButton(
                    label: S.current.verify,
                    loading: isLoading,
                    onPressed: () => _verifyCode(context),
                  ),
                  const SizedBox(height: 12),
                  // Resend row
                  _secondsLeft > 0
                      ? Text(
                          S.current.resendCodeIn(_secondsLeft),
                          style: FoodlyTextStyles.caption,
                        )
                      : TextButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  _otpController.clear();
                                  context.read<PhoneVerificationCubit>().sendCode(_completePhone);
                                },
                          child: Text(S.current.resendCode),
                        ),
                ],

                // Error message
                if (state is PhoneVerError) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: FoodlyThemes.error.withValues(alpha: .1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.error_outline, color: FoodlyThemes.error, size: 16),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(state.message, style: const TextStyle(color: FoodlyThemes.error, fontSize: 12)),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final bool loading;
  final VoidCallback onPressed;

  const _ActionButton({required this.label, required this.loading, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: FoodlyThemes.primaryFoodly,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: loading ? null : onPressed,
        child: loading
            ? const SizedBox(
                width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
            : Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
