import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:logger/logger.dart';

/// Qué pasa con el carrito cuando la orden deja de ser mía.
///
/// EL BUG (reportado en device). El host invita, el invitado agrega ítems, y
/// después el host borra los ítems y la orden. Al host se lo devuelve al menú
/// y todo bien; al invitado le quedaba el chip flotante en pantalla con su
/// monto, en cualquier vista, y tocarlo lo llevaba a una pantalla de error.
///
/// El backend ya avisaba: `destroy` emite `GroupOrderTouched('deleted')`
/// ANTES de borrar, con el comentario "los demás refetchean, reciben 404".
/// El refetch pasaba; el 404 se registraba en el log y nada más, así que el
/// estado se quedaba con la orden vieja.
///
/// Lo que estos tests protegen es la LÍNEA: qué fallo limpia el carrito y
/// cuál no. Vaciarlo de más es peor que el bug original — le borra la mesa a
/// alguien que está cenando porque se le cayó el wifi un segundo.
void main() {
  late _SpyRepo repo;
  late _SeededCubit cubit;

  // `status` explícito aunque coincida con el default: el chip solo se
  // muestra con la orden viva, y el test perdería su sentido si el fixture
  // dejara de estarlo en silencio.
  const orden = GroupOrderDM(
    uuid: 'o1',
    businessUuid: 'b1',
    // ignore: avoid_redundant_argument_values
    status: GroupOrderStatus.open,
    subtotal: 26,
  );

  setUp(() {
    repo = _SpyRepo();
    cubit = _SeededCubit(repo: repo, logger: Logger(level: Level.off));
    cubit.seed(orden);
  });

  tearDown(() => cubit.close());

  AppRequestException http(int status) => AppRequestException(
        error: DioException(
          requestOptions: RequestOptions(path: '/group-orders/o1'),
          response: Response(
            requestOptions: RequestOptions(path: '/group-orders/o1'),
            statusCode: status,
          ),
        ),
      );

  group('la orden dejó de ser mía → el carrito se limpia', () {
    test('404: el host la borró', () async {
      repo.getOutcome = ApiResult.failure(http(404));

      await cubit.refresh();

      expect(cubit.state, isNull);
    });

    test('403: sigue viva pero me sacaron de la mesa', () async {
      repo.getOutcome = ApiResult.failure(http(403));

      await cubit.refresh();

      expect(cubit.state, isNull);
    });
  });

  group('el resto de los fallos NO tocan el carrito', () {
    test('500: el servidor falló, la orden sigue existiendo', () async {
      repo.getOutcome = ApiResult.failure(http(500));

      await cubit.refresh();

      expect(cubit.state, orden);
    });

    test('timeout sin respuesta: un corte de red no borra una cena', () async {
      repo.getOutcome = ApiResult.failure(AppRequestException(
        error: DioException(
          requestOptions: RequestOptions(path: '/group-orders/o1'),
          type: DioExceptionType.connectionTimeout,
        ),
      ));

      await cubit.refresh();

      expect(cubit.state, orden);
    });

    test('429: rate limit, se reintenta después', () async {
      repo.getOutcome = ApiResult.failure(http(429));

      await cubit.refresh();

      expect(cubit.state, orden);
    });
  });

  test('sin orden activa refresh no consulta nada', () async {
    final vacio = _SeededCubit(repo: repo, logger: Logger(level: Level.off));
    addTearDown(vacio.close);

    await vacio.refresh();

    expect(repo.getCalls, 0);
  });

  test('el camino feliz sigue emitiendo la orden fresca', () async {
    const fresca = GroupOrderDM(uuid: 'o1', businessUuid: 'b1', subtotal: 41);
    repo.getOutcome = const ApiResult.success(GroupOrderResponseDM(groupOrder: fresca));

    await cubit.refresh();

    expect(cubit.state, fresca);
  });
}

class _SeededCubit extends ActiveGroupOrderCubit {
  _SeededCubit({required super.repo, required super.logger});

  void seed(GroupOrderDM order) => emit(order);
}

class _SpyRepo implements GroupOrderRepo {
  ApiResult<GroupOrderResponseDM>? getOutcome;
  int getCalls = 0;

  @override
  Future<ApiResult<GroupOrderResponseDM>> getGroupOrder(String uuid) async {
    getCalls++;
    return getOutcome!;
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
