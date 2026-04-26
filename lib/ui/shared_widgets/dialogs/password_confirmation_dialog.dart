import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/core_exports.dart' show FoodlyThemes;
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:icons_plus/icons_plus.dart' show LineAwesome;

/// Reusable "sudo-mode" dialog that asks the user to re-enter their current
/// password before a sensitive operation (email change, account deletion,
/// payment method unlink, etc.).
///
/// Usage:
/// ```dart
/// final currentPassword = await PasswordConfirmationDialog.show(
///   context,
///   reason: S.current.confirmPasswordForEmailChange,
/// );
/// if (currentPassword == null) return; // user cancelled
/// // proceed with the sensitive operation, passing `currentPassword`
/// ```
///
/// Returns the entered password if confirmed, or `null` if cancelled.
/// The caller is responsible for verifying the password with the backend
/// (typically by including it in the protected endpoint's payload).
class PasswordConfirmationDialog extends StatefulWidget {
  final String title;
  final String reason;

  /// Optional error to render inline below the password field on first
  /// open. Used by the retry loop in `_EmailEditingWdg`: after the BE
  /// rejects the password, the caller re-shows this dialog with
  /// `errorText: S.current.passwordIncorrect` so the user retries
  /// without losing context. The error clears the moment the user
  /// starts typing again — they're already correcting the issue.
  final String? errorText;

  const PasswordConfirmationDialog({
    super.key,
    required this.title,
    required this.reason,
    this.errorText,
  });

  static Future<String?> show(
    BuildContext context, {
    required String reason,
    String? title,
    String? errorText,
  }) {
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (_) => PasswordConfirmationDialog(
        title: title ?? S.current.confirmPasswordTitle,
        reason: reason,
        errorText: errorText,
      ),
    );
  }

  @override
  State<PasswordConfirmationDialog> createState() => _PasswordConfirmationDialogState();
}

class _PasswordConfirmationDialogState extends State<PasswordConfirmationDialog> {
  final _controller = TextEditingController();
  bool _isValid = false;

  /// Inline error shown below the password input. Initialized from
  /// [PasswordConfirmationDialog.errorText] so a previous failed attempt
  /// can carry its message into a re-opened dialog. Cleared as soon as
  /// the user types — keeping a stale error visible while they're
  /// already correcting it would be visual noise.
  late String? _inlineError = widget.errorText;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final valid = _controller.text.isNotEmpty;
      final shouldClearError = _inlineError != null && _controller.text.isNotEmpty;
      if (valid != _isValid || shouldClearError) {
        setState(() {
          _isValid = valid;
          if (shouldClearError) _inlineError = null;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _cancel() => Navigator.of(context).pop();
  void _confirm() {
    if (!_isValid) return;
    Navigator.of(context).pop(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
      child: FadeIn(
        duration: const Duration(milliseconds: 250),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ui.NeumorphicColors.background,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(LineAwesome.user_lock_solid, color: FoodlyThemes.primaryFoodly, size: 48),
              const SizedBox(height: 12),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: FoodlyTextStyles.confirmationTextPrimary,
              ),
              const SizedBox(height: 12),
              Text(
                widget.reason,
                textAlign: TextAlign.center,
                style: FoodlyTextStyles.caption,
              ),
              const SizedBox(height: 24),
              FoodlyPrimaryInputText(
                controller: _controller,
                inputTextType: FoodlyInputType.password,
                autovalidateMode: AutovalidateMode.disabled,
                obscureText: true,
                enabled: true,
                showLeading: false,
                autofocus: true,
                labelText: S.current.password,
                onFieldSubmitted: (_) => _confirm(),
              ),
              if (_inlineError != null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(LineAwesome.exclamation_circle_solid,
                        size: 14, color: FoodlyThemes.error),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        _inlineError!,
                        style: const TextStyle(
                          color: FoodlyThemes.error,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 44,
                      child: CustomNeumorphicButton(
                        text: S.current.cancel,
                        shape: ui.NeumorphicShape.concave,
                        type: CustomNeumorphicBtnType.secondary,
                        fontSize: 14,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        disabled: false,
                        onPressed: _cancel,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 44,
                      child: CustomNeumorphicButton(
                        text: S.current.confirm,
                        fontSize: 14,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        disabled: !_isValid,
                        onPressed: _confirm,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
