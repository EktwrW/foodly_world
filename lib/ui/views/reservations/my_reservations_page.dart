import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/reservations/reservation_dm.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart' show UIDecorations;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart'
    show CustomRoundedNeumorphicButton;
import 'package:foodly_world/ui/shared_widgets/shimmer/home_shimmer_widgets.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/reservations/cubit/my_reservations_cubit.dart';
import 'package:foodly_world/ui/views/reservations/widgets/reservation_card.dart';
import 'package:foodly_world/ui/views/reservations/widgets/reservation_messages_sheet.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class MyReservationsPage extends StatelessWidget {
  const MyReservationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyReservationsCubit(
        reservationRepo: di(),
        logger: di(),
      )..fetchReservations(),
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) {
          if (didPop) return;
          final router = di<AppRouter>();
          // Shell routes are blocked by their own PopScope(canPop: false).
          if (!router.isOnShellRoute) {
            router.goBackToLastRoute();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            key: const Key('my-reservations-app-bar'),
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
              Text(
                S.current.myReservations,
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
                context.read<MainDrawerCubit>().goToPreviousIndex();
              },
            ).paddingSymmetric(vertical: 8, horizontal: 8),
            leadingWidth: 60,
          ),
          body: const SafeArea(
            child: Column(
              children: [
                _BookingTypeFilter(),
                _StatusFilterDropdown(),
                Expanded(child: _ReservationsList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BookingTypeFilter extends StatelessWidget {
  const _BookingTypeFilter();

  static List<(String, BookingType?)> get _items => [
        (S.current.allBookings, null),
        (S.current.tableReservations, BookingType.table),
        (S.current.serviceRequests, BookingType.service),
      ];

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MyReservationsCubit, MyReservationsState, BookingType?>(
      selector: (state) => state.vm.bookingTypeFilter,
      builder: (context, activeType) {
        final cubit = context.read<MyReservationsCubit>();

        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 8,
              children: _items.map((item) {
                final selected = activeType == item.$2;
                return ChoiceChip(
                  label: Text(item.$1),
                  selected: selected,
                  onSelected: (_) => cubit.setBookingTypeFilter(item.$2),
                  selectedColor: FoodlyThemes.primaryFoodly.withValues(alpha: 0.18),
                  labelStyle: TextStyle(
                    color: selected ? FoodlyThemes.primaryFoodly : Colors.black87,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                    fontSize: 13,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: selected ? FoodlyThemes.primaryFoodly : Colors.black12,
                    ),
                  ),
                  backgroundColor: Colors.white,
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class _StatusFilterDropdown extends StatelessWidget {
  const _StatusFilterDropdown();

  static List<(String, ReservationStatus?)> get _items => [
        (S.current.all, null),
        (S.current.pending, ReservationStatus.pending),
        (S.current.quoted, ReservationStatus.quoted),
        (S.current.confirmed, ReservationStatus.confirmed),
        (S.current.completed, ReservationStatus.completed),
        (S.current.cancelled, ReservationStatus.cancelled),
      ];

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MyReservationsCubit, MyReservationsState, ReservationStatus?>(
      selector: (state) => state.vm.statusFilter,
      builder: (context, activeFilter) {
        final cubit = context.read<MyReservationsCubit>();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.4)),
              color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.05),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<ReservationStatus?>(
                value: activeFilter,
                isExpanded: true,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                borderRadius: BorderRadius.circular(12),
                icon: const Icon(Bootstrap.chevron_down, size: 14, color: FoodlyThemes.primaryFoodly),
                style: const TextStyle(fontSize: 14, color: Colors.black87),
                selectedItemBuilder: (context) => _items
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
                items: _items
                    .map((item) => DropdownMenuItem<ReservationStatus?>(
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
                onChanged: (value) => cubit.setStatusFilter(value),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ReservationsList extends StatelessWidget {
  const _ReservationsList();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyReservationsCubit, MyReservationsState>(
      listener: (context, state) {
        state.mapOrNull(
          error: (s) => FoodlySnackbars.errorGeneric(context, s.message),
        );
      },
      builder: (context, state) {
        final cubit = context.read<MyReservationsCubit>();
        final vm = state.vm;

        return state.maybeMap(
          loading: (_) => const ReservationsShimmer(),
          orElse: () {
            if (vm.reservations.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Bootstrap.calendar2_event, size: 64, color: FoodlyThemes.primaryFoodly),
                    const SizedBox(height: 12),
                    Text(S.current.noReservationsYet, style: FoodlyTextStyles.label),
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
                    return ReservationCard(
                      reservation: reservation,
                      onCancel: reservation.canBeCancelledByCustomer
                          ? () => _confirmCancel(context, cubit, reservation)
                          : null,
                      onApproveQuote: reservation.canApproveQuote
                          ? () => _confirmApproveQuote(context, cubit, reservation)
                          : null,
                      onOpenMessages: reservation.isServiceBooking && reservation.reservationUuid != null
                          ? () => showReservationMessagesSheet(
                                context,
                                reservationUuid: reservation.reservationUuid!,
                                title: reservation.businessName ?? reservation.servicePackageTitle ?? '',
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

  void _confirmCancel(BuildContext context, MyReservationsCubit cubit, ReservationDM reservation) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(S.current.cancelReservation),
        content: Text(S.current.areYouSureCancelReservation),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(S.current.cancel)),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              final success = await cubit.cancelReservation(reservation.reservationUuid!);
              if (context.mounted) {
                FoodlySnackbars.successGeneric(
                  context,
                  success ? S.current.reservationCancelled : S.current.failedToCancelReservation,
                );
              }
            },
            child: Text(S.current.yesCancel, style: TextStyle(color: Colors.red.shade700)),
          ),
        ],
      ),
    );
  }

  void _confirmApproveQuote(BuildContext context, MyReservationsCubit cubit, ReservationDM reservation) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(S.current.confirmApproveQuote),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.current.confirmApproveQuoteMessage),
            if (reservation.hasQuote) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${S.current.quotedAmount}: €${reservation.quotedAmount!.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.deepPurple),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                S.current.paymentOffPlatform,
                style: FoodlyTextStyles.caption.copyWith(color: Colors.grey.shade600),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(S.current.cancel)),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              final success = await cubit.approveQuote(reservation.reservationUuid!);
              if (context.mounted) {
                FoodlySnackbars.successGeneric(
                  context,
                  success ? S.current.quoteApproved : S.current.somethingWentWrong,
                );
              }
            },
            child: Text(S.current.approveQuote, style: const TextStyle(color: Colors.deepPurple)),
          ),
        ],
      ),
    );
  }
}
