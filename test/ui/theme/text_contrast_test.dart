import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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
}
