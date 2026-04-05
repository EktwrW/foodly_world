import 'dart:async';

import 'package:foodly_world/core/network/reservations/reservation_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/notifications/notifications_dm.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/reservations/widgets/manager_reservation_card.dart';
import 'package:foodly_world/ui/views/foodly_location_wrapper.dart';
import 'package:foodly_world/ui/views/reservations/widgets/reservation_card.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

/// Wrapper class to handle local auth (biometric), location management,
/// app lifecycle (notification polling), and incoming global handlers.
class FoodlyWrapper extends StatefulWidget {
  final Widget child;

  const FoodlyWrapper({super.key, required this.child});

  @override
  State<FoodlyWrapper> createState() => _FoodlyWrapperState();
}

class _FoodlyWrapperState extends State<FoodlyWrapper> with WidgetsBindingObserver {
  /// Guards against stacking multiple proactive reservation dialogs.
  bool _isReservationDialogShowing = false;

  /// Direct stream subscription to NotificationsCubit — avoids BlocListener
  /// context issues when showing global dialogs.
  StreamSubscription<NotificationsState>? _notificationsSubscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _subscribeToReservationNotifications();
  }

  @override
  void dispose() {
    _notificationsSubscription?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// Subscribes to NotificationsCubit state changes to detect new reservation
  /// notifications and show a proactive dialog via [rootNavigatorKey].
  void _subscribeToReservationNotifications() {
    final cubit = di<NotificationsCubit>();

    _notificationsSubscription = cubit.stream.listen((state) {
      state.maybeMap(
        loaded: (_) {
          final pending = cubit.pendingReservationNotification;
          if (pending == null || pending.reservationUuid == null) return;

          cubit.clearPendingReservationNotification();

          // Managers already get the pending-count dialog on login for
          // reservations made TO their own business.  Skip the proactive
          // dialog only for those.  If the manager also made a reservation
          // as a client at a *different* business, show it normally.
          final authService = di<AuthSessionService>();
          if (authService.userIsManager && pending.businessUuid != null) {
            final ownBusinessUuids =
                (authService.userSessionDM?.user.business ?? []).map((b) => b.uuid).toSet();
            if (ownBusinessUuids.contains(pending.businessUuid)) {
              di<Logger>().i(
                'Proactive reservation dialog: skipped for own-business notification ${pending.uuid}',
              );
              return;
            }
          }

          // Use rootNavigatorKey context — proven pattern for global dialogs.
          final navContext = rootNavigatorKey.currentContext;
          if (navContext != null) {
            di<Logger>().i('Proactive reservation dialog: showing for notification ${pending.uuid}');
            _showProactiveReservationDialog(navContext, pending);
          } else {
            di<Logger>().w('Proactive reservation dialog: rootNavigatorKey context is null');
          }
        },
        orElse: () {},
      );
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final notificationsCubit = di<NotificationsCubit>();

    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
        notificationsCubit.pausePolling();
      case AppLifecycleState.resumed:
        // Don't resume polling during biometric login — the backend is rotating
        // the token and any poll with the old token would get 401.
        if (!di<AuthSessionService>().isBiometricLoginInProgress) {
          notificationsCubit.resumePolling();
        }
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        break;
    }
  }

  /// Shows a proactive reservation dialog when a new reservation notification
  /// arrives via polling — identical layout to the one in NotificationsPage.
  void _showProactiveReservationDialog(
    BuildContext context,
    NotificationDM notification,
  ) async {
    if (_isReservationDialogShowing) return;
    _isReservationDialogShowing = true;

    final repo = di<ReservationRepo>();
    final dialogService = di<DialogService>();

    dialogService.showLoading();
    final result = await repo.getReservation(notification.reservationUuid!);
    dialogService.hideLoading();

    result.when(
      success: (response) {
        final reservation = response.reservation;
        if (reservation == null || !context.mounted) {
          _isReservationDialogShowing = false;
          return;
        }

        // Determine if current user is the reservation requester (client view)
        // or the business manager receiving the request.
        final isClientView =
            reservation.userUuid == di<AuthSessionService>().userSessionDM?.user.uuid;

        showDialog(
          context: context,
          builder: (ctx) {
            return Dialog(
              backgroundColor: reservation.isConfirmed ? Colors.white : null,
              insetPadding: const EdgeInsets.symmetric(vertical: 24, horizontal: 13),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title bar — same style as NotificationsPage
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

                    // Notification message summary
                    if (notification.title.isNotEmpty)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        color: FoodlyThemes.tertiaryFoodly.withValues(alpha: 0.08),
                        child: Row(
                          children: [
                            AvatarWidget(
                              avatarUrl: notification.actorPhotoUrl,
                              width: 28,
                              height: 28,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                notification.message,
                                style: FoodlyTextStyles.caption,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),

                    // Reservation card — client or manager view
                    if (isClientView)
                      ReservationCard(
                        reservation: reservation,
                        returnOnlyContent: true,
                      )
                    else
                      ManagerReservationCard(
                        reservation: reservation,
                        returnOnlyContent: true,
                        onConfirm: reservation.canBeActedOnByManager
                            ? () async {
                                Navigator.pop(ctx);
                                final actionResult =
                                    await repo.confirmReservation(reservation.reservationUuid!);
                                if (context.mounted) {
                                  actionResult.when(
                                    success: (_) => FoodlySnackbars.successGeneric(
                                        context, S.current.reservationConfirmed),
                                    failure: (_) => FoodlySnackbars.errorGeneric(
                                        context, S.current.failedToConfirmReservation),
                                  );
                                }
                              }
                            : null,
                        onReject: reservation.canBeActedOnByManager
                            ? () {
                                Navigator.pop(ctx);
                                _showNotesDialog(context, S.current.rejectReservation, (notes) async {
                                  final actionResult = await repo.rejectReservation(
                                      reservation.reservationUuid!,
                                      managerNotes: notes);
                                  if (context.mounted) {
                                    actionResult.when(
                                      success: (_) => FoodlySnackbars.successGeneric(
                                          context, S.current.reservationRejected),
                                      failure: (_) => FoodlySnackbars.errorGeneric(
                                          context, S.current.failedToRejectReservation),
                                    );
                                  }
                                });
                              }
                            : null,
                        onCancel: reservation.isConfirmed
                            ? () {
                                Navigator.pop(ctx);
                                _showNotesDialog(context, S.current.cancelReservation, (notes) async {
                                  final actionResult = await repo.managerCancelReservation(
                                      reservation.reservationUuid!,
                                      managerNotes: notes);
                                  if (context.mounted) {
                                    actionResult.when(
                                      success: (_) => FoodlySnackbars.successGeneric(
                                          context, S.current.reservationCancelled),
                                      failure: (_) => FoodlySnackbars.errorGeneric(
                                          context, S.current.failedToCancelReservation),
                                    );
                                  }
                                });
                              }
                            : null,
                        onNoShow: reservation.isConfirmed
                            ? () async {
                                Navigator.pop(ctx);
                                final actionResult =
                                    await repo.markNoShow(reservation.reservationUuid!);
                                if (context.mounted) {
                                  actionResult.when(
                                    success: (_) =>
                                        FoodlySnackbars.successGeneric(context, S.current.markedNoShow),
                                    failure: (_) =>
                                        FoodlySnackbars.errorGeneric(context, S.current.failedToMarkNoShow),
                                  );
                                }
                              }
                            : null,
                        onComplete: reservation.isConfirmed
                            ? () async {
                                Navigator.pop(ctx);
                                final actionResult =
                                    await repo.markComplete(reservation.reservationUuid!);
                                if (context.mounted) {
                                  actionResult.when(
                                    success: (_) => FoodlySnackbars.successGeneric(
                                        context, S.current.reservationCompleted),
                                    failure: (_) => FoodlySnackbars.errorGeneric(
                                        context, S.current.failedToCompleteReservation),
                                  );
                                }
                              }
                            : null,
                      ).paddingAll(13),
                  ],
                ),
              ),
            );
          },
        ).then((_) => _isReservationDialogShowing = false);

        // Mark the notification as read automatically
        di<NotificationsCubit>().markAsRead(notification.uuid);
      },
      failure: (_) {
        _isReservationDialogShowing = false;
        final navContext = rootNavigatorKey.currentContext;
        if (navContext != null && navContext.mounted) {
          FoodlySnackbars.errorGeneric(navContext, S.current.couldNotLoadReservationDetails);
        }
      },
    );
  }

  /// Notes dialog for manager reject/cancel actions (same pattern as NotificationsPage).
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

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        final router = di<AppRouter>();

        // Shell routes are blocked by their own PopScope(canPop: false).
        // For other routes (categories, visit-business, etc.), navigate back.
        if (!router.isOnShellRoute) {
          router.goBackToLastRoute();
        }
      },
      child: Scaffold(
        body: BlocConsumer<LocalAuthCubit, LocalAuthState>(
          listener: (context, state) {
            final authSessionService = di<AuthSessionService>();
            final dialogService = di<DialogService>();

            state.whenOrNull(
              needAuthentication: (localAuthDTO) async {
                // Set the flag BEFORE the biometric dialog opens so that the
                // lifecycle observer (resumed) won't resume notification polling
                // while the backend is about to rotate the token.
                authSessionService.setBiometricLoginInProgress(true);
                dialogService.showLoading();
                await context.read<LocalAuthCubit>().authenticate();
                // Hide loading AFTER the next frame so the router has time
                // to rebuild with the destination page (home). Without this,
                // the login page flashes briefly between overlay removal and
                // the GoRouter navigation triggered by FingerprintButtonLogin.
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  dialogService.hideLoading();
                });
              },
              loaded: (localAuthDTO) async {
                dialogService.hideLoading();
                if (!localAuthDTO.authenticated) {
                  await authSessionService.updateForceToLogin(true);
                  if (context.mounted) authSessionService.exit(context);
                  FlutterNativeSplash.remove();
                }
              },
              authenticated: (localAuthDTO) async {
                // Don't hideLoading() here — the needAuthentication handler
                // defers it to the next frame so the loading overlay stays
                // visible until GoRouter has rebuilt with the destination page.
                await authSessionService.updateForceToLogin(false);
                if (context.mounted) {
                  context.read<RootBloc>().add(RootEvent.cacheAuthSession(userSessionDM: localAuthDTO.userSessionDM));
                }
                di<Logger>().t('User authenticated: ${localAuthDTO.userSessionDM.user.uuid}', time: DateTime.now());
              },
              error: (msg, localAuthDTO) async {
                dialogService.hideLoading();
                // Always dismiss the native splash in the error path.  If the
                // token is expired (401) FoodlyLocationWrapper will be
                // unmounted before it can call FlutterNativeSplash.remove(),
                // which would leave the splash frozen on screen forever.
                FlutterNativeSplash.remove();
                await authSessionService.updateForceToLogin(true);
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  try {
                    if (context.mounted) authSessionService.exit(context);
                  } catch (e) {
                    di<Logger>().e('Error handling auth state in Foodly Wrapper: $e');
                  }
                });
              },
            );
          },
          builder: (context, state) => FoodlyLocationWrapper(childWidget: widget.child),
        ),
      ),
    );
  }
}
