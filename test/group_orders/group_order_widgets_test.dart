import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_item_tile.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_totals_footer.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/participant_expansible_tile.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/participant_progress_row.dart';

Widget _host(Widget child) => MaterialApp(home: Scaffold(body: child));

void main() {
  // Carga las traducciones (locale es) para que S.current funcione en los
  // widgets; las aserciones de abajo usan los textos en español.
  setUpAll(() async => S.load(const Locale('es')));

  group('GroupOrderItemTile', () {
    testWidgets('muestra cantidad, nombre y total de línea', (tester) async {
      const item = GroupOrderItemDM(
        uuid: 'i1',
        name: 'Nachos',
        unitPricePreview: 5.0,
        quantity: 2,
      );

      await tester.pumpWidget(_host(const GroupOrderItemTile(item: item)));

      expect(find.text('Nachos'), findsOneWidget);
      expect(find.text('2×'), findsOneWidget);
      expect(find.text('€10.00'), findsOneWidget); // 5.00 × 2
    });

    testWidgets('usa el precio congelado (at_lock) cuando existe', (tester) async {
      const item = GroupOrderItemDM(
        uuid: 'i2',
        name: 'Pizza',
        unitPricePreview: 8.0,
        unitPriceAtLock: 9.5,
      );

      await tester.pumpWidget(_host(const GroupOrderItemTile(item: item)));

      expect(find.text('€9.50'), findsOneWidget);
    });

    testWidgets('muestra botón de eliminar solo si onRemove != null', (tester) async {
      const item = GroupOrderItemDM(uuid: 'i3', name: 'Agua', unitPricePreview: 1.0);

      await tester.pumpWidget(_host(const GroupOrderItemTile(item: item)));
      expect(find.byIcon(Icons.close_rounded), findsNothing);

      await tester.pumpWidget(_host(GroupOrderItemTile(item: item, onRemove: () {})));
      expect(find.byIcon(Icons.close_rounded), findsOneWidget);
    });
  });

  group('ParticipantProgressRow', () {
    testWidgets('participante pagado: check verde, nombre y monto', (tester) async {
      const p = GroupOrderParticipantDM(
        uuid: 'p1',
        displayName: 'María',
        role: GroupParticipantRole.host,
        paymentStatus: GroupPaymentStatus.paid,
        amountDue: 12.5,
      );

      await tester.pumpWidget(_host(const ParticipantProgressRow(participant: p)));

      expect(find.text('María'), findsOneWidget);
      expect(find.text('Host'), findsOneWidget);
      expect(find.text('€12.50'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle_rounded), findsOneWidget);
    });

    testWidgets('participante pendiente: círculo hueco, sin badge host', (tester) async {
      const p = GroupOrderParticipantDM(
        uuid: 'p2',
        displayName: 'Pedro',
        amountDue: 20.0,
      );

      await tester.pumpWidget(_host(const ParticipantProgressRow(participant: p)));

      expect(find.text('Pedro'), findsOneWidget);
      expect(find.text('Host'), findsNothing);
      expect(find.byIcon(Icons.circle_outlined), findsOneWidget);
    });
  });

  group('GroupOrderTotalsFooter', () {
    const order = GroupOrderDM(
      uuid: 'o1',
      status: GroupOrderStatus.locked,
      subtotal: 60.0,
      totalAmount: 60.0,
      totalPaid: 40.0,
      participants: [
        GroupOrderParticipantDM(uuid: 'a', displayName: 'A', paymentStatus: GroupPaymentStatus.paid, amountDue: 20),
        GroupOrderParticipantDM(uuid: 'b', displayName: 'B', paymentStatus: GroupPaymentStatus.paid, amountDue: 20),
        GroupOrderParticipantDM(uuid: 'c', displayName: 'C', amountDue: 20),
      ],
    );

    testWidgets('muestra progreso y habilita el CTA cuando hay saldo', (tester) async {
      var paid = false;
      await tester.pumpWidget(_host(GroupOrderTotalsFooter(
        order: order,
        myShare: 20.0,
        onPay: () => paid = true,
      )));

      expect(find.text('2 de 3 pagado'), findsOneWidget);
      expect(find.textContaining('Pagar mi parte'), findsOneWidget);

      await tester.tap(find.textContaining('Pagar mi parte'));
      await tester.pumpAndSettle(); // drena el timer de animación del NeumorphicButton
      expect(paid, isTrue);
    });

    testWidgets('CTA deshabilitado y sin callback cuando no hay saldo', (tester) async {
      await tester.pumpWidget(_host(const GroupOrderTotalsFooter(
        order: order,
        myShare: 0.0,
      )));

      expect(find.text('Sin saldo pendiente'), findsOneWidget);
    });
  });

  group('ParticipantExpansibleTile (diseño v2)', () {
    const p1 = GroupOrderParticipantDM(
      uuid: 'p1',
      displayName: 'Ana',
      role: GroupParticipantRole.host,
      amountDue: 99.0,
    );
    const openOrder = GroupOrderDM(
      uuid: 'o1',
      participants: [p1],
      items: [
        GroupOrderItemDM(uuid: 'i1', participantUuid: 'p1', name: 'Nachos', unitPricePreview: 5.0, quantity: 2),
        GroupOrderItemDM(uuid: 'i2', participantUuid: 'p1', name: 'Agua', unitPricePreview: 1.5),
      ],
    );

    testWidgets('header: nombre, Host y subtotal vivo (preview), sin badge de pago en OPEN', (tester) async {
      await tester.pumpWidget(_host(const ParticipantExpansibleTile(order: openOrder, participant: p1)));

      expect(find.text('Ana'), findsOneWidget);
      expect(find.text('Host'), findsOneWidget);
      expect(find.text('€11.50'), findsOneWidget); // 5.0×2 + 1.5 — NO el amount_due (99)
      expect(find.byIcon(Icons.circle_outlined), findsNothing); // badge solo post-lock
      expect(find.text('Nachos'), findsNothing); // colapsado por defecto
    });

    testWidgets('tap en el header expande y muestra los ítems con su X', (tester) async {
      await tester.pumpWidget(_host(ParticipantExpansibleTile(
        order: openOrder,
        participant: p1,
        onRemoveItem: (_) {},
      )));

      await tester.tap(find.text('Ana'));
      await tester.pumpAndSettle();

      expect(find.text('Nachos'), findsOneWidget);
      expect(find.text('Agua'), findsOneWidget);
      expect(find.byIcon(Icons.close_rounded), findsNWidgets(2));
    });

    testWidgets('sin onRemoveItem no hay X en los ítems', (tester) async {
      await tester.pumpWidget(_host(const ParticipantExpansibleTile(order: openOrder, participant: p1)));

      await tester.tap(find.text('Ana'));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.close_rounded), findsNothing);
    });

    testWidgets('orden LOCKED: subtotal = amount_due congelado y badge de pago visible', (tester) async {
      final locked = openOrder.copyWith(status: GroupOrderStatus.locked);
      await tester.pumpWidget(_host(ParticipantExpansibleTile(order: locked, participant: p1)));

      expect(find.text('€99.00'), findsOneWidget);
      expect(find.byIcon(Icons.circle_outlined), findsOneWidget); // pendiente
    });

    testWidgets('initiallyExpanded muestra los ítems sin tap (mi grupo)', (tester) async {
      await tester.pumpWidget(_host(const ParticipantExpansibleTile(
        order: openOrder,
        participant: p1,
        initiallyExpanded: true,
      )));
      await tester.pumpAndSettle();

      expect(find.text('Nachos'), findsOneWidget);
    });
  });
}
