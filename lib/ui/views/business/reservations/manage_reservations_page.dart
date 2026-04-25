import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/reservations/reservation_dm.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart' show UIDecorations;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart'
    show CustomRoundedNeumorphicButton;
import 'package:foodly_world/ui/shared_widgets/shimmer/home_shimmer_widgets.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/reservations/cubit/manage_reservations_cubit.dart';
import 'package:foodly_world/ui/views/business/reservations/widgets/manager_reservation_card.dart';
import 'package:foodly_world/ui/views/business/reservations/widgets/quote_send_sheet.dart';
import 'package:foodly_world/ui/views/reservations/widgets/reservation_messages_sheet.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class ManageReservationsPage extends StatelessWidget {
  final String businessUuid;
  final String? initialFilter;
  final BusinessDM? business;

  const ManageReservationsPage({
    super.key,
    required this.businessUuid,
    this.initialFilter,
    this.business,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ManageReservationsCubit(
        reservationRepo: di(),
        logger: di(),
        businessUuid: businessUuid,
        initialFilter: initialFilter,
        // The BE endpoint filters by booking_type when we send it; the cubit
        // derives the right value from the vertical so each business sees
        // only the reservations it can actually produce (catering→service,
        // restaurants/bars/etc.→table). No visible filter chip — each
        // business has a single booking_type today.
        businessCategory: business?.categoryId,
      ),
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: AppBar(
            key: const Key('manage-reservations-app-bar'),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: UIDecorations.GLASSMORPHIC_PURPLE_GRADIENT,
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 60,
            actions: [
              IconButton(
                tooltip: S.current.availabilityCalendar,
                icon: const Icon(Bootstrap.calendar2_week, color: Colors.white, size: 22),
                onPressed: () => context.pushNamed(
                  AppRoutes.manageAvailability.name,
                  pathParameters: {AppRoutes.routeIdParam: businessUuid},
                ),
              ),
              Text(
                S.current.manageReservations,
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
            ).paddingSymmetric(vertical: 8, horizontal: 8),
            leadingWidth: 60,
          ),
          body: const SafeArea(
            child: Column(
              children: [
                _StatusFilterDropdown(),
                Expanded(child: _ManagerReservationsList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusFilterDropdown extends StatelessWidget {
  const _StatusFilterDropdown();

  /// Filter items: (label, filterKey).
  /// `null` = all, `'today'` = today's reservations,
  /// otherwise a [ReservationStatus] name.
  static List<(String, String?)> get _items => [
        (S.current.all, null),
        (S.current.reservationsForToday, 'today'),
        (S.current.pending, ReservationStatus.pending.name),
        (S.current.quoted, ReservationStatus.quoted.name),
        (S.current.confirmed, ReservationStatus.confirmed.name),
        (S.current.completed, ReservationStatus.completed.name),
        (S.current.cancelled, ReservationStatus.cancelled.name),
        (S.current.noShow, ReservationStatus.noShow.name),
      ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageReservationsCubit, ManageReservationsState>(
      builder: (context, state) {
        final cubit = context.read<ManageReservationsCubit>();
        final activeFilter = cubit.activeFilterKey;
        final items = _items;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.4)),
              color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.05),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String?>(
                value: activeFilter,
                isExpanded: true,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                borderRadius: BorderRadius.circular(12),
                icon: const Icon(Bootstrap.chevron_down, size: 14, color: FoodlyThemes.primaryFoodly),
                style: const TextStyle(fontSize: 14, color: Colors.black87),
                selectedItemBuilder: (context) => items
                    .map((item) => Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item.$1,
                            style: const TextStyle(
                              color: FoodlyThemes.primaryFoodly,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                items: items
                    .map((item) => DropdownMenuItem<String?>(
                          value: item.$2,
                          child: Text(
                            item.$1,
                            style: TextStyle(
                              color: activeFilter == item.$2 ? FoodlyThemes.primaryFoodly : Colors.black87,
                              fontWeight: activeFilter == item.$2 ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (value) => cubit.setFilter(value),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ManagerReservationsList extends StatelessWidget {
  const _ManagerReservationsList();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageReservationsCubit, ManageReservationsState>(
      listener: (context, state) {
        state.mapOrNull(
          error: (s) => FoodlySnackbars.errorGeneric(context, s.message),
        );
      },
      builder: (context, state) {
        final cubit = context.read<ManageReservationsCubit>();
        final vm = state.vm;

        return state.maybeMap(
          loading: (_) => const ReservationsShimmer(isManager: true),
          orElse: () {
            if (vm.reservations.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Bootstrap.calendar2_check, size: 64, color: FoodlyThemes.primaryFoodly),
                    const SizedBox(height: 12),
                    Text(S.current.noReservationsFound, style: FoodlyTextStyles.label),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: cubit.fetchReservations,
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification is ScrollEndNotification && notification.metrics.extentAfter < 200) {
                    cubit.fetchMoreReservations();
                  }
                  return false;
                },
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 4, bottom: 24),
                  itemCount: vm.reservations.length + (vm.isLoadingMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index >= vm.reservations.length) {
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    final reservation = vm.reservations[index];
                    // Table bookings: manager confirms directly.
                    // Service bookings: manager sends a quote (not a direct confirm).
                    final canDirectConfirm = reservation.canBeActedOnByManager && !reservation.isServiceBooking;
                    final canCancel = reservation.isConfirmed || reservation.isQuoted;

                    return ManagerReservationCard(
                      reservation: reservation,
                      onConfirm: canDirectConfirm ? () => cubit.confirmReservation(reservation.reservationUuid!) : null,
                      onReject: reservation.canBeActedOnByManager
                          ? () => _showNotesDialog(context, S.current.rejectReservation, (notes) {
                                cubit.rejectReservation(reservation.reservationUuid!, managerNotes: notes);
                              })
                          : null,
                      onCancel: canCancel
                          ? () => _showNotesDialog(context, S.current.cancelReservation, (notes) {
                                cubit.managerCancelReservation(reservation.reservationUuid!, managerNotes: notes);
                              })
                          : null,
                      onNoShow: reservation.isConfirmed ? () => cubit.markNoShow(reservation.reservationUuid!) : null,
                      onComplete:
                          reservation.isConfirmed ? () => cubit.markComplete(reservation.reservationUuid!) : null,
                      onSendQuote: reservation.canReceiveQuote ? () => _sendQuote(context, cubit, reservation) : null,
                      onOpenMessages: reservation.isServiceBooking && reservation.reservationUuid != null
                          ? () => showReservationMessagesSheet(
                                context,
                                reservationUuid: reservation.reservationUuid!,
                                title: reservation.userName ?? reservation.servicePackageTitle ?? '',
                              )
                          : null,
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _sendQuote(
    BuildContext context,
    ManageReservationsCubit cubit,
    ReservationDM reservation,
  ) async {
    final result = await showQuoteSendSheet(
      context,
      packageTitle: reservation.servicePackageTitle ?? '',
      guestCount: reservation.guestCount ?? 0,
      budgetEstimate: reservation.budgetEstimate,
    );

    if (result == null || !context.mounted) return;

    final success = await cubit.sendQuote(
      reservation.reservationUuid!,
      quotedAmount: result.quotedAmount,
      managerNotes: result.managerNotes,
    );

    if (context.mounted) {
      FoodlySnackbars.successGeneric(
        context,
        success ? S.current.quoteSent : S.current.somethingWentWrong,
      );
    }
  }

  void _showNotesDialog(BuildContext context, String title, void Function(String?) onConfirm) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: S.current.addNoteOptional,
            border: const OutlineInputBorder(),
          ),
          maxLines: 3,
          maxLength: 500,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(S.current.cancel)),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              onConfirm(controller.text.isNotEmpty ? controller.text : null);
            },
            child: Text(S.current.confirm),
          ),
        ],
      ),
    );
  }
}
