import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/ui/views/starting/starting_page.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// El logo del arranque, un 25 % más pequeño en tableta.
///
/// La condición era que NO se moviera nada más: ni los espaciados, ni los
/// botones de red social, ni el de invitado, ni el de términos, ni las
/// animaciones. Por eso se encoge el logo dentro de su hueco en vez de tocar
/// el hueco: la caja mide lo mismo, así que lo que hay debajo no se entera.
void main() {
  /// Pinta el logo dentro de la misma caja que le da `starting_page`.
  Future<({Size logo, Size hueco})> medir(WidgetTester tester, double ancho) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = Size(ancho, 1000);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(MaterialApp(
      key: UniqueKey(),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child ?? const SizedBox.shrink(),
        breakpoints: DeviceSize.breakpoints,
      ),
      home: const Scaffold(
        body: Center(
          child: SizedBox(
            key: Key('hueco'),
            height: 200,
            width: 400,
            child: Center(child: LogoDeArranque()),
          ),
        ),
      ),
    ));
    await tester.pump();

    return (
      logo: tester.getSize(find.byType(Asset)),
      hueco: tester.getSize(find.byKey(const Key('hueco'))),
    );
  }

  testWidgets('en teléfono el logo NO se envuelve en nada', (tester) async {
    await medir(tester, 402);

    expect(find.byType(FractionallySizedBox), findsNothing,
        reason: 'un FractionallySizedBox con factor 1 no es transparente: da constraints '
            'ajustadas donde Center las daba sueltas, y con BoxFit.contain eso cambia el dibujo');
  });

  testWidgets('en tableta se encoge exactamente un 25 %', (tester) async {
    final enTablet = await medir(tester, 820);

    expect(enTablet.logo.width, closeTo(400 * kFactorDeLogoEnTableta, 0.5));
    expect(enTablet.logo.height, closeTo(200 * kFactorDeLogoEnTableta, 0.5));
  });

  testWidgets('el hueco NO cambia: lo de abajo no se mueve', (tester) async {
    final enMovil = await medir(tester, 402);
    final enTablet = await medir(tester, 820);

    expect(enTablet.hueco, enMovil.hueco,
        reason: 'si la caja cambiara, se moverían los botones y los espaciados de abajo');
  });

  test('el factor es el 25 % que se pidió, ni más ni menos', () {
    expect(kFactorDeLogoEnTableta, .75);
  });
}
