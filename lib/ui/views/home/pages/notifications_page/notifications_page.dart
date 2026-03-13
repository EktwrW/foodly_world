import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer;
import 'package:foodly_world/core/core_exports.dart'
    show NotificationsCubit, NotificationsState, FoodlyThemes, ReadContext, di, DialogService, PaddingExtension, S;
import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/core/network/reservations/reservation_repo.dart';
import 'package:foodly_world/data_models/notifications/notifications_dm.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/reservations/widgets/manager_reservation_card.dart';
import 'package:foodly_world/ui/views/home/widgets/secondary_main_app_bar.dart';
import 'package:icons_plus/icons_plus.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: SecondaryMainAppBar(
          key: const Key('notifications-app-bar'),
          actionText: S.current.notifications,
        ),
        body: BlocConsumer<NotificationsCubit, NotificationsState>(
          listener: (context, state) {
            final dialogService = di<DialogService>();

            state.whenOrNull(
              loading: (vm) => dialogService.showLoading(),
              loaded: (vm) => dialogService.hideLoading(),
              error: (vm, message) {
                dialogService.hideLoading();
                FoodlySnackbars.errorGeneric(context, message);
              },
            );
          },
          builder: (context, state) {
            final vm = state.vm;

            if (vm.notifications.isEmpty) {
              return Center(
                child: Column(
                  spacing: 16,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Bootstrap.bell_slash, size: 48, color: FoodlyThemes.secondaryFoodly),
                    Text(S.current.noNotificationsYet),
                  ],
                ).paddingBottom(48),
              );
            }

            return Column(
              spacing: 16,
              children: [
                const SizedBox(height: 9),
                Row(
                  children: [
                    const Spacer(flex: 2),
                    Flexible(
                      flex: 3,
                      child: CustomNeumorphicButton(
                        onPressed: () => context.read<NotificationsCubit>().markAllAsRead(),
                        type: CustomNeumorphicBtnType.outlined,
                        text: S.current.markAllAsRead,
                        fontSize: 14,
                        disabled: !vm.hasUnread,
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16).copyWith(bottom: 120),
                    itemCount: vm.notifications.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final notification = vm.notifications[index];

                      return DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: notification.isRead
                              ? []
                              : [
                                  BoxShadow(
                                    color: Colors.white.withValues(alpha: .16),
                                    blurRadius: 6,
                                    spreadRadius: 3,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                        ),
                        child: ListTile(
                          onTap: () {
                            context.read<NotificationsCubit>().markAsRead(notification.uuid);
                            if (notification.isReservationNotification && notification.reservationUuid != null) {
                              _showReservationDialog(context, notification);
                            }
                          },
                          leading: AvatarWidget(
                            avatarUrl: notification.actorPhotoUrl,
                            width: 40,
                            height: 40,
                          ),
                          title: Text(
                            notification.title,
                            style: FoodlyTextStyles.labelBold,
                          ),
                          subtitle: Column(
                            spacing: 2,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(notification.message, style: FoodlyTextStyles.label).paddingTop(2),
                              Row(
                                spacing: 6,
                                children: [
                                  Icon(notification.type?.icon ?? Bootstrap.bell,
                                      size: 16, color: FoodlyThemes.primaryFoodly),
                                  Text(notification.createdAt?.timeAgo ?? '', style: FoodlyTextStyles.captionPurple),
                                ],
                              ),
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment:
                                notification.isRead ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
                            children: [
                              if (!notification.isRead)
                                Flexible(
                                  child: InkWell(
                                    onTap: () => context.read<NotificationsCubit>().markAsRead(notification.uuid),
                                    splashFactory: InkRipple.splashFactory,
                                    customBorder: const CircleBorder(),
                                    child: const Icon(Bootstrap.check2, size: 24),
                                  ),
                                ),
                              Flexible(
                                child: InkWell(
                                  onTap: () => context.read<NotificationsCubit>().deleteNotification(notification.uuid),
                                  splashFactory: InkRipple.splashFactory,
                                  customBorder: const CircleBorder(),
                                  child: const Icon(Bootstrap.trash, size: 20),
                                ).paddingRight(notification.isRead ? 2 : 0),
                              ),
                            ],
                          ),
                          contentPadding: const EdgeInsets.fromLTRB(16, 4, 14, 4),
                          tileColor: notification.isRead ? Colors.white : FoodlyThemes.primaryLighten73,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enableFeedback: !notification.isRead,
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showReservationDialog(BuildContext context, NotificationDM notification) async {
    final repo = di<ReservationRepo>();
    final dialogService = di<DialogService>();

    dialogService.showLoading();
    final result = await repo.getReservation(notification.reservationUuid!);
    dialogService.hideLoading();

    result.when(
      success: (response) {
        final reservation = response.reservation;
        if (reservation == null || !context.mounted) return;

        showDialog(
          context: context,
          builder: (ctx) {
            return Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title bar
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.08),
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Bootstrap.calendar2_event, size: 20, color: FoodlyThemes.primaryFoodly),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(S.current.reservationDetails, style: FoodlyTextStyles.actionsBodyBold),
                          ),
                          InkWell(
                            onTap: () => Navigator.pop(ctx),
                            customBorder: const CircleBorder(),
                            child: const Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(Icons.close, size: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Reservation card (without outer Card margin)
                    ManagerReservationCard(
                      reservation: reservation,
                      onConfirm: reservation.canBeActedOnByManager
                          ? () async {
                              Navigator.pop(ctx);
                              final actionResult = await repo.confirmReservation(reservation.reservationUuid!);
                              if (context.mounted) {
                                actionResult.when(
                                  success: (_) =>
                                      FoodlySnackbars.successGeneric(context, S.current.reservationConfirmed),
                                  failure: (_) =>
                                      FoodlySnackbars.errorGeneric(context, S.current.failedToConfirmReservation),
                                );
                              }
                            }
                          : null,
                      onReject: reservation.canBeActedOnByManager
                          ? () {
                              Navigator.pop(ctx);
                              _showNotesDialog(context, S.current.rejectReservation, (notes) async {
                                final actionResult =
                                    await repo.rejectReservation(reservation.reservationUuid!, managerNotes: notes);
                                if (context.mounted) {
                                  actionResult.when(
                                    success: (_) =>
                                        FoodlySnackbars.successGeneric(context, S.current.reservationRejected),
                                    failure: (_) =>
                                        FoodlySnackbars.errorGeneric(context, S.current.failedToRejectReservation),
                                  );
                                }
                              });
                            }
                          : null,
                      onCancel: reservation.isConfirmed
                          ? () {
                              Navigator.pop(ctx);
                              _showNotesDialog(context, S.current.cancelReservation, (notes) async {
                                final actionResult = await repo.managerCancelReservation(reservation.reservationUuid!,
                                    managerNotes: notes);
                                if (context.mounted) {
                                  actionResult.when(
                                    success: (_) =>
                                        FoodlySnackbars.successGeneric(context, S.current.reservationCancelled),
                                    failure: (_) =>
                                        FoodlySnackbars.errorGeneric(context, S.current.failedToCancelReservation),
                                  );
                                }
                              });
                            }
                          : null,
                      onNoShow: reservation.isConfirmed
                          ? () async {
                              Navigator.pop(ctx);
                              final actionResult = await repo.markNoShow(reservation.reservationUuid!);
                              if (context.mounted) {
                                actionResult.when(
                                  success: (_) => FoodlySnackbars.successGeneric(context, S.current.markedNoShow),
                                  failure: (_) => FoodlySnackbars.errorGeneric(context, S.current.failedToMarkNoShow),
                                );
                              }
                            }
                          : null,
                      onComplete: reservation.isConfirmed
                          ? () async {
                              Navigator.pop(ctx);
                              final actionResult = await repo.markComplete(reservation.reservationUuid!);
                              if (context.mounted) {
                                actionResult.when(
                                  success: (_) =>
                                      FoodlySnackbars.successGeneric(context, S.current.reservationCompleted),
                                  failure: (_) =>
                                      FoodlySnackbars.errorGeneric(context, S.current.failedToCompleteReservation),
                                );
                              }
                            }
                          : null,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      failure: (_) {
        if (context.mounted) {
          FoodlySnackbars.errorGeneric(context, S.current.couldNotLoadReservationDetails);
        }
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
          decoration: const InputDecoration(
            hintText: 'Add a note (optional)',
            border: OutlineInputBorder(),
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
