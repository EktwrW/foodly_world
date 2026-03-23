import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

/// Shows a [SnackBarWdg] of type `action` to select the combos tab label.
/// Calls [onSave] with the selected label (empty string = reset to default).
void showCombosLabelSnackBar(
  BuildContext context, {
  String? currentLabel,
  required ValueChanged<String> onSave,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  final snackBar = SnackBarWdg(
    type: SnackBarType.action,
    topBtnPadding: 0,
    content: _CombosLabelContent(currentLabel: currentLabel),
    buttonBuilder: (handleDismiss) => _CombosLabelButtons(
      currentLabel: currentLabel,
      onSave: (value) {
        onSave(value);
        handleDismiss();
      },
      onCancel: handleDismiss,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar.getSnackBar(context));
}

// ─── Content (chips + custom field) ─────────────────────────────────

class _CombosLabelContent extends StatelessWidget {
  final String? currentLabel;
  const _CombosLabelContent({this.currentLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Text(
          S.current.combosLabelTitle(
            (currentLabel != null && currentLabel!.isNotEmpty) ? currentLabel! : S.current.combos,
          ),
          style: FoodlyTextStyles.label.copyWith(fontWeight: FontWeight.w700, fontSize: 15),
        ),
        Text(
          S.current.combosLabelHint,
          style: FoodlyTextStyles.label.copyWith(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}

// ─── Buttons area (chips + custom + save/cancel) ────────────────────

class _CombosLabelButtons extends StatefulWidget {
  final String? currentLabel;
  final ValueChanged<String> onSave;
  final VoidCallback onCancel;

  const _CombosLabelButtons({
    this.currentLabel,
    required this.onSave,
    required this.onCancel,
  });

  @override
  State<_CombosLabelButtons> createState() => _CombosLabelButtonsState();
}

class _CombosLabelButtonsState extends State<_CombosLabelButtons> {
  late final TextEditingController _controller;
  String? _selected;
  bool _isCustom = false;

  static const _maxLength = 19;

  List<String> get _presets => [
        S.current.combos,
        S.current.combosLabelMenus,
        S.current.combosLabelSpecials,
        S.current.combosLabelSetMeals,
        S.current.combosLabelPlatters,
      ];

  @override
  void initState() {
    super.initState();
    final current = widget.currentLabel ?? '';
    if (current.isEmpty || _presets.contains(current)) {
      _selected = current.isEmpty ? S.current.combos : current;
    } else {
      _isCustom = true;
    }
    _controller = TextEditingController(text: _isCustom ? current : '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final value = _isCustom ? _controller.text.trim() : _selected;
    if (value == null || value.isEmpty) return;
    widget.onSave(value == S.current.combos ? '' : value);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Durations.medium2,
      child: Column(
        spacing: 36,
        children: [
          // Preset chips
          Wrap(
            spacing: 16,
            runSpacing: 9,
            children: [
              ..._presets.map((label) {
                final isActive = !_isCustom && _selected == label;
                return ChoiceChip(
                  label: Text(label),
                  selected: isActive,
                  selectedColor: FoodlyThemes.primaryFoodly.withValues(alpha: 0.15),
                  labelStyle: FoodlyTextStyles.label.copyWith(
                    fontSize: 12,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                    color: isActive ? FoodlyThemes.primaryFoodly : null,
                  ),
                  side: BorderSide(color: isActive ? FoodlyThemes.primaryFoodly : Colors.grey.shade300),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  onSelected: (_) => setState(() {
                    _selected = label;
                    _isCustom = false;
                    _controller.clear();
                  }),
                );
              }),
              // Custom chip
              ChoiceChip(
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 6,
                  children: [
                    Icon(
                      Bootstrap.pencil_square,
                      size: 16,
                      color: _isCustom ? FoodlyThemes.primaryFoodly : null,
                    ),
                    Text(S.current.combosLabelCustom),
                  ],
                ),
                selected: _isCustom,
                selectedColor: FoodlyThemes.primaryFoodly.withValues(alpha: 0.15),
                labelStyle: FoodlyTextStyles.label.copyWith(
                  fontSize: 12,
                  fontWeight: _isCustom ? FontWeight.w700 : FontWeight.w400,
                  color: _isCustom ? FoodlyThemes.primaryFoodly : null,
                ),
                side: BorderSide(color: _isCustom ? FoodlyThemes.primaryFoodly : Colors.grey.shade300),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                onSelected: (_) => setState(() {
                  _isCustom = true;
                  _selected = null;
                }),
              ),
            ],
          ),

          // Custom text field
          if (_isCustom)
            FadeIn(
              delay: Durations.short4,
              child: TextField(
                controller: _controller,
                autofocus: true,
                maxLength: _maxLength,
                inputFormatters: [LengthLimitingTextInputFormatter(_maxLength)],
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: FoodlyThemes.primaryFoodly),
                  ),
                  counterText: '${_controller.text.trim().length}/$_maxLength',
                ),
                style: FoodlyTextStyles.label.copyWith(fontSize: 14),
                onChanged: (_) => setState(() {}),
              ).paddingOnly(bottom: 16),
            ),

          // Save / Cancel buttons
          SizedBox(
            height: 44,
            child: Row(
              children: [
                Expanded(
                  child: CustomNeumorphicButton(
                    onPressed: widget.onCancel,
                    type: CustomNeumorphicBtnType.tertiary,
                    padding: const EdgeInsets.all(8),
                    text: S.current.cancel,
                    disabled: false,
                    fontSize: 12.9,
                  ),
                ),
                Expanded(
                  child: CustomNeumorphicButton(
                    onPressed: (_isCustom && _controller.text.trim().isEmpty) ? null : _submit,
                    padding: const EdgeInsets.all(8),
                    text: S.current.save,
                    disabled: (_isCustom && _controller.text.trim().isEmpty),
                    fontSize: 12.9,
                  ),
                ),
              ],
            ),
          ).paddingBottom(9),
        ],
      ),
    );
  }
}
