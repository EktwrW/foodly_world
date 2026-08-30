import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/core/services/pending_table.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:logger/logger.dart';

/// El cerrojo `_busy` tiene que soltarse SIEMPRE, incluso si la llamada de red
/// lanza en vez de devolver un `ApiResult.failure`.
///
/// Bug de producción del 2026-08-29: `_busy` se ponía en true y se bajaba con
/// una asignación suelta al final del método, sin `finally`. Cualquier throw
/// entremedio lo dejaba trabado, y como el cubit es un lazy singleton el flag
/// sobrevivía toda la vida del proceso. A partir de ahí `joinWithCode`
/// devolvía false SIN LLEGAR A PEDIR NADA — en los logs del backend no había
/// una sola petición de join pese a varios intentos del usuario— y las mismas
/// guardas bloqueaban `syncForBusiness` y `startForBusiness`, así que tampoco
/// aparecía el chip flotante ni el botón de agregar ítems. Solo se arreglaba
/// cerrando la app del todo; ni siquiera el logout lo soltaba, porque `end()`
/// no lo tocaba.
///
/// El test recrea justo eso: primera llamada que revienta, segunda que debe
/// poder salir a la red igual.
class _RepoQueRevienta implements GroupOrderRepo {
  _RepoQueRevienta();

  bool reventarProximaLlamada = true;
  int llamadasAJoin = 0;
  int llamadasAMine = 0;
  List<GroupOrderDM> ordenesDeMine = const [];
  bool retenerMine = false;
  Completer<void>? _puertaMine;

  void liberarMine() => _puertaMine?.complete();

  @override
  Future<ApiResult<GroupOrderResponseDM>> joinByCode(String code) async {
    llamadasAJoin++;
    if (reventarProximaLlamada) {
      reventarProximaLlamada = false;
      throw StateError('caída de red simulada');
    }
    return const ApiResult.success(
      GroupOrderResponseDM(groupOrder: GroupOrderDM(uuid: 'orden-1')),
    );
  }

  @override
  Future<ApiResult<GroupOrdersListResponseDM>> getMyGroupOrders() async {
    llamadasAMine++;
    if (reventarProximaLlamada) {
      reventarProximaLlamada = false;
      throw StateError('caída de red simulada');
    }
    if (retenerMine) {
      _puertaMine = Completer<void>();
      await _puertaMine!.future;
    }
    return ApiResult.success(GroupOrdersListResponseDM(groupOrders: ordenesDeMine));
  }

  // ── Escrituras que también toman el cerrojo ─────────────────────────

  int llamadasACrear = 0;
  int llamadasARonda = 0;

  /// Etiqueta de mesa con la que llegó la última creación, para comprobar que
  /// la mesa estacionada viaja puesta.
  String? mesaRecibida;
  String? origenRecibido;

  /// Si está en true, la creación devuelve `failure` en vez de éxito (el
  /// backend rechazó: negocio sin group orders, 422, lo que sea).
  bool crearFalla = false;

  bool retenerCrear = false;
  Completer<void>? _puertaCrear;

  void liberarCrear() => _puertaCrear?.complete();

  @override
  Future<ApiResult<GroupOrderResponseDM>> createGroupOrder({
    required String businessUuid,
    String? branchUuid,
    String? reservationUuid,
    String? origin,
    String? tableLabel,
  }) async {
    llamadasACrear++;
    mesaRecibida = tableLabel;
    origenRecibido = origin;
    if (reventarProximaLlamada) {
      reventarProximaLlamada = false;
      throw StateError('caída de red simulada');
    }
    if (retenerCrear) {
      _puertaCrear = Completer<void>();
      await _puertaCrear!.future;
    }
    if (crearFalla) {
      return const ApiResult.failure(AppRequestException(error: 'el backend dijo que no'));
    }
    return ApiResult.success(
      GroupOrderResponseDM(groupOrder: GroupOrderDM(uuid: 'nueva', businessUuid: businessUuid)),
    );
  }

  @override
  Future<ApiResult<GroupOrderResponseDM>> nextRound(String uuid) async {
    llamadasARonda++;
    if (reventarProximaLlamada) {
      reventarProximaLlamada = false;
      throw StateError('caída de red simulada');
    }
    return const ApiResult.success(
      GroupOrderResponseDM(groupOrder: GroupOrderDM(uuid: 'ronda-2')),
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  late _RepoQueRevienta repo;
  late ActiveGroupOrderCubit cubit;

  setUp(() {
    repo = _RepoQueRevienta();
    cubit = ActiveGroupOrderCubit(repo: repo, logger: Logger(level: Level.off));
  });

  tearDown(() => cubit.close());

  test('joinWithCode suelta el cerrojo aunque la llamada lance', () async {
    await expectLater(cubit.joinWithCode('ABC123'), throwsA(isA<StateError>()));
    expect(repo.llamadasAJoin, 1);

    // Sin el `finally`, esta segunda llamada devolvía false y NO tocaba el
    // repo: exactamente el síntoma de producción.
    final ok = await cubit.joinWithCode('ABC123');
    expect(repo.llamadasAJoin, 2, reason: 'el segundo intento tiene que salir a la red');
    expect(ok, isTrue);
  });

  test('un throw en join no deja bloqueado el sync de la orden activa', () async {
    await expectLater(cubit.joinWithCode('ABC123'), throwsA(isA<StateError>()));

    // `syncAnyActive` comparte el mismo cerrojo. Con `_busy` trabado salía
    // temprano y el chip flotante nunca se enteraba de la orden del servidor.
    await cubit.syncAnyActive();
    expect(repo.llamadasAMine, 1, reason: 'el sync no puede quedar bloqueado por el join anterior');
  });

  test('resetForLogout suelta el cerrojo; end() a secas NO', () async {
    await expectLater(cubit.joinWithCode('ABC123'), throwsA(isA<StateError>()));

    // `end()` corre también ante un 404/403 de realtime, con una operación
    // posiblemente en vuelo. Si soltara el cerrojo, dos peticiones saldrían
    // a la vez y la mesa podría abrir dos rondas.
    cubit.end();
    cubit.resetForLogout();

    final ok = await cubit.joinWithCode('ABC123');
    expect(ok, isTrue);
    expect(repo.llamadasAJoin, 2);
  });

  test('un sync en vuelo no emite si la sesión se limpió mientras viajaba', () async {
    repo.reventarProximaLlamada = false;
    repo.ordenesDeMine = const [GroupOrderDM(uuid: 'orden-vieja')];
    repo.retenerMine = true;

    final enVuelo = cubit.syncAnyActive();
    cubit.end(); // el teardown ocurre con la respuesta a mitad de camino
    repo.liberarMine();
    await enVuelo;

    expect(cubit.state, isNull,
        reason: 'la orden del usuario anterior no puede resucitar el chip');
  });

  // ── startForBusiness y la mesa estacionada ───────────────────────────

  group('startForBusiness y la mesa del QR', () {
    setUp(() {
      repo.reventarProximaLlamada = false;
      PendingTable.clear();
    });

    tearDown(PendingTable.clear);

    test('la mesa se consume SOLO si la orden se creó', () async {
      PendingTable.captureFromUri(Uri.parse('/negocio-1?t=Mesa%207'));

      final ok = await cubit.startForBusiness('negocio-1');

      expect(ok, isTrue);
      expect(repo.mesaRecibida, 'Mesa 7', reason: 'la mesa tiene que viajar en el create');
      expect(repo.origenRecibido, 'qr', reason: 'vino del QR, no del menú');
      expect(PendingTable.forBusiness('negocio-1'), isNull,
          reason: 'creada la orden, la mesa ya cumplió y no debe pegarse a la próxima');
    });

    test('si la creación FALLA la mesa queda estacionada para el reintento', () async {
      PendingTable.captureFromUri(Uri.parse('/negocio-1?t=Mesa%207'));
      repo.crearFalla = true;

      final ok = await cubit.startForBusiness('negocio-1');

      expect(ok, isFalse);
      expect(PendingTable.forBusiness('negocio-1'), 'Mesa 7',
          reason: 'perder la mesa acá deja al comensal reintentando sin mesa, y la '
              'comanda sale sin saber a qué mesa llevarla');
    });

    test('si la creación LANZA, la mesa sobrevive y el reintento sale igual', () async {
      PendingTable.captureFromUri(Uri.parse('/negocio-1?t=Mesa%207'));
      repo.reventarProximaLlamada = true;

      await expectLater(cubit.startForBusiness('negocio-1'), throwsA(isA<StateError>()));
      expect(PendingTable.forBusiness('negocio-1'), 'Mesa 7');

      // Sin el `finally`, el cerrojo quedaba tomado y este segundo intento
      // devolvía false SIN pedirle nada al backend: el comensal se quedaba
      // sin poder abrir la orden hasta reinstalar la app.
      final ok = await cubit.startForBusiness('negocio-1');
      expect(ok, isTrue);
      expect(repo.llamadasACrear, 2, reason: 'el reintento tiene que salir a la red');
      expect(repo.mesaRecibida, 'Mesa 7', reason: 'y con la mesa todavía puesta');
    });
  });

  test('startNextRound suelta el cerrojo aunque la llamada lance', () async {
    repo.reventarProximaLlamada = true;

    await expectLater(cubit.startNextRound('ronda-1'), throwsA(isA<StateError>()));

    // En un bar la mesa pide tanda tras tanda. Con el cerrojo trabado, la
    // segunda ronda no salía nunca y la única salida era matar la app.
    final ok = await cubit.startNextRound('ronda-1');
    expect(ok, isTrue);
    expect(repo.llamadasARonda, 2);
  });

  // ── Qué hace el cerrojo con las LECTURAS ─────────────────────────────

  group('los sync LEEN el cerrojo pero no lo toman', () {
    setUp(() => repo.reventarProximaLlamada = false);

    /// COMPORTAMIENTO ACTUAL, FIJADO A PROPÓSITO.
    ///
    /// `syncForBusiness` y `syncAnyActive` consultan `_busy` y se van si está
    /// tomado, pero NUNCA lo toman ellos. Las dos mitades importan y conviene
    /// no confundirlas:
    ///
    ///   · Que se vayan si hay una ESCRITURA en vuelo es correcto: la
    ///     escritura va a emitir su propia orden al terminar, así que el sync
    ///     sería redundante y podría pisarla con una foto anterior.
    ///
    ///   · Que no lo tomen deja dos sync concurrentes correr a la vez. Eso
    ///     NO era un problema mientras el único disparador era el chip, pero
    ///     desde el 2026-08-29 `setSession` dispara un segundo, así que ahora
    ///     sí pueden solaparse en un arranque en frío. Ver el test de doble
    ///     disparo en `mine_adoption_test.dart`, que fija que dos respuestas
    ///     iguales emiten UNA sola vez.
    ///
    /// LO QUE SÍ ES UN HUECO LATENTE (no se arregla acá, se documenta): si la
    /// escritura en vuelo FALLA, el sync que se descartó no lo reintenta
    /// nadie. El chip se queda vacío hasta el próximo disparador — resume de
    /// la app o navegación al menú. Es una actualización perdida, no un
    /// estado incorrecto: no muestra nada equivocado, solo tarda de más. Por
    /// eso queda como observación y no como cambio de producción.
    test('un create en vuelo descarta el sync en vez de encolarlo', () async {
      repo.retenerCrear = true;
      final creando = cubit.startForBusiness('negocio-1');
      await Future<void>.delayed(Duration.zero);

      await cubit.syncForBusiness('negocio-1');
      await cubit.syncAnyActive();

      expect(repo.llamadasAMine, 0,
          reason: 'con una escritura en vuelo los sync se van sin pedir nada');

      repo.liberarCrear();
      expect(await creando, isTrue);
    });

    test('liberado el cerrojo, el sync vuelve a funcionar', () async {
      repo.retenerCrear = true;
      final creando = cubit.startForBusiness('negocio-1');
      await Future<void>.delayed(Duration.zero);
      await cubit.syncAnyActive();
      expect(repo.llamadasAMine, 0);

      repo.liberarCrear();
      await creando;

      // El create emitió estado, así que `syncAnyActive` ahora sale por la
      // otra guarda (`state != null`). Se limpia para aislar el cerrojo.
      cubit.end();
      await cubit.syncAnyActive();

      expect(repo.llamadasAMine, 1, reason: 'el cerrojo ya no lo bloquea');
    });
  });
}
