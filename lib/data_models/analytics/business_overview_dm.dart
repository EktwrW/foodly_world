import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_overview_dm.freezed.dart';
part 'business_overview_dm.g.dart';

/// Top-level response from GET /analytics/business-overview
@freezed
class BusinessOverviewResponseDM with _$BusinessOverviewResponseDM {
  const factory BusinessOverviewResponseDM({
    BusinessOverviewDataDM? data,
  }) = _BusinessOverviewResponseDM;

  factory BusinessOverviewResponseDM.fromJson(Map<String, dynamic> json) =>
      _$BusinessOverviewResponseDMFromJson(json);
}

@freezed
class BusinessOverviewDataDM with _$BusinessOverviewDataDM {
  const factory BusinessOverviewDataDM({
    KpisDM? kpis,
    FunnelDM? funnel,
    @JsonKey(name: 'series') DailySeriesDM? series,
    BreakdownsDM? breakdowns,
  }) = _BusinessOverviewDataDM;

  factory BusinessOverviewDataDM.fromJson(Map<String, dynamic> json) =>
      _$BusinessOverviewDataDMFromJson(json);
}

// ─── KPIs ───────────────────────────────────────────────────────────────────

@freezed
class KpisDM with _$KpisDM {
  const factory KpisDM({
    @JsonKey(name: 'reservations_total') @Default(0) int reservationsTotal,
    @JsonKey(name: 'reservation_success_rate') @Default(0.0) double reservationSuccessRate,
    @JsonKey(name: 'reviews_total') @Default(0) int reviewsTotal,
    @JsonKey(name: 'reviews_avg_rating') @Default(0.0) double reviewsAvgRating,
    @JsonKey(name: 'favorites_total') @Default(0) int favoritesTotal,
    @JsonKey(name: 'favorites_unique_users') @Default(0) int favoritesUniqueUsers,
    @JsonKey(name: 'events_total') @Default(0) int eventsTotal,
  }) = _KpisDM;

  factory KpisDM.fromJson(Map<String, dynamic> json) => _$KpisDMFromJson(json);
}

// ─── Funnel ─────────────────────────────────────────────────────────────────

@freezed
class FunnelDM with _$FunnelDM {
  const factory FunnelDM({
    @Default([]) List<FunnelStepDM> steps,
    FunnelConversionDM? conversion,
  }) = _FunnelDM;

  factory FunnelDM.fromJson(Map<String, dynamic> json) => _$FunnelDMFromJson(json);
}

@freezed
class FunnelStepDM with _$FunnelStepDM {
  const factory FunnelStepDM({
    @Default('') String label,
    @Default(0) int value,
  }) = _FunnelStepDM;

  factory FunnelStepDM.fromJson(Map<String, dynamic> json) => _$FunnelStepDMFromJson(json);
}

@freezed
class FunnelConversionDM with _$FunnelConversionDM {
  const factory FunnelConversionDM({
    @JsonKey(name: 'view_to_interact') @Default(0.0) double viewToInteract,
    @JsonKey(name: 'interact_to_reserve') @Default(0.0) double interactToReserve,
    @JsonKey(name: 'reserve_to_complete') @Default(0.0) double reserveToComplete,
  }) = _FunnelConversionDM;

  factory FunnelConversionDM.fromJson(Map<String, dynamic> json) =>
      _$FunnelConversionDMFromJson(json);
}

// ─── Daily Series ───────────────────────────────────────────────────────────

@freezed
class DailySeriesDM with _$DailySeriesDM {
  const factory DailySeriesDM({
    @JsonKey(name: 'reservations_daily') @Default([]) List<DailyPointDM> reservationsDaily,
    @JsonKey(name: 'reviews_daily') @Default([]) List<DailyPointDM> reviewsDaily,
    @JsonKey(name: 'favorites_daily') @Default([]) List<DailyPointDM> favoritesDaily,
    @JsonKey(name: 'events_daily') @Default([]) List<DailyPointDM> eventsDaily,
  }) = _DailySeriesDM;

  factory DailySeriesDM.fromJson(Map<String, dynamic> json) =>
      _$DailySeriesDMFromJson(json);
}

@freezed
class DailyPointDM with _$DailyPointDM {
  const factory DailyPointDM({
    @Default('') String date,
    @Default(0) int count,
  }) = _DailyPointDM;

  factory DailyPointDM.fromJson(Map<String, dynamic> json) => _$DailyPointDMFromJson(json);
}

// ─── Breakdowns ─────────────────────────────────────────────────────────────

@freezed
class BreakdownsDM with _$BreakdownsDM {
  const factory BreakdownsDM({
    @JsonKey(name: 'reservations_by_status') @Default([]) List<BreakdownItemDM> reservationsByStatus,
    @JsonKey(name: 'top_event_types') @Default([]) List<BreakdownItemDM> topEventTypes,
  }) = _BreakdownsDM;

  factory BreakdownsDM.fromJson(Map<String, dynamic> json) =>
      _$BreakdownsDMFromJson(json);
}

@freezed
class BreakdownItemDM with _$BreakdownItemDM {
  const factory BreakdownItemDM({
    @Default('') String label,
    @Default(0) int value,
  }) = _BreakdownItemDM;

  factory BreakdownItemDM.fromJson(Map<String, dynamic> json) =>
      _$BreakdownItemDMFromJson(json);
}
