import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/core_exports.dart' show FoodlyThemes, S;
import 'package:foodly_world/data_models/business_availability/business_availability_dm.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/availability/cubit/availability_cubit.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;

/// Bottom sheet summarising every entry on a given date.
///
/// Manual entries show a trash icon — tapping it calls
/// `AvailabilityCubit.deleteEntry` directly. Auto-reservation entries
/// are rendered read-only with a "reservation" tag — the manager must
/// cancel the underlying reservation instead.
///
/// Returns `true` when the user taps "Add another block" (so the caller
/// can open the [BlockDateBottomSheet]); `null` on dismiss.
class DayEntriesBottomSheet extends StatelessWidget {
  final DateTime date;
  final List<BusinessAvailabilityDM> entries;

  const DayEntriesBottomSheet({
    super.key,
    required this.date,
    required this.entries,
  });

  String _dateLabel() {
    final d = date.day.toString().padLeft(2, '0');
    final m = date.month.toString().padLeft(2, '0');
    return '$d/$m/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    // The sheet is pushed from the page with `showModalBottomSheet` using
    // the default route — no BlocProvider wrapper. We grab the existing
    // cubit from the caller's BuildContext just before pushing, but since
    // this widget is built in the sheet's own element tree we need to
    // access it through the builder the caller provides. For simplicity
    // we read via `context.read` at action-time, which works because
    // callers must wrap the sheet in `BlocProvider.value` (see the page).
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
                const SizedBox(height: 12),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.5,
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: entries.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) => _EntryRow(
                      entry: entries[index],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
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
                          S.current.close,
                          style: const TextStyle(color: FoodlyThemes.primaryFoodly),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton.icon(
                        style: FilledButton.styleFrom(
                          backgroundColor: FoodlyThemes.primaryFoodly,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(true),
                        icon: const Icon(Bootstrap.plus_lg, size: 16),
                        label: Text(S.current.addAnotherBlock),
                      ),
                    ),
                  ],
                ),
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
        const Icon(Bootstrap.calendar2_event, color: FoodlyThemes.primaryFoodly, size: 22),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            '${S.current.blocksOn} ${_dateLabel()}',
            style: FoodlyTextStyles.menuTitle,
          ),
        ),
      ],
    );
  }
}

class _EntryRow extends StatelessWidget {
  final BusinessAvailabilityDM entry;

  const _EntryRow({required this.entry});

  String _timeRange() {
    if (entry.isFullDay) return S.current.fullDay;
    final s = entry.startTime ?? '--:--:--';
    final e = entry.endTime ?? '--:--:--';
    return '${s.substring(0, 5)} — ${e.substring(0, 5)}';
  }

  Color _badgeColor() {
    if (entry.isAutoReservation) return FoodlyThemes.primaryFoodly;
    if (entry.isFullDay) return Colors.red.shade400;
    return Colors.orange.shade400;
  }

  String _badgeLabel() {
    if (entry.isAutoReservation) return S.current.fromReservation;
    if (entry.isFullDay) return S.current.legendFullDayBlock;
    return S.current.legendPartialBlock;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: _badgeColor(),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              _badgeLabel(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_timeRange(), style: FoodlyTextStyles.actionsBody, overflow: TextOverflow.ellipsis),
                if ((entry.reason ?? '').isNotEmpty)
                  Text(
                    entry.reason!,
                    style: FoodlyTextStyles.caption,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          if (entry.isReadOnly)
            const Icon(Bootstrap.lock, size: 16, color: Colors.black38)
          else
            IconButton(
              tooltip: S.current.delete,
              icon: Icon(Bootstrap.trash, size: 18, color: Colors.red.shade400),
              onPressed: entry.availabilityUuid == null ? null : () => _confirmDelete(context, entry.availabilityUuid!),
            ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, String uuid) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(S.current.deleteBlock),
        content: Text(S.current.deleteBlockConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(S.current.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              S.current.delete,
              style: TextStyle(color: Colors.red.shade400),
            ),
          ),
        ],
      ),
    );

    if (confirm != true || !context.mounted) return;

    await context.read<AvailabilityCubit>().deleteEntry(uuid);
  }
}
