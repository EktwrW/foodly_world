import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/reservations/reservation_dm.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart' show UIDecorations;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart'
    show CustomRoundedNeumorphicButton;
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/reservations/cubit/my_reservations_cubit.dart';
import 'package:foodly_world/ui/views/reservations/widgets/reservation_card.dart';
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

class _StatusFilterDropdown extends StatelessWidget {
  const _StatusFilterDropdown();

  static const _items = <(String, ReservationStatus?)>[
    ('All', null),
    ('Pending', ReservationStatus.pending),
    ('Confirmed', ReservationStatus.confirmed),
    ('Completed', ReservationStatus.completed),
    ('Cancelled', ReservationStatus.cancelled),
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
          loading: (_) => const Center(child: CircularProgressIndicator()),
          orElse: () {
            if (vm.reservations.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Bootstrap.calendar2_event, size: 64, color: FoodlyThemes.primaryFoodly),
                    SizedBox(height: 12),
                    Text('No reservations yet.', style: FoodlyTextStyles.label),
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
        title: const Text('Cancel Reservation'),
        content: const Text('Are you sure you want to cancel this reservation?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('No')),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              final success = await cubit.cancelReservation(reservation.reservationUuid!);
              if (context.mounted) {
                FoodlySnackbars.successGeneric(
                  context,
                  success ? 'Reservation cancelled.' : 'Failed to cancel reservation.',
                );
              }
            },
            child: Text('Yes, cancel', style: TextStyle(color: Colors.red.shade700)),
          ),
        ],
      ),
    );
  }
}
