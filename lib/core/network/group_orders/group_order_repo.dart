import 'dart:async';

import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/group_orders/group_order_client.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/data_models/group_orders/manager_orders_dm.dart';
import 'package:foodly_world/data_models/group_orders/stripe_connect_dm.dart';

/// Repositorio de Group Orders. Cada método envuelve la llamada del cliente en
/// un `ApiResult<T>` (mismo patrón que ReservationRepo).
class GroupOrderRepo {
  final GroupOrderClient _client;

  // Ya no puede ser `const`: el coalescer de abajo necesita estado.
  GroupOrderRepo({required GroupOrderClient client}) : _client = client;

  /// Lecturas que comparte UN MISMO evento, por uuid.
  ///
  /// Dos cubits del mismo cliente observan el mismo canal
  /// `private-group-order.{uuid}` —la página (`group_order_cubit.dart:51`) y
  /// el chip flotante (`active_group_order_cubit.dart:354`)— y ante un evento
  /// los dos llaman aquí con el mismo uuid. Sin esto salían DOS peticiones
  /// idénticas por evento y por dispositivo: en una mesa de 8 con la página y
  /// el chip vivos, una mutación pasaba de 8 lecturas de la orden completa a
  /// 16, y cada una son ~20 consultas a Neon a 35 ms de ida y vuelta.
  ///
  /// **La ventana es UN TURNO SÍNCRONO, no "hasta que la petición termine".**
  /// Esto es lo que hace que el coalescer sea correcto y no solo barato:
  /// `ChannelListeners.notificar()` avisa a los dos oyentes en el mismo turno,
  /// así que un turno basta para colapsarlos. Y un evento POSTERIOR no puede
  /// colgarse de una petición que salió antes de la mutación que lo causó
  /// —recibiría una foto que por construcción no la contiene, y no hay nada
  /// que lo recupere: el polling de 10 s solo corre con el socket caído—.
  ///
  /// De regalo, una petición que no termina nunca —móvil que pasa de WiFi a
  /// datos, y este Dio no fija `receiveTimeout`— no puede dejar la orden muda
  /// el resto de la sesión, y el mapa no puede crecer entre sesiones.
  ///
  /// No es una caché: nadie reusa nada fuera de ese turno.
  final Map<String, Future<ApiResult<GroupOrderResponseDM>>> _lecturasDelTurno = {};

  Future<ApiResult<GroupOrdersListResponseDM>> getMyGroupOrders() async {
    try {
      return ApiResult.success(await _client.getMyGroupOrders());
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// Lee una orden.
  ///
  /// [coalesce] solo para las lecturas disparadas por un EVENTO de realtime,
  /// donde varios oyentes del MISMO evento piden lo mismo en el mismo turno y
  /// da igual quién dispare la petición de verdad.
  ///
  /// **Nunca para una lectura que sigue a una mutación propia.** Ahí hay que
  /// pedir de nuevo: una petición en vuelo salió ANTES de la mutación, y
  /// colgarse de ella devolvería el estado anterior. Es justo lo que hace
  /// `cancelPayment()`, que re-lee para que el pie deje de decir
  /// "confirmando"; con el estado viejo se quedaría diciéndolo. Hay un test
  /// que fija esto.
  Future<ApiResult<GroupOrderResponseDM>> getGroupOrder(String uuid, {bool coalesce = false}) {
    if (!coalesce) return _leerOrden(uuid);

    final delTurno = _lecturasDelTurno[uuid];
    if (delTurno != null) return delTurno;

    final lectura = _leerOrden(uuid);
    _lecturasDelTurno[uuid] = lectura;

    // Se suelta al acabar el turno, NO al acabar la petición. Los microtasks
    // se drenan antes de volver al bucle de eventos, así que el próximo
    // evento de Pusher siempre encuentra el mapa limpio.
    //
    // El `identical` es DEFENSIVO y hoy está muerto: entre que una entrada se
    // registra y corre su microtask no hay ninguna otra vía de borrado, así
    // que el mapa sólo puede tener esa misma entrada o ninguna. No conseguí
    // —ni la revisión— construir una secuencia que lo necesite. Se queda
    // porque pasaría a hacer falta en cuanto alguien ensanche el borrado
    // (un `clear()`, por ejemplo, que sí es distinguible: ver el test).
    scheduleMicrotask(() {
      if (identical(_lecturasDelTurno[uuid], lectura)) _lecturasDelTurno.remove(uuid);
    });

    return lectura;
  }

  Future<ApiResult<GroupOrderResponseDM>> _leerOrden(String uuid) async {
    try {
      return ApiResult.success(await _client.getGroupOrder(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> createGroupOrder({
    required String businessUuid,
    String? branchUuid,
    String? reservationUuid,
    String? origin,
    String? tableLabel,
  }) async {
    try {
      return ApiResult.success(await _client.createGroupOrder(
        businessUuid: businessUuid,
        branchUuid: branchUuid,
        reservationUuid: reservationUuid,
        origin: origin,
        tableLabel: tableLabel,
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F2c §B.1: [splitMode] = 'by_items' | 'equal_split' (null → default backend).
  Future<ApiResult<GroupOrderResponseDM>> lockGroupOrder(
    String uuid, {
    String? splitMode,
    String? tableLabel,
  }) async {
    try {
      return ApiResult.success(await _client.lockGroupOrder(uuid, splitMode: splitMode, tableLabel: tableLabel));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F2c: edita un ítem (cantidad/notas/compartido) mientras la orden está OPEN.
  Future<ApiResult<GroupOrderResponseDM>> updateItem(
    String uuid,
    String itemUuid, {
    int? quantity,
    String? notes,
    bool? shared,
  }) async {
    try {
      return ApiResult.success(await _client.updateItem(
        uuid,
        itemUuid,
        quantity: quantity,
        notes: notes,
        shared: shared,
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F2b §C.1 — reabre una orden cerrada sin pagos (solo host).
  Future<ApiResult<GroupOrderResponseDM>> unlockGroupOrder(String uuid) async {
    try {
      return ApiResult.success(await _client.unlockGroupOrder(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F2b §A.1 — transfiere la titularidad a otro participante (solo host).
  Future<ApiResult<GroupOrderResponseDM>> transferHost(
    String uuid, {
    required String participantUuid,
  }) async {
    try {
      return ApiResult.success(
        await _client.transferHost(uuid, participantUuid: participantUuid),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> cancelGroupOrder(String uuid) async {
    try {
      return ApiResult.success(await _client.cancelGroupOrder(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  // ── F4a-6: onboarding de pagos (Stripe Connect) ────────────────

  Future<ApiResult<StripeConnectStatusDM>> stripeStatus(String businessUuid) async {
    try {
      return ApiResult.success(await _client.stripeStatus(businessUuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<StripeOnboardResponseDM>> stripeOnboard(String businessUuid) async {
    try {
      return ApiResult.success(await _client.stripeOnboard(businessUuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  // ── F4a: panel "Órdenes en vivo" (solo dueño) ──────────────────

  Future<ApiResult<ManagerOrdersResponseDM>> managerOrders(
    String businessUuid, {
    String? bucket,
    int? page,
  }) async {
    try {
      return ApiResult.success(
        await _client.managerOrders(businessUuid, bucket: bucket, page: page),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F4a.1: historial con keyset pagination.
  Future<ApiResult<ManagerHistoryResponseDM>> managerOrderHistory(
    String businessUuid, {
    String? before,
    int? limit,
  }) async {
    try {
      return ApiResult.success(
        await _client.managerOrderHistory(businessUuid, before: before, limit: limit),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> managerSetFulfillment(
    String uuid, {
    required String status,
  }) async {
    try {
      return ApiResult.success(await _client.managerSetFulfillment(uuid, status: status));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> managerSetItemDelivered(
    String uuid,
    String itemUuid, {
    required bool delivered,
  }) async {
    try {
      return ApiResult.success(
        await _client.managerSetItemDelivered(uuid, itemUuid, delivered: delivered),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F4b.1: anula/restaura un ítem (plato devuelto — no se cobra).
  Future<ApiResult<GroupOrderResponseDM>> managerSetItemVoided(
    String uuid,
    String itemUuid, {
    required bool voided,
    String? reason,
  }) async {
    try {
      return ApiResult.success(
        await _client.managerSetItemVoided(uuid, itemUuid, voided: voided, reason: reason),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> managerDeliverAll(String uuid) async {
    try {
      return ApiResult.success(await _client.managerDeliverAll(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> managerSetTable(
    String uuid, {
    String? tableLabel,
  }) async {
    try {
      return ApiResult.success(await _client.managerSetTable(uuid, tableLabel: tableLabel));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F4b: el negocio cierra una cuenta cobrada en caja (o impagada). No cobra
  /// comisión — Foodly no procesó el dinero.
  Future<ApiResult<GroupOrderResponseDM>> managerCloseTab(
    String uuid, {
    required String reason,
  }) async {
    try {
      return ApiResult.success(await _client.managerCloseTab(uuid, reason: reason));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// Corrige el motivo de una orden ya cerrada (impagada ↔ cobrada en caja).
  Future<ApiResult<GroupOrderResponseDM>> managerAmendClosure(
    String uuid, {
    required String reason,
  }) async {
    try {
      return ApiResult.success(await _client.managerAmendClosure(uuid, reason: reason));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F4b (cuenta abierta): manda la tanda actual a cocina, sin pago.
  Future<ApiResult<GroupOrderResponseDM>> sendBatch(String uuid, {String? tableLabel}) async {
    try {
      return ApiResult.success(await _client.sendBatch(uuid, tableLabel: tableLabel));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F4b: pide la cuenta (congela el agregado y habilita el checkout).
  Future<ApiResult<GroupOrderResponseDM>> requestBill(
    String uuid, {
    String? splitMode,
    String? tableLabel,
  }) async {
    try {
      return ApiResult.success(await _client.requestBill(uuid, splitMode: splitMode, tableLabel: tableLabel));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F4b: la mesa avisa que paga en caja (el negocio confirma al cobrar).
  Future<ApiResult<GroupOrderResponseDM>> requestCashPayment(String uuid) async {
    try {
      return ApiResult.success(await _client.requestCashPayment(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F4b: deshace el aviso de pago en caja.
  Future<ApiResult<GroupOrderResponseDM>> cancelCashPayment(String uuid) async {
    try {
      return ApiResult.success(await _client.cancelCashPayment(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F4b: modo de cobro del negocio (solo dueño).
  /// F4c: enciende (o apaga) el servicio en mesa. Lo usa el generador de
  /// QRs por mesa: imprimir un lote de mesas numeradas YA declara "tengo
  /// mesas", y pedirle al dueño que además lo marque en otra pantalla sería
  /// hacerle decir dos veces lo mismo.
  Future<ApiResult<void>> updateTableService(String businessUuid, {required bool tableService}) async {
    try {
      await _client.updateTableService(businessUuid, tableService: tableService);

      return const ApiResult.success(null);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<PaymentModeResponseDM>> updatePaymentMode(
    String businessUuid, {
    required String mode,
    int? cardMinAmountMinor,
    bool? tableService,
  }) async {
    try {
      return ApiResult.success(await _client.updatePaymentMode(
        businessUuid,
        paymentModeBody(
          mode: mode,
          cardMinAmountMinor: cardMinAmountMinor,
          tableService: tableService,
        ),
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F4a (caso bar): siguiente ronda de la mesa.
  Future<ApiResult<GroupOrderResponseDM>> nextRound(String uuid) async {
    try {
      return ApiResult.success(await _client.nextRound(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// e2e r4: host elimina definitivamente una orden vacía.
  Future<ApiResult<bool>> deleteGroupOrder(String uuid) async {
    try {
      await _client.deleteGroupOrder(uuid);
      return const ApiResult.success(true);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// e2e r4: miembro sin ítems propios abandona la orden.
  Future<ApiResult<bool>> leaveGroupOrder(String uuid) async {
    try {
      await _client.leaveGroupOrder(uuid);
      return const ApiResult.success(true);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> joinGroupOrder(String uuid) async {
    try {
      return ApiResult.success(await _client.joinGroupOrder(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F3a: unirse con código corto de invitación.
  Future<ApiResult<GroupOrderResponseDM>> joinByCode(String code) async {
    try {
      return ApiResult.success(await _client.joinByCode(code: code));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> removeParticipant(
    String uuid,
    String participantUuid,
  ) async {
    try {
      return ApiResult.success(await _client.removeParticipant(uuid, participantUuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> addItem(
    String uuid, {
    required String itemableType,
    required String itemableUuid,
    required int quantity,
    String? notes,
    String? version,
  }) async {
    try {
      return ApiResult.success(await _client.addItem(
        uuid,
        itemableType: itemableType,
        itemableUuid: itemableUuid,
        quantity: quantity,
        notes: notes,
        version: version,
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupOrderResponseDM>> removeItem(String uuid, String itemUuid) async {
    try {
      return ApiResult.success(await _client.removeItem(uuid, itemUuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<GroupInviteResponseDM>> createInvitation(String uuid) async {
    try {
      return ApiResult.success(await _client.createInvitation(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// F2b "yo invito": con [coverParticipantUuids] el pago cubre la parte de
  /// esos participantes (monto server-side).
  Future<ApiResult<PayIntentResponseDM>> createPayIntent(
    String uuid, {
    List<String>? coverParticipantUuids,
    double? tipAmount,
  }) async {
    try {
      return ApiResult.success(await _client.createPayIntent(
        uuid,
        coverParticipantUuids: coverParticipantUuids,
        tipAmount: tipAmount,
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// Checkout hosteado (MB WAY y demás métodos fuera del PaymentSheet nativo).
  Future<ApiResult<PayIntentResponseDM>> createCheckoutSession(
    String uuid, {
    List<String>? coverParticipantUuids,
    double? tipAmount,
  }) async {
    try {
      return ApiResult.success(await _client.createCheckoutSession(
        uuid,
        coverParticipantUuids: coverParticipantUuids,
        tipAmount: tipAmount,
      ));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  /// Suelta el intento de pago en vuelo (ver `GroupOrderClient.cancelPayment`).
  ///
  /// Falla —409— cuando Stripe dice que el dinero YA está comprometido: el
  /// comensal que autoriza en la app de su banco no puede perder su pago
  /// porque tocó atrás.
  Future<ApiResult<void>> cancelPayment(String uuid) async {
    try {
      await _client.cancelPayment(uuid);

      return const ApiResult.success(null);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
