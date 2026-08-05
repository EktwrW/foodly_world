import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/manager_orders/widgets/manager_widgets.dart';
import 'package:foodly_world/ui/views/manager_orders/widgets/payment_mode_selector.dart';

/// F4b-2/4 — selector "¿Cómo cobra tu negocio?" (elección EXPLÍCITA, sin
/// default preseleccionado) y badge de cobro del panel del manager.

void main() {
  setUpAll(() async => S.load(const Locale('es')));

  group('PaymentModeSelector', () {
    testWidgets('sin selección previa el CTA arranca deshabilitado y no '
        'confirma nada (decisión: elección explícita)', (tester) async {
      GroupPaymentMode? confirmed;
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: PaymentModeSelector(onConfirm: (m) => confirmed = m),
        ),
      ));

      expect(find.text(S.current.paymentModeTitle), findsOneWidget);
      expect(find.text(S.current.paymentModeOpenTabTitle), findsOneWidget);
      expect(find.text(S.current.paymentModePerRoundTitle), findsOneWidget);

      await tester.tap(find.text(S.current.confirm));
      await tester.pumpAndSettle();
      expect(confirmed, isNull, reason: 'sin elegir, el CTA no hace nada');
    });

    testWidgets('elegir cuenta abierta y confirmar devuelve openTab', (tester) async {
      GroupPaymentMode? confirmed;
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: PaymentModeSelector(onConfirm: (m) => confirmed = m),
        ),
      ));

      await tester.tap(find.text(S.current.paymentModeOpenTabTitle));
      await tester.pumpAndSettle();
      await tester.tap(find.text(S.current.confirm));
      await tester.pumpAndSettle();

      expect(confirmed, GroupPaymentMode.openTab);
    });

    testWidgets('elegir prepago devuelve perRound; el flujo se explica en '
        'lenguaje de negocio', (tester) async {
      GroupPaymentMode? confirmed;
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: PaymentModeSelector(
            initial: GroupPaymentMode.openTab,
            onConfirm: (m) => confirmed = m,
          ),
        ),
      ));

      expect(find.text(S.current.paymentModePerRoundFlow), findsOneWidget);

      await tester.tap(find.text(S.current.paymentModePerRoundTitle));
      await tester.pumpAndSettle();
      await tester.tap(find.text(S.current.confirm));
      await tester.pumpAndSettle();

      expect(confirmed, GroupPaymentMode.perRound);
    });
  });

  group('ManagerPaymentBadge', () {
    Widget host(GroupOrderDM order) =>
        MaterialApp(home: Scaffold(body: ManagerPaymentBadge(order: order)));

    testWidgets('cuenta abierta sin cobrar → POR PAGAR', (tester) async {
      await tester.pumpWidget(host(const GroupOrderDM(
        uuid: 'o1',
        status: GroupOrderStatus.confirmed,
        paymentMode: GroupPaymentMode.openTab,
        totalAmount: 63,
      )));

      expect(find.text(S.current.managerUnpaidBadge), findsOneWidget);
      expect(find.text(S.current.managerPaidComplete), findsNothing);
    });

    testWidgets('pagada (total_paid cubre el total) → PAGADA', (tester) async {
      await tester.pumpWidget(host(const GroupOrderDM(
        uuid: 'o1',
        status: GroupOrderStatus.confirmed,
        paymentMode: GroupPaymentMode.openTab,
        totalAmount: 63,
        totalPaid: 63,
      )));

      expect(find.text(S.current.managerPaidComplete), findsOneWidget);
      expect(find.text(S.current.managerUnpaidBadge), findsNothing);
    });

    testWidgets('prepago por ronda: la comanda nace pagada', (tester) async {
      await tester.pumpWidget(host(const GroupOrderDM(
        uuid: 'o1',
        status: GroupOrderStatus.confirmed,
        totalAmount: 28,
        totalPaid: 28,
      )));

      expect(find.text(S.current.managerPaidComplete), findsOneWidget);
    });
  });
}
