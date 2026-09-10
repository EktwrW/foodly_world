import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/ui/shared_widgets/layout/rejilla_adaptativa.dart';
import 'package:foodly_world/ui/shared_widgets/shimmer/home_shimmer_widgets.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// La rejilla de negocios, medida sobre un widget de verdad.
///
/// `columnasDeRejilla` ya está probada como función pura; esto comprueba lo
/// otro: que el widget la llame con el ancho correcto y que el resultado llegue
/// al `gridDelegate`. Se usa `BusinessGridShimmer` porque es la única de las
/// tres rejillas que se construye sin cubits ni inyección de dependencias — y
/// además es la que TIENE que cuadrar con la cargada, o la pantalla salta al
/// terminar de cargar.
void main() {
  Future<int> columnasPintadas(WidgetTester tester, double ancho) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = Size(ancho, 1200);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(MaterialApp(
      key: UniqueKey(),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child ?? const SizedBox.shrink(),
        breakpoints: DeviceSize.breakpoints,
      ),
      home: const Scaffold(body: BusinessGridShimmer()),
    ));
    await tester.pump();

    final rejilla = tester.widget<GridView>(find.byType(GridView));
    final delegado = rejilla.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;

    return delegado.crossAxisCount;
  }

  group('en teléfono se pintan dos, como hoy', () {
    for (final ancho in [375.0, 402.0, 440.0]) {
      testWidgets('a ${ancho.toInt()} px', (tester) async {
        expect(await columnasPintadas(tester, ancho), kColumnasEnTelefono);
      });
    }
  });

  group('en tablet se pintan más', () {
    testWidgets('iPad mini (744 px) → 3', (tester) async {
      expect(await columnasPintadas(tester, 744), 3);
    });

    testWidgets('iPad Air (820 px) → 4', (tester) async {
      expect(await columnasPintadas(tester, 820), 4);
    });
  });

  testWidgets('el esqueleto llena la rejilla: dos filas, salgan las columnas que salgan', (tester) async {
    for (final ancho in [402.0, 820.0]) {
      final columnas = await columnasPintadas(tester, ancho);
      final tarjetas = tester.widget<GridView>(find.byType(GridView));
      final hijos = (tarjetas.childrenDelegate as SliverChildListDelegate).children.length;

      expect(hijos, columnas * 2,
          reason: 'a $ancho px pinta $hijos esqueletos para $columnas columnas: quedarían huecos');
    }
  });
}
