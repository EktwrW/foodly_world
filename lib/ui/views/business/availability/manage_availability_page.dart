import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart' show UIDecorations;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart'
    show CustomRoundedNeumorphicButton;
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/availability/cubit/availability_cubit.dart';
import 'package:foodly_world/ui/views/business/availability/cubit/availability_vm.dart';
import 'package:foodly_world/ui/views/business/availability/widgets/block_date_bottom_sheet.dart';
import 'package:foodly_world/ui/views/business/availability/widgets/day_entries_bottom_sheet.dart';
import 'package:foodly_world/ui/views/business/availability/widgets/month_calendar.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;

/// Manager page for the availability calendar (Catering & Chefs vertical).
///
/// Shows a month-at-a-time grid where each cell is color-coded by its
/// current block state. Tapping an empty day opens the [BlockDateBottomSheet]
/// to create a new block; tapping a day that already has entries opens the
/// [DayEntriesBottomSheet] to inspect / edit / delete them.
///
/// Auto-reservation entries are rendered distinctively and are read-only.
class ManageAvailabilityPage extends StatefulWidget {
  final String businessUuid;

  const ManageAvailabilityPage({super.key, required this.businessUuid});

  @override
  State<ManageAvailabilityPage> createState() => _ManageAvailabilityPageState();
}

class _ManageAvailabilityPageState extends State<ManageAvailabilityPage> {
  late DateTime _visibleMonth;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _visibleMonth = DateTime(now.year, now.month);

    // Kick off the first fetch after the cubit is available.
    WidgetsBinding.instance.addPostFrameCallback((_) => _fetchVisibleMonth());
  }

  void _fetchVisibleMonth() {
    if (!mounted) return;
    final from = DateTime(_visibleMonth.year, _visibleMonth.month);
    final to = DateTime(_visibleMonth.year, _visibleMonth.month + 1, 0);
    context.read<AvailabilityCubit>().fetchRange(from, to);
  }

  void _goToMonth(DateTime month) {
    setState(() {
      _visibleMonth = DateTime(month.year, month.month);
    });
    _fetchVisibleMonth();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          key: const Key('manage-availability-app-bar'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: UIDecorations.glassmorphicPurpleGradient,
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 60,
          actions: [
            Text(
              S.current.availabilityCalendar,
              overflow: TextOverflow.ellipsis,
              style: FoodlyTextStyles.secondaryTitle.copyWith(color: Colors.white, fontSize: 20),
            ).paddingOnly(right: 18),
          ],
          leading: CustomRoundedNeumorphicButton(
            iconSize: 26,
            diameter: 32,
            iconData: Bootstrap.caret_left_fill,
            onPressed: () {
              if (context.canPop()) {
                di<AppRouter>().removeLastRouteHistory();
                context.pop();
              } else {
                di<AppRouter>().goBackToLastRoute();
              }
            },
            padding: const EdgeInsets.all(6),
          ).paddingSymmetric(vertical: 10, horizontal: 10),
          leadingWidth: 60,
        ),
        body: SafeArea(
          child: BlocConsumer<AvailabilityCubit, AvailabilityState>(
            listener: (context, state) {
              state.mapOrNull(
                saved: (_) => FoodlySnackbars.successGeneric(context, S.current.dateBlocked),
                deleted: (s) => FoodlySnackbars.successGeneric(context, s.message),
                error: (s) => FoodlySnackbars.errorGeneric(context, s.message),
              );
            },
            builder: (context, state) {
              final vm = state.vm;
              final isLoading = state.maybeMap(
                loading: (_) => true,
                orElse: () => false,
              );

              return Column(
                spacing: 16,
                children: [
                  _MonthHeader(
                    month: _visibleMonth,
                    onPrev: () => _goToMonth(DateTime(
                      _visibleMonth.year,
                      _visibleMonth.month - 1,
                    )),
                    onNext: () => _goToMonth(DateTime(
                      _visibleMonth.year,
                      _visibleMonth.month + 1,
                    )),
                    onToday: () {
                      final now = DateTime.now();
                      _goToMonth(DateTime(now.year, now.month));
                    },
                  ).paddingTop(16),
                  const _LegendRow(),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        _fetchVisibleMonth();
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 24),
                        child: Column(
                          children: [
                            MonthCalendar(
                              month: _visibleMonth,
                              entriesForDate: vm.entriesForDate,
                              isFullyBlocked: vm.isFullyBlocked,
                              hasPartialBlocks: vm.hasPartialBlocks,
                              onDayTap: (date) => _handleDayTap(context, vm, date),
                              isLoading: isLoading,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _handleDayTap(
    BuildContext context,
    AvailabilityVM vm,
    DateTime date,
  ) async {
    final cubit = context.read<AvailabilityCubit>();
    final entries = vm.entriesForDate(date);

    if (entries.isEmpty) {
      await _openBlockSheet(context, cubit, date);
      return;
    }

    // There are entries — show the summary sheet. Deletion is handled
    // inside the sheet via `context.read<AvailabilityCubit>()`, so we
    // wrap the sheet in a `BlocProvider.value`. A `true` result means
    // the user tapped "Add another block".
    final addMore = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: DayEntriesBottomSheet(
          date: date,
          entries: entries,
        ),
      ),
    );

    if (addMore == true && context.mounted) {
      await _openBlockSheet(context, cubit, date);
    }
  }

  Future<void> _openBlockSheet(
    BuildContext context,
    AvailabilityCubit cubit,
    DateTime date,
  ) async {
    final result = await showModalBottomSheet<BlockDateResult>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlockDateBottomSheet(date: date),
    );

    if (result == null || !context.mounted) return;

    await cubit.blockDate(
      date: result.date,
      isFullDay: result.isFullDay,
      startTime: result.startTime,
      endTime: result.endTime,
      reason: result.reason,
    );
  }
}

class _MonthHeader extends StatelessWidget {
  final DateTime month;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final VoidCallback onToday;

  const _MonthHeader({
    required this.month,
    required this.onPrev,
    required this.onNext,
    required this.onToday,
  });

  String _label(BuildContext context) {
    final months = [
      S.current.january,
      S.current.february,
      S.current.march,
      S.current.april,
      S.current.may,
      S.current.june,
      S.current.july,
      S.current.august,
      S.current.september,
      S.current.october,
      S.current.november,
      S.current.december,
    ];
    final m = months[(month.month - 1).clamp(0, 11)];
    return '$m ${month.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
      child: Row(
        children: [
          IconButton(
            tooltip: S.current.previousMonth,
            icon: const Icon(Bootstrap.chevron_left, size: 18, color: FoodlyThemes.primaryFoodly),
            onPressed: onPrev,
          ),
          Expanded(
            child: Center(
              child: Text(
                _label(context),
                style: FoodlyTextStyles.secondaryTitle.copyWith(fontSize: 18, color: FoodlyThemes.primaryFoodly),
              ),
            ),
          ),
          IconButton(
            tooltip: S.current.nextMonth,
            icon: const Icon(Bootstrap.chevron_right, size: 18, color: FoodlyThemes.primaryFoodly),
            onPressed: onNext,
          ),
          TextButton(
            onPressed: onToday,
            child: Text(
              S.current.today,
              style: const TextStyle(
                color: FoodlyThemes.primaryFoodly,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendRow extends StatelessWidget {
  const _LegendRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Wrap(
        spacing: 12,
        runSpacing: 6,
        alignment: WrapAlignment.center,
        children: [
          _LegendChip(
            color: Colors.red.shade400,
            label: S.current.legendFullDayBlock,
          ),
          _LegendChip(
            color: Colors.orange.shade400,
            label: S.current.legendPartialBlock,
          ),
          _LegendChip(
            color: FoodlyThemes.primaryFoodly,
            label: S.current.legendAutoReservation,
          ),
        ],
      ),
    );
  }
}

class _LegendChip extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendChip({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 6),
        Text(label, style: FoodlyTextStyles.caption),
      ],
    );
  }
}
