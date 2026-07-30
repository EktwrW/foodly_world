// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_overview_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceOverviewResponseDM _$ServiceOverviewResponseDMFromJson(
        Map<String, dynamic> json) =>
    _ServiceOverviewResponseDM(
      success: json['success'] as bool? ?? false,
      data: json['data'] == null
          ? null
          : ServiceOverviewDataDM.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServiceOverviewResponseDMToJson(
        _ServiceOverviewResponseDM instance) =>
    <String, dynamic>{
      'success': instance.success,
      if (instance.data?.toJson() case final value?) 'data': value,
    };

_ServiceOverviewDataDM _$ServiceOverviewDataDMFromJson(
        Map<String, dynamic> json) =>
    _ServiceOverviewDataDM(
      scope: json['scope'] == null
          ? null
          : AnalyticsScopeDM.fromJson(json['scope'] as Map<String, dynamic>),
      kpis: json['kpis'] == null
          ? null
          : ServiceKpisDM.fromJson(json['kpis'] as Map<String, dynamic>),
      funnel: json['funnel'] == null
          ? null
          : ServiceFunnelDM.fromJson(json['funnel'] as Map<String, dynamic>),
      series: json['series'] == null
          ? null
          : ServiceDailySeriesDM.fromJson(
              json['series'] as Map<String, dynamic>),
      breakdowns: json['breakdowns'] == null
          ? null
          : ServiceBreakdownsDM.fromJson(
              json['breakdowns'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : AnalyticsMetaDM.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServiceOverviewDataDMToJson(
        _ServiceOverviewDataDM instance) =>
    <String, dynamic>{
      if (instance.scope?.toJson() case final value?) 'scope': value,
      if (instance.kpis?.toJson() case final value?) 'kpis': value,
      if (instance.funnel?.toJson() case final value?) 'funnel': value,
      if (instance.series?.toJson() case final value?) 'series': value,
      if (instance.breakdowns?.toJson() case final value?) 'breakdowns': value,
      if (instance.meta?.toJson() case final value?) 'meta': value,
    };

_AnalyticsScopeDM _$AnalyticsScopeDMFromJson(Map<String, dynamic> json) =>
    _AnalyticsScopeDM(
      period: json['period'] == null
          ? null
          : AnalyticsPeriodDM.fromJson(json['period'] as Map<String, dynamic>),
      businesses: (json['businesses'] as List<dynamic>?)
              ?.map((e) =>
                  AnalyticsBusinessRefDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AnalyticsScopeDMToJson(_AnalyticsScopeDM instance) =>
    <String, dynamic>{
      if (instance.period?.toJson() case final value?) 'period': value,
      'businesses': instance.businesses.map((e) => e.toJson()).toList(),
    };

_AnalyticsPeriodDM _$AnalyticsPeriodDMFromJson(Map<String, dynamic> json) =>
    _AnalyticsPeriodDM(
      days: (json['days'] as num?)?.toInt() ?? 30,
      start: json['start'] as String? ?? '',
      end: json['end'] as String? ?? '',
    );

Map<String, dynamic> _$AnalyticsPeriodDMToJson(_AnalyticsPeriodDM instance) =>
    <String, dynamic>{
      'days': instance.days,
      'start': instance.start,
      'end': instance.end,
    };

_AnalyticsBusinessRefDM _$AnalyticsBusinessRefDMFromJson(
        Map<String, dynamic> json) =>
    _AnalyticsBusinessRefDM(
      id: (json['id'] as num?)?.toInt() ?? 0,
      businessUuid: json['business_uuid'] as String? ?? '',
      businessName: json['business_name'] as String?,
    );

Map<String, dynamic> _$AnalyticsBusinessRefDMToJson(
        _AnalyticsBusinessRefDM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'business_uuid': instance.businessUuid,
      if (instance.businessName case final value?) 'business_name': value,
    };

_ServiceKpisDM _$ServiceKpisDMFromJson(Map<String, dynamic> json) =>
    _ServiceKpisDM(
      bookingsTotal: (json['bookings_total'] as num?)?.toInt() ?? 0,
      bookingSuccessRate:
          (json['booking_success_rate'] as num?)?.toDouble() ?? 0.0,
      avgResponseHours: (json['avg_response_hours'] as num?)?.toDouble() ?? 0.0,
      availabilityChecks: (json['availability_checks'] as num?)?.toInt() ?? 0,
      reviewsTotal: (json['reviews_total'] as num?)?.toInt() ?? 0,
      reviewsAvgRating: (json['reviews_avg_rating'] as num?)?.toDouble() ?? 0.0,
      favoritesTotal: (json['favorites_total'] as num?)?.toInt() ?? 0,
      favoritesUniqueUsers:
          (json['favorites_unique_users'] as num?)?.toInt() ?? 0,
      eventsTotal: (json['events_total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ServiceKpisDMToJson(_ServiceKpisDM instance) =>
    <String, dynamic>{
      'bookings_total': instance.bookingsTotal,
      'booking_success_rate': instance.bookingSuccessRate,
      'avg_response_hours': instance.avgResponseHours,
      'availability_checks': instance.availabilityChecks,
      'reviews_total': instance.reviewsTotal,
      'reviews_avg_rating': instance.reviewsAvgRating,
      'favorites_total': instance.favoritesTotal,
      'favorites_unique_users': instance.favoritesUniqueUsers,
      'events_total': instance.eventsTotal,
    };

_ServiceFunnelDM _$ServiceFunnelDMFromJson(Map<String, dynamic> json) =>
    _ServiceFunnelDM(
      steps: json['steps'] == null ? const [] : parseFunnelSteps(json['steps']),
      conversion: json['conversion'] == null
          ? null
          : ServiceFunnelConversionDM.fromJson(
              json['conversion'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServiceFunnelDMToJson(_ServiceFunnelDM instance) =>
    <String, dynamic>{
      'steps': instance.steps.map((e) => e.toJson()).toList(),
      if (instance.conversion?.toJson() case final value?) 'conversion': value,
    };

_ServiceFunnelConversionDM _$ServiceFunnelConversionDMFromJson(
        Map<String, dynamic> json) =>
    _ServiceFunnelConversionDM(
      viewToInquiryRate:
          (json['view_to_inquiry_rate'] as num?)?.toDouble() ?? 0.0,
      inquiryToBookingRate:
          (json['inquiry_to_booking_rate'] as num?)?.toDouble() ?? 0.0,
      viewToBookingRate:
          (json['view_to_booking_rate'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$ServiceFunnelConversionDMToJson(
        _ServiceFunnelConversionDM instance) =>
    <String, dynamic>{
      'view_to_inquiry_rate': instance.viewToInquiryRate,
      'inquiry_to_booking_rate': instance.inquiryToBookingRate,
      'view_to_booking_rate': instance.viewToBookingRate,
    };

_ServiceDailySeriesDM _$ServiceDailySeriesDMFromJson(
        Map<String, dynamic> json) =>
    _ServiceDailySeriesDM(
      bookingsDaily: (json['bookings_daily'] as List<dynamic>?)
              ?.map((e) => DailyPointDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      reviewsDaily: (json['reviews_daily'] as List<dynamic>?)
              ?.map((e) => DailyPointDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      eventsDaily: (json['events_daily'] as List<dynamic>?)
              ?.map((e) => DailyPointDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ServiceDailySeriesDMToJson(
        _ServiceDailySeriesDM instance) =>
    <String, dynamic>{
      'bookings_daily': instance.bookingsDaily.map((e) => e.toJson()).toList(),
      'reviews_daily': instance.reviewsDaily.map((e) => e.toJson()).toList(),
      'events_daily': instance.eventsDaily.map((e) => e.toJson()).toList(),
    };

_ServiceBreakdownsDM _$ServiceBreakdownsDMFromJson(Map<String, dynamic> json) =>
    _ServiceBreakdownsDM(
      bookingsByStatus: json['bookings_by_status'] == null
          ? const []
          : parseBreakdownMapOrList(json['bookings_by_status']),
      topPackages: (json['top_packages'] as List<dynamic>?)
              ?.map((e) =>
                  TopServicePackageDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ServiceBreakdownsDMToJson(
        _ServiceBreakdownsDM instance) =>
    <String, dynamic>{
      'bookings_by_status':
          instance.bookingsByStatus.map((e) => e.toJson()).toList(),
      'top_packages': instance.topPackages.map((e) => e.toJson()).toList(),
    };

_TopServicePackageDM _$TopServicePackageDMFromJson(Map<String, dynamic> json) =>
    _TopServicePackageDM(
      packageUuid: json['package_uuid'] as String? ?? '',
      title: json['title'] as String? ?? '',
      priceType: json['price_type'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      bookingsCount: (json['bookings_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TopServicePackageDMToJson(
        _TopServicePackageDM instance) =>
    <String, dynamic>{
      'package_uuid': instance.packageUuid,
      'title': instance.title,
      'price_type': instance.priceType,
      'price': instance.price,
      'bookings_count': instance.bookingsCount,
    };

_AnalyticsMetaDM _$AnalyticsMetaDMFromJson(Map<String, dynamic> json) =>
    _AnalyticsMetaDM(
      generatedAt: json['generated_at'] as String?,
      source: json['source'] as String? ?? '',
    );

Map<String, dynamic> _$AnalyticsMetaDMToJson(_AnalyticsMetaDM instance) =>
    <String, dynamic>{
      if (instance.generatedAt case final value?) 'generated_at': value,
      'source': instance.source,
    };
