import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/manager_orders/widgets/payment_mode_selector.dart';

/// F4c — el ajuste "sirvo en mesa" en el selector del manager.
///
/// De este switch depende TODA la feature: si el negocio no lo enciende, al
/// comensal nunca se le pregunta la mesa y el pedido sigue llegando a cocina
/// sin decir a dónde llevarlo. Una revisión encontró que el selector solo se
/// alcanzaba desde la rama "pagos activos" del banner de Stripe — o sea que el
/// negocio tradicional de mesas, que cobra en caja, no podía encenderlo.
void main() {
  setUpAll(() async => S.load(const Locale('es')));

  Future<PaymentSettings?> confirmar(
    WidgetTester tester, {
    bool initialTableService = false,
    bool togglear = false,
  }) async {
    PaymentSettings? confirmado;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PaymentModeSelector(
          initialTableService: initialTableService,
          onConfirm: (s) => confirmado = s,
        ),
      ),
    ));

    if (togglear) {
      await tester.tap(find.byKey(PaymentModeSelector.switchMesaKey), warnIfMissed: false);
      await tester.pumpAndSettle();
    }

    await tester.tap(find.text(S.current.paymentModeOpenTabTitle));
    await tester.pumpAndSettle();
    await tester.tap(find.text(S.current.confirm));
    await tester.pumpAndSettle();

    return confirmado;
  }

  testWidgets('el switch se ve y arranca apagado por defecto', (tester) async {
    // Apagado = el comportamiento de siempre. Ningún negocio existente cambia.
    final r = await confirmar(tester);

    expect(find.byKey(PaymentModeSelector.switchMesaKey), findsOneWidget);
    expect(r?.tableService, isFalse);
  });

  testWidgets('abre con el valor que el negocio ya tiene puesto', (tester) async {
    final r = await confirmar(tester, initialTableService: true);

    expect(r?.tableService, isTrue, reason: 'no debe perder el ajuste al reconfirmar');
  });

  testWidgets('encenderlo viaja en lo que se confirma', (tester) async {
    final r = await confirmar(tester, togglear: true);

    expect(r?.tableService, isTrue);
  });

  testWidgets('apagarlo también', (tester) async {
    final r = await confirmar(tester, initialTableService: true, togglear: true);

    expect(r?.tableService, isFalse);
  });

  testWidgets('el ajuste de mesa no pisa el mínimo ni el modo', (tester) async {
    final r = await confirmar(tester, togglear: true);

    expect(r?.minMinor, isNull, reason: 'sin mínimo configurado debe seguir null');
    expect(r?.mode, isNotNull);
  });
}
