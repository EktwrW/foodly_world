import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/core/services/group_order_ongoing_notification_service.dart';
import 'package:foodly_world/core/services/group_order_realtime_service.dart';
import 'package:foodly_world/core/services/pending_table.dart';
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

  /// Realtime opcional (null en tests): mantiene FRESCO el chip flotante
  /// mientras el comensal navega otras pantallas. Ver [watchActive].
  final GroupOrderRealtimeService? _realtime;

  /// uuid observado ahora mismo, y su suscripción (para cancelar la NUESTRA).
  String? _watchedUuid;
  RealtimeSubscription? _sub;
  bool _busy = false;

  ActiveGroupOrderCubit({
    required GroupOrderRepo repo,
    required Logger logger,
    GroupOrderOngoingNotificationService? ongoingNotification,
    GroupOrderRealtimeService? realtime,
  })  : _repo = repo,
        _logger = logger,
        _ongoingNotification = ongoingNotification,
        _realtime = realtime,
        super(null);

  /// F3a (spec v2 §D.2): la notificación ongoing de Android refleja SIEMPRE
  /// el estado del carrito — un solo hook para todas las emisiones.
  @override
  void onChange(Change<GroupOrderDM?> change) {
    super.onChange(change);
    final order = change.nextState;
    // F4b: la orden de cuenta abierta sigue viva tras confirmarse (isTracking
    // la cubre) — la notificación ongoing debe seguir ahí hasta el pago.
    if (order == null || !(order.isOpen || order.isPayable || order.isTracking)) {
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
        // F4b: en cuenta abierta la orden CONFIRMADA sigue siendo el carrito
        // (la mesa pide más tandas). Sin isTracking acá, volver al menú
        // ofrecía "crear orden" y nacía una SEGUNDA orden en la misma mesa.
        final remote = r.groupOrders
            .where((o) =>
                o.businessUuid == businessUuid && (o.isOpen || o.isPayable || o.isTracking))
            .toList();
        if (remote.isNotEmpty) emit(remote.first);
      },
      failure: (_) {/* silencioso: sin red no bloqueamos el menú */},
    );
  }

  /// e2e F4a: recuperación GLOBAL de la orden activa (cold start / resume).
  /// Sin esto, un cliente que pagó y cerró la app no tenía camino de vuelta
  /// a su orden. Prioridad: carrito vivo (open/payable) > tracking (pagada
  /// sin entregar). No-op si ya hay estado o sin sesión (401 silencioso).
  Future<void> syncAnyActive() async {
    if (state != null || _busy) return;
    final res = await _repo.getMyGroupOrders();
    res.when(
      success: (r) {
        final cart = r.groupOrders.where((o) => o.isOpen || o.isPayable).toList();
        if (cart.isNotEmpty) {
          emit(cart.first);
        } else {
          final tracking = r.groupOrders.where((o) => o.isTracking).toList();
          if (tracking.isNotEmpty) emit(tracking.first);
        }
      },
      failure: (_) {/* silencioso: sin red/sesión no molestamos */},
    );
    // Recién acá hay uuid que observar (y si la página está abierta, ella es
    // la dueña: watchActive es idempotente y el host cede/retoma).
    await watchActive();
  }

  /// Total de unidades en la orden activa (para el badge del menú).
  int get itemCount => state?.items.fold<int>(0, (acc, i) => acc + i.quantity) ?? 0;

  /// Inicia una orden grupal para el negocio (idempotente si ya hay una activa
  /// para el mismo negocio). Devuelve true si quedó/ya estaba activa.
  Future<bool> startForBusiness(String businessUuid) async {
    if (isActiveFor(businessUuid)) return true;
    if (_busy) return false;
    _busy = true;
    // Mesa del QR, si el comensal entró escaneando el de SU mesa. `null` en
    // todo el resto de los casos, que es como venía funcionando: sin mesa, el
    // request es idéntico al de antes salvo por un campo que no se manda.
    //
    // `origin: 'qr'` solo cuando de verdad vino del QR — hasta ahora era
    // siempre 'menu'. Es descriptivo (nada se bifurca por él en el backend),
    // pero deja de mentirle a la analítica.
    final tableLabel = PendingTable.forBusiness(businessUuid);
    final res = await _repo.createGroupOrder(
      businessUuid: businessUuid,
      origin: tableLabel != null ? 'qr' : 'menu',
      tableLabel: tableLabel,
    );
    final ok = res.when(
      success: (r) {
        // Se consume solo si la orden se creó. Si falló, la mesa queda
        // estacionada y el reintento la conserva.
        PendingTable.clearFor(businessUuid);
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
  ///
  /// [version] es el tamaño que el comensal eligió en el menú. Sin él el
  /// backend cobra siempre el precio de regular aunque la app muestre el de
  /// grande — la mesa paga de menos y el negocio pone la diferencia. Peor
  /// todavía: el BE fusiona la grande con la chica en UNA línea, así que un
  /// roll de 2 € y uno grande de 6 € salían "2× roll · 4 €" en las dos UIs.
  ///
  /// Es REQUERIDO y no opcional con default a propósito. Ya se perdió una
  /// vez en un merge y nada lo agarró: siendo opcional, borrar el argumento
  /// compila igual y el bug vuelve en silencio. Ahora no compila. Para la
  /// versión por defecto se pasa [Version.regular], que es explícito.
  Future<bool> addFood(
    String itemableType,
    String itemableUuid, {
    required Version version,
    int quantity = 1,
  }) async {
    final order = state;
    if (order == null) return false;
    final res = await _repo.addItem(
      order.uuid,
      itemableType: itemableType,
      itemableUuid: itemableUuid,
      quantity: quantity,
      version: version.value,
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

  /// Motivo del último fallo al invitar, para mostrar lo que dice el backend
  /// en vez de un genérico; null = sin detalle.
  String? lastInviteError;

  /// Código de invitación de la orden ACTIVA (lo genera o reutiliza el
  /// backend). Es el mismo método que ya tenía `GroupOrderCubit`, pero
  /// colgado del carrito: el chip flotante vive fuera de la GroupOrderPage y
  /// no alcanza su provider. Pasarle el cubit de la página por
  /// `BlocProvider.value` ataría un widget GLOBAL al ciclo de vida de una
  /// ruta que casi nunca está montada cuando se toca el chip.
  Future<GroupInviteResponseDM?> createInvitation() async {
    final uuid = state?.uuid;
    if (uuid == null) return null;
    lastInviteError = null;
    final result = await _repo.createInvitation(uuid);
    return result.when(
      success: (r) => r,
      failure: (e) {
        _logger.e(e);
        lastInviteError = e.serverMessage;
        return null;
      },
    );
  }

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

  // ── Realtime del chip flotante (e2e 2026-08-06) ─────────────────────
  //
  // Antes este cubit solo se refrescaba al arrancar la app, al volver del
  // background o en mutaciones locales. Con el comensal sentado mirando el
  // home, el negocio marcaba LISTO, entregaba una tanda o anulaba un plato
  // y el chip seguía mostrando una foto vieja: por eso decía "preparando"
  // cuando la tanda 2 ya estaba entregada.
  //
  // El servicio es multi-canal sobre UNA conexión, así que el chip sostiene
  // su suscripción SIEMPRE mientras haya orden activa. No hay traspaso de
  // dueño con la página de la orden: convivir es correcto y elimina la
  // carrera que dejaba al chip suscrito pero sin socket.

  /// Observa la orden activa. Idempotente: si ya observa ese uuid no hace
  /// nada; si cambió de orden, cancela la anterior primero.
  Future<void> watchActive() async {
    final uuid = state?.uuid;
    if (_realtime == null || uuid == null || _watchedUuid == uuid) return;
    await _sub?.cancel();
    _watchedUuid = uuid;
    _sub = await _realtime.watch(uuid, onTouched: refresh);
  }

  /// Termina la orden activa (tras cerrar/pagar/cancelar): limpia el carrito.
  void end() {
    _watchedUuid = null;
    _sub?.cancel();
    _sub = null;
    emit(null);
  }
}
