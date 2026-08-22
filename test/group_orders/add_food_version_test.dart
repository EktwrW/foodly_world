import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:logger/logger.dart';

/// El tamaño elegido tiene que llegar al backend.
///
/// Si no llega, el BE cobra regular pase lo que pase y —peor— fusiona la
/// grande con la chica en UNA línea: un dinamita roll de 2 € y uno grande de
/// 6 € salían como "2× dinamita roll · 4 €" en las dos UIs.
///
/// El cableado del menú ya se perdió una vez en un merge sin que nada lo
/// agarrara. Por eso `version` es un named REQUERIDO: borrarlo del call site
/// ahora no compila. Esto cubre el tramo de acá para abajo.
void main() {
  late _SpyRepo repo;
  late _SeededCubit cubit;

  setUp(() {
    repo = _SpyRepo();
    cubit = _SeededCubit(repo: repo, logger: Logger(level: Level.off));
    cubit.seed(const GroupOrderDM(uuid: 'o1', businessUuid: 'b1'));
  });

  tearDown(() => cubit.close());

  test('manda la versión elegida tal cual', () async {
    await cubit.addFood('drink', 'item-1', version: Version.big);
    expect(repo.lastVersion, 'big');
  });

  test('regular viaja explícito: el BE lo normaliza a null, no lo adivina', () async {
    await cubit.addFood('drink', 'item-1', version: Version.regular);
    expect(repo.lastVersion, 'regular');
  });

  test('mediana también', () async {
    await cubit.addFood('food', 'item-2', version: Version.medium);
    expect(repo.lastVersion, 'medium');
  });

  test('sin orden activa no llama al repo', () async {
    final huerfano = _SeededCubit(repo: repo, logger: Logger(level: Level.off));
    addTearDown(huerfano.close);

    final ok = await huerfano.addFood('drink', 'item-1', version: Version.big);

    expect(ok, isFalse);
    expect(repo.addCalls, 0);
  });
}

class _SeededCubit extends ActiveGroupOrderCubit {
  _SeededCubit({required super.repo, required super.logger});

  void seed(GroupOrderDM order) => emit(order);
}

class _SpyRepo implements GroupOrderRepo {
  int addCalls = 0;
  String? lastVersion;

  @override
  Future<ApiResult<GroupOrderResponseDM>> addItem(
    String uuid, {
    required String itemableType,
    required String itemableUuid,
    required int quantity,
    String? notes,
    String? version,
  }) async {
    addCalls++;
    lastVersion = version;
    return const ApiResult.success(
      GroupOrderResponseDM(groupOrder: GroupOrderDM(uuid: 'o1')),
    );
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
