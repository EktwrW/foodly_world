import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/group_orders/group_order_repo.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/qr/foodly_qr_card.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/active_group_order_chip.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_chip_logic.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_floating_chip_host.dart';
import 'package:logger/logger.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Invitar a la mesa desde el chip flotante.
///
/// Se maneja el HOST, no el chip suelto: el chip lo monta el builder de
/// MaterialApp, fuera del árbol de providers, y la primera versión de esto
/// hacía `context.read<ActiveGroupOrderCubit>()` desde adentro. En un test
/// que envolvía el chip en un `BlocProvider` pasaba en verde; en el device
/// tiraba ProviderNotFoundError apenas se tocaba el botón.
///
/// Por eso ahora el chip recibe `onInvite` como callback y quien tiene DI es
/// el host — y por eso el test entra por donde entra la app.
void main() {
  setUpAll(() async => S.load(const Locale('es')));
  tearDown(() {
    GroupOrderChipPositionStore.reset();
    GroupOrderPageVisibility.reset();
  });

  late _FakeRepo repo;
  late _SeededActiveCubit cart;

  setUp(() {
    repo = _FakeRepo();
    // UN solo cubit para las dos costuras, como en producción: el host las
    // separa por tipo (`ordersSource` es un StateStreamable cualquiera),
    // pero el singleton real es el mismo objeto. Con dos distintos el test
    // mentiría: `createInvitation()` lee el uuid de SU estado, y uno vacío
    // devolvía null sin llamar al repo.
    cart = _SeededActiveCubit(repo: repo, logger: Logger(level: Level.off));
  });

  tearDown(() => cart.close());

  const order = GroupOrderDM(
    uuid: 'o1',
    businessName: 'Tasca do Bairro',
    subtotal: 26,
    items: [GroupOrderItemDM(uuid: 'i1', name: 'Plato', unitPricePreview: 26)],
  );

  Future<void> pumpHost(WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    cart.seed(order);

    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child ?? const SizedBox.shrink(),
          breakpoints: DeviceSize.breakpoints,
        ),
        home: GroupOrderFloatingChipHost(
          ordersSource: cart,
          inviteSource: cart,
          routeListenable: ValueNotifier('/visit-menu/m1'),
          locationOf: () => '/visit-menu/m1',
          onOpenOrder: (_) {},
          child: const Scaffold(body: SizedBox.expand()),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  Finder inviteBtn() => find.byTooltip(S.current.groupOrderInviteCta);

  testWidgets('el chip suelto NO trae botón: sin quién lo atienda, no se ofrece',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: Scaffold(body: ActiveGroupOrderChip(order: order, onTap: () {}))),
    );
    expect(inviteBtn(), findsNothing);
  });

  testWidgets('montado por el host sí aparece', (tester) async {
    await pumpHost(tester);
    expect(inviteBtn(), findsOneWidget);
  });

  testWidgets('tocarlo pide el código y muestra el QR — sin provider arriba',
      (tester) async {
    repo.inviteOutcome = const ApiResult.success(GroupInviteResponseDM(inviteCode: 'K7QP42'));

    await pumpHost(tester);
    await tester.tap(inviteBtn());
    await tester.pumpAndSettle();

    expect(repo.inviteCalls, 1);
    expect(repo.lastInviteUuid, 'o1');
    expect(find.byType(FoodlyQrCard), findsOneWidget);
    expect(find.text('K7QP42'), findsOneWidget);
  });

  testWidgets('si el backend rechaza, se muestra SU motivo y no un QR vacío',
      (tester) async {
    repo.inviteOutcome = ApiResult.failure(
      AppRequestException(
        error: DioException(
          requestOptions: RequestOptions(path: '/x'),
          response: Response(
            requestOptions: RequestOptions(path: '/x'),
            statusCode: 409,
            data: {'message': 'La orden ya fue cerrada'},
          ),
        ),
      ),
    );

    await pumpHost(tester);
    await tester.tap(inviteBtn());
    await tester.pumpAndSettle();

    expect(find.byType(FoodlyQrCard), findsNothing);
    expect(find.textContaining('La orden ya fue cerrada'), findsOneWidget);
  });
}

/// El cubit real del carrito con estado sembrado a mano: `emit` es protegido
/// y desde afuera sólo se llega vía red.
class _SeededActiveCubit extends ActiveGroupOrderCubit {
  _SeededActiveCubit({required super.repo, required super.logger});

  void seed(GroupOrderDM order) => emit(order);
}

/// Fake mínimo: sólo `createInvitation` importa; el resto cae en
/// noSuchMethod y estalla si alguien lo toca sin querer.
class _FakeRepo implements GroupOrderRepo {
  ApiResult<GroupInviteResponseDM>? inviteOutcome;
  int inviteCalls = 0;
  String? lastInviteUuid;

  @override
  Future<ApiResult<GroupInviteResponseDM>> createInvitation(String uuid) async {
    inviteCalls++;
    lastInviteUuid = uuid;
    return inviteOutcome!;
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
