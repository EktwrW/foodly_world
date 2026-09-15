import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/data_models/group_orders/manager_orders_dm.dart';
import 'package:foodly_world/data_models/group_orders/stripe_connect_dm.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/manager_history_cubit.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/stripe_onboarding_cubit.dart';
import 'package:logger/logger.dart';

/// Salir de "Órdenes en vivo" con una petición todavía en vuelo reventaba con
/// `Bad state: Cannot emit new states after calling close` (device, 2026-09-15):
/// el cubit se cierra al desmontar la pantalla y la respuesta llega después.
///
/// Los `await` de estos dos cubits no miraban `isClosed`, cosa que el resto de
/// los cubits del proyecto sí hace. El fallo no era visible en la pantalla —
/// se lo comía el observer y subía a Crashlytics— pero es un error por cada
/// vuelta atrás con red lenta.
class _RepoLento implements GroupOrderRepo {
  final stripe = Completer<ApiResult<StripeConnectStatusDM>>();
  final historial = Completer<ApiResult<ManagerHistoryResponseDM>>();
  final enmienda = Completer<ApiResult<GroupOrderResponseDM>>();

  @override
  Future<ApiResult<StripeConnectStatusDM>> stripeStatus(String businessUuid) => stripe.future;

  @override
  Future<ApiResult<ManagerHistoryResponseDM>> managerOrderHistory(
    String businessUuid, {
    String? before,
    int? limit,
  }) =>
      historial.future;

  @override
  Future<ApiResult<GroupOrderResponseDM>> managerAmendClosure(
    String uuid, {
    required String reason,
  }) =>
      enmienda.future;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  late _RepoLento repo;
  final logger = Logger(level: Level.off);

  setUp(() => repo = _RepoLento());

  test('StripeOnboardingCubit: cerrar con la consulta en vuelo no revienta', () async {
    final cubit = StripeOnboardingCubit(repo: repo, logger: logger, businessUuid: 'b1');

    final enVuelo = cubit.load();
    await cubit.close();
    repo.stripe.complete(const ApiResult.success(StripeConnectStatusDM(chargesEnabled: true)));

    await expectLater(enVuelo, completes);
  });

  test('ManagerHistoryCubit: cerrar con el historial en vuelo no revienta', () async {
    final cubit = ManagerHistoryCubit(repo: repo, logger: logger, businessUuid: 'b1');

    final enVuelo = cubit.load();
    await cubit.close();
    repo.historial.complete(const ApiResult.success(ManagerHistoryResponseDM()));

    await expectLater(enVuelo, completes);
  });

  test('ManagerHistoryCubit: amendClosure devuelve false si ya no hay pantalla', () async {
    final cubit = ManagerHistoryCubit(repo: repo, logger: logger, businessUuid: 'b1');

    final enVuelo = cubit.amendClosure('o1', 'paid_at_counter');
    await cubit.close();
    repo.enmienda.complete(
      const ApiResult.success(GroupOrderResponseDM(groupOrder: GroupOrderDM(uuid: 'o1'))),
    );

    // La corrección se guardó igual en el servidor; lo que se pierde es
    // pintarla. El false dice "no pude confirmarlo en pantalla", no "falló".
    expect(await enVuelo, isFalse);
  });

  test('con la pantalla viva sí emite: la guarda no apaga el camino bueno', () async {
    final cubit = StripeOnboardingCubit(repo: repo, logger: logger, businessUuid: 'b1');

    final enVuelo = cubit.load();
    repo.stripe.complete(const ApiResult.success(StripeConnectStatusDM(chargesEnabled: true)));
    await enVuelo;

    expect(cubit.state.chargesEnabled, isTrue);
    await cubit.close();
  });
}
