import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/qr/foodly_qr_card.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/group_order_invite_snackbar.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// La invitación a la mesa pasó de `showModalBottomSheet` propio de la
/// GroupOrderPage al `SnackBarWdg` de la casa, y ahora la usan DOS entradas:
/// la página y el chip flotante.
///
/// Lo que se verifica acá es que el contenido entre en un aviso —el QR ocupa
/// el 40% del ancho y al lado va el código— en las pantallas angostas de
/// verdad. Un overflow no rompe el build: pinta la franja amarilla en el
/// dispositivo del comensal, que es peor.
void main() {
  setUpAll(() async => S.load(const Locale('es')));

  Future<void> pumpInvite(WidgetTester tester, {required Size screen}) async {
    tester.view.physicalSize = screen;
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child ?? const SizedBox.shrink(),
          breakpoints: DeviceSize.breakpoints,
        ),
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => showGroupOrderInviteSnackBar(
                context,
                code: 'K7QP42',
                businessName: 'Tasca do Bairro',
              ),
              child: const Text('invitar'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('invitar'));
    await tester.pumpAndSettle();
  }

  testWidgets('muestra QR, código tipeable y las dos salidas', (tester) async {
    await pumpInvite(tester, screen: const Size(390, 844)); // iPhone 14

    expect(find.byType(FoodlyQrCard), findsOneWidget);
    // El código corto es el fallback cuando el QR falla o el otro está en web.
    expect(find.text('K7QP42'), findsOneWidget);
    expect(find.text(S.current.groupOrderInviteShareCta), findsOneWidget);
    expect(find.text(S.current.close), findsOneWidget);
  });

  testWidgets('el QR codifica el link de join, no el código pelado', (tester) async {
    await pumpInvite(tester, screen: const Size(390, 844));

    final qr = tester.widget<FoodlyQrCard>(find.byType(FoodlyQrCard));
    // Escanear tiene que ABRIR la app en la orden. Con el código pelado el
    // lector muestra "K7QP42" y el invitado se queda mirando una pantalla.
    expect(qr.data, 'https://foodly.solutions/join/K7QP42');
  });

  testWidgets('entra sin overflow en un Z Fold cerrado (344px)', (tester) async {
    await pumpInvite(tester, screen: const Size(344, 882));

    expect(tester.takeException(), isNull);
    expect(find.byType(FoodlyQrCard), findsOneWidget);
  });

  testWidgets('cerrar lo saca de pantalla', (tester) async {
    await pumpInvite(tester, screen: const Size(390, 844));

    await tester.tap(find.text(S.current.close));
    await tester.pumpAndSettle();

    expect(find.byType(FoodlyQrCard), findsNothing);
  });
}
