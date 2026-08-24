import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/manager_orders/widgets/payment_mode_selector.dart';

/// Monto mínimo para pagar en la app, dentro del selector de modo de cobro.
///
/// La regla que fija esta clase: **apagado no cuesta nada**. El estado por
/// defecto de todo negocio es sin mínimo, y en ese estado el diálogo no debe
/// pedir ninguna decisión extra ni bloquear el CTA. Toda la complejidad
/// aparece solo si el dueño enciende el switch.
void main() {
  setUpAll(() async => S.load(const Locale('es')));

  Future<PaymentSettings?> abrir(
    WidgetTester tester, {
    int? initialMinMinor,
  }) async {
    PaymentSettings? confirmado;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PaymentModeSelector(
          initialMinMinor: initialMinMinor,
          onConfirm: (s) => confirmado = s,
        ),
      ),
    ));
    return confirmado;
  }

  /// Confirma eligiendo un modo, y devuelve lo que el selector entregó.
  Future<PaymentSettings?> confirmarCon(WidgetTester tester, {int? initialMinMinor}) async {
    PaymentSettings? confirmado;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PaymentModeSelector(
          initialMinMinor: initialMinMinor,
          onConfirm: (s) => confirmado = s,
        ),
      ),
    ));
    await tester.tap(find.text(S.current.paymentModeOpenTabTitle));
    await tester.pumpAndSettle();
    await tester.tap(find.text(S.current.confirm));
    await tester.pumpAndSettle();
    return confirmado;
  }

  group('apagado', () {
    testWidgets('es el estado por defecto y no muestra montos', (tester) async {
      await abrir(tester);
      await tester.pumpAndSettle();

      expect(find.text(S.current.paymentModeMinOff), findsOneWidget);
      expect(find.text('5,00 €'), findsNothing);
      expect(find.text(S.current.paymentModeMinCustom), findsNothing);
    });

    testWidgets('no bloquea confirmar y entrega minMinor null', (tester) async {
      final res = await confirmarCon(tester);

      expect(res, isNotNull);
      expect(res!.mode, GroupPaymentMode.openTab);
      expect(res.minMinor, isNull, reason: 'sin mínimo debe viajar null, no 0');
    });
  });

  group('encendido', () {
    testWidgets('despliega los presets y pide elegir antes de confirmar', (tester) async {
      PaymentSettings? confirmado;
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: PaymentModeSelector(onConfirm: (s) => confirmado = s)),
      ));
      await tester.tap(find.text(S.current.paymentModeOpenTabTitle));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(PaymentModeSelector.switchMinimoKey), warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(find.text('5,00 €'), findsOneWidget);
      expect(find.text(S.current.paymentModeMinCustom), findsOneWidget);
      // Encendido pero sin monto: el CTA no puede confirmar un estado a medias.
      expect(find.text(S.current.paymentModeMinPrompt), findsOneWidget);

      await tester.tap(find.text(S.current.confirm));
      await tester.pumpAndSettle();
      expect(confirmado, isNull, reason: 'no debe confirmar sin monto elegido');
    });
  });

  group('valor inicial', () {
    testWidgets('un mínimo existente abre encendido y con el monto puesto', (tester) async {
      await abrir(tester, initialMinMinor: 1000);
      await tester.pumpAndSettle();

      expect(find.text(S.current.paymentModeMinOff), findsNothing);
      expect(find.textContaining('10,00 €'), findsWidgets);
    });

    testWidgets('lo confirma tal cual si no se toca nada', (tester) async {
      final res = await confirmarCon(tester, initialMinMinor: 1000);

      expect(res?.minMinor, 1000);
    });

    /// Un mínimo que no coincide con ningún preset —p. ej. puesto antes con
    /// otro criterio— tiene que abrir en "Otro" con su valor, no perderse.
    testWidgets('un mínimo fuera de los presets abre en "Otro"', (tester) async {
      await abrir(tester, initialMinMinor: 750);
      await tester.pumpAndSettle();

      expect(find.widgetWithText(TextField, '7,50'), findsOneWidget);
    });

    testWidgets('y se conserva al confirmar', (tester) async {
      final res = await confirmarCon(tester, initialMinMinor: 750);

      expect(res?.minMinor, 750);
    });
  });
}
