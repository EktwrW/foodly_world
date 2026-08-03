import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manager_orders_dm.freezed.dart';
part 'manager_orders_dm.g.dart';

/// F4a — respuesta del panel "Órdenes en vivo" del negocio.
/// Espejo de ManagerGroupOrderController::index.

/// Contadores para los chips (SIEMPRE completos, filtre lo que filtre).
@freezed
abstract class ManagerOrderCountsDM with _$ManagerOrderCountsDM {
  const factory ManagerOrderCountsDM({
    @Default(0) int pending,
    @Default(0) int preparing,
    @Default(0) int ready,
    @Default(0) int delivered,
  }) = _ManagerOrderCountsDM;

  factory ManagerOrderCountsDM.fromJson(Map<String, dynamic> json) =>
      _$ManagerOrderCountsDMFromJson(json);
}

@freezed
abstract class ManagerOrdersResponseDM with _$ManagerOrdersResponseDM {
  const factory ManagerOrdersResponseDM({
    @Default(true) bool success,
    @Default(<GroupOrderDM>[]) List<GroupOrderDM> orders,
    @Default(ManagerOrderCountsDM()) ManagerOrderCountsDM counts,
    ManagerOrdersMetaDM? meta,
  }) = _ManagerOrdersResponseDM;

  factory ManagerOrdersResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ManagerOrdersResponseDMFromJson(json);
}

/// F4a.1 — página de historial con keyset pagination por confirmed_at.
@freezed
abstract class ManagerHistoryResponseDM with _$ManagerHistoryResponseDM {
  const factory ManagerHistoryResponseDM({
    @Default(true) bool success,
    @Default(<GroupOrderDM>[]) List<GroupOrderDM> orders,
    @JsonKey(name: 'has_more') @Default(false) bool hasMore,
    @JsonKey(name: 'next_before') String? nextBefore,
  }) = _ManagerHistoryResponseDM;

  factory ManagerHistoryResponseDM.fromJson(Map<String, dynamic> json) =>
      _$ManagerHistoryResponseDMFromJson(json);
}

@freezed
abstract class ManagerOrdersMetaDM with _$ManagerOrdersMetaDM {
  const factory ManagerOrdersMetaDM({
    @JsonKey(name: 'current_page') @Default(1) int currentPage,
    @JsonKey(name: 'last_page') @Default(1) int lastPage,
    @Default(0) int total,
  }) = _ManagerOrdersMetaDM;

  factory ManagerOrdersMetaDM.fromJson(Map<String, dynamic> json) =>
      _$ManagerOrdersMetaDMFromJson(json);
}
