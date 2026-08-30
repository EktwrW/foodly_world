import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:logger/logger.dart';

/// Qué adopta el chip de lo que devuelve `GET /group-orders/mine`.
///
/// LO QUE EL BACKEND MANDA DE VERDAD (`GroupOrderController::mine`): las
/// órdenes en estado `open`, `locked`, `paying` o `confirmed` donde el usuario
/// es host O participante, ordenadas por `latest()`. Las `completed`,
/// `expired` y `cancelled` se filtran en SQL y NO llegan nunca. El endpoint
/// vive detrás de `auth:sanctum` (401 sin token) y del kill-switch
/// `EnsureGroupOrdersEnabled` (503 con el feature apagado).
///
/// POR QUÉ ESTE ARCHIVO AHORA. Hasta el 2026-08-29 `syncAnyActive()` corría en
/// dos momentos: el montaje del chip y el resume de la app. Desde el arreglo
/// del cerrojo corre TAMBIÉN en cada sesión nueva, desde `setSession`. No
/// cambia lo que se adopta —las guardas son funciones puras del DTO— pero sí
/// cuántas veces se pregunta, y el historial de este código dice que
/// preguntar de más es exactamente como aparecieron los fantasmas:
///
///   · el TTL de 12 h sobre `confirmedAt` nació del "fantasma de €163", una
///     orden confirmada hacía días que el chip resucitaba para siempre;
///   · la regla de saldo en cuenta abierta nació el 2026-08-06 porque una
///     cuenta YA PAGADA seguía "en tracking" 12 h y `syncAnyActive()` "la
///     recuperaba en cada login y el chip la resucitaba ofreciendo pagar algo
///     ya pagado".
///
/// Ese segundo caso se disparaba con el login, que es justo el momento en el
/// que ahora hay un disparador MÁS. De ahí el bloque "fantasmas": no vuelve a
/// testear `isTracking` en abstracto (eso ya está en
/// `group_order_invariants_test.dart`) sino la ADOPCIÓN, que es donde el chip
/// se puebla y donde el usuario ve la orden muerta.
void main() {
  late _RepoDeMine repo;
  late _CubitConSemilla cubit;

  setUp(() {
    repo = _RepoDeMine();
    cubit = _CubitConSemilla(repo: repo, logger: Logger(level: Level.off));
  });

  tearDown(() => cubit.close());

  // ── Lo que el endpoint sí devuelve ───────────────────────────────────

  group('/mine con una orden viva', () {
    test('una orden abierta se adopta como carrito', () async {
      repo.ordenes = const [GroupOrderDM(uuid: 'abierta', businessUuid: 'b1')];

      await cubit.syncAnyActive();

      expect(cubit.state?.uuid, 'abierta');
    });

    test('una orden en cobro (locked) también: es carrito pagable', () async {
      repo.ordenes = const [
        GroupOrderDM(uuid: 'cerrada', businessUuid: 'b1', status: GroupOrderStatus.locked),
      ];

      await cubit.syncAnyActive();

      expect(cubit.state?.uuid, 'cerrada');
    });

    test('confirmada y sin entregar (por ronda) se adopta como tracking', () async {
      repo.ordenes = [_confirmada(uuid: 'en-cocina', hace: const Duration(minutes: 20))];

      await cubit.syncAnyActive();

      expect(cubit.state?.uuid, 'en-cocina',
          reason: 'el que pagó y cerró la app necesita el camino de vuelta a su pedido');
    });

    test('el carrito vivo gana a la orden en tracking', () async {
      // `latest()` puede poner cualquiera primero; la prioridad la decide el
      // cliente, no el orden en que llega la lista.
      repo.ordenes = [
        _confirmada(uuid: 'en-cocina', hace: const Duration(minutes: 20)),
        const GroupOrderDM(uuid: 'carrito', businessUuid: 'b1'),
      ];

      await cubit.syncAnyActive();

      expect(cubit.state?.uuid, 'carrito');
    });
  });

  // ── Fantasmas: lo que NO se puede resucitar ──────────────────────────

  group('fantasmas — órdenes que /mine devuelve pero el chip no debe adoptar', () {
    test('confirmada hace más de 12 h: el backend la sigue mandando, el chip no la toma',
        () async {
      // El TTL vive SOLO en el cliente. `mine` no filtra por antigüedad: una
      // orden de un negocio que no opera el panel se queda en `confirmed`
      // indefinidamente y viaja en cada respuesta. Es el fantasma de €163.
      repo.ordenes = [_confirmada(uuid: 'fantasma', hace: const Duration(hours: 13))];

      await cubit.syncAnyActive();

      expect(cubit.state, isNull, reason: 'una orden de anteayer no es la cena de hoy');
      expect(repo.llamadasAMine, 1, reason: 'y la consulta sí salió: no pasa por no preguntar');
    });

    test('cuenta abierta YA SALDADA: no hay nada que pagar, no hay chip', () async {
      repo.ordenes = [
        _confirmada(uuid: 'cuenta-pagada', hace: const Duration(minutes: 30)).copyWith(
          paymentMode: GroupPaymentMode.openTab,
          totalAmount: 42,
          totalPaid: 42,
        ),
      ];

      await cubit.syncAnyActive();

      expect(cubit.state, isNull,
          reason: 'este es literalmente el bug del 2026-08-06: el chip volvía en cada '
              'login ofreciendo pagar una cuenta ya pagada');
    });

    test('cuenta abierta anulada entera (importe 0) tampoco', () async {
      // El negocio anuló todo: total 0, pagado 0. La resta da 0 y la orden
      // muere. Antes quedaba "viva" 12 h y `syncForBusiness` la readoptaba,
      // bloqueando crear una nueva en ese negocio.
      repo.ordenes = [
        _confirmada(uuid: 'todo-anulado', hace: const Duration(minutes: 30)).copyWith(
          paymentMode: GroupPaymentMode.openTab,
          totalAmount: 0,
          totalPaid: 0,
        ),
      ];

      await cubit.syncAnyActive();

      expect(cubit.state, isNull);
    });

    test('cuenta abierta CON saldo pendiente sí se adopta', () async {
      // La contracara: si se recorta de más, el comensal pierde su único
      // camino de vuelta a "Pagar la cuenta".
      repo.ordenes = [
        _confirmada(uuid: 'falta-pagar', hace: const Duration(minutes: 30)).copyWith(
          paymentMode: GroupPaymentMode.openTab,
          totalAmount: 42,
          totalPaid: 20,
        ),
      ];

      await cubit.syncAnyActive();

      expect(cubit.state?.uuid, 'falta-pagar');
    });

    test('por ronda ya ENTREGADA: el ciclo terminó', () async {
      repo.ordenes = [
        _confirmada(uuid: 'entregada', hace: const Duration(minutes: 30))
            .copyWith(fulfillmentStatus: GroupFulfillmentStatus.delivered),
      ];

      await cubit.syncAnyActive();

      expect(cubit.state, isNull);
    });

    /// CARACTERIZACIÓN, NO APROBACIÓN — hueco PREEXISTENTE, ajeno a este PR.
    ///
    /// La rama de carrito (`isOpen || isPayable`) no tiene TTL: lo que llegue
    /// en `open` se adopta, tenga la edad que tenga. Y del lado del backend
    /// nada expira una orden `open`: `HandleExpiredGroupOrders` solo mira
    /// `locked` y `paying` (y excluye las de cuenta abierta), y el único
    /// camino `open → cancelled` es el endpoint `cancel`, que alguien tiene
    /// que tocar. Una orden abandonada hace tres semanas sigue viajando en
    /// cada `/mine` y el chip la readopta.
    ///
    /// Se fija acá porque el arreglo del cerrojo agrega un disparador de
    /// `syncAnyActive` y conviene tener a la vista qué NO lo protege. No es
    /// una regresión de este cambio: el chip ya llamaba a `syncAnyActive` en
    /// cada arranque en frío, así que el comportamiento es idéntico al de
    /// antes. Si algún día se le pone TTL a la rama de carrito, este test se
    /// ACTUALIZA, no se borra.
    test('carrito abierto viejísimo: se adopta igual (sin TTL en esta rama)', () async {
      repo.ordenes = const [GroupOrderDM(uuid: 'carrito-de-hace-un-mes', businessUuid: 'b1')];

      await cubit.syncAnyActive();

      expect(cubit.state?.uuid, 'carrito-de-hace-un-mes');
    });

    /// NOTA SOBRE ESTE CASO. `mine` filtra `completed`/`expired`/`cancelled`
    /// en SQL, así que por el cable NO llegan. Se prueba igual porque el DTO
    /// es compartido: la misma lista alimenta caminos que sí ven órdenes
    /// terminales (el historial, un push con la orden ya cerrada), y porque
    /// si mañana alguien relaja el `whereIn` del backend, el cliente no debe
    /// resucitar una cuenta cobrada. Es defensa en profundidad, no un caso
    /// que hoy produzca la API.
    test('terminal (completed/cancelled/expired) nunca se adopta', () async {
      for (final estado in [
        GroupOrderStatus.completed,
        GroupOrderStatus.cancelled,
        GroupOrderStatus.expired,
      ]) {
        cubit.end();
        repo.ordenes = [
          _confirmada(uuid: 'terminal', hace: const Duration(minutes: 5)).copyWith(status: estado),
        ];

        await cubit.syncAnyActive();

        expect(cubit.state, isNull, reason: estado.name);
      }
    });
  });

  // ── Doble disparo: chip + setSession en el mismo arranque ────────────

  group('doble disparo del sync', () {
    /// Desde el arreglo hay DOS disparadores en un arranque en frío: el
    /// postFrame del chip y el `setSession` que restaura la sesión. Ninguno de
    /// los dos toma el cerrojo `_busy`, así que pueden solaparse de verdad.
    ///
    /// Lo que se fija acá es que solaparse no le cambie nada al usuario: una
    /// sola emisión y una sola orden. Si esto se rompiera, el chip parpadearía
    /// entre dos órdenes en el arranque.
    test('dos sync concurrentes con la misma respuesta emiten UNA vez', () async {
      repo.ordenes = const [GroupOrderDM(uuid: 'la-unica', businessUuid: 'b1')];
      repo.retener = true;

      final emisiones = <GroupOrderDM?>[];
      final sub = cubit.stream.listen(emisiones.add);

      final primero = cubit.syncAnyActive();
      final segundo = cubit.syncAnyActive();
      await Future<void>.delayed(Duration.zero);

      // Los dos pasaron la guarda: `syncAnyActive` lee `_busy` pero no lo toma.
      expect(repo.llamadasAMine, 2,
          reason: 'comportamiento actual: nada serializa dos sync entre sí');

      repo.liberar();
      await Future.wait([primero, segundo]);
      await Future<void>.delayed(Duration.zero);
      await sub.cancel();

      expect(cubit.state?.uuid, 'la-unica');
      expect(emisiones.length, 1,
          reason: 'bloc deduplica estados iguales: el chip no puede parpadear');
    });

    test('en secuencia, el segundo sync ni siquiera pregunta', () async {
      repo.ordenes = const [GroupOrderDM(uuid: 'la-unica', businessUuid: 'b1')];

      await cubit.syncAnyActive();
      await cubit.syncAnyActive();

      expect(repo.llamadasAMine, 1,
          reason: 'con estado ya adoptado la guarda `state != null` corta el segundo');
      expect(cubit.state?.uuid, 'la-unica');
    });

    /// El caso feo: dos sync solapados cuyas respuestas NO coinciden porque el
    /// servidor cambió entremedio. Documenta el comportamiento REAL, que no es
    /// el ideal — la última respuesta gana— para que quede a la vista si algún
    /// día hay que serializarlos.
    test('respuestas distintas: gana la última en llegar (comportamiento actual)', () async {
      repo.retener = true;
      repo.ordenes = const [GroupOrderDM(uuid: 'primera', businessUuid: 'b1')];

      final primero = cubit.syncAnyActive();
      final segundo = cubit.syncAnyActive();
      await Future<void>.delayed(Duration.zero);

      repo.ordenes = const [GroupOrderDM(uuid: 'segunda', businessUuid: 'b1')];
      repo.liberar();
      await Future.wait([primero, segundo]);

      // Las dos llamadas leen `ordenes` DESPUÉS de soltarse la puerta, así que
      // las dos ven 'segunda'. Lo que importa es que el estado final es uno
      // solo y coherente, no una mezcla.
      expect(cubit.state?.uuid, 'segunda');
    });
  });

  // ── Fallos del endpoint ──────────────────────────────────────────────

  group('/mine que falla', () {
    test('401: silencioso, sin estado y sin excepción', () async {
      repo.respuestaFija = ApiResult.failure(_http(401));

      await expectLater(cubit.syncAnyActive(), completes);

      expect(cubit.state, isNull);
      expect(repo.llamadasAMine, 1);
    });

    test('401 con carrito ya adoptado: no lo borra', () async {
      // Un 401 es "no sé quién sos", no "tu orden no existe". Vaciar el
      // carrito acá le borraría la cena a alguien que está pidiendo.
      cubit.sembrar(const GroupOrderDM(uuid: 'mi-carrito', businessUuid: 'b1'));
      repo.respuestaFija = ApiResult.failure(_http(401));

      await cubit.syncAnyActive();

      expect(cubit.state?.uuid, 'mi-carrito');
      expect(repo.llamadasAMine, 0,
          reason: 'con estado presente ni siquiera se pregunta');
    });

    test('503 (kill-switch del feature): también silencioso', () async {
      repo.respuestaFija = ApiResult.failure(_http(503));

      await cubit.syncAnyActive();

      expect(cubit.state, isNull);
    });
  });

  // ── refresh(): 404/403 limpian, y NO sueltan el cerrojo ──────────────

  group('la orden dejó de ser mía durante una escritura', () {
    /// `refresh()` es el callback de realtime. Un 404 (el host borró la orden)
    /// o un 403 (me sacaron de la mesa) la dan por muerta y llaman a `end()`.
    ///
    /// Lo que se fija acá es la mitad menos obvia: `end()` NO suelta `_busy`.
    /// Si lo soltara, un evento de Pusher que llega mientras hay una escritura
    /// en vuelo liberaría un cerrojo que sostiene otra operación, y dos
    /// peticiones saldrían a la vez — en un bar, dos rondas abiertas.
    for (final codigo in [404, 403]) {
      test('$codigo limpia la orden pero deja el cerrojo tomado', () async {
        cubit.sembrar(const GroupOrderDM(uuid: 'la-mia', businessUuid: 'b1'));

        // Escritura en vuelo: toma el cerrojo y se queda esperando.
        repo.retenerCrear = true;
        final creando = cubit.startForBusiness('otro-negocio');
        await Future<void>.delayed(Duration.zero);

        repo.respuestaDeGet = ApiResult.failure(_http(codigo));
        await cubit.refresh();

        expect(cubit.state, isNull, reason: 'la orden ya no es mía: el chip se va');

        // El cerrojo sigue tomado: la escritura de arriba no terminó.
        final unido = await cubit.joinWithCode('ABC123');
        expect(unido, isFalse);
        expect(repo.llamadasAJoin, 0,
            reason: 'end() no puede habilitar una petición concurrente');

        repo.liberarCrear();
        await creando;
      });
    }

    test('un 500 no borra nada: la orden sigue existiendo', () async {
      cubit.sembrar(const GroupOrderDM(uuid: 'la-mia', businessUuid: 'b1'));
      repo.respuestaDeGet = ApiResult.failure(_http(500));

      await cubit.refresh();

      expect(cubit.state?.uuid, 'la-mia');
    });
  });
}

// ── Helpers ────────────────────────────────────────────────────────────

/// Orden confirmada hace [hace]. `confirmedAt` es el dato del que cuelga el
/// TTL de 12 h, así que se pone siempre explícito.
GroupOrderDM _confirmada({required String uuid, required Duration hace}) => GroupOrderDM(
      uuid: uuid,
      businessUuid: 'b1',
      status: GroupOrderStatus.confirmed,
      confirmedAt: DateTime.now().subtract(hace),
    );

AppRequestException _http(int status) => AppRequestException(
      error: DioException(
        requestOptions: RequestOptions(path: '/group-orders/mine'),
        response: Response(
          requestOptions: RequestOptions(path: '/group-orders/mine'),
          statusCode: status,
        ),
      ),
    );

class _CubitConSemilla extends ActiveGroupOrderCubit {
  _CubitConSemilla({required super.repo, required super.logger});

  void sembrar(GroupOrderDM orden) => emit(orden);
}

class _RepoDeMine implements GroupOrderRepo {
  List<GroupOrderDM> ordenes = const [];
  ApiResult<GroupOrdersListResponseDM>? respuestaFija;
  ApiResult<GroupOrderResponseDM>? respuestaDeGet;

  int llamadasAMine = 0;
  int llamadasAJoin = 0;

  /// Puerta COMPARTIDA: dos llamadas concurrentes esperan el mismo completer,
  /// para poder soltarlas juntas y provocar el solapamiento de verdad.
  bool retener = false;
  Completer<void>? _puerta;

  void liberar() {
    final puerta = _puerta;
    if (puerta != null && !puerta.isCompleted) puerta.complete();
  }

  bool retenerCrear = false;
  Completer<void>? _puertaCrear;

  void liberarCrear() {
    final puerta = _puertaCrear;
    if (puerta != null && !puerta.isCompleted) puerta.complete();
  }

  @override
  Future<ApiResult<GroupOrdersListResponseDM>> getMyGroupOrders() async {
    llamadasAMine++;
    if (retener) {
      final puerta = _puerta ??= Completer<void>();
      await puerta.future;
    }
    return respuestaFija ?? ApiResult.success(GroupOrdersListResponseDM(groupOrders: ordenes));
  }

  @override
  Future<ApiResult<GroupOrderResponseDM>> getGroupOrder(String uuid) async =>
      respuestaDeGet ??
      ApiResult.success(GroupOrderResponseDM(groupOrder: GroupOrderDM(uuid: uuid)));

  @override
  Future<ApiResult<GroupOrderResponseDM>> createGroupOrder({
    required String businessUuid,
    String? branchUuid,
    String? reservationUuid,
    String? origin,
    String? tableLabel,
  }) async {
    if (retenerCrear) {
      final puerta = _puertaCrear ??= Completer<void>();
      await puerta.future;
    }
    return ApiResult.success(
      GroupOrderResponseDM(groupOrder: GroupOrderDM(uuid: 'nueva', businessUuid: businessUuid)),
    );
  }

  @override
  Future<ApiResult<GroupOrderResponseDM>> joinByCode(String code) async {
    llamadasAJoin++;
    return const ApiResult.success(
      GroupOrderResponseDM(groupOrder: GroupOrderDM(uuid: 'unida')),
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
