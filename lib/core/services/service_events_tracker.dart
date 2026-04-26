import 'package:foodly_world/core/services/event_tracking_service.dart';

/// Typed wrapper around [EventTrackingService] for the Catering & Chefs
/// vertical analytics events Mateo defined for the data warehouse.
///
/// We funnel all `service.*` events through here for three reasons:
///
///   1. **Single source of truth for event names.** If Mateo renames
///      `service.package_inquiry` tomorrow we change one constant, not 8
///      grep-and-replace hits across cubits and widgets.
///   2. **Consistent shape.** Every event carries `targetType: 'service'`
///      plus a stable `sourceModule`, so the BI side gets uniform rows
///      without having to special-case payload differences.
///   3. **Cheap call sites.** Cubits and widgets call
///      `di<ServiceEventsTracker>().profileView(uuid)` instead of the
///      verbose 6-named-arg `track(...)` invocation.
///
/// Source modules are passed in by the call site so we can later split
/// "card clicks" from "deep-link CTAs" without changing the event name.
class ServiceEventsTracker {
  final EventTrackingService _events;

  // Event name constants — keep these in lock-step with Mateo's BigQuery
  // dashboards. If you rename one, ping #data-eng before merging.
  static const _profileView = 'service.profile_view';
  static const _packageView = 'service.package_view';
  static const _packageInquiry = 'service.package_inquiry';
  static const _bookingStarted = 'service.booking_started';
  static const _bookingSubmitted = 'service.booking_submitted';
  static const _bookingSucceeded = 'service.booking_succeeded';
  static const _messageSent = 'service.message_sent';
  static const _availabilityChecked = 'service.availability_checked';

  ServiceEventsTracker(this._events);

  /// User opened a chef/catering professional profile (visit-service-packages page).
  void profileView({required String businessUuid, required String sourceModule}) {
    _events.track(
      _profileView,
      sourceModule,
      targetType: 'business',
      targetUuid: businessUuid,
    );
  }

  /// A package card became visible long enough to count as "viewed"
  /// (>= 50 % visible for ≥1 s — gating happens at the call site).
  ///
  /// [position] is the index inside the package list, 0-based, so Mateo
  /// can compute "average position of converting packages".
  void packageView({
    required String packageUuid,
    required String businessUuid,
    required String sourceModule,
    int? position,
  }) {
    _events.track(
      _packageView,
      sourceModule,
      targetType: 'service_package',
      targetUuid: packageUuid,
      position: position,
      data: {'business_uuid': businessUuid},
    );
  }

  /// User tapped "Solicitar servicio" / "Cotizar" on a package card.
  void packageInquiry({
    required String packageUuid,
    required String businessUuid,
    required String sourceModule,
  }) {
    _events.track(
      _packageInquiry,
      sourceModule,
      targetType: 'service_package',
      targetUuid: packageUuid,
      data: {'business_uuid': businessUuid},
    );
  }

  /// Booking request sheet was opened (form started).
  void bookingStarted({
    required String packageUuid,
    required String businessUuid,
    required String sourceModule,
  }) {
    _events.track(
      _bookingStarted,
      sourceModule,
      targetType: 'service_package',
      targetUuid: packageUuid,
      data: {'business_uuid': businessUuid},
    );
  }

  /// Booking form was submitted successfully (BE accepted the request).
  void bookingSubmitted({
    required String reservationUuid,
    required String packageUuid,
    required String businessUuid,
    required String sourceModule,
    int? guestCount,
  }) {
    _events.track(
      _bookingSubmitted,
      sourceModule,
      targetType: 'reservation',
      targetUuid: reservationUuid,
      data: {
        'business_uuid': businessUuid,
        'service_package_uuid': packageUuid,
        if (guestCount != null) 'guest_count': guestCount,
      },
    );
  }

  /// Provider confirmed the booking (status went to confirmed). Triggered
  /// when the customer's NotificationsCubit observes a service-booking
  /// reservationConfirmed notification.
  void bookingSucceeded({
    required String reservationUuid,
    required String businessUuid,
    required String sourceModule,
  }) {
    _events.track(
      _bookingSucceeded,
      sourceModule,
      targetType: 'reservation',
      targetUuid: reservationUuid,
      data: {'business_uuid': businessUuid},
    );
  }

  /// User sent a message in the booking negotiation thread.
  void messageSent({
    required String reservationUuid,
    required String sourceModule,
  }) {
    _events.track(
      _messageSent,
      sourceModule,
      targetType: 'reservation',
      targetUuid: reservationUuid,
    );
  }

  /// User polled provider availability (date picker opened a calendar
  /// month, or programmatic check from the booking sheet).
  void availabilityChecked({
    required String businessUuid,
    required String sourceModule,
    String? month,
  }) {
    _events.track(
      _availabilityChecked,
      sourceModule,
      targetType: 'business',
      targetUuid: businessUuid,
      data: {if (month != null) 'month': month},
    );
  }
}
