import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/core/services/group_order_realtime_service.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/group_order_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'group_order_cubit.freezed.dart';
part 'group_order_state.dart';

/// Cubit de la pantalla de detalle de una orden grupal (split payments).
/// Patrón de MyReservationsCubit. Real-time (Pusher) se integra en F1-D.
class GroupOrderCubit extends Cubit<GroupOrderState> {
  final GroupOrderRepo _repo;
  final Logger _logger;

  /// F3a: realtime opcional (null en tests). Se suscribe al cargar la orden
  /// y se libera al cerrar el cubit (= salir de la pantalla).
  final GroupOrderRealtimeService? _realtime;

  /// Suscripción PROPIA: se cancela solo la nuestra, nunca la de
  /// otro consumidor del servicio (2026-08-06).
  RealtimeSubscription? _sub;
  GroupOrderVM _vm;

  GroupOrderCubit({
    required GroupOrderRepo repo,
    required Logger logger,
    GroupOrderRealtimeService? realtime,
  })  : _repo = repo,
        _logger = logger,
        _realtime = realtime,
        _vm = const GroupOrderVM(),
        super(const GroupOrderState.initial(GroupOrderVM()));

  GroupOrderVM get vm => _vm;

  /// Carga (o recarga) el detalle de una orden por su uuid.
  Future<void> load(String uuid) async {
    emit(GroupOrderState.loading(_vm));
    final result = await _repo.getGroupOrder(uuid);
    result.when(
      success: (r) {
        _applyResponse(r);
        // Realtime tras la primera carga exitosa: cualquier cambio remoto
        // (evento socket, tick de polling fallback o resume de la app)
        // dispara un refetch SILENCIOSO — sin spinner, la UI solo se refresca.
        _realtime?.watch(uuid, onTouched: () => _refetchSilently(uuid)).then((sub) => _sub = sub);
      },
      failure: _onError,
    );
  }

  /// Pull-to-refresh (hallazgo medio del audit): re-lee la orden a demanda
  /// sin pasar por loading — la UI no parpadea, el RefreshIndicator ya da
  /// el feedback visual.
  Future<void> refetch() async {
    final uuid = _vm.order?.uuid;
    if (uuid != null) await _refetchSilently(uuid);
  }

  Future<void> _refetchSilently(String uuid) async {
    if (isClosed) return;
    final result = await _repo.getGroupOrder(uuid);
    if (isClosed) return;
    result.when(success: _applyResponse, failure: (_) {/* silencioso */});
  }

  @override
  Future<void> close() async {
    await _sub?.cancel();
    return super.close();
  }

  /// Host: cierra la orden (congela precios y habilita el pago).
  /// F2c §B.1: [splitMode] = 'by_items' | 'equal_split'.
  Future<void> lock({String? splitMode}) async {
    final uuid = _vm.order?.uuid;
    if (uuid == null) return;
    emit(GroupOrderState.loading(_vm));
    final result = await _repo.lockGroupOrder(uuid, splitMode: splitMode);
    result.when(success: _applyResponse, failure: _onError);
  }

  /// F4b (cuenta abierta): "Enviar orden" — la tanda actual va a cocina sin
  /// pago. Devuelve true si el envío salió bien (la UI muestra el sheet
  /// "Pedido enviado a cocina").
  Future<bool> sendBatch() async {
    final uuid = _vm.order?.uuid;
    if (uuid == null) return false;
    emit(GroupOrderState.loading(_vm));
    final result = await _repo.sendBatch(uuid);
    return result.when(
      success: (r) {
        _applyResponse(r);
        return true;
      },
      failure: (e) {
        _onError(e);
        return false;
      },
    );
  }

  /// F4b: "Pedir la cuenta" — congela el agregado y habilita el checkout
  /// (el split se elige igual que en el lock clásico).
  Future<void> requestBill({String? splitMode}) async {
    final uuid = _vm.order?.uuid;
    if (uuid == null) return;
    emit(GroupOrderState.loading(_vm));
    final result = await _repo.requestBill(uuid, splitMode: splitMode);
    result.when(success: _applyResponse, failure: _onError);
  }

  /// F4b: "Pagar en caja" — la mesa avisa y el negocio confirma al cobrar.
  /// No hay checkout: el dinero se entrega en el mostrador.
  Future<void> requestCashPayment() async {
    final uuid = _vm.order?.uuid;
    if (uuid == null) return;
    emit(GroupOrderState.loading(_vm));
    final result = await _repo.requestCashPayment(uuid);
    result.when(success: _applyResponse, failure: _onError);
  }

  /// F4b: deshace el aviso — vuelven a poder pedir o pagar en la app.
  Future<void> cancelCashPayment() async {
    final uuid = _vm.order?.uuid;
    if (uuid == null) return;
    emit(GroupOrderState.loading(_vm));
    final result = await _repo.cancelCashPayment(uuid);
    result.when(success: _applyResponse, failure: _onError);
  }

  /// F2c: marca/desmarca un ítem como compartido (solo en OPEN).
  Future<void> setItemShared(String itemUuid, bool shared) async {
    final uuid = _vm.order?.uuid;
    if (uuid == null) return;
    final result = await _repo.updateItem(uuid, itemUuid, shared: shared);
    result.when(success: _applyResponse, failure: _onError);
  }

  /// Host: reabre una orden cerrada SIN pagos (F2b §C.1).
  /// Devuelve si la orden quedó reabierta. El bool importa: reabrir puede
  /// fallar porque OTRO comensal tiene un pago en curso, y ahí la pantalla no
  /// debe seguir como si nada.
  Future<bool> unlock() async {
    final uuid = _vm.order?.uuid;
    if (uuid == null) return false;
    emit(GroupOrderState.loading(_vm));
    final result = await _repo.unlockGroupOrder(uuid);

    return result.when(
      success: (r) {
        _applyResponse(r);

        return true;
      },
      failure: (e) {
        _onError(e);

        return false;
      },
    );
  }

  /// Suelta el intento de pago en vuelo de ESTE comensal.
  ///
  /// POR QUÉ (e2e 2026-08-15). Cerrar la hoja de pago sin pagar dejaba al
  /// participante en `processing`, y con eso la orden quedaba congelada: no se
  /// podía reabrir para agregar o quitar un plato, y el único remedio era
  /// esperar a que el intento caducara. Cerrar una hoja no es pagar.
  ///
  /// El backend NO cancela a ciegas: le pregunta a Stripe y se niega si el
  /// dinero ya está comprometido —incluido el MB WAY o Bizum que el comensal
  /// está aprobando en la app de su banco justo ahora—. Por eso esto puede
  /// devolver false sin que sea un error de programación.
  ///
  /// Silencioso a propósito: se llama al cerrar la hoja, y el caso normal —no
  /// había nada que soltar— no merece ni un mensaje. Quien necesite avisar al
  /// comensal (el flujo de reabrir) mira el bool.
  Future<bool> cancelPayment() async {
    final uuid = _vm.order?.uuid;
    if (uuid == null) return false;

    final result = await _repo.cancelPayment(uuid);

    // Se re-lee SIEMPRE, salga bien o mal: si se soltó, para que el pie deje de
    // decir "confirmando"; si no se soltó, porque el motivo suele ser que el
    // pago avanzó y la pantalla está desactualizada.
    await _refetchSilently(uuid);

    return result.when(success: (_) => true, failure: (_) => false);
  }

  /// e2e r4: host elimina DEFINITIVAMENTE una orden vacía. true = eliminada
  /// (el caller cierra el carrito y navega fuera — la orden ya no existe).
  Future<bool> deleteOrder() async {
    final uuid = _vm.order?.uuid;
    if (uuid == null) return false;
    emit(GroupOrderState.loading(_vm));
    final result = await _repo.deleteGroupOrder(uuid);
    return result.when(
      success: (_) => true,
      failure: (e) {
        _onError(e);
        return false;
      },
    );
  }

  /// e2e r4: miembro sin ítems propios abandona la orden. true = fuera.
  Future<bool> leaveOrder() async {
    final uuid = _vm.order?.uuid;
    if (uuid == null) return false;
    emit(GroupOrderState.loading(_vm));
    final result = await _repo.leaveGroupOrder(uuid);
    return result.when(
      success: (_) => true,
      failure: (e) {
        _onError(e);
        return false;
      },
    );
  }

  /// Host: transfiere la titularidad a otro participante (F2b §A.1).
  Future<void> transferHost(String participantUuid) async {
    final uuid = _vm.order?.uuid;
    if (uuid == null) return;
    emit(GroupOrderState.loading(_vm));
    final result = await _repo.transferHost(uuid, participantUuid: participantUuid);
    result.when(success: _applyResponse, failure: _onError);
  }

  /// Agrega un ítem (solo cuando la orden está OPEN).
  Future<void> addItem({
    required String itemableType,
    required String itemableUuid,
    int quantity = 1,
    String? notes,
    Version? version,
  }) async {
    final uuid = _vm.order?.uuid;
    if (uuid == null) return;
    final result = await _repo.addItem(
      uuid,
      itemableType: itemableType,
      itemableUuid: itemableUuid,
      quantity: quantity,
      notes: notes,
      version: version?.value,
    );
    result.when(success: _applyResponse, failure: _onError);
  }

  /// Elimina un ítem (solo OPEN, dueño del ítem o host).
  Future<void> removeItem(String itemUuid) async {
    final uuid = _vm.order?.uuid;
    if (uuid == null) return;
    final result = await _repo.removeItem(uuid, itemUuid);
    result.when(success: _applyResponse, failure: _onError);
  }

  /// F3a: genera (o reutiliza) el código de invitación de la orden.
  /// Motivo del último fallo al generar la invitación, para poder mostrar lo
  /// que dice el backend en vez de un genérico (e2e 2026-08-08).
  String? lastInviteError;

  Future<GroupInviteResponseDM?> createInvitation() async {
    final uuid = _vm.order?.uuid;
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

  /// Unirse a la orden (invitado autenticado).
  Future<void> join(String uuid) async {
    emit(GroupOrderState.loading(_vm));
    final result = await _repo.joinGroupOrder(uuid);
    result.when(success: _applyResponse, failure: _onError);
  }

  /// Genera el PaymentIntent de la parte del usuario actual. Devuelve la
  /// respuesta (con client_secret) para que la página confirme el pago con
  /// el Stripe PaymentSheet. El estado `paid` se sella vía webhook + refetch.
  ///
  /// F2b "yo invito": con [coverParticipantUuids] el pago cubre la parte de
  /// esos participantes (el monto lo calcula el backend: Σ remaining_due).
  Future<PayIntentResponseDM?> createPayIntent({
    List<String>? coverParticipantUuids,
    double? tipAmount,
    // Checkout hosteado en vez del PaymentSheet nativo: la única vía capaz de
    // ofrecer MB WAY. Comparte todo lo demás, así que comparte también este
    // método — el estado `isPaying` y el manejo de error son idénticos.
    bool hosted = false,
  }) async {
    final uuid = _vm.order?.uuid;
    if (uuid == null) return null;

    _vm = _vm.copyWith(isPaying: true, errorMessage: null);
    emit(GroupOrderState.loaded(_vm));

    final result = await (hosted
        ? _repo.createCheckoutSession(
            uuid,
            coverParticipantUuids: coverParticipantUuids,
            tipAmount: tipAmount,
          )
        : _repo.createPayIntent(
            uuid,
            coverParticipantUuids: coverParticipantUuids,
            tipAmount: tipAmount,
          ));
    return result.when(
      success: (r) {
        _vm = _vm.copyWith(isPaying: false);
        emit(GroupOrderState.loaded(_vm));
        return r;
      },
      failure: (e) {
        _logger.e(e);
        _vm = _vm.copyWith(isPaying: false, errorMessage: e.toString());
        emit(GroupOrderState.error(_vm, e.toString()));

        // Y se RE-LEE la orden (e2e 2026-08-14). Un pago puede fallar porque
        // el estado cambió por debajo: la ventana de la cuenta dura 30 minutos
        // y, vencida, el cron la reabre —`total_amount` y el `amount_due` de
        // cada comensal a 0, la cuenta des-pedida—. Sin esto la pantalla se
        // quedaba ofreciendo "Pagar la orden · €X" sobre algo que ya no
        // existía así, y cada toque repetía el mismo 409 sin explicar nada.
        //
        // El mensaje al comensal ya salió: la página lo muestra desde el
        // `listener` del BlocConsumer, que se dispara con el emit de arriba.
        // Este refetch emite `loaded` después y solo corrige los botones que
        // quedan debajo del aviso.
        //
        // Sin await a propósito: quien llamó necesita su `null` ya.
        // ignore: unawaited_futures
        _refetchSilently(uuid);

        return null;
      },
    );
  }

  // ── Helpers ────────────────────────────────────────────────────

  void _applyResponse(GroupOrderResponseDM r) {
    _vm = _vm.copyWith(
      order: r.groupOrder,
      myShare: r.myShare,
      myParticipantUuid: r.myParticipantUuid ?? _vm.myParticipantUuid,
      errorMessage: null,
    );
    emit(GroupOrderState.loaded(_vm));
  }

  void _onError(Object e) {
    _logger.e(e);
    _vm = _vm.copyWith(errorMessage: e.toString());
    emit(GroupOrderState.error(_vm, e.toString()));
  }
}
