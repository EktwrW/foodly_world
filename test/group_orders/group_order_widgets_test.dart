// ignore_for_file: avoid_redundant_argument_values

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_formatting.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_item_tile.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_totals_footer.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/participant_expansible_tile.dart';

Widget _host(Widget child) => MaterialApp(home: Scaffold(body: child));

void main() {
  /// El icono del botón de eliminar un ítem. Nombrado UNA vez porque ya
  /// cambió tres veces —`Icons.close_rounded` → `Bootstrap.trash3` →
  /// `Icons.remove_circle_outline`— y estaba escrito en ocho aserciones.
  const iconoEliminar = Icons.remove_circle_outline;

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

    testWidgets(
        'e2e r7: el badge Compartido lleva tooltip por TAP que explica '
        'el reparto (se confundía con "yo invito")', (tester) async {
      const item = GroupOrderItemDM(
        uuid: 'i5',
        name: 'Jarra de sangría',
        unitPricePreview: 12.0,
        shared: true,
      );

      await tester.pumpWidget(_host(const GroupOrderItemTile(item: item)));

      final tooltip = tester.widget<Tooltip>(find.byType(Tooltip));
      expect(tooltip.message, S.current.groupOrderSharedBadgeTooltip);
      expect(tooltip.triggerMode, TooltipTriggerMode.tap);

      // Tap sobre el badge → aparece el texto explicativo en pantalla.
      await tester.tap(find.byType(Tooltip));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text(S.current.groupOrderSharedBadgeTooltip), findsOneWidget);

      // Deja expirar el tooltip (drena su timer de auto-cierre).
      await tester.pump(const Duration(seconds: 5));
    });

    testWidgets('sin shared no hay badge ni tooltip', (tester) async {
      const item = GroupOrderItemDM(uuid: 'i6', name: 'Agua', unitPricePreview: 1.0);
      await tester.pumpWidget(_host(const GroupOrderItemTile(item: item)));
      expect(find.byType(Tooltip), findsNothing);
    });

    testWidgets('muestra botón de eliminar solo si onRemove != null', (tester) async {
      const item = GroupOrderItemDM(uuid: 'i3', name: 'Agua', unitPricePreview: 1.0);

      await tester.pumpWidget(_host(const GroupOrderItemTile(item: item)));
      expect(find.byIcon(iconoEliminar), findsNothing);

      await tester.pumpWidget(_host(GroupOrderItemTile(item: item, onRemove: () async {})));
      expect(find.byIcon(iconoEliminar), findsOneWidget);
    });

    testWidgets(
        'e2e r6: mientras el borrado está en vuelo la X es spinner, '
        'ignora re-taps y vuelve al terminar', (tester) async {
      const item = GroupOrderItemDM(uuid: 'i4', name: 'Nachos', unitPricePreview: 5.0);
      final gate = Completer<void>();
      var calls = 0;

      await tester.pumpWidget(_host(GroupOrderItemTile(
        item: item,
        onRemove: () {
          calls++;
          return gate.future;
        },
      )));

      await tester.tap(find.byIcon(iconoEliminar));
      await tester.pump();

      // En vuelo: spinner visible, X fuera, y no hay nada tapeable.
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byIcon(iconoEliminar), findsNothing);
      expect(calls, 1);

      // El borrado termina → vuelve la X y un solo call en total.
      gate.complete();
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byIcon(iconoEliminar), findsOneWidget);
      expect(calls, 1);
    });
  });

  group('shouldCelebrateConfirmation (e2e r7: cierre del flujo de pago)', () {
    test('celebra SOLO al transitar viva→confirmada, una única vez', () {
      // Transición real: vimos la orden viva y ahora está confirmada.
      expect(
        shouldCelebrateConfirmation(alreadyShown: false, sawAliveOrder: true, isConfirmed: true),
        isTrue,
      );
      // Ya se mostró → nunca más.
      expect(
        shouldCelebrateConfirmation(alreadyShown: true, sawAliveOrder: true, isConfirmed: true),
        isFalse,
      );
      // Abrir una orden YA confirmada (historial) NO dispara festejo.
      expect(
        shouldCelebrateConfirmation(alreadyShown: false, sawAliveOrder: false, isConfirmed: true),
        isFalse,
      );
      // Orden aún viva → nada que celebrar.
      expect(
        shouldCelebrateConfirmation(alreadyShown: false, sawAliveOrder: true, isConfirmed: false),
        isFalse,
      );
    });

    // e2e 2026-08-06 — en cuenta abierta `confirmed` es el PRINCIPIO (primera
    // tanda a cocina), no el final. Festejar ahí ponía "¡Orden confirmada!"
    // detrás del sheet "Pedido enviado a cocina".
    test('cuenta abierta: enviar la primera tanda NO se celebra', () {
      expect(
        shouldCelebrateConfirmation(
          alreadyShown: false,
          sawAliveOrder: true,
          isConfirmed: true, // confirmed = comanda enviada
          isOpenTab: true,
          isPaid: false, // nadie pagó todavía
        ),
        isFalse,
        reason: 'La mesa recién pidió: la orden empieza, no termina.',
      );
    });

    test('cuenta abierta: se celebra al SALDAR la cuenta', () {
      expect(
        shouldCelebrateConfirmation(
          alreadyShown: false,
          sawAliveOrder: true,
          isConfirmed: true,
          isOpenTab: true,
          isPaid: true,
        ),
        isTrue,
      );
    });

    test('cuenta abierta: entregada pero SIN pagar tampoco se celebra', () {
      expect(
        shouldCelebrateConfirmation(
          alreadyShown: false,
          sawAliveOrder: true,
          isConfirmed: true,
          isOpenTab: true,
          isPaid: false,
        ),
        isFalse,
      );
    });

    test('prepago por ronda no cambia: pagar ES confirmar', () {
      expect(
        shouldCelebrateConfirmation(
          alreadyShown: false,
          sawAliveOrder: true,
          isConfirmed: true,
          isOpenTab: false,
          isPaid: false, // el modo viejo no mira el dinero
        ),
        isTrue,
      );
    });

    // Invariante sobre el producto cartesiano: ninguna combinación puede
    // celebrar dos veces ni celebrar sin haber visto la orden viva.
    test('invariante: alreadyShown o !sawAliveOrder ⇒ nunca celebra', () {
      for (final confirmed in [true, false]) {
        for (final openTab in [true, false]) {
          for (final paid in [true, false]) {
            expect(
              shouldCelebrateConfirmation(
                alreadyShown: true,
                sawAliveOrder: true,
                isConfirmed: confirmed,
                isOpenTab: openTab,
                isPaid: paid,
              ),
              isFalse,
            );
            expect(
              shouldCelebrateConfirmation(
                alreadyShown: false,
                sawAliveOrder: false,
                isConfirmed: confirmed,
                isOpenTab: openTab,
                isPaid: paid,
              ),
              isFalse,
            );
          }
        }
      }
    });
  });

  // ParticipantProgressRow (F1) quedó obsoleto: lo reemplazó
  // ParticipantExpansibleTile en F2a y ya no se usa en lib/ — sus tests se
  // retiraron junto con el widget (refinamiento pre-F4a).

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
        onPay: (_) => paid = true,
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
        onRemoveItem: (_) async {},
      )));

      await tester.tap(find.text('Ana'));
      await tester.pumpAndSettle();

      expect(find.text('Nachos'), findsOneWidget);
      expect(find.text('Agua'), findsOneWidget);
      expect(find.byIcon(iconoEliminar), findsNWidgets(2));
    });

    testWidgets('sin onRemoveItem no hay X en los ítems', (tester) async {
      await tester.pumpWidget(_host(const ParticipantExpansibleTile(order: openOrder, participant: p1)));

      await tester.tap(find.text('Ana'));
      await tester.pumpAndSettle();

      expect(find.byIcon(iconoEliminar), findsNothing);
    });

    testWidgets('orden LOCKED: subtotal = amount_due congelado y badge de pago visible', (tester) async {
      // e2e r3: el badge solo aparece con VARIOS participantes (en solitario
      // es ruido) — la orden lockeada del test necesita un segundo comensal.
      const p2 = GroupOrderParticipantDM(uuid: 'p2', displayName: 'Beto', amountDue: 5.0);
      final locked = openOrder.copyWith(
        status: GroupOrderStatus.locked,
        participants: [p1, p2],
      );
      await tester.pumpWidget(_host(ParticipantExpansibleTile(order: locked, participant: p1)));

      expect(find.text('€99.00'), findsOneWidget);
      expect(find.byIcon(Icons.circle_outlined), findsOneWidget); // pendiente
    });

    testWidgets('CUENTA ABIERTA: un ítem YA EN COCINA se puede marcar '
        'compartido, pero no borrar', (tester) async {
      // e2e 2026-08-09 — la jarra de sangría para la mesa. "Compartido" es de
      // REPARTO, no de cocina: no cambia el plato, cambia entre quiénes se
      // divide. Gatearlo por `isSent` —la regla correcta para borrar— lo
      // volvía inalcanzable en cuenta abierta, donde el ítem nace enviado.
      const p2 = GroupOrderParticipantDM(uuid: 'p2', displayName: 'Beto');
      final enCocina = openOrder.copyWith(
        status: GroupOrderStatus.confirmed,
        paymentMode: GroupPaymentMode.openTab,
        participants: [p1, p2],
        items: [
          GroupOrderItemDM(
            uuid: 'i1',
            participantUuid: 'p1',
            name: 'Jarra de sangría',
            unitPricePreview: 18.0,
            sentAt: DateTime(2026, 8, 9, 21),
            batchNo: 1,
          ),
        ],
      );

      await tester.pumpWidget(_host(ParticipantExpansibleTile(
        order: enCocina,
        participant: p1,
        initiallyExpanded: true,
        onRemoveItem: (_) async {},
        onToggleSharedItem: (_) {},
      )));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.group_outlined), findsOneWidget,
          reason: 'Sin este toggle no hay forma de dividir la jarra.');
      expect(find.byIcon(iconoEliminar), findsNothing,
          reason: 'Borrar sí toca a la cocina: la jarra ya se sirvió.');
    });

    testWidgets('CUENTA ABIERTA en curso: subtotal VIVO, no el reparto vacío',
        (tester) async {
      // e2e 2026-08-08. `liveSubtotalFor` devolvía `amount_due` en cuanto la
      // orden dejaba de estar `open`. En cuenta abierta eso pasa con la
      // PRIMERA tanda —o sea, durante toda la comida— y el backend no reparte
      // nada hasta que se pide la cuenta: cada comensal miraba su fila y veía
      // €0,00 mientras comía. El reparto solo manda cuando existe.
      const comiendo = GroupOrderParticipantDM(
        uuid: 'p1',
        displayName: 'Ana',
        role: GroupParticipantRole.host,
      );
      final enCurso = openOrder.copyWith(
        status: GroupOrderStatus.confirmed,
        paymentMode: GroupPaymentMode.openTab,
        participants: [comiendo],
      );

      await tester.pumpWidget(_host(ParticipantExpansibleTile(order: enCurso, participant: comiendo)));

      expect(find.text('€11.50'), findsOneWidget, reason: '5.0×2 + 1.5 de lo consumido.');
      expect(find.text('€0.00'), findsNothing);
    });

    testWidgets('CUENTA ABIERTA ya pedida: se congela en el reparto', (tester) async {
      final pedida = openOrder.copyWith(
        status: GroupOrderStatus.confirmed,
        paymentMode: GroupPaymentMode.openTab,
        billRequestedAt: DateTime(2026, 8, 8, 22),
      );

      await tester.pumpWidget(_host(ParticipantExpansibleTile(order: pedida, participant: p1)));

      expect(find.text('€99.00'), findsOneWidget,
          reason: 'Pedida la cuenta, manda lo repartido: es lo que se va a cobrar.');
    });

    testWidgets('orden LOCKED en solitario: sin badge de pago (modo solo)', (tester) async {
      final locked = openOrder.copyWith(status: GroupOrderStatus.locked);
      await tester.pumpWidget(_host(ParticipantExpansibleTile(order: locked, participant: p1)));

      expect(find.text('€99.00'), findsOneWidget);
      expect(find.byIcon(Icons.circle_outlined), findsNothing);
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
