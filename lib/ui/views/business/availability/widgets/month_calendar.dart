import 'package:flutter/material.dart';
import 'package:foodly_world/core/core_exports.dart' show FoodlyThemes, S;
import 'package:foodly_world/data_models/business_availability/business_availability_dm.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

/// A month-grid calendar for the availability page.
///
/// Renders the full month as a 7-column grid, with leading/trailing "spill"
/// days (from the neighbouring months) drawn in a dimmed state so the grid
/// always starts on Monday. Each day cell is color-coded by its block state:
///
/// * red tint — fully blocked (any full-day manual block)
/// * orange tint — partial block (some hours blocked, day otherwise open)
/// * primary purple tint — has an auto-reservation entry
/// * white / transparent — no entries
///
/// A thin shimmer overlay is rendered while [isLoading] is true so the
/// previously-loaded month stays visible during re-fetches.
class MonthCalendar extends StatelessWidget {
  final DateTime month;
  final List<BusinessAvailabilityDM> Function(DateTime) entriesForDate;
  final bool Function(DateTime) isFullyBlocked;
  final bool Function(DateTime) hasPartialBlocks;
  final ValueChanged<DateTime> onDayTap;
  final bool isLoading;

  const MonthCalendar({
    super.key,
    required this.month,
    required this.entriesForDate,
    required this.isFullyBlocked,
    required this.hasPartialBlocks,
    required this.onDayTap,
    this.isLoading = false,
  });

  /// List of days shown in the grid — always a multiple of 7, starting on
  /// Monday. Days from the previous/next month are marked `isCurrentMonth: false`.
  List<_CellData> _buildCells() {
    final first = DateTime(month.year, month.month);
    final lastDay = DateTime(month.year, month.month + 1, 0).day;

    // Monday = 1, Sunday = 7 in DateTime.weekday.
    final leading = (first.weekday - 1) % 7;
    final cells = <_CellData>[];

    for (var i = leading; i > 0; i--) {
      final d = first.subtract(Duration(days: i));
      cells.add(_CellData(date: d, isCurrentMonth: false));
    }

    for (var d = 1; d <= lastDay; d++) {
      cells.add(_CellData(
        date: DateTime(month.year, month.month, d),
        isCurrentMonth: true,
      ));
    }

    // Pad trailing to fill a 6-week grid for consistent height.
    while (cells.length % 7 != 0 || cells.length < 42) {
      final last = cells.last.date;
      cells.add(_CellData(
        date: last.add(const Duration(days: 1)),
        isCurrentMonth: false,
      ));
    }

    return cells;
  }

  @override
  Widget build(BuildContext context) {
    final cells = _buildCells();
    // Weekday labels start on Monday to match the grid.
    // `weekdayShort1` = Sun, so Mon..Sun is 2..7,1.
    final weekdays = [
      S.current.weekdayShort2,
      S.current.weekdayShort3,
      S.current.weekdayShort4,
      S.current.weekdayShort5,
      S.current.weekdayShort6,
      S.current.weekdayShort7,
      S.current.weekdayShort1,
    ];

    return Opacity(
      opacity: isLoading ? 0.65 : 1,
      child: Column(
        children: [
          _WeekdayHeader(labels: weekdays),
          const SizedBox(height: 4),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cells.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              final cell = cells[index];
              final entries = entriesForDate(cell.date);
              final fullyBlocked = isFullyBlocked(cell.date);
              final partial = hasPartialBlocks(cell.date);
              final hasAuto =
                  entries.any((e) => e.isAutoReservation);

              return _DayCell(
                cell: cell,
                entryCount: entries.length,
                fullyBlocked: fullyBlocked,
                hasPartial: partial,
                hasAuto: hasAuto,
                onTap: cell.isCurrentMonth ? () => onDayTap(cell.date) : null,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CellData {
  final DateTime date;
  final bool isCurrentMonth;

  _CellData({required this.date, required this.isCurrentMonth});
}

class _WeekdayHeader extends StatelessWidget {
  final List<String> labels;

  const _WeekdayHeader({required this.labels});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: labels
          .map(
            (l) => Expanded(
              child: Center(
                child: Text(
                  l,
                  style: FoodlyTextStyles.caption.copyWith(
                    color: FoodlyThemes.primaryFoodly,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
          .toList(growable: false),
    );
  }
}

class _DayCell extends StatelessWidget {
  final _CellData cell;
  final int entryCount;
  final bool fullyBlocked;
  final bool hasPartial;
  final bool hasAuto;
  final VoidCallback? onTap;

  const _DayCell({
    required this.cell,
    required this.entryCount,
    required this.fullyBlocked,
    required this.hasPartial,
    required this.hasAuto,
    required this.onTap,
  });

  Color _backgroundColor() {
    if (!cell.isCurrentMonth) return Colors.grey.shade100;
    if (fullyBlocked) return Colors.red.shade50;
    if (hasPartial) return Colors.orange.shade50;
    if (hasAuto) return FoodlyThemes.primaryFoodly.withValues(alpha: 0.08);
    return Colors.white;
  }

  Color _accent() {
    if (fullyBlocked) return Colors.red.shade400;
    if (hasPartial) return Colors.orange.shade400;
    if (hasAuto) return FoodlyThemes.primaryFoodly;
    return Colors.transparent;
  }

  bool get _isToday {
    final now = DateTime.now();
    return cell.date.year == now.year &&
        cell.date.month == now.month &&
        cell.date.day == now.day;
  }

  @override
  Widget build(BuildContext context) {
    final textColor = cell.isCurrentMonth
        ? (fullyBlocked ? Colors.red.shade700 : Colors.black87)
        : Colors.black26;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: _backgroundColor(),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _isToday ? FoodlyThemes.primaryFoodly : Colors.black12,
            width: _isToday ? 1.4 : 0.6,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '${cell.date.day}',
                  style: TextStyle(
                    color: textColor,
                    fontWeight:
                        _isToday ? FontWeight.w700 : FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ),
              if (entryCount > 0)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    decoration: BoxDecoration(
                      color: _accent(),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$entryCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
