import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:logger/logger.dart';

/// e2e r5 — joinWithCode con causa real: cuando el backend rechaza el join,
/// la UI debe poder mostrar SU mensaje ("la orden ya no admite nuevos
/// participantes") y no siempre el genérico "código inválido o vencido".
/// También cubre AppRequestException.serverMessage (parser puro del body).

AppRequestException _dioFailure({int status = 409, Object? body}) => AppRequestException(
      error: DioException(
        requestOptions: RequestOptions(path: '/group-orders/join'),
        response: Response(
          requestOptions: RequestOptions(path: '/group-orders/join'),
          statusCode: status,
          data: body,
        ),
      ),
    );

class _FakeRepo implements GroupOrderRepo {
  ApiResult<GroupOrderResponseDM>? joinByCodeOutcome;
  ApiResult<GroupOrderResponseDM>? nextRoundOutcome;
  ApiResult<GroupOrdersListResponseDM>? mineOutcome;
  String? lastCodeSent;
  String? lastNextRoundUuid;
  int mineCalls = 0;

  @override
  Future<ApiResult<GroupOrderResponseDM>> joinByCode(String code) async {
    lastCodeSent = code;
    return joinByCodeOutcome!;
  }

  @override
  Future<ApiResult<GroupOrderResponseDM>> nextRound(String uuid) async {
    lastNextRoundUuid = uuid;
    return nextRoundOutcome!;
  }

  @override
  Future<ApiResult<GroupOrdersListResponseDM>> getMyGroupOrders() async {
    mineCalls++;
    return mineOutcome!;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  group('AppRequestException.serverMessage', () {
    test('extrae el message del body Laravel', () {
      final e = _dioFailure(body: {'message': 'La orden ya no admite nuevos participantes.'});
      expect(e.serverMessage, 'La orden ya no admite nuevos participantes.');
    });

    test('null cuando el body no trae message, no es Map o no es Dio', () {
      expect(_dioFailure(body: {'error': 'x'}).serverMessage, isNull);
      expect(_dioFailure(body: 'plain text').serverMessage, isNull);
      expect(_dioFailure(body: {'message': '   '}).serverMessage, isNull);
      expect(const AppRequestException(error: 'boom').serverMessage, isNull);
    });
  });

  group('ActiveGroupOrderCubit.syncAnyActive (e2e F4a: volver a la orden)', () {
    late _FakeRepo repo;
    late ActiveGroupOrderCubit cubit;

    const open = GroupOrderDM(uuid: 'cart');
    const tracking = GroupOrderDM(uuid: 'track', status: GroupOrderStatus.confirmed);
    const delivered = GroupOrderDM(
      uuid: 'done',
      status: GroupOrderStatus.confirmed,
      fulfillmentStatus: GroupFulfillmentStatus.delivered,
    );

    setUp(() {
      repo = _FakeRepo();
      cubit = ActiveGroupOrderCubit(repo: repo, logger: Logger(level: Level.off));
    });

    tearDown(() => cubit.close());

    test('prioriza el carrito vivo sobre la orden en tracking', () async {
      repo.mineOutcome = const ApiResult.success(
          GroupOrdersListResponseDM(groupOrders: [tracking, open]));

      await cubit.syncAnyActive();

      expect(cubit.state?.uuid, 'cart');
    });

    test('sin carrito, adopta la orden pagada SIN entregar (tracking) — el '
        'cliente que cerró la app recupera su pedido', () async {
      repo.mineOutcome =
          const ApiResult.success(GroupOrdersListResponseDM(groupOrders: [tracking]));

      await cubit.syncAnyActive();

      expect(cubit.state?.uuid, 'track');
    });

    test('las entregadas no cuentan; con estado ya presente es no-op', () async {
      repo.mineOutcome =
          const ApiResult.success(GroupOrdersListResponseDM(groupOrders: [delivered]));
      await cubit.syncAnyActive();
      expect(cubit.state, isNull);

      // Con estado presente no vuelve a pegarle a /mine.
      repo.mineOutcome = const ApiResult.success(
          GroupOrdersListResponseDM(groupOrders: [open]));
      await cubit.syncAnyActive(); // state sigue null → consulta
      expect(cubit.state?.uuid, 'cart');
      final calls = repo.mineCalls;
      await cubit.syncAnyActive(); // ahora hay estado → no-op
      expect(repo.mineCalls, calls);
    });

    test('fallo de red: silencioso, sin estado', () async {
      repo.mineOutcome = const ApiResult.failure(AppRequestException(error: 'down'));

      await cubit.syncAnyActive();

      expect(cubit.state, isNull);
    });
  });

  group('ActiveGroupOrderCubit.joinWithCode', () {
    late _FakeRepo repo;
    late ActiveGroupOrderCubit cubit;

    setUp(() {
      repo = _FakeRepo();
      cubit = ActiveGroupOrderCubit(repo: repo, logger: Logger(level: Level.off));
    });

    tearDown(() => cubit.close());

    test('éxito: emite la orden, normaliza el código y lastJoinError queda null', () async {
      const order = GroupOrderDM(uuid: 'o1');
      repo.joinByCodeOutcome = const ApiResult.success(GroupOrderResponseDM(groupOrder: order));

      final ok = await cubit.joinWithCode('  abc234 ');

      expect(ok, isTrue);
      expect(cubit.state?.uuid, 'o1');
      expect(repo.lastCodeSent, 'ABC234');
      expect(cubit.lastJoinError, isNull);
    });

    test('fallo con mensaje del backend: lo expone en lastJoinError', () async {
      repo.joinByCodeOutcome = ApiResult.failure(
        _dioFailure(body: {'message': 'La orden ya no admite nuevos participantes.'}),
      );

      final ok = await cubit.joinWithCode('ABC234');

      expect(ok, isFalse);
      expect(cubit.state, isNull);
      expect(cubit.lastJoinError, 'La orden ya no admite nuevos participantes.');
    });

    test('fallo sin mensaje: lastJoinError null (la UI usa el genérico)', () async {
      repo.joinByCodeOutcome = ApiResult.failure(_dioFailure(body: 'gateway error'));

      expect(await cubit.joinWithCode('ABC234'), isFalse);
      expect(cubit.lastJoinError, isNull);
    });

    test('startNextRound (F4a): la ronda nueva pasa a ser el carrito activo', () async {
      const round2 = GroupOrderDM(uuid: 'r2', roundNumber: 2, businessMenuUuid: 'm1');
      repo.nextRoundOutcome = const ApiResult.success(GroupOrderResponseDM(groupOrder: round2));

      final ok = await cubit.startNextRound('r1');

      expect(ok, isTrue);
      expect(repo.lastNextRoundUuid, 'r1');
      expect(cubit.state?.uuid, 'r2');
      expect(cubit.state?.roundNumber, 2);
      expect(cubit.lastJoinError, isNull);
    });

    test('startNextRound con fallo: false + causa del backend, carrito intacto', () async {
      repo.nextRoundOutcome = ApiResult.failure(
        _dioFailure(body: {'message': 'La ronda anterior aún no está confirmada.'}),
      );

      final ok = await cubit.startNextRound('r1');

      expect(ok, isFalse);
      expect(cubit.state, isNull);
      expect(cubit.lastJoinError, 'La ronda anterior aún no está confirmada.');
    });

    test('un join exitoso posterior LIMPIA el error anterior', () async {
      repo.joinByCodeOutcome = ApiResult.failure(_dioFailure(body: {'message': 'Código inválido o vencido.'}));
      await cubit.joinWithCode('MALO99');
      expect(cubit.lastJoinError, isNotNull);

      const order = GroupOrderDM(uuid: 'o2');
      repo.joinByCodeOutcome = const ApiResult.success(GroupOrderResponseDM(groupOrder: order));
      expect(await cubit.joinWithCode('ABC234'), isTrue);
      expect(cubit.lastJoinError, isNull);
    });
  });
}
