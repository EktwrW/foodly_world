import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/layout/content_column.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toggle_switch/toggle_switch.dart';

/// `context.screenWidth` dentro de un techo de ancho.
///
/// LA TRAMPA (2026-09-12). `ContentColumn` acota a sus hijos, pero un hijo que
/// se dimensiona con `context.screenWidth` NO se entera: sigue leyendo el ancho
/// de la PANTALLA, no el de la caja en la que esta. En telefono da igual
/// —pantalla y caja miden lo mismo— pero en tableta son 1032 contra 700.
///
/// MEDIDO, y sale mejor de lo que parecia: NO rompe nada. Tanto un `SizedBox`
/// como el `ToggleSwitch` de las pestañas respetan las constraints que les
/// bajan y se quedan en el techo. No hay overflow ni en tableta.
///
/// Lo que SI queda mal es la intencion: quien escribio `minWidth:
/// context.screenWidth` queria «todo el ancho», y dentro de un techo eso pasa a
/// significar «el ancho del techo». Sale bien por accidente, no por diseño.
///
/// Este test fija ese comportamiento para que un cambio de version de
/// `toggle_switch` —o un techo aplicado a otra pantalla— no lo convierta en un
/// overflow de verdad sin que nadie se entere.
void main() {
  Future<void> pintar(WidgetTester tester, double ancho, Widget Function(BuildContext) hijo) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = Size(ancho, 900);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: const [
            Breakpoint(start: 0, end: 599, name: MOBILE),
            Breakpoint(start: 600, end: 1023, name: TABLET),
            Breakpoint(start: 1024, end: double.infinity, name: DESKTOP),
          ],
        ),
        home: Scaffold(
          body: ContentColumn.list(
            child: Builder(builder: hijo),
          ),
        ),
      ),
    );

    // `ResponsiveBreakpoints` devuelve 0 hasta que su LayoutBuilder mide, asi
    // que sin este pump `context.screenWidth` vale 0 y el test pasa en verde
    // sin comprobar nada. Esta documentado en CLAUDE.md.
    await tester.pump();
  }

  double anchoLeido = 0;

  Widget toggleDeDosPestanas(BuildContext context) {
    anchoLeido = context.screenWidth;
    return ToggleSwitch(
      initialLabelIndex: 0,
      totalSwitches: 2,
      minHeight: 30,
      labels: const ['Vigentes', 'Proximas'],
      // Esto es lo que hay hoy en saved_promotions_toggle_switch.dart y en
      // my_favorites_toggle_switch.dart.
      minWidth: context.screenWidth,
    );
  }

  testWidgets('en telefono el toggle con screenWidth no desborda', (tester) async {
    await pintar(tester, 402, toggleDeDosPestanas);

    expect(tester.takeException(), isNull, reason: 'en telefono pantalla y caja miden lo mismo: no hay conflicto');
  });

  testWidgets('en tableta el toggle con screenWidth se queda en el techo, sin desbordar', (tester) async {
    await pintar(tester, 1032, toggleDeDosPestanas);

    expect(
      anchoLeido,
      1032,
      reason: 'si esto fuese 0 —el LayoutBuilder sin medir— el test de abajo pasaria sin comprobar nada',
    );
    expect(tester.takeException(), isNull, reason: 'no desborda: el toggle respeta las constraints que le bajan');
    expect(
      tester.getSize(find.byType(ToggleSwitch)).width,
      lessThanOrEqualTo(UIDimens.LIST_MAX_WIDTH),
      reason: 'y se queda dentro del techo, no en los 1032 de la pantalla',
    );
  });
}
