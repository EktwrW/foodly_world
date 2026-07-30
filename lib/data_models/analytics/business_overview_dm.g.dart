// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_overview_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BusinessOverviewResponseDM _$BusinessOverviewResponseDMFromJson(
        Map<String, dynamic> json) =>
    _BusinessOverviewResponseDM(
      data: json['data'] == null
          ? null
          : BusinessOverviewDataDM.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusinessOverviewResponseDMToJson(
        _BusinessOverviewResponseDM instance) =>
    <String, dynamic>{
      if (instance.data?.toJson() case final value?) 'data': value,
    };

_BusinessOverviewDataDM _$BusinessOverviewDataDMFromJson(
        Map<String, dynamic> json) =>
    _BusinessOverviewDataDM(
      kpis: json['kpis'] == null
          ? null
          : KpisDM.fromJson(json['kpis'] as Map<String, dynamic>),
      funnel: json['funnel'] == null
          ? null
          : FunnelDM.fromJson(json['funnel'] as Map<String, dynamic>),
      series: json['series'] == null
          ? null
          : DailySeriesDM.fromJson(json['series'] as Map<String, dynamic>),
      breakdowns: json['breakdowns'] == null
          ? null
          : BreakdownsDM.fromJson(json['breakdowns'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusinessOverviewDataDMToJson(
        _BusinessOverviewDataDM instance) =>
    <String, dynamic>{
      if (instance.kpis?.toJson() case final value?) 'kpis': value,
      if (instance.funnel?.toJson() case final value?) 'funnel': value,
      if (instance.series?.toJson() case final value?) 'series': value,
      if (instance.breakdowns?.toJson() case final value?) 'breakdowns': value,
    };

_KpisDM _$KpisDMFromJson(Map<String, dynamic> json) => _KpisDM(
      reservationsTotal: (json['reservations_total'] as num?)?.toInt() ?? 0,
      reservationSuccessRate:
          (json['reservation_success_rate'] as num?)?.toDouble() ?? 0.0,
      reviewsTotal: (json['reviews_total'] as num?)?.toInt() ?? 0,
      reviewsAvgRating: (json['reviews_avg_rating'] as num?)?.toDouble() ?? 0.0,
      favoritesTotal: (json['favorites_total'] as num?)?.toInt() ?? 0,
      favoritesUniqueUsers:
          (json['favorites_unique_users'] as num?)?.toInt() ?? 0,
      eventsTotal: (json['events_total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$KpisDMToJson(_KpisDM instance) => <String, dynamic>{
      'reservations_total': instance.reservationsTotal,
      'reservation_success_rate': instance.reservationSuccessRate,
      'reviews_total': instance.reviewsTotal,
      'reviews_avg_rating': instance.reviewsAvgRating,
      'favorites_total': instance.favoritesTotal,
      'favorites_unique_users': instance.favoritesUniqueUsers,
      'events_total': instance.eventsTotal,
    };

_FunnelDM _$FunnelDMFromJson(Map<String, dynamic> json) => _FunnelDM(
      steps: json['steps'] == null ? const [] : parseFunnelSteps(json['steps']),
      conversion: json['conversion'] == null
          ? null
          : FunnelConversionDM.fromJson(
              json['conversion'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FunnelDMToJson(_FunnelDM instance) => <String, dynamic>{
      'steps': instance.steps.map((e) => e.toJson()).toList(),
      if (instance.conversion?.toJson() case final value?) 'conversion': value,
    };

_FunnelStepDM _$FunnelStepDMFromJson(Map<String, dynamic> json) =>
    _FunnelStepDM(
      label: json['label'] as String? ?? '',
      value: (json['value'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$FunnelStepDMToJson(_FunnelStepDM instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };

_FunnelConversionDM _$FunnelConversionDMFromJson(Map<String, dynamic> json) =>
    _FunnelConversionDM(
      openToCtaRate: (json['open_to_cta_rate'] as num?)?.toDouble() ?? 0.0,
      openToReservationRate:
          (json['open_to_reservation_rate'] as num?)?.toDouble() ?? 0.0,
      ctaToReservationRate:
          (json['cta_to_reservation_rate'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$FunnelConversionDMToJson(_FunnelConversionDM instance) =>
    <String, dynamic>{
      'open_to_cta_rate': instance.openToCtaRate,
      'open_to_reservation_rate': instance.openToReservationRate,
      'cta_to_reservation_rate': instance.ctaToReservationRate,
    };

_DailySeriesDM _$DailySeriesDMFromJson(Map<String, dynamic> json) =>
    _DailySeriesDM(
      reservationsDaily: (json['reservations_daily'] as List<dynamic>?)
              ?.map((e) => DailyPointDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      reviewsDaily: (json['reviews_daily'] as List<dynamic>?)
              ?.map((e) => DailyPointDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      favoritesDaily: (json['favorites_daily'] as List<dynamic>?)
              ?.map((e) => DailyPointDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      eventsDaily: (json['events_daily'] as List<dynamic>?)
              ?.map((e) => DailyPointDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DailySeriesDMToJson(_DailySeriesDM instance) =>
    <String, dynamic>{
      'reservations_daily':
          instance.reservationsDaily.map((e) => e.toJson()).toList(),
      'reviews_daily': instance.reviewsDaily.map((e) => e.toJson()).toList(),
      'favorites_daily':
          instance.favoritesDaily.map((e) => e.toJson()).toList(),
      'events_daily': instance.eventsDaily.map((e) => e.toJson()).toList(),
    };

_DailyPointDM _$DailyPointDMFromJson(Map<String, dynamic> json) =>
    _DailyPointDM(
      date: json['date'] as String? ?? '',
      value: (json['value'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DailyPointDMToJson(_DailyPointDM instance) =>
    <String, dynamic>{
      'date': instance.date,
      'value': instance.value,
    };

_BreakdownsDM _$BreakdownsDMFromJson(Map<String, dynamic> json) =>
    _BreakdownsDM(
      reservationsByStatus: json['reservations_by_status'] == null
          ? const []
          : parseBreakdownMapOrList(json['reservations_by_status']),
      topEventTypes: json['top_event_types'] == null
          ? const []
          : parseEventTypes(json['top_event_types']),
    );

Map<String, dynamic> _$BreakdownsDMToJson(_BreakdownsDM instance) =>
    <String, dynamic>{
      'reservations_by_status':
          instance.reservationsByStatus.map((e) => e.toJson()).toList(),
      'top_event_types': instance.topEventTypes.map((e) => e.toJson()).toList(),
    };

_BreakdownItemDM _$BreakdownItemDMFromJson(Map<String, dynamic> json) =>
    _BreakdownItemDM(
      label: json['label'] as String? ?? '',
      value: (json['value'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$BreakdownItemDMToJson(_BreakdownItemDM instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };
