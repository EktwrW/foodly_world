import 'package:foodly_world/data_models/analytics/business_overview_dm.dart';
import 'package:foodly_world/data_models/analytics/service_overview_dm.dart';
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_vm.freezed.dart';

/// Which flavour of analytics dashboard the cubit should render. Derived
/// once at cubit construction from the [BusinessDM] (see [AnalyticsCubit]).
///
/// - [restaurant]: traditional businesses (restaurants, bars, bakeries,
///   coffee shops, drinkhouses, etc.). Backed by `/analytics/business-overview`
///   with `reservations_total`, `favorites_total`, `reviews_avg_rating`
///   and the `business.open → cta_clicked → reservation.*` funnel.
///
/// - [service]: catering & chefs vertical (currently `category_id == 26`,
///   future fallback: businesses with active service_packages). Will be
///   backed by `/analytics/service-overview` once Mateo's endpoint is
///   stable on Cloud Run — the funnel uses the six `service.*` events
///   (profile_view → package_view → package_inquiry → booking_started
///   → booking_submitted → booking_succeeded) and KPIs centre on quotes,
///   bookings and message engagement instead of reservations + reviews.
enum AnalyticsKind { restaurant, service }

@freezed
class AnalyticsVM with _$AnalyticsVM {
  const factory AnalyticsVM({
    /// Business whose analytics we're showing. Carried through the cubit
    /// so widgets can access `categoryId`, `name`, etc. without a lookup.
    /// Nullable to support the empty `initial` state — every real lifecycle
    /// path (`loading`, `loaded`, `error`) is emitted with `business` set.
    BusinessDM? business,

    /// Pre-resolved at cubit construction so `AnalyticsDashboardPage` can
    /// branch synchronously without re-deriving on every rebuild. Default
    /// `restaurant` covers the empty/initial state.
    @Default(AnalyticsKind.restaurant) AnalyticsKind kind,

    /// Restaurant-flavour payload. Populated only when [kind] is
    /// [AnalyticsKind.restaurant]. Mutually exclusive with [serviceOverview]
    /// — at most one of the two is non-null per loaded state.
    BusinessOverviewDataDM? overview,

    /// Catering & chefs-flavour payload. Populated only when [kind] is
    /// [AnalyticsKind.service]. Mutually exclusive with [overview].
    ServiceOverviewDataDM? serviceOverview,

    @Default(30) int selectedDays,
  }) = _AnalyticsVM;
}
