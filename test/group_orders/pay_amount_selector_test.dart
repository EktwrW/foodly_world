import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/group_order_vm.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_totals_footer.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/hosted_rail.dart';

/// Selector de MONTO en el pie de pago.
///
/// EL PROBLEMA. "Pagar todo lo pendiente" era un tercer BOTÓN, y en este pie
/// los botones son el MÉTODO: el primero abre el PaymentSheet, el segundo la
/// página hosteada (la única que ofrece MB WAY y Bizum). Con "pagar todo"
/// siendo un botón, invitar a la mesa obligaba a tarjeta — un portugués no
/// podía invitar con MB WAY, que es como paga en su país.
///
/// El backend nunca tuvo ese límite: `payIntent` y `checkoutSession` comparten
/// `runPayment`, que acepta `cover_participant_uuids` desde F2b.
///
/// LA DECISIÓN. Monto y método son dimensiones independientes: el selector
/// dice CUÁNTO, los dos botones dicen CÓMO. Los tests fijan que el bool viaje
/// por las dos vías, y sobre todo que el default nunca sea "toda la cuenta".
void main() {
  setUpAll(() async => S.load(const Locale('es')));

  Widget host(Widget child) => MaterialApp(home: Scaffold(body: child));

  // El fixture nombra los defaults a propósito: son los que hacen legible
  // la aritmética de los montos que se afirman abajo.
  // ignore_for_file: avoid_redundant_argument_values

  /// Mesa de tres: yo debo 20, faltan 60 en total.
  GroupOrderDM orden({
    double miParte = 20,
    double totalPagado = 0,
    GroupPaymentStatus? miEstado,
  }) =>
      GroupOrderDM(
        uuid: 'o1',
        status: GroupOrderStatus.locked,
        paymentMode: GroupPaymentMode.perRound,
        totalAmount: 60,
        totalPaid: totalPagado,
        participants: [
          GroupOrderParticipantDM(
            uuid: 'p1',
            displayName: 'Yo',
            amountDue: 20,
            amountPaid: 20 - miParte,
            paymentStatus: miEstado ?? GroupPaymentStatus.pending,
          ),
          const GroupOrderParticipantDM(uuid: 'p2', displayName: 'Ana', amountDue: 20),
          const GroupOrderParticipantDM(uuid: 'p3', displayName: 'Rui', amountDue: 20),
        ],
      );

  Future<void> pintar(
    WidgetTester tester, {
    required GroupOrderDM order,
    double myShare = 20,
    bool canCoverAll = true,
    void Function(bool)? onPay,
    void Function(bool)? onPayHosted,
  }) async {
    tester.view.physicalSize = const Size(390, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(host(GroupOrderTotalsFooter(
      order: order,
      myShare: myShare,
      canCoverAll: canCoverAll,
      hostedRail: HostedRail.mbWay,
      onPay: onPay ?? (_) {},
      onPayHosted: onPayHosted ?? (_) {},
    )));
    await tester.pumpAndSettle();
  }

  Finder miParte() => find.text(S.current.groupOrderAmountMyShare);
  Finder todaLaCuenta() => find.text(S.current.groupOrderAmountAll);

  group('cuándo aparece', () {
    testWidgets('con saldo mío Y ajeno hay dos opciones', (tester) async {
      await pintar(tester, order: orden());
      expect(miParte(), findsOneWidget);
      expect(todaLaCuenta(), findsOneWidget);
    });

    testWidgets('sin saldo ajeno no hay selector: sería un control de un botón',
        (tester) async {
      await pintar(tester, order: orden(), canCoverAll: false);
      expect(miParte(), findsNothing);
      expect(todaLaCuenta(), findsNothing);
      // Y el CTA vuelve al copy de siempre.
      expect(find.textContaining('Pagar mi parte'), findsOneWidget);
    });

    testWidgets('ya pagué lo mío: sin selector, pero puedo cubrir al resto',
        (tester) async {
      await pintar(tester, order: orden(miParte: 0), myShare: 0);

      expect(miParte(), findsNothing);
      // Antes acá no había NADA que tocar: en cuanto tu parte quedaba saldada
      // la UI te negaba invitar, aunque el backend lo permite explícitamente.
      expect(find.textContaining('Pagar todo lo pendiente'), findsOneWidget);
    });
  });

  group('qué monto se cobra', () {
    testWidgets('arranca en mi parte, nunca en la cuenta entera', (tester) async {
      bool? cubrioTodo;
      await pintar(tester, order: orden(), onPay: (v) => cubrioTodo = v);

      // El CTA muestra mi parte + la tarifa fija, no los 60.
      expect(find.textContaining('20.25'), findsOneWidget);

      await tester.tap(find.textContaining('20.25'));
      await tester.pumpAndSettle();
      expect(cubrioTodo, isFalse);
    });

    testWidgets('elegir toda la cuenta cambia el monto del CTA', (tester) async {
      bool? cubrioTodo;
      await pintar(tester, order: orden(), onPay: (v) => cubrioTodo = v);

      await tester.tap(todaLaCuenta());
      await tester.pumpAndSettle();

      expect(find.textContaining('60.25'), findsOneWidget);
      await tester.tap(find.textContaining('60.25'));
      await tester.pumpAndSettle();
      expect(cubrioTodo, isTrue);
    });

    testWidgets('el monto elegido viaja TAMBIÉN por MB WAY — el bug de origen',
        (tester) async {
      bool? cubrioTodo;
      await pintar(tester, order: orden(), onPayHosted: (v) => cubrioTodo = v);

      await tester.tap(todaLaCuenta());
      await tester.pumpAndSettle();
      await tester.tap(find.text('Pagar con MB WAY'));
      await tester.pumpAndSettle();

      expect(cubrioTodo, isTrue);
    });

    testWidgets('volver a mi parte revierte el monto', (tester) async {
      bool? cubrioTodo;
      await pintar(tester, order: orden(), onPay: (v) => cubrioTodo = v);

      await tester.tap(todaLaCuenta());
      await tester.pumpAndSettle();
      await tester.tap(miParte());
      await tester.pumpAndSettle();

      await tester.tap(find.textContaining('20.25'));
      await tester.pumpAndSettle();
      expect(cubrioTodo, isFalse);
    });
  });

  testWidgets('entra sin overflow en un Z Fold cerrado (344px)', (tester) async {
    // Dos montos lado a lado en el ancho más angosto que soportamos. Un
    // overflow acá no rompe el build: pinta la franja amarilla sobre el pie
    // de pago, que es la peor pantalla donde puede pasar.
    tester.view.physicalSize = const Size(344, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(host(GroupOrderTotalsFooter(
      order: orden(),
      myShare: 20,
      canCoverAll: true,
      hostedRail: HostedRail.mbWay,
      onPay: (_) {},
      onPayHosted: (_) {},
    )));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(todaLaCuenta(), findsOneWidget);
  });

  group('anti sobrepago', () {
    test('con mi pago en vuelo no puedo pagar, aunque lo dispare OTRO', () {
      // Quien paga toda la cuenta deja a los cubiertos en `processing` dentro
      // de su transacción. `hasPaid` sigue false y la parte sigue debiéndose,
      // así que sin mirar `processing` el botón del resto de la mesa quedaba
      // encendido y el 409 del backend llegaba DESPUÉS de tocar.
      final vm = GroupOrderVM(
        order: orden(miEstado: GroupPaymentStatus.processing),
        myShare: 20,
        myParticipantUuid: 'p1',
      );

      expect(vm.iAmProcessing, isTrue);
      expect(vm.canPay, isFalse);
    });

    test('sin pago en vuelo se puede pagar como siempre', () {
      final vm = GroupOrderVM(order: orden(), myShare: 20, myParticipantUuid: 'p1');

      expect(vm.iAmProcessing, isFalse);
      expect(vm.canPay, isTrue);
    });

    test('el pago en vuelo de OTRO no me bloquea a mí', () {
      // Ana paga solo lo suyo: mi fila no se toca y yo sigo pudiendo pagar.
      final base = orden();
      final conAnaPagando = base.copyWith(
        participants: [
          base.participants[0],
          base.participants[1].copyWith(paymentStatus: GroupPaymentStatus.processing),
          base.participants[2],
        ],
      );
      final vm = GroupOrderVM(order: conAnaPagando, myShare: 20, myParticipantUuid: 'p1');

      expect(vm.canPay, isTrue);
    });
  });
}
