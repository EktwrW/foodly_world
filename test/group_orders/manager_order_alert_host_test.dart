import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/manager_orders/widgets/manager_order_alert_host.dart';

/// F4a — modal global de aviso al manager: aparece con push en foreground
/// fuera del panel, navega con el business_uuid del payload, no molesta
/// dentro del panel, y no apila modales.
///
/// e2e 2026-08-06: el título depende del `kind` que manda el BE (antes todo
/// se anunciaba como "pagada", incluso una cuenta abierta sin cobrar) y el
/// CTA abre la orden concreta, no la lista.

void main() {
  setUpAll(() async => S.load(const Locale('es')));

  late StreamController<Map<String, dynamic>> pushes;

  setUp(() => pushes = StreamController<Map<String, dynamic>>.broadcast());
  tearDown(() => pushes.close());

  Widget host({
    String location = '/main/home/u1/foodly-main-page',
    void Function(String, String?)? onGo,
    String? fallbackUuid,
  }) =>
      MaterialApp(
        home: ManagerOrderAlertHost(
          pushes: pushes.stream,
          locationOf: () => location,
          onGoToOrders: onGo ?? (_, __) {},
          fallbackBusinessUuid: () => fallbackUuid,
          child: const Scaffold(body: Text('app')),
        ),
      );

  Map<String, dynamic> push({String? businessUuid, String? body, String? kind}) => {
        'type': 'manager_group_order',
        'uuid': 'order-1',
        if (kind != null) 'kind': kind,
        if (businessUuid != null) 'business_uuid': businessUuid,
        if (body != null) 'body': body,
      };

  testWidgets('push fuera del panel → modal con cuerpo; CTA navega al panel '
      'del negocio del payload y cierra', (tester) async {
    String? navigatedTo;
    await tester.pumpWidget(host(onGo: (uuid, _) => navigatedTo = uuid));

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
    await tester.pumpWidget(host(onGo: (uuid, _) => navigatedTo = uuid));

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
    await tester.pumpWidget(host(onGo: (uuid, _) => navigatedTo = uuid, fallbackUuid: 'biz-fallback'));

    pushes.add(push()); // sin business_uuid (builds viejos del BE)
    await tester.pumpAndSettle();
    await tester.tap(find.text(S.current.managerNewOrderGo));
    await tester.pumpAndSettle();

    expect(navigatedTo, 'biz-fallback');
  });

  // ── Título por evento (e2e 2026-08-06) ─────────────────────────────
  //
  // Anunciar "¡Nueva orden pagada!" cuando la mesa solo mandó una comanda a
  // cocina le promete al negocio un cobro que no ocurrió.

  testWidgets('kind=new_order → "¡Nueva orden!", sin prometer cobro', (tester) async {
    await tester.pumpWidget(host());
    pushes.add(push(businessUuid: 'biz-1', kind: 'new_order'));
    await tester.pumpAndSettle();

    expect(find.text(S.current.managerNewOrderTitle), findsOneWidget);
    expect(find.text(S.current.managerPaidOrderTitle), findsNothing);
  });

  testWidgets('kind=more_items → "La mesa pidió más"', (tester) async {
    await tester.pumpWidget(host());
    pushes.add(push(businessUuid: 'biz-1', kind: 'more_items'));
    await tester.pumpAndSettle();

    expect(find.text(S.current.managerMoreItemsTitle), findsOneWidget);
    expect(find.text(S.current.managerNewOrderTitle), findsNothing);
  });

  testWidgets('kind=paid → "¡Nueva orden pagada!" (único caso que habla de dinero)',
      (tester) async {
    await tester.pumpWidget(host());
    pushes.add(push(businessUuid: 'biz-1', kind: 'paid'));
    await tester.pumpAndSettle();

    expect(find.text(S.current.managerPaidOrderTitle), findsOneWidget);
  });

  testWidgets('sin kind (builds viejos del BE) cae en el título neutro', (tester) async {
    await tester.pumpWidget(host());
    pushes.add(push(businessUuid: 'biz-1'));
    await tester.pumpAndSettle();

    expect(find.text(S.current.managerNewOrderTitle), findsOneWidget);
  });

  // ── Navegación a la orden concreta ─────────────────────────────────

  testWidgets('el CTA lleva el uuid de la ORDEN, no solo el del negocio',
      (tester) async {
    String? biz;
    String? order;
    await tester.pumpWidget(host(onGo: (b, o) {
      biz = b;
      order = o;
    }));

    pushes.add(push(businessUuid: 'biz-1', kind: 'more_items'));
    await tester.pumpAndSettle();
    await tester.tap(find.text(S.current.managerNewOrderGo));
    await tester.pumpAndSettle();

    expect(biz, 'biz-1');
    expect(order, 'order-1', reason: 'Sin esto el manager cae en la lista a buscarla.');
  });
}
