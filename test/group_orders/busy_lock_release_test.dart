import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
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
}
