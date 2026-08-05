import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/manager_orders/widgets/manager_order_alert_host.dart';

/// F4a — modal global "nueva orden pagada": aparece con push en foreground
/// fuera del panel, navega con el business_uuid del payload, no molesta
/// dentro del panel, y no apila modales.

void main() {
  setUpAll(() async => S.load(const Locale('es')));

  late StreamController<Map<String, dynamic>> pushes;

  setUp(() => pushes = StreamController<Map<String, dynamic>>.broadcast());
  tearDown(() => pushes.close());

  Widget host({
    String location = '/main/home/u1/foodly-main-page',
    void Function(String)? onGo,
    String? fallbackUuid,
  }) =>
      MaterialApp(
        home: ManagerOrderAlertHost(
          pushes: pushes.stream,
          locationOf: () => location,
          onGoToOrders: onGo ?? (_) {},
          fallbackBusinessUuid: () => fallbackUuid,
          child: const Scaffold(body: Text('app')),
        ),
      );

  Map<String, dynamic> push({String? businessUuid, String? body}) => {
        'type': 'manager_group_order',
        'uuid': 'order-1',
        if (businessUuid != null) 'business_uuid': businessUuid,
        if (body != null) 'body': body,
      };

  testWidgets('push fuera del panel → modal con cuerpo; CTA navega al panel '
      'del negocio del payload y cierra', (tester) async {
    String? navigatedTo;
    await tester.pumpWidget(host(onGo: (uuid) => navigatedTo = uuid));

    pushes.add(push(businessUuid: 'biz-1', body: 'Nueva orden pagada · €64.50 · Mesa 7'));
    await tester.pumpAndSettle();

    expect(find.text(S.current.managerNewOrderTitle), findsOneWidget);
    expect(find.text('Nueva orden pagada · €64.50 · Mesa 7'), findsOneWidget);

    await tester.tap(find.text(S.current.managerNewOrderGo));
    await tester.pumpAndSettle();

    expect(navigatedTo, 'biz-1');
    expect(find.text(S.current.managerNewOrderTitle), findsNothing);
  });

  testWidgets('en el panel de órdenes NO molesta (Pusher ya refresca)', (tester) async {
    await tester.pumpWidget(host(location: '/main/biz-1/my-business/live-orders'));

    pushes.add(push(businessUuid: 'biz-1'));
    await tester.pumpAndSettle();

    expect(find.text(S.current.managerNewOrderTitle), findsNothing);
  });

  testWidgets('"Ahora no" y tap en la barrera cierran sin navegar', (tester) async {
    String? navigatedTo;
    await tester.pumpWidget(host(onGo: (uuid) => navigatedTo = uuid));

    pushes.add(push(businessUuid: 'biz-1'));
    await tester.pumpAndSettle();
    await tester.tap(find.text(S.current.managerNewOrderLater));
    await tester.pumpAndSettle();
    expect(find.text(S.current.managerNewOrderTitle), findsNothing);
    expect(navigatedTo, isNull);

    // Barrera (tap fuera de la tarjeta).
    pushes.add(push(businessUuid: 'biz-1'));
    await tester.pumpAndSettle();
    await tester.tapAt(const Offset(5, 5));
    await tester.pumpAndSettle();
    expect(find.text(S.current.managerNewOrderTitle), findsNothing);
    expect(navigatedTo, isNull);
  });

  testWidgets('no apila: segundo push con el modal abierto se descarta', (tester) async {
    await tester.pumpWidget(host());

    pushes.add(push(businessUuid: 'biz-1', body: 'primera'));
    await tester.pumpAndSettle();
    pushes.add(push(businessUuid: 'biz-1', body: 'segunda'));
    await tester.pumpAndSettle();

    expect(find.text('primera'), findsOneWidget);
    expect(find.text('segunda'), findsNothing);
  });

  testWidgets('payload sin business_uuid usa el fallback (negocio del owner '
      'en sesión)', (tester) async {
    String? navigatedTo;
    await tester.pumpWidget(host(onGo: (uuid) => navigatedTo = uuid, fallbackUuid: 'biz-fallback'));

    pushes.add(push()); // sin business_uuid (builds viejos del BE)
    await tester.pumpAndSettle();
    await tester.tap(find.text(S.current.managerNewOrderGo));
    await tester.pumpAndSettle();

    expect(navigatedTo, 'biz-fallback');
  });
}
