import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/reservations/reservation_dm.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart' show UIDecorations;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart'
    show CustomRoundedNeumorphicButton;
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/reservations/cubit/manage_reservations_cubit.dart';
import 'package:foodly_world/ui/views/business/reservations/widgets/manager_reservation_card.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class ManageReservationsPage extends StatelessWidget {
  final String businessUuid;

  const ManageReservationsPage({super.key, required this.businessUuid});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ManageReservationsCubit(
        reservationRepo: di(),
        logger: di(),
        businessUuid: businessUuid,
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

  static final _items = <(String, ReservationStatus?)>[
    (S.current.all, null),
    (S.current.pending, ReservationStatus.pending),
    (S.current.confirmed, ReservationStatus.confirmed),
    (S.current.completed, ReservationStatus.completed),
    (S.current.cancelled, ReservationStatus.cancelled),
    (S.current.noShow, ReservationStatus.noShow),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ManageReservationsCubit, ManageReservationsState, ReservationStatus?>(
      selector: (state) => state.vm.statusFilter,
      builder: (context, activeFilter) {
        final cubit = context.read<ManageReservationsCubit>();

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
          loading: (_) => const Center(child: CircularProgressIndicator()),
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
                    return ManagerReservationCard(
                      reservation: reservation,
                      onConfirm: reservation.canBeActedOnByManager
                          ? () => cubit.confirmReservation(reservation.reservationUuid!)
                          : null,
                      onReject: reservation.canBeActedOnByManager
                          ? () => _showNotesDialog(context, S.current.rejectReservation, (notes) {
                                cubit.rejectReservation(reservation.reservationUuid!, managerNotes: notes);
                              })
                          : null,
                      onCancel: reservation.isConfirmed
                          ? () => _showNotesDialog(context, S.current.cancelReservation, (notes) {
                                cubit.managerCancelReservation(reservation.reservationUuid!, managerNotes: notes);
                              })
                          : null,
                      onNoShow: reservation.isConfirmed ? () => cubit.markNoShow(reservation.reservationUuid!) : null,
                      onComplete:
                          reservation.isConfirmed ? () => cubit.markComplete(reservation.reservationUuid!) : null,
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
