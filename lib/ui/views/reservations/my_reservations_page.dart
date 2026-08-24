import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/reservations/reservation_dm.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart' show UIDecorations;
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart'
    show CustomRoundedNeumorphicButton;
import 'package:foodly_world/ui/shared_widgets/shimmer/home_shimmer_widgets.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/reservations/cubit/my_reservations_cubit.dart';
import 'package:foodly_world/ui/views/reservations/widgets/reservation_card.dart';
import 'package:foodly_world/ui/views/reservations/widgets/reservation_messages_sheet.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;

class MyReservationsPage extends StatelessWidget {
  const MyReservationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Intentionally NOT calling `..fetchReservations()` here. The first
      // fetch is triggered by [_BookingTypeFilter] AFTER it has restored the
      // persisted booking-type filter from SharedPreferences. Doing it here
      // would force a wasted "no-filter" fetch on every cold start when the
      // user has a persisted filter (e.g. they last viewed only `service`),
      // and would briefly flash the wrong list before the second fetch
      // landed. [_ReservationsList] now treats `initial` as a loading state
      // so the shimmer shows while the filter is being restored.
      create: (_) => MyReservationsCubit(
        reservationRepo: di(),
        logger: di(),
      ),
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
              padding: const EdgeInsets.all(6),
            ).paddingSymmetric(vertical: 10, horizontal: 10),
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

/// Top filter that splits reservations between table reservations and service
/// requests. Rendered as a multi-select [SegmentedButton] matching the app's
/// segmented filter pattern (period_selector, business_sort_selector, the
/// radius selector inside CategoriesPage).
///
/// Two segments — `BookingType.table` and `BookingType.service`. Selection is
/// MULTI and the empty set is a legitimate state representing "no filter
/// active": both types are shown and no segment is highlighted, which mirrors
/// the cubit's pre-existing `bookingTypeFilter == null` semantic.
///
/// ## Mapping to the cubit
/// The cubit's `BookingType? bookingTypeFilter` field stays untouched; we
/// translate the local [Set] on the way in / out:
///   - `{}`                → `null`  (no filter — initial / "ver todas")
///   - `{table}`           → `BookingType.table`
///   - `{service}`         → `BookingType.service`
///   - `{table, service}`  → `null`  (data-equivalent to empty: BE returns
///                                    both. Visually distinguished — the
///                                    user explicitly opted in to both,
///                                    rather than not filtering at all.)
///
/// Both `{}` and `{table, service}` produce the same query (`null`), and
/// that's correct: they're two valid UI affordances for "show both types".
/// We preserve them as separate UI states because they look different and
/// represent slightly different intents (passive "I haven't filtered" vs
/// active "I want both").
///
/// ## Empty selection
/// `multiSelectionEnabled: true` + `emptySelectionAllowed: true`. The user
/// can deselect down to `{}` and that is the resting "no filter" state.
///
/// ## Persistence
/// Saves the user's last selection to [LocalStorageService] (SharedPreferences
/// under the hood) so the choice survives across app restarts. The page's
/// [BlocProvider] intentionally does NOT auto-fetch — this widget owns the
/// initial fetch, dispatched after the persisted filter has been read in
/// [initState]. This avoids a wasted no-filter round-trip on cold start
/// when the user previously chose a single type.
class _BookingTypeFilter extends StatefulWidget {
  const _BookingTypeFilter();

  @override
  State<_BookingTypeFilter> createState() => _BookingTypeFilterState();
}

class _BookingTypeFilterState extends State<_BookingTypeFilter> {
  /// SharedPreferences key. Namespaced to this page so other features can't
  /// collide. If we ever change the encoding, bump the suffix.
  static const _kStorageKey = 'my_reservations.booking_type_filter.v1';

  /// Encoded values stored in prefs. Four distinct UI states; `none` and
  /// `both` map to the same cubit filter (`null`) but are visually different
  /// so we preserve them separately.
  static const _kEncodedNone = 'none';
  static const _kEncodedTable = 'table';
  static const _kEncodedService = 'service';
  static const _kEncodedBoth = 'both';

  /// First-run / fallback state: empty set ⇒ no filter ⇒ BE returns both
  /// types ⇒ the page shows "todas las reservas" with no segment highlighted.
  static const Set<BookingType> _defaultSelection = <BookingType>{};

  Set<BookingType> _selected = _defaultSelection;

  @override
  void initState() {
    super.initState();
    _restoreAndFetch();
  }

  /// Reads the persisted filter from [LocalStorageService], applies it to
  /// local state, and dispatches the FIRST cubit fetch with the right
  /// filter already set. This is the single entry point for the initial
  /// load — see the page-level [BlocProvider] doc.
  Future<void> _restoreAndFetch() async {
    Set<BookingType> restored;
    try {
      final raw = await di<LocalStorageService>().getString(_kStorageKey);
      restored = _decode(raw);
    } catch (_) {
      // Persistence read failures must NEVER block the screen. Fall back
      // to the safe default (no filter, everything visible) and continue.
      restored = _defaultSelection;
    }
    if (!mounted) return;
    setState(() => _selected = restored);
    context.read<MyReservationsCubit>().setBookingTypeFilter(_toCubitFilter(restored));
  }

  /// `Set<BookingType>` → cubit's nullable single field.
  /// Single element ⇒ that element. Empty OR both ⇒ `null` (= no
  /// `booking_type` query param, BE returns both).
  BookingType? _toCubitFilter(Set<BookingType> set) {
    if (set.length == 1) return set.first;
    return null;
  }

  Set<BookingType> _decode(String? raw) {
    switch (raw) {
      case _kEncodedTable:
        return const {BookingType.table};
      case _kEncodedService:
        return const {BookingType.service};
      case _kEncodedBoth:
        return const {BookingType.table, BookingType.service};
      case _kEncodedNone:
        return _defaultSelection;
      default:
        // Unknown / null → fall back to default. Covers first-run (no key
        // stored yet) and any forward-incompatible value left over from a
        // previous schema.
        return _defaultSelection;
    }
  }

  String _encode(Set<BookingType> set) {
    if (set.isEmpty) return _kEncodedNone;
    if (set.length == 2) return _kEncodedBoth;
    return set.first == BookingType.table ? _kEncodedTable : _kEncodedService;
  }

  /// Fire-and-forget. We deliberately do NOT await — UI must respond
  /// instantly, and a failed write only means the user sees the default
  /// next session, which is acceptable.
  void _persist(Set<BookingType> set) {
    di<LocalStorageService>().saveString(_kStorageKey, _encode(set)).catchError((_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      // SizedBox forces the SegmentedButton to span the available row width
      // so the two segments split the space evenly. Without it the widget
      // sizes itself to its label content and leaves a gap on the right.
      child: SizedBox(
        width: double.infinity,
        child: SegmentedButton<BookingType>(
          multiSelectionEnabled: true,
          // Empty selection is a valid resting state (= "no filter"). Both
          // {} and {table, service} produce the same data, so the user can
          // either deselect everything or select both — whichever feels
          // more natural to express "show all".
          emptySelectionAllowed: true,
          showSelectedIcon: false,
          segments: [
            ButtonSegment<BookingType>(
              value: BookingType.table,
              label: Text(
                S.current.tableReservations,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11.5),
              ),
            ),
            ButtonSegment<BookingType>(
              value: BookingType.service,
              label: Text(
                S.current.serviceRequests,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11.5),
              ),
            ),
          ],
          selected: _selected,
          onSelectionChanged: (selection) {
            setState(() => _selected = selection);
            _persist(selection);
            context.read<MyReservationsCubit>().setBookingTypeFilter(_toCubitFilter(selection));
          },
          style: ButtonStyle(
            side: const WidgetStatePropertyAll(BorderSide(color: FoodlyThemes.primaryFoodly)),
            foregroundColor: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.selected) ? Colors.white : FoodlyThemes.primaryFoodly,
            ),
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return FoodlyThemes.primaryFoodly.withValues(alpha: .7);
              }
              return null;
            }),
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            visualDensity: VisualDensity.compact,
          ),
        ),
      ),
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

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
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
          // `initial` is shown for a brief moment on cold start while
          // _BookingTypeFilter restores the persisted filter from prefs
          // and dispatches the first fetch. Treat it as a loading state
          // so the user sees the shimmer instead of an empty page.
          initial: (_) => const ReservationsShimmer(),
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
                      onApproveQuote:
                          reservation.canApproveQuote ? () => _confirmApproveQuote(context, cubit, reservation) : null,
                      onRejectQuote:
                          reservation.canRejectQuote ? () => _confirmRejectQuote(context, cubit, reservation) : null,
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
    // Switched from generic AlertDialog → DialogService.showCustomDialog with
    // a custom-styled widget that matches PasswordConfirmationDialog and
    // LogoutDialog (NeumorphicColors.background, CustomNeumorphicButtons,
    // FoodlyTextStyles). Closure captures `context` + `cubit` so the dialog
    // stays decoupled from the cubit — see comment in _ApproveQuoteDialog.
    di<DialogService>().showCustomDialog(
      _CancelReservationDialog(
        onConfirm: () async {
          final success = await cubit.cancelReservation(reservation.reservationUuid!);
          if (context.mounted) {
            FoodlySnackbars.successGeneric(
              context,
              success ? S.current.reservationCancelled : S.current.failedToCancelReservation,
            );
          }
        },
      ),
      0,
    );
  }

  void _confirmRejectQuote(BuildContext context, MyReservationsCubit cubit, ReservationDM reservation) {
    di<DialogService>().showCustomDialog(
      _RejectQuoteDialog(
        reservation: reservation,
        onSubmit: (reason) async {
          // _RejectQuoteDialog already pops itself before invoking us, so
          // here we just dispatch the action and surface the result.
          final success = await cubit.rejectQuote(
            reservation.reservationUuid!,
            rejectionReason: reason,
          );
          if (context.mounted) {
            FoodlySnackbars.successGeneric(
              context,
              success ? S.current.quoteRejected : S.current.somethingWentWrong,
            );
          }
        },
      ),
      0,
    );
  }

  void _confirmApproveQuote(BuildContext context, MyReservationsCubit cubit, ReservationDM reservation) {
    di<DialogService>().showCustomDialog(
      _ApproveQuoteDialog(
        reservation: reservation,
        onConfirm: () async {
          final success = await cubit.approveQuote(reservation.reservationUuid!);
          if (context.mounted) {
            FoodlySnackbars.successGeneric(
              context,
              success ? S.current.quoteApproved : S.current.somethingWentWrong,
            );
          }
        },
      ),
      0,
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Reservation-action dialogs.
//
// All three follow the same visual contract (calque of PasswordConfirmationDialog):
//   - Outer FadeIn wrapping a Container with NeumorphicColors.background, 12-radius
//     corners, padding (20, 24, 20, 16), and a horizontal margin equal to
//     UIDimens.SCREEN_PADDING_MOB. The DialogService wraps this in a transparent
//     Dialog with insetPadding: zero, so the margin we set IS the inset.
//   - Top icon → title (FoodlyTextStyles.confirmationTextPrimary) → body text /
//     custom content → Row of two CustomNeumorphicButtons (Cancel + action).
//
// They each take an `onConfirm` / `onSubmit` callback and pop themselves before
// invoking it, so the caller stays focused on dispatching the cubit action +
// surfacing the result snackbar. See the closure-vs-BlocProvider.value rationale
// in the page-level comments where these are invoked: closure is the right
// trade-off for fire-and-forget actions whose progress/error UI lives on the
// page, not inside the dialog.
// ─────────────────────────────────────────────────────────────────────────────

/// Outer chrome shared by every reservation-action dialog. Centralises the
/// neumorphic-background container so styling drift stays impossible.
class _DialogShell extends StatelessWidget {
  final Widget child;

  const _DialogShell({required this.child});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 250),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ui.NeumorphicColors.background,
        ),
        child: child,
      ),
    );
  }
}

/// Cancel-or-confirm pair of buttons used at the bottom of every dialog.
/// `confirmIsDestructive: true` paints the confirm button in [FoodlyThemes.error]
/// for actions that can't be undone (cancel reservation, reject quote).
class _DialogActionButtons extends StatelessWidget {
  final String confirmLabel;
  final VoidCallback onCancel;
  final VoidCallback? onConfirm;
  final bool confirmIsDestructive;

  const _DialogActionButtons({
    required this.confirmLabel,
    required this.onCancel,
    required this.onConfirm,
    this.confirmIsDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 13,
      children: [
        Expanded(
          flex: 3,
          child: CustomNeumorphicButton(
            text: S.current.close,
            shape: ui.NeumorphicShape.concave,
            type: confirmIsDestructive ? CustomNeumorphicBtnType.outlined : CustomNeumorphicBtnType.tertiary,
            fontSize: 13,
            padding: const EdgeInsets.symmetric(vertical: 8),
            disabled: false,
            onPressed: onCancel,
            margin: EdgeInsets.zero,
          ),
        ),
        Expanded(
          flex: 4,
          child: CustomNeumorphicButton(
            text: confirmLabel,
            // Outlined + error color for destructive confirmations so
            // `cancel reservation` and `reject quote` read clearly as
            // last-step actions. Approve uses the primary style.
            type: confirmIsDestructive ? CustomNeumorphicBtnType.outlined : CustomNeumorphicBtnType.primary,
            foregroundColor: confirmIsDestructive ? FoodlyThemes.error : null,
            fontSize: 13,
            padding: const EdgeInsets.symmetric(vertical: 8),
            disabled: onConfirm == null,
            onPressed: onConfirm, margin: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }
}

/// Confirmation dialog for cancelling a reservation (table or service).
/// Cancel-by-customer is allowed while pending / quoted / confirmed —
/// see ReservationDM.canBeCancelledByCustomer.
class _CancelReservationDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const _CancelReservationDialog({required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return _DialogShell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Bootstrap.calendar_x, size: 48, color: FoodlyThemes.error),
          const SizedBox(height: 12),
          Text(
            S.current.cancelReservation,
            textAlign: TextAlign.center,
            style: FoodlyTextStyles.confirmationTextPrimary,
          ),
          const SizedBox(height: 12),
          Text(
            S.current.areYouSureCancelReservation,
            textAlign: TextAlign.center,
            style: FoodlyTextStyles.caption,
          ),
          const SizedBox(height: 24),
          _DialogActionButtons(
            confirmLabel: S.current.yesCancel,
            confirmIsDestructive: true,
            onCancel: () => Navigator.of(context).pop(),
            onConfirm: () {
              // Pop FIRST, then run the action. The list keeps showing
              // the row until the cubit emits `loading`, at which point
              // the page-level shimmer takes over — same flow as before.
              Navigator.of(context).pop();
              onConfirm();
            },
          ),
        ],
      ),
    );
  }
}

/// Confirmation dialog for approving the chef/catering quote on a service
/// booking. Approve flips the reservation to `confirmed` and is what
/// service.booking_succeeded fires off (see MyReservationsCubit).
class _ApproveQuoteDialog extends StatelessWidget {
  final ReservationDM reservation;
  final VoidCallback onConfirm;

  const _ApproveQuoteDialog({
    required this.reservation,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    // Customer-side: derive the currency from the business country attached
    // to the reservation, NOT from the manager's auth session. See
    // ReservationDM.businessCountry doc / ReservationResource.business_country.
    final currency = reservation.businessCountry?.currencySymbol ?? '\$';

    return _DialogShell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Icon(Bootstrap.check_circle, size: 48, color: FoodlyThemes.primaryFoodly),
          ),
          const SizedBox(height: 12),
          Text(
            S.current.confirmApproveQuote,
            textAlign: TextAlign.center,
            style: FoodlyTextStyles.confirmationTextPrimary,
          ).paddingHorizontal(8),
          const SizedBox(height: 12),
          Text(
            S.current.confirmApproveQuoteMessage,
            textAlign: TextAlign.center,
            style: FoodlyTextStyles.caption,
          ),
          if (reservation.hasQuote) ...[
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${S.current.quotedAmount}: $currency${reservation.quotedAmount!.toStringAsFixed(2)}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w600, color: FoodlyThemes.primaryFoodly),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              S.current.paymentOffPlatform,
              textAlign: TextAlign.center,
              style: FoodlyTextStyles.caption.copyWith(color: Colors.grey.shade600),
            ),
          ],
          const SizedBox(height: 20),
          _DialogActionButtons(
            confirmLabel: S.current.approveQuote,
            onCancel: () => Navigator.of(context).pop(),
            onConfirm: () {
              Navigator.of(context).pop();
              onConfirm();
            },
          ),
        ],
      ),
    );
  }
}

/// Confirmation dialog for rejecting a quote. Collects an optional
/// `rejection_reason` (<= 500 chars) the business side will see appended
/// to manager_notes. Reject is a terminal action — the reservation moves
/// to STATUS_REJECTED and cannot be re-quoted without a new booking request.
class _RejectQuoteDialog extends StatefulWidget {
  final ReservationDM reservation;
  final ValueChanged<String?> onSubmit;

  const _RejectQuoteDialog({
    required this.reservation,
    required this.onSubmit,
  });

  @override
  State<_RejectQuoteDialog> createState() => _RejectQuoteDialogState();
}

class _RejectQuoteDialogState extends State<_RejectQuoteDialog> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final reason = _controller.text.trim();
    Navigator.of(context).pop();
    widget.onSubmit(reason.isEmpty ? null : reason);
  }

  @override
  Widget build(BuildContext context) {
    // See the same rationale on _ApproveQuoteDialog — currency is the
    // business's, not the auth user's.
    final currency = widget.reservation.businessCountry?.currencySymbol ?? '\$';

    return _DialogShell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Icon(Bootstrap.x_circle, size: 48, color: FoodlyThemes.error),
          ),
          const SizedBox(height: 12),
          Text(
            S.current.confirmRejectQuote,
            textAlign: TextAlign.center,
            style: FoodlyTextStyles.confirmationTextPrimary,
          ).paddingHorizontal(8),
          const SizedBox(height: 12),
          Text(
            S.current.confirmRejectQuoteMessage,
            textAlign: TextAlign.center,
            style: FoodlyTextStyles.caption,
          ),
          if (widget.reservation.hasQuote) ...[
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: FoodlyThemes.error.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${S.current.quotedAmount}: $currency${widget.reservation.quotedAmount!.toStringAsFixed(2)}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w600, color: FoodlyThemes.error),
              ),
            ),
          ],
          const SizedBox(height: 14),
          TextField(
            controller: _controller,
            maxLines: 3,
            maxLength: 500,
            textInputAction: TextInputAction.newline,
            decoration: InputDecoration(
              labelText: S.current.rejectionReasonOptional,
              hintText: S.current.rejectionReasonHint,
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
          ),
          const SizedBox(height: 8),
          _DialogActionButtons(
            confirmLabel: S.current.rejectQuote,
            confirmIsDestructive: true,
            onCancel: () => Navigator.of(context).pop(),
            onConfirm: _submit,
          ),
        ],
      ),
    );
  }
}
