import 'package:foodly_world/generated/l10n.dart' show S;

/// Converts raw backend analytics keys into human-readable, localized labels.
///
/// Backend sends event keys like `business_open`, `cta_clicked`, etc.
/// This helper maps them to user-friendly text appropriate for business managers.
class AnalyticsLabelHelper {
  AnalyticsLabelHelper._();

  /// Humanizes a funnel step key (e.g. `business_open` → "Business views").
  static String funnelStep(String raw) {
    final key = raw.toLowerCase().trim();
    return _funnelStepLabels[key] ?? _fallbackHumanize(raw);
  }

  /// Humanizes an event type key (e.g. `cta_whatsapp` → "WhatsApp contact").
  static String eventType(String raw) {
    final key = raw.toLowerCase().trim();
    return _eventTypeLabels[key] ?? _fallbackHumanize(raw);
  }

  /// Humanizes a reservation status (e.g. `no_show` → "No show").
  static String reservationStatus(String raw) {
    final key = raw.toLowerCase().trim();
    return _reservationStatusLabels[key] ?? _fallbackHumanize(raw);
  }

  /// Lazily-built maps that use S.current so locale is resolved at call time.

  static Map<String, String> get _funnelStepLabels => {
        // Restaurant flavour funnel (business-overview).
        'business_open': S.current.analyticsLabelBusinessOpen,
        'cta_clicked': S.current.analyticsLabelCtaClicked,
        'reservation_started': S.current.analyticsLabelReservationStarted,
        'reservation_submitted': S.current.analyticsLabelReservationSubmitted,
        'reservation_succeeded': S.current.analyticsLabelReservationSucceeded,
        // Catering & chefs flavour funnel (service-overview). Step keys
        // arrive without the `service.` prefix in the BE response — they're
        // bare names inside a `funnel.steps` map.
        'profile_view': S.current.analyticsLabelProfileView,
        'package_view': S.current.analyticsLabelPackageView,
        'package_inquiry': S.current.analyticsLabelPackageInquiry,
        'booking_started': S.current.analyticsLabelBookingStarted,
        'booking_submitted': S.current.analyticsLabelBookingSubmitted,
        'booking_succeeded': S.current.analyticsLabelBookingSucceeded,
      };

  static Map<String, String> get _eventTypeLabels => {
        'business_open': S.current.analyticsLabelBusinessOpen,
        'cta_clicked': S.current.analyticsLabelCtaClicked,
        'cta_whatsapp': S.current.analyticsLabelCtaWhatsapp,
        'cta_phone': S.current.analyticsLabelCtaPhone,
        'cta_website': S.current.analyticsLabelCtaWebsite,
        'cta_directions': S.current.analyticsLabelCtaDirections,
        'cta_instagram': S.current.analyticsLabelCtaInstagram,
        'search_result': S.current.analyticsLabelSearchResult,
        'search.result': S.current.analyticsLabelSearchResult,
        'reservation_started': S.current.analyticsLabelReservationStarted,
        'reservation_submitted': S.current.analyticsLabelReservationSubmitted,
        'reservation_succeeded': S.current.analyticsLabelReservationSucceeded,
        'favorite_added': S.current.analyticsLabelFavoriteAdded,
        'favorite_removed': S.current.analyticsLabelFavoriteRemoved,
        'review_created': S.current.analyticsLabelReviewCreated,
        'menu_viewed': S.current.analyticsLabelMenuViewed,
        'share': S.current.analyticsLabelShare,
      };

  static Map<String, String> get _reservationStatusLabels => {
        'confirmed': S.current.analyticsStatusConfirmed,
        'completed': S.current.analyticsStatusCompleted,
        'pending': S.current.analyticsStatusPending,
        'cancelled': S.current.analyticsStatusCancelled,
        'rejected': S.current.analyticsStatusRejected,
        'no_show': S.current.analyticsStatusNoShow,
      };

  /// Fallback: replaces underscores/dots with spaces and capitalizes first letter.
  static String _fallbackHumanize(String raw) {
    if (raw.isEmpty) return raw;
    final spaced = raw.replaceAll(RegExp(r'[_.]'), ' ').trim();
    return spaced[0].toUpperCase() + spaced.substring(1);
  }
}
