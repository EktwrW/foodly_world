import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/group_order_cubit.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/group_order_vm.dart';
import 'package:logger/logger.dart';

/// Tests del [GroupOrderCubit]. Sin bloc_test/mocktail (no están en pubspec);
/// se usa un fake manual del repo + escucha de `cubit.stream`, la convención
/// del proyecto (ver test/location/location_bloc_test.dart).
void main() {
  late _FakeGroupOrderRepo repo;
  late Logger silentLogger;

  setUp(() {
    repo = _FakeGroupOrderRepo();
    silentLogger = Logger(level: Level.off);
  });

  GroupOrderCubit buildCubit() => GroupOrderCubit(repo: repo, logger: silentLogger);

  GroupOrderDM sampleOrder() => const GroupOrderDM(
        uuid: 'o1',
        status: GroupOrderStatus.locked,
        businessName: 'Mystic Restaurant',
        totalAmount: 20,
        participants: [
          GroupOrderParticipantDM(uuid: 'p1', displayName: 'Yo', amountDue: 20),
        ],
        items: [
          GroupOrderItemDM(uuid: 'i1', participantUuid: 'p1', name: 'Nachos', unitPriceAtLock: 8.5),
        ],
      );

  // Extrae el VM de cualquier variante del estado.
  GroupOrderVM vmOf(GroupOrderState s) => s.when(
        initial: (vm) => vm,
        loading: (vm) => vm,
        loaded: (vm) => vm,
        error: (vm, _) => vm,
      );
  bool isLoading(GroupOrderState s) => s.maybeWhen(loading: (_) => true, orElse: () => false);
  bool isLoaded(GroupOrderState s) => s.maybeWhen(loaded: (_) => true, orElse: () => false);
  bool isError(GroupOrderState s) => s.maybeWhen(error: (_, __) => true, orElse: () => false);

  // Envuelve un DioException a propósito: AppRequestException.toString() para
  // errores NO-Dio usa di<BaseConfig>() + S.current, que no están configurados
  // en tests unitarios. El branch DioException devuelve el status sin tocarlos.
  AppRequestException boom() {
    final opts = RequestOptions(path: '/group-orders/o1/pay-intent');
    return AppRequestException(
      error: DioException(
        requestOptions: opts,
        response: Response(requestOptions: opts, statusCode: 500, statusMessage: 'Server Error'),
        type: DioExceptionType.badResponse,
      ),
      stackTrace: StackTrace.current,
    );
  }

  group('load', () {
    test('éxito: emite [loading, loaded] y puebla order + myShare', () async {
      repo.getOutcome = ApiResult.success(
        GroupOrderResponseDM(groupOrder: sampleOrder(), myShare: 20, myParticipantUuid: 'p1'),
      );
      final cubit = buildCubit();
      final emitted = <GroupOrderState>[];
      final sub = cubit.stream.listen(emitted.add);

      await cubit.load('o1');
      await Future<void>.delayed(const Duration(milliseconds: 10));

      expect(emitted.length, 2);
      expect(isLoading(emitted.first), true);
      expect(isLoaded(emitted.last), true);
      final vm = vmOf(emitted.last);
      expect(vm.order?.uuid, 'o1');
      expect(vm.myShare, 20);
      expect(vm.myParticipantUuid, 'p1');

      await sub.cancel();
      await cubit.close();
    });

    test('fallo: emite [loading, error] con errorMessage', () async {
      repo.getOutcome = ApiResult.failure(boom());
      final cubit = buildCubit();
      final emitted = <GroupOrderState>[];
      final sub = cubit.stream.listen(emitted.add);

      await cubit.load('o1');
      await Future<void>.delayed(const Duration(milliseconds: 10));

      expect(isLoading(emitted.first), true);
      expect(isError(emitted.last), true);
      expect(vmOf(emitted.last).errorMessage, isNotNull);

      await sub.cancel();
      await cubit.close();
    });
  });

  group('createPayIntent', () {
    test('éxito: devuelve el client_secret y termina con isPaying=false', () async {
      repo.getOutcome = ApiResult.success(
        GroupOrderResponseDM(groupOrder: sampleOrder(), myShare: 20, myParticipantUuid: 'p1'),
      );
      repo.payIntentOutcome = const ApiResult.success(
        PayIntentResponseDM(clientSecret: 'sec_123', amount: 20),
      );
      final cubit = buildCubit();
      await cubit.load('o1'); // deja order en el VM

      final emitted = <GroupOrderState>[];
      final sub = cubit.stream.listen(emitted.add);

      final result = await cubit.createPayIntent();
      await Future<void>.delayed(const Duration(milliseconds: 10));

      expect(result?.clientSecret, 'sec_123');
      // Primero isPaying=true, luego isPaying=false; ambos loaded.
      expect(emitted.every(isLoaded), true);
      expect(vmOf(emitted.first).isPaying, true);
      expect(vmOf(emitted.last).isPaying, false);

      await sub.cancel();
      await cubit.close();
    });

    test('fallo: devuelve null y emite error', () async {
      repo.getOutcome = ApiResult.success(
        GroupOrderResponseDM(groupOrder: sampleOrder(), myShare: 20, myParticipantUuid: 'p1'),
      );
      repo.payIntentOutcome = ApiResult.failure(boom());
      final cubit = buildCubit();
      await cubit.load('o1');

      final emitted = <GroupOrderState>[];
      final sub = cubit.stream.listen(emitted.add);

      final result = await cubit.createPayIntent();
      await Future<void>.delayed(const Duration(milliseconds: 10));

      expect(result, isNull);
      expect(emitted.any(isError), true);
      expect(vmOf(emitted.last).isPaying, false);

      await sub.cancel();
      await cubit.close();
    });

    test('sin orden cargada: no hace nada y devuelve null', () async {
      final cubit = buildCubit();
      final emitted = <GroupOrderState>[];
      final sub = cubit.stream.listen(emitted.add);

      final result = await cubit.createPayIntent();
      await Future<void>.delayed(const Duration(milliseconds: 10));

      expect(result, isNull);
      expect(emitted, isEmpty);

      await sub.cancel();
      await cubit.close();
    });
  });

  group('F2b', () {
    test('createPayIntent con covers pasa los uuids al repo ("yo invito")', () async {
      repo.getOutcome = ApiResult.success(
        GroupOrderResponseDM(groupOrder: sampleOrder(), myShare: 20, myParticipantUuid: 'p1'),
      );
      repo.payIntentOutcome = const ApiResult.success(
        PayIntentResponseDM(
          clientSecret: 'sec_covers',
          amount: 30,
          coveredParticipantUuids: ['p2', 'p3'],
        ),
      );
      final cubit = buildCubit();
      await cubit.load('o1');

      final result = await cubit.createPayIntent(coverParticipantUuids: ['p2', 'p3']);

      expect(result?.clientSecret, 'sec_covers');
      expect(result?.coveredParticipantUuids, ['p2', 'p3']);
      expect(repo.lastCoverUuids, ['p2', 'p3']);

      await cubit.close();
    });

    test('unlock: emite [loading, loaded] con la orden reabierta', () async {
      repo.getOutcome = ApiResult.success(
        GroupOrderResponseDM(groupOrder: sampleOrder(), myShare: 20, myParticipantUuid: 'p1'),
      );
      final reopened = sampleOrder().copyWith(status: GroupOrderStatus.open, totalAmount: 0);
      repo.unlockOutcome = ApiResult.success(
        GroupOrderResponseDM(groupOrder: reopened, myParticipantUuid: 'p1'),
      );
      final cubit = buildCubit();
      await cubit.load('o1');

      final emitted = <GroupOrderState>[];
      final sub = cubit.stream.listen(emitted.add);

      await cubit.unlock();
      await Future<void>.delayed(const Duration(milliseconds: 10));

      expect(isLoading(emitted.first), true);
      expect(isLoaded(emitted.last), true);
      expect(vmOf(emitted.last).order?.status, GroupOrderStatus.open);

      await sub.cancel();
      await cubit.close();
    });

    test('transferHost: pasa el uuid destino y aplica la respuesta', () async {
      repo.getOutcome = ApiResult.success(
        GroupOrderResponseDM(groupOrder: sampleOrder(), myShare: 20, myParticipantUuid: 'p1'),
      );
      final transferred = sampleOrder().copyWith(
        participants: const [
          GroupOrderParticipantDM(uuid: 'p1', displayName: 'Yo', amountDue: 20),
          GroupOrderParticipantDM(
            uuid: 'p2',
            displayName: 'Nuevo Host',
            role: GroupParticipantRole.host,
          ),
        ],
      );
      repo.transferHostOutcome = ApiResult.success(
        GroupOrderResponseDM(groupOrder: transferred, myShare: 20, myParticipantUuid: 'p1'),
      );
      final cubit = buildCubit();
      await cubit.load('o1');

      await cubit.transferHost('p2');

      expect(repo.lastTransferTarget, 'p2');
      final newHost = cubit.vm.order?.participants.where((p) => p.isHost).first;
      expect(newHost?.uuid, 'p2');

      await cubit.close();
    });
  });

  group('removeItem', () {
    test('éxito: aplica la respuesta y emite loaded con la orden actualizada', () async {
      repo.getOutcome = ApiResult.success(
        GroupOrderResponseDM(groupOrder: sampleOrder(), myShare: 20, myParticipantUuid: 'p1'),
      );
      final updated = sampleOrder().copyWith(items: const []);
      repo.removeItemOutcome = ApiResult.success(
        GroupOrderResponseDM(groupOrder: updated, myShare: 20, myParticipantUuid: 'p1'),
      );
      final cubit = buildCubit();
      await cubit.load('o1');

      final emitted = <GroupOrderState>[];
      final sub = cubit.stream.listen(emitted.add);

      await cubit.removeItem('i1');
      await Future<void>.delayed(const Duration(milliseconds: 10));

      expect(isLoaded(emitted.last), true);
      expect(vmOf(emitted.last).order?.items, isEmpty);

      await sub.cancel();
      await cubit.close();
    });
  });
}

/// Fake manual del repo: solo implementa lo que el cubit usa; el resto cae en
/// noSuchMethod. Cada outcome se configura por test.
class _FakeGroupOrderRepo implements GroupOrderRepo {
  ApiResult<GroupOrderResponseDM>? getOutcome;
  ApiResult<GroupOrderResponseDM>? removeItemOutcome;
  ApiResult<PayIntentResponseDM>? payIntentOutcome;
  ApiResult<GroupOrderResponseDM>? unlockOutcome;
  ApiResult<GroupOrderResponseDM>? transferHostOutcome;

  /// Espías F2b: qué recibió el repo en la última llamada.
  List<String>? lastCoverUuids;
  String? lastTransferTarget;

  @override
  Future<ApiResult<GroupOrderResponseDM>> getGroupOrder(String uuid) async => getOutcome!;

  @override
  Future<ApiResult<GroupOrderResponseDM>> removeItem(String uuid, String itemUuid) async => removeItemOutcome!;

  @override
  Future<ApiResult<PayIntentResponseDM>> createPayIntent(
    String uuid, {
    List<String>? coverParticipantUuids,
  }) async {
    lastCoverUuids = coverParticipantUuids;
    return payIntentOutcome!;
  }

  @override
  Future<ApiResult<GroupOrderResponseDM>> unlockGroupOrder(String uuid) async => unlockOutcome!;

  @override
  Future<ApiResult<GroupOrderResponseDM>> transferHost(
    String uuid, {
    required String participantUuid,
  }) async {
    lastTransferTarget = participantUuid;
    return transferHostOutcome!;
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
