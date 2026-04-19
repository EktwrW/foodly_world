import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/core_exports.dart' show FoodlyThemes, S;
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

/// Result of the [BlockDateBottomSheet] — `null` means the user dismissed
/// the sheet without confirming. `startTime` / `endTime` are `HH:MM:SS`
/// strings (the BE accepts `HH:MM:SS` only) and `null` when `isFullDay`.
class BlockDateResult {
  final DateTime date;
  final bool isFullDay;
  final String? startTime;
  final String? endTime;
  final String? reason;

  const BlockDateResult({
    required this.date,
    required this.isFullDay,
    this.startTime,
    this.endTime,
    this.reason,
  });
}

/// Bottom sheet for creating a single block on [date].
///
/// Toggle "Full day" switches between a date-only block and a time-window
/// block. When partial, two TimeOfDay pickers are shown and the sheet
/// refuses to confirm until start < end.
class BlockDateBottomSheet extends StatefulWidget {
  final DateTime date;

  const BlockDateBottomSheet({super.key, required this.date});

  @override
  State<BlockDateBottomSheet> createState() => _BlockDateBottomSheetState();
}

class _BlockDateBottomSheetState extends State<BlockDateBottomSheet> {
  bool _isFullDay = true;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  final _reasonController = TextEditingController();

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  String _formatTime(TimeOfDay t) {
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m:00';
  }

  bool get _canConfirm {
    if (_isFullDay) return true;
    if (_startTime == null || _endTime == null) return false;
    final s = _startTime!.hour * 60 + _startTime!.minute;
    final e = _endTime!.hour * 60 + _endTime!.minute;
    return s < e;
  }

  Future<void> _pickStart() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _startTime ?? const TimeOfDay(hour: 12, minute: 0),
    );
    if (picked != null) setState(() => _startTime = picked);
  }

  Future<void> _pickEnd() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _endTime ?? const TimeOfDay(hour: 14, minute: 0),
    );
    if (picked != null) setState(() => _endTime = picked);
  }

  String _dateLabel() {
    final d = widget.date;
    final day = d.day.toString().padLeft(2, '0');
    final month = d.month.toString().padLeft(2, '0');
    return '$day/$month/${d.year}';
  }

  void _confirm() {
    if (!_canConfirm) return;

    Navigator.of(context).pop(BlockDateResult(
      date: widget.date,
      isFullDay: _isFullDay,
      startTime: _isFullDay ? null : _formatTime(_startTime!),
      endTime: _isFullDay ? null : _formatTime(_endTime!),
      reason: _reasonController.text.trim().isEmpty ? null : _reasonController.text.trim(),
    ));
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
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHandle(),
                const SizedBox(height: 8),
                _buildTitle(),
                const SizedBox(height: 4),
                _buildDateChip(),
                const SizedBox(height: 16),
                _buildFullDayToggle(),
                if (!_isFullDay) ...[
                  const SizedBox(height: 12),
                  _buildTimeRow(),
                ],
                const SizedBox(height: 16),
                _buildReasonField(),
                const SizedBox(height: 20),
                _buildActions(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHandle() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 4),
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
        const Icon(Bootstrap.calendar_x, color: FoodlyThemes.primaryFoodly, size: 22),
        const SizedBox(width: 10),
        Text(S.current.blockDate, style: FoodlyTextStyles.menuTitle),
      ],
    );
  }

  Widget _buildDateChip() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.3),
            ),
          ),
          child: Text(
            _dateLabel(),
            style: const TextStyle(
              color: FoodlyThemes.primaryFoodly,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFullDayToggle() {
    return Row(
      children: [
        Expanded(
          child: Text(S.current.fullDay, style: FoodlyTextStyles.actionsBody),
        ),
        Switch.adaptive(
          value: _isFullDay,
          activeThumbColor: FoodlyThemes.primaryFoodly,
          onChanged: (v) => setState(() => _isFullDay = v),
        ),
      ],
    );
  }

  Widget _buildTimeRow() {
    return Row(
      children: [
        Expanded(
          child: _TimeField(
            label: S.current.startTime,
            value: _startTime,
            onPick: _pickStart,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _TimeField(
            label: S.current.endTime,
            value: _endTime,
            onPick: _pickEnd,
          ),
        ),
      ],
    );
  }

  Widget _buildReasonField() {
    return TextField(
      controller: _reasonController,
      maxLength: 200,
      maxLines: 2,
      style: FoodlyTextStyles.inputTextValue,
      decoration: InputDecoration(
        labelText: S.current.reasonOptional,
        hintText: S.current.reasonHint,
        counterText: '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: FoodlyThemes.secondaryFoodly),
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: FoodlyThemes.secondaryFoodly),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              S.current.cancel,
              style: const TextStyle(color: FoodlyThemes.primaryFoodly),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: FoodlyThemes.primaryFoodly,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: _canConfirm ? _confirm : null,
            child: Text(S.current.blockAction),
          ),
        ),
      ],
    ).paddingOnly(top: 4);
  }
}

class _TimeField extends StatelessWidget {
  final String label;
  final TimeOfDay? value;
  final VoidCallback onPick;

  const _TimeField({
    required this.label,
    required this.value,
    required this.onPick,
  });

  String _format(TimeOfDay t) {
    final h = t.hour.toString().padLeft(2, '0');
    final m = t.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPick,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: FoodlyThemes.secondaryFoodly),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: FoodlyTextStyles.caption),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Bootstrap.clock, size: 14, color: FoodlyThemes.primaryFoodly),
                const SizedBox(width: 6),
                Text(
                  value == null ? '--:--' : _format(value!),
                  style: FoodlyTextStyles.inputTextValue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
