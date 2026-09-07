import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Alturas proporcionales que no se aplastan al girar.
///
/// `starting_page` —la de login, lo primero que se ve— reparte la pantalla en
/// cajas de alto proporcional: `.12`, `.19`, `.38`, `.19`. Sumadas dan casi
/// toda la altura.
///
/// En vertical funciona. En una tableta APAISADA, `screenHeight` pasa a ser el
/// lado corto: la caja del formulario (`.38`) mediría 304 px en una tableta de
/// 1280x800, MENOS que los 332 que tiene hoy en un iPhone 16 Pro. El formulario
/// se aplasta.
///
/// Con el lado largo la caja conserva su tamaño de vertical y, como la página
/// ya vive dentro de un `SingleChildScrollView`, lo que sobra se desplaza.
void main() {
  Future<({double alto, double ladoLargo})> medir(WidgetTester tester, Size pantalla) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = pantalla;
    addTearDown(tester.view.reset);

    late BuildContext contexto;
    await tester.pumpWidget(MaterialApp(
      key: UniqueKey(),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child ?? const SizedBox.shrink(),
        breakpoints: DeviceSize.breakpoints,
      ),
      home: Builder(builder: (context) {
        contexto = context;

        return const SizedBox.shrink();
      }),
    ));
    // `ResponsiveBreakpoints` devuelve 0 hasta que su LayoutBuilder mide — ya
    // estaba documentado en `group_order_invite_snackbar.dart`. Leyendo en el
    // primer build salen dos ceros, y `0 == 0` hacía pasar el test de vertical
    // sin comprobar nada.
    await tester.pump();

    final alto = contexto.screenHeight;
    expect(alto, greaterThan(0), reason: 'si esto es 0, el test no está midiendo nada');

    return (alto: alto, ladoLargo: contexto.screenLongestSide);
  }

  group('en vertical son el mismo número: el teléfono no se entera', () {
    const verticales = <String, Size>{
      'iPhone SE': Size(375, 667),
      'iPhone 16 Pro': Size(402, 874),
      'iPad mini vertical': Size(744, 1133),
      'iPad Pro vertical': Size(1024, 1366),
    };

    for (final entrada in verticales.entries) {
      testWidgets(entrada.key, (tester) async {
        final m = await medir(tester, entrada.value);

        expect(m.ladoLargo, m.alto, reason: 'en vertical el lado largo ES la altura');
      });
    }
  });

  group('en apaisado el lado largo salva las proporciones', () {
    const apaisadas = <String, Size>{
      'tableta Android 1280x800': Size(1280, 800),
      'iPad Pro 12.9"': Size(1366, 1024),
      'iPad mini': Size(1133, 744),
    };

    for (final entrada in apaisadas.entries) {
      testWidgets('${entrada.key}: la caja del formulario no encoge', (tester) async {
        final m = await medir(tester, entrada.value);

        // El .38 es el alto que `starting_page` le da al bloque de login.
        final conAltura = m.alto * .38;
        final conLadoLargo = m.ladoLargo * .38;

        expect(conLadoLargo, greaterThan(conAltura));
        expect(conLadoLargo, greaterThan(332),
            reason: 'debe darle al menos lo que tiene hoy en un iPhone 16 Pro (874 * .38)');
      });
    }
  });

  /// La otra mitad del arreglo: si las cajas ya no caben, la página se desplaza
  /// en vez de desbordarse. `starting_page` ya vive en un SingleChildScrollView.
  testWidgets('cajas que suman más que la pantalla se desplazan, no desbordan', (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(1280, 800);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              for (final proporcion in [.12, .19, .38, .19])
                SizedBox(height: 1280 * proporcion, child: const Placeholder()),
            ],
          ),
        ),
      ),
    ));
    await tester.pump();

    expect(tester.takeException(), isNull, reason: '1126 px de contenido en 800 deben desplazarse');
    expect(find.byType(Placeholder), findsNWidgets(4));
  });
}
