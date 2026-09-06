import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/layout/content_column.dart';

/// El techo de ancho del contenido, medido a los tamaños reales de los
/// dispositivos que nos importan.
///
/// EL PROBLEMA QUE RESUELVE (2026-09-05). Ninguna de las 38 pantallas
/// reaccionaba al ancho, así que en un iPad todo se estiraba de borde a borde.
/// Este widget es el arreglo del caso común; los tests miden que de verdad
/// acote donde tiene que acotar y que NO haga nada donde no debe.
void main() {
  /// Anchos en puntos lógicos de los aparatos reales, no números redondos.
  const dispositivos = <String, double>{
    'iPhone SE': 375,
    'iPhone 16 Pro': 402,
    'iPad mini vertical': 744,
    'iPad Air vertical': 820,
    'iPad Pro 11" vertical': 834,
    'iPad Pro 12.9" horizontal': 1366,
  };

  Future<double> anchoDelContenido(WidgetTester tester, double anchoPantalla, {Widget? column}) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = Size(anchoPantalla, 900);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: column ?? const ContentColumn(child: SizedBox(height: 40, child: Placeholder())),
        ),
      ),
    );

    return tester.getSize(find.byType(Placeholder)).width;
  }

  testWidgets('en móvil no hace nada: el contenido sigue ocupando todo', (tester) async {
    for (final ancho in [375.0, 402.0]) {
      expect(await anchoDelContenido(tester, ancho), ancho, reason: 'a $ancho px el techo no debería morder');
    }
  });

  testWidgets('en tablet acota al ancho de lectura', (tester) async {
    for (final entry in dispositivos.entries.where((e) => e.value >= 744)) {
      expect(await anchoDelContenido(tester, entry.value), UIDimens.CONTENT_MAX_WIDTH,
          reason: '${entry.key} (${entry.value} px) quedó sin acotar');
    }
  });

  testWidgets('la variante de listas usa su propio techo, más ancho', (tester) async {
    final ancho = await anchoDelContenido(
      tester,
      1024,
      column: const ContentColumn.list(child: SizedBox(height: 40, child: Placeholder())),
    );

    expect(ancho, UIDimens.LIST_MAX_WIDTH);
    expect(UIDimens.LIST_MAX_WIDTH, greaterThan(UIDimens.CONTENT_MAX_WIDTH));
  });

  testWidgets('el contenido queda centrado, no pegado a un lado', (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(1024, 900);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: ContentColumn(child: SizedBox(height: 40, child: Placeholder()))),
      ),
    );

    final caja = tester.getRect(find.byType(Placeholder));

    expect(caja.center.dx, 512, reason: 'debería estar centrado en una pantalla de 1024');
    expect(caja.left, 1024 / 2 - UIDimens.CONTENT_MAX_WIDTH / 2);
  });

  /// LA TRAMPA AL ACOTAR UNA PANTALLA (2026-09-06). Un hijo con ancho fijo
  /// `context.screenWidth` se acota solo si el padre le pasa el ancho: un
  /// `SizedBox` recorta su propio ancho contra las constraints que recibe. Un
  /// `Row`, en cambio, da ancho SIN ACOTAR a sus hijos, así que ahí el ancho
  /// fijo se respeta tal cual y se desborda.
  ///
  /// O sea: al meter una pantalla dentro de ContentColumn hay que buscar
  /// anchos de pantalla fijos, pero solo los que cuelgan de un Row (o de un
  /// ListView horizontal) son un problema real. Lo comprobé midiendo, después
  /// de haber "arreglado" tres sitios de los que solo uno estaba roto.
  group('anchos fijos por debajo del techo', () {
    Future<Object?> pintar(WidgetTester tester, Widget hijo) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(1024, 900);
      addTearDown(tester.view.reset);
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: ContentColumn(child: hijo))));
      return tester.takeException();
    }

    testWidgets('colgando del techo directamente, el ancho fijo se recorta solo', (tester) async {
      final excepcion = await pintar(tester, const SizedBox(width: 1024, height: 40, child: Placeholder()));

      expect(excepcion, isNull);
      expect(tester.getSize(find.byType(Placeholder)).width, UIDimens.CONTENT_MAX_WIDTH);
    });

    testWidgets('dentro de un Row, el mismo ancho fijo se desborda', (tester) async {
      final excepcion = await pintar(
        tester,
        const Row(children: [SizedBox(width: 988, height: 40, child: Placeholder())]),
      );

      expect(excepcion, isA<FlutterError>(), reason: 'el Row no acota: 988 px no caben en 640');
    });

    testWidgets('con Expanded en vez de ancho fijo, el Row cabe', (tester) async {
      final excepcion = await pintar(
        tester,
        const Row(children: [Expanded(child: SizedBox(height: 40, child: Placeholder()))]),
      );

      expect(excepcion, isNull);
      expect(tester.getSize(find.byType(Placeholder)).width, UIDimens.CONTENT_MAX_WIDTH);
    });
  });

  /// El techo es de LECTURA, no de dispositivo: si alguien lo sube al
  /// `DeviceSize.maxWidth` del build web (1440), deja de morder en cualquier
  /// iPad y el widget no sirve para nada.
  test('el techo de lectura está por debajo del iPad más estrecho', () {
    expect(UIDimens.CONTENT_MAX_WIDTH, lessThan(744));
    expect(UIDimens.LIST_MAX_WIDTH, lessThan(744));
  });
}
