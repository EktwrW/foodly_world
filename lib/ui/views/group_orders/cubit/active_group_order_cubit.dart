import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:logger/logger.dart';

/// "Carrito de grupo": mantiene la orden grupal ACTIVA mientras el cliente
/// navega el menú. Es un singleton (DI) compartido entre la pantalla de menú
/// (donde se agregan ítems) y la GroupOrderPage (donde se cierra y paga).
///
/// El estado es la orden activa (o null si no hay ninguna). Bloc deduplica
/// emisiones iguales, así que cada `addFood` emite la orden actualizada con
/// más ítems → la UI (badge/barra) se refresca.
class ActiveGroupOrderCubit extends Cubit<GroupOrderDM?> {
  final GroupOrderRepo _repo;
  final Logger _logger;
  bool _busy = false;

  ActiveGroupOrderCubit({required GroupOrderRepo repo, required Logger logger})
      : _repo = repo,
        _logger = logger,
        super(null);

  /// ¿Hay una orden activa para este negocio?
  bool isActiveFor(String businessUuid) => state != null && state!.businessUuid == businessUuid;

  /// Total de unidades en la orden activa (para el badge del menú).
  int get itemCount => state?.items.fold<int>(0, (acc, i) => acc + i.quantity) ?? 0;

  /// Inicia una orden grupal para el negocio (idempotente si ya hay una activa
  /// para el mismo negocio). Devuelve true si quedó/ya estaba activa.
  Future<bool> startForBusiness(String businessUuid) async {
    if (isActiveFor(businessUuid)) return true;
    if (_busy) return false;
    _busy = true;
    final res = await _repo.createGroupOrder(businessUuid: businessUuid, origin: 'menu');
    final ok = res.when(
      success: (r) {
        emit(r.groupOrder);
        return true;
      },
      failure: (e) {
        _logger.e(e);
        return false;
      },
    );
    _busy = false;
    return ok;
  }

  /// Agrega un ítem del menú a la orden activa. [itemableType] = food/drink/combo.
  Future<bool> addFood(String itemableType, String itemableUuid, {int quantity = 1}) async {
    final order = state;
    if (order == null) return false;
    final res = await _repo.addItem(
      order.uuid,
      itemableType: itemableType,
      itemableUuid: itemableUuid,
      quantity: quantity,
    );
    return res.when(
      success: (r) {
        emit(r.groupOrder);
        return true;
      },
      failure: (e) {
        _logger.e(e);
        return false;
      },
    );
  }

  /// Re-lee la orden activa desde el backend (p. ej. al volver del detalle).
  Future<void> refresh() async {
    final order = state;
    if (order == null) return;
    final res = await _repo.getGroupOrder(order.uuid);
    res.when(success: (r) => emit(r.groupOrder), failure: (e) => _logger.e(e));
  }

  /// Termina la orden activa (tras cerrar/pagar/cancelar): limpia el carrito.
  void end() => emit(null);
}
