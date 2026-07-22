import 'package:foodly_world/data_models/analytics/business_overview_dm.dart'
    show BreakdownItemDM, DailyPointDM, FunnelStepDM, parseBreakdownMapOrList, parseFunnelSteps;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_overview_dm.freezed.dart';
part 'service_overview_dm.g.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Catering & Chefs analytics — service-overview shape
//
// Backed by `GET /analytics/service-overview` on Mateo's NLP service
// (Cloud Run, europe-west1). Verified against the live endpoint on
// 2026-04-28 with the catering test business (uuid 73fc89f0-...). Field
// names below reflect the ACTUAL response, not the prior deduction —
// where they differ from the convention you'd guess from business-overview,
// the divergence is documented at the type that owns the field.
//
// ## What we reuse from business_overview_dm.dart
//
// `FunnelStepDM`, `DailyPointDM`, `BreakdownItemDM` and the converters
// `parseFunnelSteps` / `parseBreakdownMapOrList` are shape-agnostic — they
// handle the BE quirks (steps coming as a Map, breakdowns being either a
// Map or a List) regardless of which vertical they describe. Single source
// of truth for those primitives stays in business_overview_dm.dart.
// `parseEventTypes` is NOT reused: service-overview's breakdowns don't
// include a top_event_types field.
// ─────────────────────────────────────────────────────────────────────────────

/// Top-level response wrapper for the service-overview endpoint.
///
/// Unlike business-overview's wrapper (which only exposes `data`), this one
/// also includes a `success: bool` at the top level. The current
/// `BusinessOverviewResponseDM` silently drops `success` from its payload —
/// here we model it explicitly so consumers can check the flag if needed.
@freezed
abstract class ServiceOverviewResponseDM with _$ServiceOverviewResponseDM {
  const factory ServiceOverviewResponseDM({
    @Default(false) bool success,
    ServiceOverviewDataDM? data,
  }) = _ServiceOverviewResponseDM;

  factory ServiceOverviewResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ServiceOverviewResponseDMFromJson(json);
}

@freezed
abstract class ServiceOverviewDataDM with _$ServiceOverviewDataDM {
  const factory ServiceOverviewDataDM({
    AnalyticsScopeDM? scope,
    ServiceKpisDM? kpis,
    ServiceFunnelDM? funnel,
    ServiceDailySeriesDM? series,
    ServiceBreakdownsDM? breakdowns,
    AnalyticsMetaDM? meta,
  }) = _ServiceOverviewDataDM;

  factory ServiceOverviewDataDM.fromJson(Map<String, dynamic> json) =>
      _$ServiceOverviewDataDMFromJson(json);
}

// ─── Scope (shared shape across both overviews) ───────────────────────────

/// Identifies what the analytics window covers — the time period and the
/// list of businesses included. The BE returns a single business when the
/// query filters by `business_uuid`, multiple when filtered by `owner_user_id`.
///
/// Generic name (no `Service` prefix) so business-overview can reuse it
/// later if its DM is updated to model `scope` properly.
@freezed
abstract class AnalyticsScopeDM with _$AnalyticsScopeDM {
  const factory AnalyticsScopeDM({
    AnalyticsPeriodDM? period,
    @Default([]) List<AnalyticsBusinessRefDM> businesses,
  }) = _AnalyticsScopeDM;

  factory AnalyticsScopeDM.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsScopeDMFromJson(json);
}

@freezed
abstract class AnalyticsPeriodDM with _$AnalyticsPeriodDM {
  const factory AnalyticsPeriodDM({
    @Default(30) int days,
    @Default('') String start,
    @Default('') String end,
  }) = _AnalyticsPeriodDM;

  factory AnalyticsPeriodDM.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsPeriodDMFromJson(json);
}

/// Lightweight business identifier returned inside `scope.businesses`.
/// Not a full [BusinessDM] — the analytics endpoint only echoes id, uuid
/// and name, not the rich business profile.
@freezed
abstract class AnalyticsBusinessRefDM with _$AnalyticsBusinessRefDM {
  const factory AnalyticsBusinessRefDM({
    @Default(0) int id,
    @JsonKey(name: 'business_uuid') @Default('') String businessUuid,
    @JsonKey(name: 'business_name') String? businessName,
  }) = _AnalyticsBusinessRefDM;

  factory AnalyticsBusinessRefDM.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsBusinessRefDMFromJson(json);
}

// ─── KPIs — service-specific ──────────────────────────────────────────────

/// Catering & chefs KPIs returned by the BE (verified 2026-04-28).
///
/// Notable differences vs business-overview kpis:
///
///   - `bookings_total` replaces `reservations_total` — the same underlying
///     row count but filtered to `booking_type = service`.
///   - `booking_success_rate` (NOTE: SINGULAR `booking`, not `bookings`).
///     Mateo standardised the BE on the singular form here, divergent from
///     business-overview's `reservation_success_rate` plural baseline.
///   - `avg_response_hours`: how long, on average, the chef takes to move a
///     pending booking forward (quote / confirm / reject). Quality signal
///     for the chef's responsiveness.
///   - `availability_checks` (NOT `_total`): count of
///     `service.availability_checked` events. Pre-inquiry interest signal.
///
/// The reviews + favorites blocks are SHARED with business-overview: catering
/// businesses still earn reviews and favorites just like restaurants do.
/// Mateo carried those fields verbatim into the service shape so the FE can
/// render them from the same KPI card definitions if it wants to.
@freezed
abstract class ServiceKpisDM with _$ServiceKpisDM {
  const factory ServiceKpisDM({
    @JsonKey(name: 'bookings_total') @Default(0) int bookingsTotal,
    @JsonKey(name: 'booking_success_rate') @Default(0.0) double bookingSuccessRate,
    @JsonKey(name: 'avg_response_hours') @Default(0.0) double avgResponseHours,
    @JsonKey(name: 'availability_checks') @Default(0) int availabilityChecks,
    @JsonKey(name: 'reviews_total') @Default(0) int reviewsTotal,
    @JsonKey(name: 'reviews_avg_rating') @Default(0.0) double reviewsAvgRating,
    @JsonKey(name: 'favorites_total') @Default(0) int favoritesTotal,
    @JsonKey(name: 'favorites_unique_users') @Default(0) int favoritesUniqueUsers,
    @JsonKey(name: 'events_total') @Default(0) int eventsTotal,
  }) = _ServiceKpisDM;

  factory ServiceKpisDM.fromJson(Map<String, dynamic> json) => _$ServiceKpisDMFromJson(json);
}

// ─── Funnel ───────────────────────────────────────────────────────────────

/// Service vertical funnel. Six linear steps, each derived from one
/// `service.*` event emitted by [ServiceEventsTracker]:
///
/// ```
/// profile_view      ← user opened a chef/catering page
///   ↓
/// package_view      ← user scrolled and saw a package long enough
///   ↓
/// package_inquiry   ← user tapped "Solicitar servicio"
///   ↓
/// booking_started   ← booking sheet opened
///   ↓
/// booking_submitted ← BE accepted the request
///   ↓
/// booking_succeeded ← provider confirmed (status → confirmed)
/// ```
///
/// The step keys in the BE response are the SHORT names (no `service.` prefix
/// in the JSON keys, they're embedded in the funnel object whose owner is
/// already implicit). `service.message_sent` and `service.availability_checked`
/// are NOT funnel steps — they're orthogonal engagement / interest metrics
/// (the latter surfaces under [ServiceKpisDM.availabilityChecks]).
///
/// Reuses [FunnelStepDM] from business_overview_dm.dart — same `{label, value}`
/// shape applies regardless of which event sequence the funnel represents.
@freezed
abstract class ServiceFunnelDM with _$ServiceFunnelDM {
  const factory ServiceFunnelDM({
    @JsonKey(fromJson: parseFunnelSteps) @Default([]) List<FunnelStepDM> steps,
    ServiceFunnelConversionDM? conversion,
  }) = _ServiceFunnelDM;

  factory ServiceFunnelDM.fromJson(Map<String, dynamic> json) =>
      _$ServiceFunnelDMFromJson(json);
}

/// Conversion rates between the meaningful jump points in the service
/// funnel. Three primary rates the dashboard surfaces — per-segment
/// (view→inquiry, inquiry→booking) plus the end-to-end (view→booking).
///
/// `view_to_booking_rate` measures the FULL drop from package_view down to
/// booking_submitted. Mateo named it that way (rather than something like
/// `booking_to_succeeded_rate`) because the conversion that matters for the
/// chef is "how often does someone who saw my package end up actually
/// requesting it" — the succeeded step is partly outside the chef's
/// control (customer can ghost between submit and confirm).
@freezed
abstract class ServiceFunnelConversionDM with _$ServiceFunnelConversionDM {
  const factory ServiceFunnelConversionDM({
    @JsonKey(name: 'view_to_inquiry_rate') @Default(0.0) double viewToInquiryRate,
    @JsonKey(name: 'inquiry_to_booking_rate') @Default(0.0) double inquiryToBookingRate,
    @JsonKey(name: 'view_to_booking_rate') @Default(0.0) double viewToBookingRate,
  }) = _ServiceFunnelConversionDM;

  factory ServiceFunnelConversionDM.fromJson(Map<String, dynamic> json) =>
      _$ServiceFunnelConversionDMFromJson(json);
}

// ─── Daily Series ─────────────────────────────────────────────────────────

/// Time series for the service vertical. Each list has one entry per day in
/// the requested window — the BE backfills zeros for days with no activity
/// (same convention as business-overview's `_build_daily_series` helper).
///
/// Three series the BE currently ships:
///   - `bookings_daily`: service-type reservations created per day. The
///     primary trend chart on the catering dashboard.
///   - `reviews_daily`: review row creations per day. Same as the
///     business-overview equivalent — chefs get reviewed too.
///   - `events_daily`: total service.* event volume per day. Engagement
///     proxy useful as the secondary line on the trends chart.
///
/// `package_views_daily` and `messages_daily` (which the FE shadow DM had
/// originally guessed) DO NOT exist in the BE response — package views are
/// already represented inside the funnel step `package_view`, and message
/// volume is currently absent from the analytics surface.
@freezed
abstract class ServiceDailySeriesDM with _$ServiceDailySeriesDM {
  const factory ServiceDailySeriesDM({
    @JsonKey(name: 'bookings_daily') @Default([]) List<DailyPointDM> bookingsDaily,
    @JsonKey(name: 'reviews_daily') @Default([]) List<DailyPointDM> reviewsDaily,
    @JsonKey(name: 'events_daily') @Default([]) List<DailyPointDM> eventsDaily,
  }) = _ServiceDailySeriesDM;

  factory ServiceDailySeriesDM.fromJson(Map<String, dynamic> json) =>
      _$ServiceDailySeriesDMFromJson(json);
}

// ─── Breakdowns ───────────────────────────────────────────────────────────

/// Slices of the service activity for "which X drives the most volume"
/// charts.
///
/// - `bookings_by_status`: pending / quoted / confirmed / completed /
///   rejected / cancelled. Powers a donut chart of the deal pipeline. BE
///   sends it as a Map (`{"pending": 6, "quoted": 3, ...}`); the converter
///   `parseBreakdownMapOrList` flattens it to `List<BreakdownItemDM>` for
///   the FE.
/// - `top_packages`: catalog items ranked by booking count. Unlike
///   business-overview's `top_event_types` (flat label+value pairs), each
///   entry here is a RICH object with uuid + title + price + bookings —
///   the FE can render a real package row, not just a generic bar.
///   Modelled as a dedicated [TopServicePackageDM] type rather than the
///   generic [BreakdownItemDM] for that reason.
///
/// `top_event_types` from business-overview is intentionally absent — the
/// catering dashboard surfaces "top packages" instead, which is more
/// actionable for the chef.
@freezed
abstract class ServiceBreakdownsDM with _$ServiceBreakdownsDM {
  const factory ServiceBreakdownsDM({
    @JsonKey(name: 'bookings_by_status', fromJson: parseBreakdownMapOrList)
    @Default([])
    List<BreakdownItemDM> bookingsByStatus,
    @JsonKey(name: 'top_packages') @Default([]) List<TopServicePackageDM> topPackages,
  }) = _ServiceBreakdownsDM;

  factory ServiceBreakdownsDM.fromJson(Map<String, dynamic> json) =>
      _$ServiceBreakdownsDMFromJson(json);
}

/// One row of the `top_packages` breakdown — a full package descriptor with
/// its booking count over the analytics window. Specific to service-overview;
/// no equivalent in business-overview.
///
/// `priceType` arrives as the snake_case form (`per_person`, `per_hour`,
/// `fixed`, `on_quote`) matching the [PriceType] enum's `@JsonValue` strings,
/// but is kept as a raw String here to avoid coupling the analytics DM to
/// the service_packages DM. Consumers that need the typed enum can map
/// `PriceType.values.firstWhere(...)` at the callsite.
@freezed
abstract class TopServicePackageDM with _$TopServicePackageDM {
  const factory TopServicePackageDM({
    @JsonKey(name: 'package_uuid') @Default('') String packageUuid,
    @Default('') String title,
    @JsonKey(name: 'price_type') @Default('') String priceType,
    @Default(0.0) double price,
    @JsonKey(name: 'bookings_count') @Default(0) int bookingsCount,
  }) = _TopServicePackageDM;

  factory TopServicePackageDM.fromJson(Map<String, dynamic> json) =>
      _$TopServicePackageDMFromJson(json);
}

// ─── Meta ─────────────────────────────────────────────────────────────────

/// Generation metadata. Same shape that business-overview's `meta` returns
/// in the live response (`{generated_at, source}`). The current
/// [BusinessOverviewResponseDM] doesn't model it — this is the canonical
/// definition; if business-overview's DM is ever updated to expose meta,
/// it should import this type.
@freezed
abstract class AnalyticsMetaDM with _$AnalyticsMetaDM {
  const factory AnalyticsMetaDM({
    @JsonKey(name: 'generated_at') String? generatedAt,
    @Default('') String source,
  }) = _AnalyticsMetaDM;

  factory AnalyticsMetaDM.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsMetaDMFromJson(json);
}
