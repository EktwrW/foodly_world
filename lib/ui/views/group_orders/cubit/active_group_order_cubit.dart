import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/core/services/group_order_ongoing_notification_service.dart';
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
  final GroupOrderOngoingNotificationService? _ongoingNotification;
  bool _busy = false;

  ActiveGroupOrderCubit({
    required GroupOrderRepo repo,
    required Logger logger,
    GroupOrderOngoingNotificationService? ongoingNotification,
  })  : _repo = repo,
        _logger = logger,
        _ongoingNotification = ongoingNotification,
        super(null);

  /// F3a (spec v2 §D.2): la notificación ongoing de Android refleja SIEMPRE
  /// el estado del carrito — un solo hook para todas las emisiones.
  @override
  void onChange(Change<GroupOrderDM?> change) {
    super.onChange(change);
    final order = change.nextState;
    if (order == null || !(order.isOpen || order.isPayable)) {
      _ongoingNotification?.dismiss();
    } else {
      _ongoingNotification?.show(
        orderUuid: order.uuid,
        businessName: order.businessName.isNotEmpty ? order.businessName : 'Foodly',
        total: order.isOpen ? order.subtotal : order.totalAmount,
        itemCount: order.items.fold<int>(0, (acc, i) => acc + i.quantity),
        currency: order.currency,
      );
    }
  }

  /// ¿Hay una orden activa para este negocio?
  bool isActiveFor(String businessUuid) => state != null && state!.businessUuid == businessUuid;

  /// Bug e2e 2026-07-31: el carrito era SOLO memoria local — el mismo usuario
  /// desde otro dispositivo no veía su orden activa (y podía crear otra).
  /// Al entrar al menú de un negocio se sincroniza contra /mine y, si el
  /// servidor tiene una orden activa para este negocio, se adopta.
  Future<void> syncForBusiness(String businessUuid) async {
    if (isActiveFor(businessUuid) || _busy) return;
    final res = await _repo.getMyGroupOrders();
    res.when(
      success: (r) {
        final remote = r.groupOrders
            .where((o) => o.businessUuid == businessUuid && (o.isOpen || o.isPayable))
            .toList();
        if (remote.isNotEmpty) emit(remote.first);
      },
      failure: (_) {/* silencioso: sin red no bloqueamos el menú */},
    );
  }

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

  /// e2e r5: causa real del último join fallido (mensaje del backend) para
  /// que la UI no muestre siempre "código inválido"; null = sin detalle.
  String? lastJoinError;

  /// F3a: unirse a la orden de OTRO usuario con el código de invitación.
  /// Si funciona, la orden ajena pasa a ser el carrito activo.
  Future<bool> joinWithCode(String code) async {
    if (_busy) return false;
    _busy = true;
    lastJoinError = null;
    final res = await _repo.joinByCode(code.trim().toUpperCase());
    final ok = res.when(
      success: (r) {
        emit(r.groupOrder);
        return true;
      },
      failure: (e) {
        _logger.e(e);
        lastJoinError = e.serverMessage;
        return false;
      },
    );
    _busy = false;
    return ok;
  }

  /// F4a (caso bar): abre la SIGUIENTE RONDA de la mesa — la orden nueva
  /// (que hereda mesa y QR) pasa a ser el carrito activo. true = abierta.
  Future<bool> startNextRound(String previousOrderUuid) async {
    if (_busy) return false;
    _busy = true;
    lastJoinError = null;
    final res = await _repo.nextRound(previousOrderUuid);
    final ok = res.when(
      success: (r) {
        emit(r.groupOrder);
        return true;
      },
      failure: (e) {
        _logger.e(e);
        lastJoinError = e.serverMessage;
        return false;
      },
    );
    _busy = false;
    return ok;
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
