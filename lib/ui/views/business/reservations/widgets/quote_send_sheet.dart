import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/services/dependency_injection_service.dart' show AuthSessionService, di;
import 'package:foodly_world/generated/l10n.dart' show S;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

/// Shows a bottom sheet for the manager to enter a quote amount + optional notes.
///
/// Returns `({double quotedAmount, String? managerNotes})` on submit, or `null`
/// if the user dismisses the sheet.
Future<({double quotedAmount, String? managerNotes})?> showQuoteSendSheet(
  BuildContext context, {
  required String packageTitle,
  required int guestCount,
  double? budgetEstimate,
}) {
  return showModalBottomSheet<({double quotedAmount, String? managerNotes})>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _QuoteSendSheet(
      packageTitle: packageTitle,
      guestCount: guestCount,
      budgetEstimate: budgetEstimate,
    ),
  );
}

class _QuoteSendSheet extends StatefulWidget {
  final String packageTitle;
  final int guestCount;
  final double? budgetEstimate;

  const _QuoteSendSheet({
    required this.packageTitle,
    required this.guestCount,
    this.budgetEstimate,
  });

  @override
  State<_QuoteSendSheet> createState() => _QuoteSendSheetState();
}

class _QuoteSendSheetState extends State<_QuoteSendSheet> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final amount = double.parse(_amountController.text);
    final notes = _notesController.text.isNotEmpty ? _notesController.text : null;

    Navigator.of(context).pop((quotedAmount: amount, managerNotes: notes));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
          color: ui.NeumorphicColors.background,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
          child: FadeIn(
            duration: const Duration(milliseconds: 300),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHandle(),
                  const SizedBox(height: 8),
                  _buildTitle(),
                  const SizedBox(height: 16),
                  _buildContextInfo(),
                  const SizedBox(height: 16),
                  _buildAmountField(),
                  const SizedBox(height: 12),
                  _buildNotesField(),
                  const SizedBox(height: 8),
                  _buildPaymentHint(),
                  const SizedBox(height: 20),
                  _buildButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHandle() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 12, bottom: 4),
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        const Icon(Bootstrap.cash_coin, size: 22, color: FoodlyThemes.primaryFoodly),
        const SizedBox(width: 10),
        Text(S.current.sendQuote, style: FoodlyTextStyles.menuTitle),
      ],
    );
  }

  Widget _buildContextInfo() {
    final currency = di<AuthSessionService>().currency;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.packageTitle, style: FoodlyTextStyles.actionsBodyBold),
          const SizedBox(height: 4),
          Text(
            '${S.current.guestCount}: ${widget.guestCount}',
            style: FoodlyTextStyles.caption,
          ),
          if (widget.budgetEstimate != null) ...[
            const SizedBox(height: 4),
            Text(
              '${S.current.budgetEstimate}: $currency${widget.budgetEstimate!.toStringAsFixed(2)}',
              style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.primaryFoodly),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAmountField() {
    // Currency symbol of the manager's business — same source as
    // _buildContextInfo above. Used as a TEXT prefix instead of a
    // Bootstrap.currency_euro icon because that icon is hardcoded to € and
    // wouldn't reflect ARS / VES / USD for Phase 2/3 markets.
    final currency = di<AuthSessionService>().currency;

    return TextFormField(
      controller: _amountController,
      autofocus: true,
      decoration: InputDecoration(
        labelText: S.current.enterQuoteAmount,
        labelStyle: FoodlyTextStyles.hintText,
        prefixText: '$currency ',
        prefixStyle: const TextStyle(color: FoodlyThemes.secondaryFoodly, fontWeight: FontWeight.w600),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: FoodlyThemes.primaryFoodly),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red.shade300),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red.shade300),
        ),
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validator: (v) {
        if (v == null || v.isEmpty) return S.current.fieldRequired;
        final n = double.tryParse(v);
        if (n == null || n <= 0) return S.current.invalidValue;
        return null;
      },
    );
  }

  Widget _buildNotesField() {
    return TextFormField(
      controller: _notesController,
      decoration: InputDecoration(
        labelText: S.current.quoteNotes,
        labelStyle: FoodlyTextStyles.hintText,
        prefixIcon: const Icon(Bootstrap.chat_left_text, size: 18, color: FoodlyThemes.secondaryFoodly),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: FoodlyThemes.primaryFoodly),
        ),
      ),
      maxLines: 3,
      maxLength: 500,
    );
  }

  Widget _buildPaymentHint() {
    return Row(
      children: [
        Icon(Bootstrap.info_circle, size: 14, color: Colors.grey.shade600),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            S.current.paymentOffPlatform,
            style: FoodlyTextStyles.caption.copyWith(color: Colors.grey.shade600),
          ),
        ),
      ],
    );
  }

  Widget _buildButtons() {
    return Row(
      children: [
        Expanded(
          child: CustomNeumorphicButton(
            text: S.current.cancel,
            onPressed: () => Navigator.of(context).pop(),
            type: CustomNeumorphicBtnType.secondary,
            disabled: false,
            fontSize: 14,
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 9),
          ),
        ),
        Expanded(
          child: CustomNeumorphicButton(
            text: S.current.sendQuote,
            onPressed: _submit,
            disabled: false,
            fontSize: 14,
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 9),
          ),
        ),
      ],
    );
  }
}
