import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/data_models/group_orders/manager_orders_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/manager_orders_cubit.dart';
import 'package:foodly_world/ui/views/manager_orders/cubit/stripe_onboarding_cubit.dart';
import 'package:foodly_world/ui/views/manager_orders/manager_orders_page.dart';
import 'package:logger/logger.dart';

/// EL CHIP "TODAS" CONTABA EL CUBO FILTRADO.
///
/// `state.total` llevaba DOS cantidades que sólo coinciden sin chip puesto: el
/// total del listado —el del pie "mostrando N de M", que el backend devuelve
/// ya filtrado— y el del panel entero, que es lo que pinta el chip "Todas".
/// Con 1 pendiente y 2 listas y el chip "Listas" marcado, "Todas" decía **2**.
///
/// No es una carrera ni un parpadeo: mientras hubiera un chip puesto, el
/// número era falso y se quedaba falso, en la pantalla que la cocina mira de
/// un vistazo. El backend ya mandaba el dato en cada mutación (be-foodly
/// #148) y el cliente lo tiraba; en la LISTA no lo mandaba nadie hasta
/// be-foodly #149.

class _FakeRepo implements GroupOrderRepo {
  ApiResult<ManagerOrdersResponseDM>? lista;
  ApiResult<GroupOrderResponseDM>? accion;
  String? ultimoBucket;

  @override
  Future<ApiResult<ManagerOrdersResponseDM>> managerOrders(
    String businessUuid, {
    String? bucket,
    int? page,
  }) async {
    ultimoBucket = bucket;
    return lista!;
  }

  @override
  Future<ApiResult<GroupOrderResponseDM>> managerSetFulfillment(
    String uuid, {
    required String status,
  }) async =>
      accion!;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  setUpAll(() async => S.load(const Locale('es')));

  // Con `businessName`: la tarjeta cae en `uuid.substring(0, 8)` cuando falta,
  // y un uuid de una letra revienta el `pumpWidget` antes de llegar al chip.
  const lista1 = GroupOrderDM(
      uuid: 'a', status: GroupOrderStatus.confirmed, businessName: 'Best Sushi Lounge');
  const lista2 = GroupOrderDM(
      uuid: 'b', status: GroupOrderStatus.confirmed, businessName: 'Best Sushi Lounge');

  // 1 pendiente + 2 listas = 3 en el panel. Los cuatro cubos NO suman 3 por
  // casualidad: suman 3 porque los tres números son reales.
  const contadores = ManagerOrderCountsDM(pending: 1, ready: 2);

  /// La respuesta del panel SIN chip: ahí `meta.total` y el global coinciden,
  /// y por eso el fallo no se veía hasta tocar un chip.
  ApiResult<ManagerOrdersResponseDM> sinChip({int? global = 3}) =>
      ApiResult.success(ManagerOrdersResponseDM(
        orders: const [lista1, lista2],
        counts: contadores,
        countsTotal: global,
        meta: const ManagerOrdersMetaDM(total: 3),
      ));

  /// Y CON el chip "Listas" puesto: `meta.total` es 2 —el del cubo— y el
  /// global sigue siendo 3.
  ApiResult<ManagerOrdersResponseDM> conChipListas({int? global = 3}) =>
      ApiResult.success(ManagerOrdersResponseDM(
        orders: const [lista1, lista2],
        counts: contadores,
        countsTotal: global,
        meta: const ManagerOrdersMetaDM(total: 2),
      ));

  late _FakeRepo repo;
  late ManagerOrdersCubit cubit;

  setUp(() {
    repo = _FakeRepo();
    cubit = ManagerOrdersCubit(
      repo: repo,
      logger: Logger(level: Level.off),
      businessUuid: 'biz-1',
    );
  });

  tearDown(() => cubit.close());

  group('en pantalla', () {
    Widget app(ManagerOrdersCubit cubit) {
      final stripe = StripeOnboardingCubit(
        repo: _FakeRepo(),
        logger: Logger(level: Level.off),
        businessUuid: 'biz-1',
      );
      addTearDown(stripe.close);

      return MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: cubit),
            BlocProvider.value(value: stripe),
          ],
          child: const ManagerOrdersPage(),
        ),
      );
    }

    /// El número que el segmento de [etiqueta] pinta encima de su nombre.
    ///
    /// Se lee del segmento CONCRETO y no con un `find.text('3')` suelto: el
    /// pie y las tarjetas también pintan números, y un finder global pasaría
    /// por la razón equivocada en cuanto alguno coincidiera.
    String numeroDelChip(WidgetTester tester, String etiqueta) {
      final columna = find.ancestor(of: find.text(etiqueta), matching: find.byType(Column)).first;
      final numero = find.descendant(of: columna, matching: find.byType(Text)).first;

      return (tester.widget<Text>(numero)).data!;
    }

    testWidgets('con un chip puesto, "Todas" sigue contando el panel entero',
        (tester) async {
      repo.lista = sinChip();
      await tester.pumpWidget(app(cubit));
      await cubit.load();
      await tester.pumpAndSettle();

      expect(numeroDelChip(tester, S.current.managerBucketAll), '3');

      // Y ahora el chip "Listas", que es donde estaba el fallo.
      repo.lista = conChipListas();
      await tester.tap(find.text(S.current.managerBucketReady));
      await tester.pumpAndSettle();

      expect(repo.ultimoBucket, 'ready', reason: 'el tap no llegó al cubit');
      expect(
        numeroDelChip(tester, S.current.managerBucketAll),
        '3',
        reason: '"Todas" se quedó con el total del cubo filtrado',
      );
      expect(numeroDelChip(tester, S.current.managerBucketReady), '2');
      expect(numeroDelChip(tester, S.current.managerBucketPending), '1');
    });
  });

  group('en el cubit', () {
    test('selectBucket: el listado pasa a contar el cubo, el panel no', () async {
      repo.lista = sinChip();
      await cubit.load();
      expect(cubit.state.total, 3);
      expect(cubit.state.panelTotal, 3);

      repo.lista = conChipListas();
      await cubit.selectBucket('ready');

      // Son DOS números, y aquí se separan.
      expect(cubit.state.total, 2, reason: 'el pie tiene que seguir hablando del cubo');
      expect(cubit.state.panelTotal, 3, reason: 'el chip "Todas" cuenta el panel entero');
    });

    /// Lo que el cliente TIRABA: la mutación manda `counts_total` desde
    /// be-foodly #148, filtre lo que filtre, así que con un chip puesto el
    /// chip "Todas" se pone al día sin releer nada.
    test('una acción con chip puesto refresca el total del panel', () async {
      repo.lista = conChipListas();
      await cubit.selectBucket('ready');
      expect(cubit.state.panelTotal, 3);

      // Una mesa se cerró en otro sitio: el panel pasa a 2.
      repo.accion = ApiResult.success(GroupOrderResponseDM(
        groupOrder: lista1.copyWith(fulfillmentStatus: GroupFulfillmentStatus.ready),
        panelCounts: const ManagerOrderCountsDM(ready: 2),
        panelTotal: 2,
        stillInPanel: true,
      ));

      await cubit.advanceFulfillment('a', 'ready');

      expect(cubit.state.panelTotal, 2, reason: 'la mutación traía el total y se descartó');
    });

    /// Respaldo para un backend anterior a be-foodly #149: SIN chip,
    /// `meta.total` ya es el global, así que el respaldo es exacto.
    test('backend sin counts_total y sin chip: el respaldo es exacto', () async {
      repo.lista = sinChip(global: null);
      await cubit.load();

      expect(cubit.state.panelTotal, 3);
    });

    /// Y CON chip no hay respaldo que valga: `meta.total` es el del cubo y
    /// sumar los cuatro chips es el error que el backend tiene prohibido por
    /// test. Se conserva el último global conocido antes que inventar uno.
    test('backend sin counts_total y con chip: conserva el último conocido', () async {
      repo.lista = sinChip(global: null);
      await cubit.load();

      repo.lista = conChipListas(global: null);
      await cubit.selectBucket('ready');

      expect(cubit.state.total, 2);
      expect(
        cubit.state.panelTotal,
        3,
        reason: 'se quedó con el total del cubo, que es justo el fallo original',
      );
    });
  });

  test('el DM lee counts_total del JSON', () {
    final r = ManagerOrdersResponseDM.fromJson(const {
      'success': true,
      'orders': <Map<String, dynamic>>[],
      'counts': {'pending': 1, 'preparing': 0, 'ready': 2, 'delivered': 0},
      'counts_total': 3,
      'meta': {'current_page': 1, 'last_page': 1, 'total': 2},
    });

    expect(r.countsTotal, 3);
    expect(r.meta?.total, 2, reason: 'y no es el mismo campo que el del listado');
  });
}
