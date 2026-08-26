import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/group_orders/widgets/ask_table_dialog.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// El diálogo que pide la mesa.
///
/// EL CRASH que motiva este archivo (device, 2026-08-26): el controller se
/// creaba fuera del diálogo y se liberaba al completarse el `Future` de
/// `showDialog` — que ocurre al llamar a `Navigator.pop`, NO cuando termina la
/// animación de salida. El `TextField` seguía dibujándose contra un controller
/// liberado y al cancelar se rompía la pantalla entera.
///
/// Por eso los tests hacen `pumpAndSettle` DESPUÉS de cerrar: dejar correr la
/// animación es justo lo que destapaba el fallo. Un `pump()` suelto pasaba en
/// verde con el bug adentro.
void main() {
  setUpAll(() async => S.load(const Locale('es')));

  Future<String?> abrir(WidgetTester tester) async {
    String? resultado;
    await tester.pumpWidget(MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child ?? const SizedBox.shrink(),
        breakpoints: DeviceSize.breakpoints,
      ),
      home: Scaffold(
        body: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () async => resultado = await askTableDialog(context),
            child: const Text('abrir'),
          ),
        ),
      ),
    ));
    await tester.tap(find.text('abrir'));
    await tester.pumpAndSettle();

    return resultado;
  }

  testWidgets('cancelar cierra limpio, sin usar nada liberado', (tester) async {
    await abrir(tester);

    await tester.tap(find.text(S.current.cancel));
    await tester.pumpAndSettle(); // la animación de salida completa

    expect(tester.takeException(), isNull);
    expect(find.byType(TextField), findsNothing);
  });

  testWidgets('confirmar con una mesa la devuelve', (tester) async {
    String? resultado;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () async => resultado = await askTableDialog(context),
            child: const Text('abrir'),
          ),
        ),
      ),
    ));
    await tester.tap(find.text('abrir'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), '  Terraza 3  ');
    await tester.tap(find.text(S.current.confirm));
    await tester.pumpAndSettle();

    expect(resultado, 'Terraza 3', reason: 'se recortan los espacios');
    expect(tester.takeException(), isNull);
  });

  testWidgets('en blanco no confirma: avisa y se queda abierto', (tester) async {
    await abrir(tester);

    await tester.tap(find.text(S.current.confirm));
    await tester.pumpAndSettle();

    expect(find.text(S.current.groupOrderTableRequired), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget, reason: 'no se cierra sin mesa');
  });

  testWidgets('solo espacios tampoco cuenta como mesa', (tester) async {
    await abrir(tester);

    await tester.enterText(find.byType(TextField), '   ');
    await tester.tap(find.text(S.current.confirm));
    await tester.pumpAndSettle();

    expect(find.text(S.current.groupOrderTableRequired), findsOneWidget);
  });

  testWidgets('escribir borra el error anterior', (tester) async {
    await abrir(tester);
    await tester.tap(find.text(S.current.confirm));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Mesa 4');
    await tester.pumpAndSettle();

    expect(find.text(S.current.groupOrderTableRequired), findsNothing);
  });
}
