import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:logger/logger.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// El chip flotante suma gente a la mesa sin pasar por la GroupOrderPage.
///
/// `createInvitation()` vive en el cubit del CARRITO y no en el de la página
/// a propósito: el chip es global —se toca desde el home o el menú— y ahí la
/// GroupOrderPage no está montada. Pasarle su cubit por `BlocProvider.value`
/// ataría un widget global al ciclo de vida de una ruta que casi nunca está
/// en pantalla.
void main() {
  setUpAll(() async => S.load(const Locale('es')));

  late _FakeRepo repo;
  late ActiveGroupOrderCubit cubit;

  setUp(() {
    repo = _FakeRepo();
    cubit = ActiveGroupOrderCubit(repo: repo, logger: Logger(level: Level.off));
  });

  tearDown(() => cubit.close());

  GroupOrderDM order({GroupOrderStatus status = GroupOrderStatus.open}) => GroupOrderDM(
        uuid: 'o1',
        status: status,
        businessName: 'Tasca do Bairro',
        paymentMode: GroupPaymentMode.openTab,
        confirmedAt: status == GroupOrderStatus.open ? null : DateTime(2026, 8, 21),
        subtotal: 26,
        items: const [GroupOrderItemDM(uuid: 'i1', name: 'Plato', unitPricePreview: 26)],
      );

  Future<void> pump(WidgetTester tester, GroupOrderDM o) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    cubit.emit(o);
    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child ?? const SizedBox.shrink(),
          breakpoints: DeviceSize.breakpoints,
        ),
        home: BlocProvider<ActiveGroupOrderCubit>.value(
          value: cubit,
          child: Scaffold(body: ActiveGroupOrderChip(order: o, onTap: () {})),
        ),
      ),
    );
  }

  Finder inviteBtn() => find.byTooltip(S.current.groupOrderInviteCta);

  testWidgets('el botón de invitar aparece con el carrito editable', (tester) async {
    await pump(tester, order());
    expect(inviteBtn(), findsOneWidget);
  });

  testWidgets('tocarlo pide el código y muestra el QR', (tester) async {
    repo.inviteOutcome = const ApiResult.success(GroupInviteResponseDM(inviteCode: 'K7QP42'));

    await pump(tester, order());
    await tester.tap(inviteBtn());
    await tester.pumpAndSettle();

    expect(repo.inviteCalls, 1);
    expect(repo.lastInviteUuid, 'o1');
    expect(find.byType(FoodlyQrCard), findsOneWidget);
    expect(find.text('K7QP42'), findsOneWidget);
  });

  testWidgets('si el backend rechaza, se muestra SU motivo y no un QR vacío', (tester) async {
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

    await pump(tester, order());
    await tester.tap(inviteBtn());
    await tester.pumpAndSettle();

    expect(find.byType(FoodlyQrCard), findsNothing);
    // El copy genérico taparía lo único accionable que manda el backend.
    expect(find.textContaining('La orden ya fue cerrada'), findsOneWidget);
  });
}

/// Fake mínimo: sólo `createInvitation` importa acá; el resto cae en
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
