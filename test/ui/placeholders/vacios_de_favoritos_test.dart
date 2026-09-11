import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/ui/shared_widgets/placeholders/foodly_empty_view.dart';

/// Los tres vacios de favoritos viven dentro de un `PageView` de alto FIJO
/// (`SizedBox.fromSize(Size(screenWidth, screenHeight))` en
/// `my_favorites_page.dart`) al que ademas se le restan por arriba el appbar y
/// el conmutador de pestañas. No hay scroll: lo que no entre, desborda.
///
/// Antes de esto el vacio era icono + una linea de texto. Ahora es medallon +
/// titulo + subtitulo, o sea mas alto — asi que el hueco disponible deja de ser
/// un detalle.
void main() {
  /// Copy real, en los tres idiomas, para que lo que se mida sea lo que se ve.
  /// El portugues es el mas largo de los tres y es el que manda.
  const copys = <String, (String, String)>{
    'negocios es': ('Aún no tienes negocios favoritos', 'Toca el corazón en cualquier negocio y lo tendrás siempre a mano.'),
    'negocios en': ("You haven't saved any places yet", 'Tap the heart on any place and it will always be within reach.'),
    'negocios pt': ('Ainda não tens negócios favoritos', 'Toca no coração de qualquer negócio e tê-lo-ás sempre à mão.'),
    'cartas es': ('Aún no tienes cartas guardadas', 'Guarda la carta de un negocio y la abrirás desde aquí sin buscarla.'),
    'cartas en': ("You haven't saved any menus yet", "Save a place's menu and you'll open it from here without searching."),
    'cartas pt': ('Ainda não tens cartas guardadas', 'Guarda a carta de um negócio e abri-la-ás daqui sem a procurares.'),
    'platos es': ('Aún no tienes platos favoritos', 'Toca el corazón en un plato y lo encontrarás aquí cuando vuelvas.'),
    'platos en': ("You haven't saved any dishes yet", "Tap the heart on a dish and you'll find it here when you come back."),
    'platos pt': ('Ainda não tens pratos favoritos', 'Toca no coração de um prato e encontrá-lo-ás aqui quando voltares.'),
  };

  /// Los 120 px que la pagina le pone debajo para levantarlo del borde.
  const relleno = 120.0;

  /// Lo que queda de alto en el aparato mas pequeño que soportamos: 568 px de
  /// un iPhone SE de primera generacion, menos el appbar (56) y el conmutador
  /// de pestañas (~64).
  const altoDisponible = 568.0 - 56 - 64;

  Future<double> altoDe(WidgetTester tester, String titulo, String subtitulo, double ancho) async {
    await tester.pumpWidget(
      MediaQuery(
        data: MediaQueryData(size: Size(ancho, 4000)),
        child: const Directionality(textDirection: TextDirection.ltr, child: SizedBox()),
      ),
    );
    late double alto;
    await tester.pumpWidget(
      MediaQuery(
        data: MediaQueryData(size: Size(ancho, 4000)),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: ancho,
              child: Builder(
                builder: (_) => FoodlyEmptyView(title: titulo, subtitle: subtitulo),
              ),
            ),
          ),
        ),
      ),
    );
    alto = tester.getSize(find.byType(Column).first).height;
    return alto;
  }

  group('los vacios de favoritos entran en el hueco que tienen', () {
    for (final ancho in [320.0, 375.0, 402.0, 430.0]) {
      testWidgets('a $ancho px de ancho', (tester) async {
        for (final MapEntry(key: nombre, value: (titulo, subtitulo)) in copys.entries) {
          final alto = await altoDe(tester, titulo, subtitulo, ancho);
          expect(
            alto + relleno,
            lessThanOrEqualTo(altoDisponible),
            reason: '«$nombre» mide $alto + $relleno de relleno y solo hay $altoDisponible',
          );
        }
      });
    }
  });

  testWidgets('el subtitulo no se recorta: el texto que se mide es el completo', (tester) async {
    // Un `maxLines` colado en FoodlyEmptyView dejaria el alto cuadrado y el
    // texto a medias, que es justo el fallo que este banco NO veria midiendo
    // solo alturas.
    await tester.pumpWidget(
      const MediaQuery(
        data: MediaQueryData(size: Size(320, 800)),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: FoodlyEmptyView(
            title: 'Ainda não tens negócios favoritos',
            subtitle: 'Toca no coração de qualquer negócio e tê-lo-ás sempre à mão.',
          ),
        ),
      ),
    );
    final subtitulo = tester.widget<Text>(find.text('Toca no coração de qualquer negócio e tê-lo-ás sempre à mão.'));
    expect(subtitulo.maxLines, isNull);
    expect(subtitulo.overflow, anyOf(isNull, TextOverflow.clip));
  });
}
