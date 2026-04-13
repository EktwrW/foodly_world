// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_overview_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusinessOverviewResponseDMImpl _$$BusinessOverviewResponseDMImplFromJson(
        Map<String, dynamic> json) =>
    _$BusinessOverviewResponseDMImpl(
      data: json['data'] == null
          ? null
          : BusinessOverviewDataDM.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BusinessOverviewResponseDMImplToJson(
        _$BusinessOverviewResponseDMImpl instance) =>
    <String, dynamic>{
      if (instance.data?.toJson() case final value?) 'data': value,
    };

_$BusinessOverviewDataDMImpl _$$BusinessOverviewDataDMImplFromJson(
        Map<String, dynamic> json) =>
    _$BusinessOverviewDataDMImpl(
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

Map<String, dynamic> _$$BusinessOverviewDataDMImplToJson(
        _$BusinessOverviewDataDMImpl instance) =>
    <String, dynamic>{
      if (instance.kpis?.toJson() case final value?) 'kpis': value,
      if (instance.funnel?.toJson() case final value?) 'funnel': value,
      if (instance.series?.toJson() case final value?) 'series': value,
      if (instance.breakdowns?.toJson() case final value?) 'breakdowns': value,
    };

_$KpisDMImpl _$$KpisDMImplFromJson(Map<String, dynamic> json) => _$KpisDMImpl(
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

Map<String, dynamic> _$$KpisDMImplToJson(_$KpisDMImpl instance) =>
    <String, dynamic>{
      'reservations_total': instance.reservationsTotal,
      'reservation_success_rate': instance.reservationSuccessRate,
      'reviews_total': instance.reviewsTotal,
      'reviews_avg_rating': instance.reviewsAvgRating,
      'favorites_total': instance.favoritesTotal,
      'favorites_unique_users': instance.favoritesUniqueUsers,
      'events_total': instance.eventsTotal,
    };

_$FunnelDMImpl _$$FunnelDMImplFromJson(Map<String, dynamic> json) =>
    _$FunnelDMImpl(
      steps: json['steps'] == null ? const [] : parseFunnelSteps(json['steps']),
      conversion: json['conversion'] == null
          ? null
          : FunnelConversionDM.fromJson(
              json['conversion'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FunnelDMImplToJson(_$FunnelDMImpl instance) =>
    <String, dynamic>{
      'steps': instance.steps.map((e) => e.toJson()).toList(),
      if (instance.conversion?.toJson() case final value?) 'conversion': value,
    };

_$FunnelStepDMImpl _$$FunnelStepDMImplFromJson(Map<String, dynamic> json) =>
    _$FunnelStepDMImpl(
      label: json['label'] as String? ?? '',
      value: (json['value'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$FunnelStepDMImplToJson(_$FunnelStepDMImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };

_$FunnelConversionDMImpl _$$FunnelConversionDMImplFromJson(
        Map<String, dynamic> json) =>
    _$FunnelConversionDMImpl(
      openToCtaRate: (json['open_to_cta_rate'] as num?)?.toDouble() ?? 0.0,
      openToReservationRate:
          (json['open_to_reservation_rate'] as num?)?.toDouble() ?? 0.0,
      ctaToReservationRate:
          (json['cta_to_reservation_rate'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$FunnelConversionDMImplToJson(
        _$FunnelConversionDMImpl instance) =>
    <String, dynamic>{
      'open_to_cta_rate': instance.openToCtaRate,
      'open_to_reservation_rate': instance.openToReservationRate,
      'cta_to_reservation_rate': instance.ctaToReservationRate,
    };

_$DailySeriesDMImpl _$$DailySeriesDMImplFromJson(Map<String, dynamic> json) =>
    _$DailySeriesDMImpl(
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

Map<String, dynamic> _$$DailySeriesDMImplToJson(_$DailySeriesDMImpl instance) =>
    <String, dynamic>{
      'reservations_daily':
          instance.reservationsDaily.map((e) => e.toJson()).toList(),
      'reviews_daily': instance.reviewsDaily.map((e) => e.toJson()).toList(),
      'favorites_daily':
          instance.favoritesDaily.map((e) => e.toJson()).toList(),
      'events_daily': instance.eventsDaily.map((e) => e.toJson()).toList(),
    };

_$DailyPointDMImpl _$$DailyPointDMImplFromJson(Map<String, dynamic> json) =>
    _$DailyPointDMImpl(
      date: json['date'] as String? ?? '',
      value: (json['value'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$DailyPointDMImplToJson(_$DailyPointDMImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'value': instance.value,
    };

_$BreakdownsDMImpl _$$BreakdownsDMImplFromJson(Map<String, dynamic> json) =>
    _$BreakdownsDMImpl(
      reservationsByStatus: json['reservations_by_status'] == null
          ? const []
          : parseBreakdownMapOrList(json['reservations_by_status']),
      topEventTypes: json['top_event_types'] == null
          ? const []
          : parseEventTypes(json['top_event_types']),
    );

Map<String, dynamic> _$$BreakdownsDMImplToJson(_$BreakdownsDMImpl instance) =>
    <String, dynamic>{
      'reservations_by_status':
          instance.reservationsByStatus.map((e) => e.toJson()).toList(),
      'top_event_types': instance.topEventTypes.map((e) => e.toJson()).toList(),
    };

_$BreakdownItemDMImpl _$$BreakdownItemDMImplFromJson(
        Map<String, dynamic> json) =>
    _$BreakdownItemDMImpl(
      label: json['label'] as String? ?? '',
      value: (json['value'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$BreakdownItemDMImplToJson(
        _$BreakdownItemDMImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };
