import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/layout/content_column.dart';

/// El techo de ancho dentro de un [FlexibleSpaceBar], que es como está puesto
/// en el appbar del home.
///
/// LO QUE DABA MIEDO (2026-09-06). El contenido del appbar del home es una
/// `Column` con `MainAxisAlignment.end`, apoyada en el borde de abajo de los
/// 149 px. `ContentColumn` es un `Align`, y un `Align` encoge en el eje que no
/// acota — así que parecía que iba a quedarse sin alto sobrante, que el `end`
/// dejaría de significar nada y que el header se subiría al techo de la barra.
///
/// Medido: NO pasa. `FlexibleSpaceBar` le da al title un hueco justo de alto,
/// así que al `Align` no le sobra espacio vertical y las dos alineaciones dan
/// exactamente el mismo rectángulo. Por eso el appbar del home usa la
/// alineación por defecto y no una puesta a mano.
void main() {
  const marca = Key('contenido-del-appbar');

  Future<Rect> pintar(WidgetTester tester, double ancho, {required Widget Function(Widget) envolver}) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = Size(ancho, 900);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 149,
                collapsedHeight: 149,
                toolbarHeight: 85,
                pinned: true,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 1,
                  collapseMode: CollapseMode.pin,
                  titlePadding: EdgeInsets.zero,
                  title: envolver(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(key: marca, height: 40, color: const Color(0xFF00FF00)),
                      ],
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 800)),
            ],
          ),
        ),
      ),
    );

    return tester.getRect(find.byKey(marca));
  }

  Widget sinTecho(Widget hijo) => hijo;
  Widget conTecho(Widget hijo) => ContentColumn.list(child: hijo);
  Widget conTechoAbajo(Widget hijo) => ContentColumn.list(alignment: Alignment.bottomCenter, child: hijo);

  testWidgets('en móvil el contenido no se mueve ni un píxel', (tester) async {
    for (final ancho in [375.0, 402.0, 440.0]) {
      final antes = await pintar(tester, ancho, envolver: sinTecho);
      final despues = await pintar(tester, ancho, envolver: conTecho);

      expect(despues, antes, reason: 'a $ancho px el techo de 700 no debe morder ni mover nada');
    }
  });

  testWidgets('en iPad se acota pero sigue apoyado abajo', (tester) async {
    final antes = await pintar(tester, 1024, envolver: sinTecho);
    final despues = await pintar(tester, 1024, envolver: conTecho);

    expect(antes.width, 1024, reason: 'esto es lo que pasaba antes: el contenido a todo lo ancho');
    expect(despues.width, UIDimens.LIST_MAX_WIDTH);
    expect(despues.bottom, antes.bottom, reason: 'no debe despegarse del borde inferior de la barra');
    expect(despues.center.dx, 512, reason: 'y queda centrado');
  });

  /// Por qué el appbar del home NO fija la alineación a mano.
  testWidgets('dentro de un FlexibleSpaceBar la alineación vertical da igual', (tester) async {
    final porDefecto = await pintar(tester, 1024, envolver: conTecho);
    final abajo = await pintar(tester, 1024, envolver: conTechoAbajo);

    expect(porDefecto, abajo,
        reason: 'el hueco del title es justo de alto, así que al Align no le sobra nada que repartir');
  });
}
