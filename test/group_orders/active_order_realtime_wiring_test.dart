import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:logger/logger.dart';

/// A qué orden queda enganchado el chip flotante.
///
/// EL BUG (reportado en device). El anfitrión invita, user1 entra por código y
/// se queda en el menú agregando platos. Mientras tanto el anfitrión agrega y
/// quita ítems, y el chip de user1 no reflejaba NADA: solo se ponía al día
/// cuando user1 tocaba algo y el response del backend traía el estado nuevo de
/// rebote. Dentro de la orden sí se veía en vivo, porque esa página tiene su
/// propia suscripción.
///
/// La causa: `watchActive()` se pedía a mano y solo desde dos sitios —el cold
/// start (`syncAnyActive`) y el cierre de la página de la orden—. Ni
/// `joinWithCode` ni `startForBusiness` lo llamaban, así que quien entraba por
/// ahí se quedaba sin socket.
///
/// Ahora cuelga de `onChange`, que ya era el hook único para todas las
/// emisiones (lo usa la notificación ongoing). Estos tests fijan ESO: que
/// cada orden que pasa a ser el carrito quede observada, y con su uuid.
void main() {
  late _FakeRepo repo;
  late _SpyCubit cubit;

  setUp(() {
    repo = _FakeRepo();
    cubit = _SpyCubit(repo: repo, logger: Logger(level: Level.off));
  });

  tearDown(() => cubit.close());

  GroupOrderResponseDM respuesta(String uuid) =>
      GroupOrderResponseDM(groupOrder: GroupOrderDM(uuid: uuid, businessUuid: 'b1'));

  test('entrar por código deja el chip observando esa orden — el bug', () async {
    repo.joinOutcome = ApiResult.success(respuesta('o-invitado'));

    await cubit.joinWithCode('ABC123');

    expect(cubit.observadas, ['o-invitado']);
  });

  test('crear la orden también la deja observada', () async {
    repo.createOutcome = ApiResult.success(respuesta('o-nueva'));

    await cubit.startForBusiness('b1');

    expect(cubit.observadas, ['o-nueva']);
  });

  test('la siguiente ronda mueve la observación a la orden nueva', () async {
    repo.joinOutcome = ApiResult.success(respuesta('o1'));
    await cubit.joinWithCode('ABC123');

    repo.nextRoundOutcome = ApiResult.success(respuesta('o2'));
    await cubit.startNextRound('o1');

    // El segundo uuid tiene que ser el NUEVO. `onChange` corre antes de que
    // bloc asigne el estado, así que leer `state` adentro devolvía el viejo:
    // el chip habría quedado escuchando la ronda que ya terminó.
    expect(cubit.observadas, ['o1', 'o2']);
  });

  test('terminar el carrito no engancha nada', () async {
    repo.joinOutcome = ApiResult.success(respuesta('o1'));
    await cubit.joinWithCode('ABC123');

    cubit.end();

    expect(cubit.observadas, ['o1']);
    expect(cubit.state, isNull);
  });

  test('un join fallido no engancha nada', () async {
    repo.joinOutcome = ApiResult.failure(AppRequestException(error: Exception('nope')));

    await cubit.joinWithCode('MALO');

    expect(cubit.observadas, isEmpty);
  });
}

/// Espía de la suscripción: se queda con el uuid que recibiría el servicio
/// realtime, sin abrir ningún socket.
class _SpyCubit extends ActiveGroupOrderCubit {
  _SpyCubit({required super.repo, required super.logger});

  final List<String> observadas = [];

  @override
  Future<void> watchActive([String? uuid]) async {
    if (uuid != null) observadas.add(uuid);
  }
}

class _FakeRepo implements GroupOrderRepo {
  ApiResult<GroupOrderResponseDM>? joinOutcome;
  ApiResult<GroupOrderResponseDM>? createOutcome;
  ApiResult<GroupOrderResponseDM>? nextRoundOutcome;

  @override
  Future<ApiResult<GroupOrderResponseDM>> joinByCode(String code) async => joinOutcome!;

  @override
  Future<ApiResult<GroupOrderResponseDM>> createGroupOrder({
    required String businessUuid,
    String? branchUuid,
    String? reservationUuid,
    String? origin,
    String? tableLabel,
  }) async =>
      createOutcome!;

  @override
  Future<ApiResult<GroupOrderResponseDM>> nextRound(String uuid) async => nextRoundOutcome!;

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
