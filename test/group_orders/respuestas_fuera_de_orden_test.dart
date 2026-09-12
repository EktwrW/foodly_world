import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/network/group_orders/group_order_client.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/core/services/group_order_realtime_service.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/group_order_cubit.dart';
import 'package:logger/logger.dart';

/// La orden se quedaba rancia por RESPUESTAS FUERA DE ORDEN.
///
/// Llegan dos eventos de Pusher en turnos distintos. L1 (del evento viejo) y L2
/// (del nuevo, que trae la mutación) salen las dos — el coalescer de la PR #69
/// no las junta, y hace bien: viven en turnos distintos. Si L2 responde ANTES
/// que L1, la respuesta de L1 se aplica después y **pisa el estado nuevo**. La
/// orden se queda mostrando datos anteriores a la última mutación hasta el
/// siguiente evento, un resume o abrir/cerrar la página: el polling de 10 s no
/// rescata nada porque sólo corre con el socket caído
/// (`group_order_realtime_service.dart:237` lo apaga al conectar).
///
/// No es una regresión de la #69 — pasaba antes y ella lo estrecha (de 2
/// peticiones en vuelo por evento a 1), pero no lo cierra.
///
/// La guarda es un contador POR CUBIT que sube al lanzar una lectura y con
/// cada cambio de estado. Una respuesta cuya generación ya no es la última
/// salió antes de algo que ya se aplicó: llega tarde y se descarta.
void main() {
  group('la página: una respuesta que llega tarde no pisa el estado nuevo', () {
    late _ClienteFalso cliente;
    late GroupOrderRepo repo;
    late _RealtimeEspia realtime;
    late GroupOrderCubit cubit;

    setUp(() {
      cliente = _ClienteFalso();
      repo = GroupOrderRepo(client: cliente);
      realtime = _RealtimeEspia();
      cubit = GroupOrderCubit(repo: repo, logger: _mudo, realtime: realtime);
    });

    tearDown(() => cubit.close());

    /// EL BUG. Verificado con los cubits reales durante la revisión de la #69.
    test('la respuesta del evento VIEJO no pisa la del NUEVO', () async {
      final carga = cubit.load('o1');
      cliente.responder(0, mesa: 'inicial');
      await carga;

      // Dos eventos en TURNOS DISTINTOS, como llegan los de Pusher de verdad.
      // Por eso el coalescer no los junta y salen dos peticiones.
      realtime.tocar(); // L1: evento viejo
      await _turno();
      realtime.tocar(); // L2: evento nuevo, el que trae la mutación
      await _turno();

      expect(cliente.peticiones, 3, reason: 'carga + un evento por turno');

      // La carrera: L2 vuelve ANTES que L1.
      cliente.responder(2, mesa: 'con-la-mutacion');
      await _turno();
      cliente.responder(1, mesa: 'inicial');
      await _turno();

      expect(cubit.vm.order?.tableLabel, 'con-la-mutacion',
          reason: 'L1 salió antes de la mutación: su foto no puede contenerla');
    });

    /// El control que impide que la guarda pase por el motivo equivocado:
    /// descartarlo TODO también haría verde al test de arriba.
    test('en orden normal la última respuesta sí se aplica', () async {
      final carga = cubit.load('o1');
      cliente.responder(0, mesa: 'inicial');
      await carga;

      realtime.tocar();
      await _turno();
      cliente.responder(1, mesa: 'nueva');
      await _turno();

      expect(cubit.vm.order?.tableLabel, 'nueva');
    });

    /// La otra mitad del mismo fallo, y la que se ve en la cara del comensal:
    /// el host cierra la cuenta, la pantalla pasa a "cerrada", y un refetch de
    /// un evento ANTERIOR vuelve y la reabre.
    test('una lectura en vuelo no pisa el resultado de una mutación propia', () async {
      final carga = cubit.load('o1');
      cliente.responder(0, mesa: 'inicial');
      await carga;

      realtime.tocar(); // L1 sale ahora, ANTES de que el host cierre
      await _turno();

      final cierre = cubit.lock();
      cliente.responder(2, mesa: 'cerrada');
      await cierre;
      expect(cubit.vm.order?.tableLabel, 'cerrada');

      cliente.responder(1, mesa: 'inicial'); // L1 llega tarde
      await _turno();

      expect(cubit.vm.order?.tableLabel, 'cerrada',
          reason: 'una lectura anterior al cierre no puede reabrir la cuenta');
    });

    /// Y el pull-to-refresh no puede quedar mudo por la guarda: no hay nada
    /// más nuevo en vuelo, así que su respuesta se aplica.
    test('el pull-to-refresh sigue aplicando su respuesta', () async {
      final carga = cubit.load('o1');
      cliente.responder(0, mesa: 'inicial');
      await carga;

      final aMano = cubit.refetch();
      cliente.responder(1, mesa: 'a-mano');
      await aMano;

      expect(cubit.vm.order?.tableLabel, 'a-mano');
    });
  });

  group('el chip: mismo fallo, estado propio', () {
    late _ClienteFalso cliente;
    late GroupOrderRepo repo;
    late ActiveGroupOrderCubit cubit;

    setUp(() {
      cliente = _ClienteFalso();
      repo = GroupOrderRepo(client: cliente);
      cubit = ActiveGroupOrderCubit(repo: repo, logger: _mudo);
    });

    tearDown(() => cubit.close());

    test('la respuesta vieja no pisa a la nueva', () async {
      final join = cubit.joinWithCode('ABC123');
      cliente.responder(0, mesa: 'inicial');
      await join;

      final vieja = cubit.refresh();
      final nueva = cubit.refresh();

      cliente.responder(2, mesa: 'con-la-mutacion');
      await nueva;
      cliente.responder(1, mesa: 'inicial');
      await vieja;

      expect(cubit.state?.tableLabel, 'con-la-mutacion');
    });

    /// EL BUMP AL LANZAR, que es la otra mitad de la guarda y no estaba medido
    /// (lo encontró la revisión). Aquí las respuestas llegan EN ORDEN: si el
    /// contador sólo subiera al aplicar, la primera en volver ganaría y la
    /// segunda —más nueva— se descartaría.
    test('en orden, gana la ÚLTIMA lanzada y no la primera en volver', () async {
      final join = cubit.joinWithCode('ABC123');
      cliente.responder(0, mesa: 'inicial');
      await join;

      final vieja = cubit.refresh();
      final nueva = cubit.refresh();

      cliente.responder(1, mesa: 'vieja'); // la primera vuelve primero
      await vieja;
      cliente.responder(2, mesa: 'nueva');
      await nueva;

      expect(cubit.state?.tableLabel, 'nueva');
    });

    /// El caso que NO es sólo cosmético: `refresh()` trata el 404 y el 403 como
    /// "la orden dejó de ser mía" y llama a `end()`, que vacía el carrito. Un
    /// 404 de la orden ANTERIOR, llegando tarde, borraba la orden a la que el
    /// comensal acababa de unirse.
    test('un 404 de la orden ANTERIOR no vacía el carrito nuevo', () async {
      final primerJoin = cubit.joinWithCode('ABC123');
      cliente.responder(0, mesa: 'mesa-A', uuid: 'oA');
      await primerJoin;

      final lecturaDeA = cubit.refresh(); // sale para oA y se queda en vuelo

      final segundoJoin = cubit.joinWithCode('DEF456');
      cliente.responder(2, mesa: 'mesa-B', uuid: 'oB');
      await segundoJoin;
      expect(cubit.state?.uuid, 'oB');

      final antes = cliente.peticiones;
      cliente.fallar(1, 404); // oA ya no existe, y la respuesta llega ahora
      await lecturaDeA;
      await _turno();

      expect(cubit.state?.uuid, 'oB', reason: 'el 404 era de la orden vieja');
      expect(cliente.peticiones, antes,
          reason: 'un veredicto sobre OTRA orden no merece ni una re-lectura');
    });

    /// LA MUTACIÓN QUE SOBREVIVIÓ AL PRIMER BARRIDO, y por eso está este caso.
    ///
    /// Yo había razonado que el `_generacion++` explícito de `end()` NO es
    /// redundante con el de `onChange` —bloc deduplica emisiones iguales, así
    /// que `emit(null)` sobre un estado ya null no dispara `onChange`— pero eso
    /// era un argumento, no una medida: quitarlo no ponía nada en rojo.
    ///
    /// Y es el caso para el que nació el contador: `syncAnyActive` sólo corre
    /// con el estado en null, así que si la sesión se limpia mientras `/mine`
    /// viaja, sin el bump explícito el chip repoblaba igual — resucitando la
    /// orden del usuario anterior.
    /// OJO CON LA SECUENCIA: bloc deduplica `state == _state && _emitted`, y
    /// `_emitted` es false hasta la PRIMERA emisión. En un cubit recién nacido
    /// `emit(null)` sí propaga, así que el caso no se reproduce y el test pasa
    /// con la mutación puesta — que es como quedó mi primer intento. Hay que
    /// estrenar el cubit antes.
    test('cerrar sesión mientras /mine viaja no resucita la orden', () async {
      final join = cubit.joinWithCode('ABC123');
      cliente.responder(0, mesa: 'del-usuario-anterior');
      await join;
      cubit.end(); // el carrito se vacía: a partir de aquí bloc ya deduplica
      expect(cubit.state, isNull);

      final sync = cubit.syncAnyActive(); // sólo corre con el estado en null

      cubit.resetForLogout(); // emite null SOBRE null: bloc no lo propaga
      cliente.responderMine('oA');
      await sync;

      expect(cubit.state, isNull, reason: 'esa orden es del usuario que se fue');
    });

    /// CUARTO HALLAZGO, y lo predijo la revisión antes de que existiera el
    /// código: juzgar el 404/403 SÓLO por uuid es más débil que la generación
    /// en un eje. El host me saca de la mesa (su evento lanza R1, que dará
    /// 403) y dentro de esa ventana me vuelvo a unir: MISMO uuid, así que el
    /// 403 tardío me vaciaba el carrito al que acababa de volver.
    ///
    /// Por eso una respuesta que llegó tarde no se cree a ciegas: se vuelve a
    /// preguntar una vez. Si de verdad ya no es mía, el reintento lo confirma.
    test('un 403 tardío no me echa de la orden a la que acabo de volver', () async {
      final j1 = cubit.joinWithCode('ABC123');
      cliente.responder(0, mesa: 'antes');
      await j1;

      final r1 = cubit.refresh(); // del evento: me sacaron de la mesa

      final j2 = cubit.joinWithCode('ABC123'); // me re-uno, MISMO uuid
      cliente.responder(2, mesa: 'me-reuni');
      await j2;

      cliente.fallar(1, 403); // R1 llega ahora
      await r1;
      await _turno();
      cliente.responder(3, mesa: 'me-reuni'); // el reintento: sigue siendo mía
      await _turno();

      expect(cubit.state?.tableLabel, 'me-reuni');
    });

    /// Y el reintento no puede tapar un borrado de verdad: si la orden ya no
    /// existe, el reintento vuelve a dar 404 y ahí sí se vacía.
    test('pero si el reintento confirma el 404, el carrito se vacía', () async {
      final join = cubit.joinWithCode('ABC123');
      cliente.responder(0, mesa: 'inicial');
      await join;

      final lectura = cubit.refresh();
      final plato = cubit.addFood('food', 'f1', version: Version.regular);
      cliente.responder(2, mesa: 'con-plato');
      await plato;

      cliente.fallar(1, 404);
      await lectura;
      await _turno();
      expect(cliente.peticiones, 4, reason: 'el reintento sale una vez');

      cliente.fallar(3, 404); // el reintento lo confirma
      await _turno();

      expect(cubit.state, isNull);
      expect(cliente.peticiones, 4, reason: 'y no se reintenta el reintento');
    });

    /// El TOPE del reintento. Sólo se distingue si algo emite MIENTRAS el
    /// reintento viaja: sin tope, ese reintento vuelve a llegar «tarde» y pide
    /// otro, y otro, mientras siga habiendo actividad. Una cadena sin fin de
    /// peticiones sobre una orden que ya no existe.
    test('el reintento es la última palabra, no encadena otro', () async {
      final join = cubit.joinWithCode('ABC123');
      cliente.responder(0, mesa: 'inicial');
      await join;

      final lectura = cubit.refresh();
      final plato = cubit.addFood('food', 'f1', version: Version.regular);
      cliente.responder(2, mesa: 'con-plato');
      await plato;

      cliente.fallar(1, 404);
      await lectura;
      await _turno();
      expect(cliente.peticiones, 4, reason: 'salió el reintento');

      // Otra emisión MIENTRAS el reintento viaja: vuelve a dejarlo «tarde».
      final otro = cubit.addFood('food', 'f2', version: Version.regular);
      cliente.responder(4, mesa: 'con-otro-plato');
      await otro;

      cliente.fallar(3, 404); // el reintento lo confirma igual
      await _turno();

      expect(cubit.state, isNull, reason: 'el reintento ya preguntó: se acabó');
      expect(cliente.peticiones, 5, reason: 'y no encadena un tercero');
    });

    /// TERCER HALLAZGO DE LA REVISIÓN: `syncForBusiness` tenía la misma
    /// carrera y ninguna guarda. Se llama al abrir el menú de un negocio, así
    /// que basta con cerrar sesión antes de que vuelva `/mine`.
    test('cerrar sesión mientras syncForBusiness viaja no repuebla el chip', () async {
      final join = cubit.joinWithCode('ABC123');
      cliente.responder(0, mesa: 'inicial');
      await join;
      cubit.end(); // bloc ya deduplica a partir de aquí

      final sync = cubit.syncForBusiness('b1');
      cubit.resetForLogout();
      cliente.responderMine('oA');
      await sync;

      expect(cubit.state, isNull);
    });

    /// EL CONTROL QUE FALTABA, y lo señaló la revisión: sin él, una guarda que
    /// descarte SIEMPRE pasa el banco — y eso apagaría la recuperación en frío
    /// del carrito (F4a: quien pagó y cerró la app no tendría camino de vuelta).
    test('sin nada que la invalide, /mine SÍ adopta la orden', () async {
      final sync = cubit.syncAnyActive();
      cliente.responderMine('oA');
      await sync;

      expect(cubit.state?.uuid, 'oA');
    });

    /// El control: un 404 de la orden que SÍ está en pantalla tiene que seguir
    /// vaciando el carrito. Es la razón por la que ese `end()` existe.
    test('pero el 404 de la orden ACTUAL sigue vaciando el carrito', () async {
      final join = cubit.joinWithCode('ABC123');
      cliente.responder(0, mesa: 'inicial');
      await join;

      final lectura = cubit.refresh();
      cliente.fallar(1, 404);
      await lectura;

      expect(cubit.state, isNull, reason: 'el host la borró: el chip se va');
    });
  });

  /// `isClosed`: quitarlo no ponía nada en rojo (lo vio la revisión). Emitir
  /// sobre un cubit cerrado lanza `StateError`, y una lectura en vuelo
  /// sobrevive al cierre de la pantalla.
  group('cerrar la pantalla con una lectura en vuelo', () {
    test('la página no revienta al volver la respuesta', () async {
      final cliente = _ClienteFalso();
      final realtime = _RealtimeEspia();
      final cubit = GroupOrderCubit(repo: GroupOrderRepo(client: cliente), logger: _mudo, realtime: realtime);
      final carga = cubit.load('o1');
      cliente.responder(0, mesa: 'inicial');
      await carga;

      realtime.tocar(); // lectura en vuelo
      await _turno();
      await cubit.close();

      cliente.responder(1, mesa: 'tarde');
      await expectLater(_turno(), completes);
    });

    test('y el chip tampoco', () async {
      final cliente = _ClienteFalso();
      final cubit = ActiveGroupOrderCubit(repo: GroupOrderRepo(client: cliente), logger: _mudo);
      final join = cubit.joinWithCode('ABC123');
      cliente.responder(0, mesa: 'inicial');
      await join;

      final lectura = cubit.refresh();
      await cubit.close();

      cliente.responder(1, mesa: 'tarde');
      await expectLater(lectura, completes);
    });
  });

  /// LO QUE ENCONTRÓ LA REVISIÓN INDEPENDIENTE, y que la primera versión de
  /// esta guarda ROMPÍA. El contador subía con CADA emisión, así que emisiones
  /// que NO traen una foto del servidor —`loading`, `error`, el `isPaying` del
  /// pago— mataban la lectura que venía con la verdad. Y de esas no se vuelve:
  /// el evento que la disparó ya se gastó y el polling de 10 s está apagado con
  /// el socket sano.
  group('sólo una foto del servidor puede invalidar una lectura', () {
    late _ClienteFalso cliente;
    late GroupOrderRepo repo;
    late _RealtimeEspia realtime;
    late GroupOrderCubit cubit;

    setUp(() async {
      cliente = _ClienteFalso();
      repo = GroupOrderRepo(client: cliente);
      realtime = _RealtimeEspia();
      cubit = GroupOrderCubit(repo: repo, logger: _mudo, realtime: realtime);
      final carga = cubit.load('o1');
      cliente.responder(0, mesa: 'abierta');
      await carga;
    });

    tearDown(() => cubit.close());

    /// El host cierra la cuenta; su evento lanza L1. Antes de que L1 vuelva, el
    /// comensal toca "compartir" un ítem y el backend responde 409 porque la
    /// orden YA está cerrada. Ese error no sabe nada de la orden: no puede
    /// tapar la única lectura que traía el cierre.
    test('una mutación que FALLA no mata la lectura que traía el cierre', () async {
      realtime.tocar(); // L1, del evento del cierre
      await _turno();

      final fallo = cubit.setItemShared('i1', true);
      cliente.fallar(2, 409);
      await fallo;

      cliente.responder(1, mesa: 'cerrada'); // L1 llega ahora
      await _turno();

      expect(cubit.vm.order?.tableLabel, 'cerrada',
          reason: 'un 409 no trae foto: no puede invalidar nada');
    });

    /// `createPayIntent` emite `isPaying` ANTES de pedir, y su rama de éxito
    /// sólo apaga el flag — nunca vuelve a leer la orden. Si ese emit mata la
    /// lectura en vuelo, la pantalla se queda con la foto anterior al evento.
    test('abrir el pago no mata la lectura en vuelo', () async {
      realtime.tocar();
      await _turno();

      cubit.createPayIntent(); // emite isPaying y se queda esperando a Stripe
      await _turno();

      cliente.responder(1, mesa: 'con-el-plato-nuevo');
      await _turno();

      expect(cubit.vm.order?.tableLabel, 'con-el-plato-nuevo');
    });

    /// El control de este grupo: una mutación con ÉXITO sí trae foto, así que
    /// sí tiene que invalidar lo que salió antes que ella.
    test('pero una mutación con ÉXITO sigue invalidando lo anterior', () async {
      realtime.tocar(); // L1 sale antes del cierre
      await _turno();

      final cierre = cubit.lock();
      cliente.responder(2, mesa: 'cerrada');
      await cierre;

      cliente.responder(1, mesa: 'abierta'); // L1 llega tarde
      await _turno();

      expect(cubit.vm.order?.tableLabel, 'cerrada');
    });
  });

  /// LA RESTRICCIÓN DE LA #69. El coalescer hace que los dos oyentes del mismo
  /// evento compartan UN Future. Si la generación viviera en el repo —el
  /// "punto común" que parece más limpio— el lanzamiento del segundo cubit
  /// invalidaría la lectura del primero sobre la MISMA petición, y uno de los
  /// dos se quedaría sin aplicar. Por eso el contador es POR CUBIT.
  group('convive con el coalescer de la #69', () {
    late _ClienteFalso cliente;
    late GroupOrderRepo repo;
    late _RealtimeEspia realtime;
    late GroupOrderCubit pagina;
    late ActiveGroupOrderCubit chip;

    setUp(() async {
      cliente = _ClienteFalso();
      repo = GroupOrderRepo(client: cliente);
      realtime = _RealtimeEspia();
      pagina = GroupOrderCubit(repo: repo, logger: _mudo, realtime: realtime);
      chip = ActiveGroupOrderCubit(repo: repo, logger: _mudo, realtime: realtime);

      final carga = pagina.load('o1');
      cliente.responder(0, mesa: 'inicial');
      await carga;

      final join = chip.joinWithCode('ABC123');
      cliente.responder(1, mesa: 'inicial');
      await join;
      await _turno(); // `watchActive` cuelga de `onChange` y se suscribe tarde

      expect(realtime.oyentes, 2, reason: 'hacen falta los dos suscritos');
    });

    tearDown(() async {
      await pagina.close();
      await chip.close();
    });

    test('un evento, UNA petición, y los DOS cubits la aplican', () async {
      final antes = cliente.peticiones;

      realtime.tocar(); // como `ChannelListeners.notificar()`: mismo turno
      expect(cliente.peticiones, antes + 1, reason: 'el coalescer sigue vivo');

      cliente.responder(antes, mesa: 'nueva');
      await _turno();

      expect(pagina.vm.order?.tableLabel, 'nueva');
      expect(chip.state?.tableLabel, 'nueva',
          reason: 'comparten el Future: los dos tienen que poder aplicarlo');
    });

    /// Generaciones independientes, dicho al revés: que el chip lea por su
    /// cuenta no puede callar la lectura en vuelo de la página.
    test('una lectura del chip no invalida la de la página', () async {
      realtime.tocar(); // petición compartida, se queda en vuelo
      final compartida = cliente.peticiones - 1;

      final delChip = chip.refresh(); // lectura EXTRA, sólo del chip
      cliente.responder(compartida + 1, mesa: 'del-chip');
      await delChip;

      cliente.responder(compartida, mesa: 'del-evento');
      await _turno();

      expect(pagina.vm.order?.tableLabel, 'del-evento',
          reason: 'el contador del chip no manda sobre el de la página');
    });
  });
}

/// Un turno del bucle de eventos: drena los microtasks pendientes, que es como
/// llegan encadenadas las continuaciones de `await`.
Future<void> _turno() => Future<void>.delayed(Duration.zero);

final _mudo = Logger(level: Level.off);

/// Cliente con respuestas a mano. La cola es CRONOLÓGICA y común a lecturas y
/// mutaciones: el índice es el orden en que las peticiones SALIERON, y
/// `responder` elige en qué orden VUELVEN. Es lo único que permite montar una
/// carrera determinista.
class _ClienteFalso implements GroupOrderClient {
  final List<Completer<GroupOrderResponseDM>> _pendientes = [];

  int get peticiones => _pendientes.length;

  @override
  Future<GroupOrderResponseDM> getGroupOrder(String uuid) => _encolar();

  @override
  Future<GroupOrderResponseDM> joinByCode({required String code}) => _encolar();

  final List<Completer<GroupOrdersListResponseDM>> _pendientesMine = [];

  @override
  Future<GroupOrdersListResponseDM> getMyGroupOrders() {
    final c = Completer<GroupOrdersListResponseDM>();
    _pendientesMine.add(c);
    return c.future;
  }

  void responderMine(String uuid) => _pendientesMine.removeAt(0).complete(
        GroupOrdersListResponseDM(
          groupOrders: [GroupOrderDM(uuid: uuid, businessUuid: 'b1')],
        ),
      );

  @override
  Future<GroupOrderResponseDM> lockGroupOrder(
    String uuid, {
    String? splitMode,
    String? tableLabel,
  }) =>
      _encolar();

  @override
  Future<GroupOrderResponseDM> addItem(
    String uuid, {
    required String itemableType,
    required String itemableUuid,
    required int quantity,
    String? notes,
    bool? shared,
    String? version,
  }) =>
      _encolar();

  @override
  Future<GroupOrderResponseDM> updateItem(
    String uuid,
    String itemUuid, {
    int? quantity,
    String? notes,
    bool? shared,
  }) =>
      _encolar();

  /// Se queda SIEMPRE en vuelo: las sondas del pago sólo necesitan el `emit`
  /// de `isPaying` que sale ANTES del await.
  @override
  Future<PayIntentResponseDM> createPayIntent(
    String uuid, {
    List<String>? coverParticipantUuids,
    double? tipAmount,
  }) =>
      Completer<PayIntentResponseDM>().future;

  Future<GroupOrderResponseDM> _encolar() {
    final c = Completer<GroupOrderResponseDM>();
    _pendientes.add(c);
    return c.future;
  }

  /// [mesa] va en `table_label` sólo para poder ver CUÁL respuesta se aplicó.
  void responder(int indice, {required String mesa, String uuid = 'o1'}) =>
      _pendientes[indice].complete(GroupOrderResponseDM(
        groupOrder: GroupOrderDM(uuid: uuid, businessUuid: 'b1', tableLabel: mesa),
      ));

  /// Siempre DioException: `AppRequestException.toString()` para errores que no
  /// son de Dio pasa por `di<BaseConfig>()` y `S.current`, que no existen en un
  /// test unitario. Es la misma nota que ya llevan otros ficheros de aquí.
  void fallar(int indice, int status) {
    final opts = RequestOptions(path: '/group-orders/o1');
    _pendientes[indice].completeError(DioException(
      requestOptions: opts,
      response: Response(requestOptions: opts, statusCode: status),
      type: DioExceptionType.badResponse,
    ));
  }

  @override
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);
}

/// Realtime que guarda los `onTouched` para dispararlos a mano. Los llama a
/// TODOS en el mismo turno, como hace `ChannelListeners.notificar()`.
class _RealtimeEspia implements GroupOrderRealtimeService {
  final List<VoidCallback> _oyentes = [];

  int get oyentes => _oyentes.length;

  void tocar() {
    for (final o in List<VoidCallback>.of(_oyentes)) {
      o();
    }
  }

  @override
  Future<RealtimeSubscription> watch(String orderUuid, {required VoidCallback onTouched}) {
    _oyentes.add(onTouched);
    // `RealtimeSubscription` tiene constructor privado: no se puede fabricar
    // uno, y el cubit sólo lo guarda para cancelarlo al cerrarse.
    return Completer<RealtimeSubscription>().future;
  }

  @override
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);
}
