// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_orders_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ManagerOrderCountsDM _$ManagerOrderCountsDMFromJson(
        Map<String, dynamic> json) =>
    _ManagerOrderCountsDM(
      pending: (json['pending'] as num?)?.toInt() ?? 0,
      preparing: (json['preparing'] as num?)?.toInt() ?? 0,
      ready: (json['ready'] as num?)?.toInt() ?? 0,
      delivered: (json['delivered'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ManagerOrderCountsDMToJson(
        _ManagerOrderCountsDM instance) =>
    <String, dynamic>{
      'pending': instance.pending,
      'preparing': instance.preparing,
      'ready': instance.ready,
      'delivered': instance.delivered,
    };

_ManagerOrdersResponseDM _$ManagerOrdersResponseDMFromJson(
        Map<String, dynamic> json) =>
    _ManagerOrdersResponseDM(
      success: json['success'] as bool? ?? true,
      orders: (json['orders'] as List<dynamic>?)
              ?.map((e) => GroupOrderDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <GroupOrderDM>[],
      counts: json['counts'] == null
          ? const ManagerOrderCountsDM()
          : ManagerOrderCountsDM.fromJson(
              json['counts'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : ManagerOrdersMetaDM.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ManagerOrdersResponseDMToJson(
        _ManagerOrdersResponseDM instance) =>
    <String, dynamic>{
      'success': instance.success,
      'orders': instance.orders.map((e) => e.toJson()).toList(),
      'counts': instance.counts.toJson(),
      if (instance.meta?.toJson() case final value?) 'meta': value,
    };

_ManagerHistoryResponseDM _$ManagerHistoryResponseDMFromJson(
        Map<String, dynamic> json) =>
    _ManagerHistoryResponseDM(
      success: json['success'] as bool? ?? true,
      orders: (json['orders'] as List<dynamic>?)
              ?.map((e) => GroupOrderDM.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <GroupOrderDM>[],
      hasMore: json['has_more'] as bool? ?? false,
      nextBefore: json['next_before'] as String?,
    );

Map<String, dynamic> _$ManagerHistoryResponseDMToJson(
        _ManagerHistoryResponseDM instance) =>
    <String, dynamic>{
      'success': instance.success,
      'orders': instance.orders.map((e) => e.toJson()).toList(),
      'has_more': instance.hasMore,
      if (instance.nextBefore case final value?) 'next_before': value,
    };

_PaymentModeResponseDM _$PaymentModeResponseDMFromJson(
        Map<String, dynamic> json) =>
    _PaymentModeResponseDM(
      success: json['success'] as bool? ?? true,
      groupPaymentMode: json['group_payment_mode'] as String? ?? 'per_round',
    );

Map<String, dynamic> _$PaymentModeResponseDMToJson(
        _PaymentModeResponseDM instance) =>
    <String, dynamic>{
      'success': instance.success,
      'group_payment_mode': instance.groupPaymentMode,
    };

_ManagerOrdersMetaDM _$ManagerOrdersMetaDMFromJson(Map<String, dynamic> json) =>
    _ManagerOrdersMetaDM(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 1,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 1,
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ManagerOrdersMetaDMToJson(
        _ManagerOrdersMetaDM instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'total': instance.total,
    };
