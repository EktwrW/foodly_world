import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/shared_widgets/glass/foodly_glass.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

/// Contraste de los colores de marca cuando se usan para TEXTO.
///
/// EL BUG (2026-08-28). La pantalla de sesiones activas salió con
/// `secondaryFoodly` en los textos pequeños y no se podía leer. No era
/// impresión: 2.76:1 sobre blanco, y 2.49:1 donde además llevaba alpha. La
/// WCAG pide 4.5:1 para texto por debajo de ~18px.
///
/// De ahí salió `secondaryFoodlyText`: el mismo tono y la misma saturación,
/// más oscuro. Este test es lo que impide que alguien "simplifique" los dos
/// tonos en uno.
void main() {
  /// Luminancia relativa (WCAG 2.1, relative luminance).
  double luz(Color c) {
    double canal(double v) => v <= 0.03928 ? v / 12.92 : math.pow((v + 0.055) / 1.055, 2.4).toDouble();

    return 0.2126 * canal(c.r) + 0.7152 * canal(c.g) + 0.0722 * canal(c.b);
  }

  double contraste(Color a, Color b) {
    final la = luz(a), lb = luz(b);

    return (math.max(la, lb) + 0.05) / (math.min(la, lb) + 0.05);
  }

  /// Los dos fondos sobre los que se pinta texto en estas pantallas.
  const blanco = Colors.white;
  const fondoPantalla = Color(0xFFF6F4F5);

  /// El mínimo de la WCAG AA para texto normal. Los textos de estas tarjetas
  /// van entre 11 y 15px, o sea muy por debajo del umbral de "texto grande".
  const minimoAA = 4.5;

  test('el tono de texto de marca es legible sobre blanco', () {
    expect(contraste(FoodlyThemes.secondaryFoodlyText, blanco), greaterThanOrEqualTo(minimoAA));
  });

  test('y también sobre el gris de fondo', () {
    expect(contraste(FoodlyThemes.secondaryFoodlyText, fondoPantalla), greaterThanOrEqualTo(minimoAA));
  });

  /// La razón de que existan DOS tonos. Si este test empieza a fallar es que
  /// alguien aclaró el de texto o oscureció el decorativo, y entonces uno de
  /// los dos sobra — pero hay que decidirlo a propósito, no de rebote.
  test('el tono decorativo NO sirve para texto, que es por lo que hay dos', () {
    expect(contraste(FoodlyThemes.secondaryFoodly, blanco), lessThan(minimoAA));
  });

  /// El estilo compartido de los hints: 17 pantallas dependen de él, así que
  /// es el único sitio donde una regresión se multiplica sola.
  test('el hint de los inputs es legible', () {
    final color = FoodlyTextStyles.hintText.color;

    expect(color, isNotNull, reason: 'si deja de traer color, hereda el del tema y esto ya no mide nada');
    expect(contraste(color!, blanco), greaterThanOrEqualTo(minimoAA));
  });

  /// El alpha fue lo que hundió el caso peor: 0.85 sobre blanco bajaba de
  /// 2.76 a 2.49. Aplicar transparencia a un color de texto le quita
  /// contraste, siempre.
  test('bajarle alpha a un color de texto solo puede empeorarlo', () {
    final solido = contraste(FoodlyThemes.secondaryFoodlyText, blanco);
    final translucido = contraste(
      Color.alphaBlend(FoodlyThemes.secondaryFoodlyText.withValues(alpha: 0.85), blanco),
      blanco,
    );

    expect(translucido, lessThan(solido));
  });

  /// LOS COLORES DE LA CARD DE PROMO SOBRE VIDRIO (2026-09-04).
  ///
  /// El rediseño puso el título y el subtítulo encima de la foto, sobre una
  /// cinta de vidrio. Eso rompe la suposición del resto del archivo: el
  /// fondo ya no es blanco ni el gris de la app, sino el vidrio con la foto
  /// asomando por detrás, y la foto puede ser cualquier cosa.
  ///
  /// El peor caso es calculable: el vidrio claro es blanco al 74%, así que
  /// sobre una foto completamente negra queda en un gris medio. Ese gris es
  /// el suelo contra el que tiene que medir cualquier texto de la cinta —
  /// y se saca del propio token, no a mano, para que si alguien baja el
  /// alpha del vidrio el test lo cace.
  final vidrioSobreFotoNegra = Color.alphaBlend(FoodlyGlassTone.light.fill, Colors.black);

  test('el título de la promo se lee sobre el vidrio, aunque la foto sea negra', () {
    expect(contraste(FoodlyThemes.titleOnGlass, vidrioSobreFotoNegra), greaterThanOrEqualTo(minimoAA));
    expect(contraste(FoodlyThemes.titleOnGlass, blanco), greaterThanOrEqualTo(minimoAA));
  });

  /// El subtítulo va a 13.5px, o sea muy por debajo de "texto grande", y es
  /// el que menos margen tiene de toda la cinta: si alguien lo aclara para
  /// que "pese menos" que el título, cae por debajo del mínimo.
  test('y el subtítulo también, que es el que va más justo', () {
    expect(contraste(FoodlyThemes.promoSubtitleOnGlass, vidrioSobreFotoNegra), greaterThanOrEqualTo(minimoAA));
  });

  test('el cuerpo de la promo se lee sobre el blanco de la card', () {
    expect(contraste(FoodlyThemes.promoBody, blanco), greaterThanOrEqualTo(minimoAA));
  });

  /// Los días en los que la promo NO aplica se dibujan apagados. Apagado no
  /// puede querer decir ilegible: el usuario tiene que poder leer "Dom" para
  /// entender que el domingo está fuera.
  test('el día apagado sigue siendo legible sobre su propio fondo', () {
    expect(contraste(FoodlyThemes.promoDayOffText, FoodlyThemes.promoDayOff), greaterThanOrEqualTo(minimoAA));
  });

  /// EL BUG DEL CORAZÓN (2026-09-04). El rediseño puso el botón de favoritos
  /// sobre vidrio CIRUELA y le apagó su propio fondo. El corazón guardado se
  /// pinta con `favourites`, que es ese mismo ciruela: quedaba ciruela sobre
  /// ciruela y no se distinguía la forma.
  ///
  /// Ahora el estado lo cuenta el tono del vidrio, y el corazón guardado vive
  /// sobre el vidrio CLARO. Los iconos piden 3:1, no 4.5:1 — no son texto —,
  /// pero el punto del test es que si alguien vuelve a poner el corazón de
  /// marca sobre un fondo de marca, esto se cae en vez de llegar al simulador.
  test('el corazón guardado no queda sobre su propio color', () {
    final vidrioClaroSobreFotoNegra = Color.alphaBlend(FoodlyGlassTone.light.fill, Colors.black);

    expect(contraste(FoodlyThemes.favourites, vidrioClaroSobreFotoNegra), greaterThanOrEqualTo(3));
  });

  /// Y que los dos estados sigan siendo distinguibles entre sí: si alguien
  /// iguala los tonos, guardada y sin guardar se ven igual.
  test('el vidrio del corazón cambia de verdad entre estados', () {
    expect(FoodlyGlassTone.light.fill, isNot(FoodlyGlassTone.dark.fill));
  });

  /// EL APPBAR DEL HOME (2026-09-05). El saludo y la pregunta viven sobre un
  /// degradado teñido, no sobre blanco, así que el suelo es el extremo OSCURO
  /// del degradado — que es donde caen los dos textos.
  ///
  /// Es el caso que obligó a que exista `secondaryFoodlyTextOnTint`: el tono
  /// normal de texto secundario da 3,75:1 ahí, por debajo del mínimo a 13px.
  final fondoAppBar = UIDecorations.HOME_APP_BAR_GRADIENT.colors.last;

  test('el saludo se lee sobre el degradado del appbar', () {
    expect(contraste(FoodlyThemes.titleOnGlass, fondoAppBar), greaterThanOrEqualTo(minimoAA));
  });

  test('y la pregunta de debajo también, que es la que iba justa', () {
    expect(contraste(FoodlyThemes.secondaryFoodlyTextOnTint, fondoAppBar), greaterThanOrEqualTo(minimoAA));
  });

  /// La razón de que haya dos tonos de texto secundario, igual que con
  /// `secondaryFoodly` / `secondaryFoodlyText`. Si este test empieza a fallar
  /// es que alguien oscureció el de blanco o aclaró el de fondo teñido, y
  /// entonces uno de los dos sobra — pero hay que decidirlo a propósito.
  test('el tono secundario normal NO sirve sobre el degradado teñido', () {
    expect(contraste(FoodlyThemes.secondaryFoodlyText, fondoAppBar), lessThan(minimoAA));
  });
}
