import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/ui/shared_widgets/carousel/foodly_carousel.dart';

/// La tira de promos de la home en tablet.
///
/// EL PROBLEMA (2026-09-06). `CarouselSlider` sin `height` se dimensiona con su
/// `aspectRatio` 16/9 sobre el ancho disponible, así que la tira crecía con la
/// pantalla: 226 px en un iPhone 16 Pro y 576 px en un iPad de 1024. Y con
/// `viewportFraction` fija en .83, la card pasaba de 334 px a 850.
///
/// Estos tests miden las dos cosas contra la función que usa el widget de
/// verdad, no contra una copia.
void main() {
  /// Alto real que produce CarouselSlider con las opciones de la home, medido
  /// pintándolo: así el test no depende de mi lectura del paquete.
  Future<double> altoReal(WidgetTester tester, double ancho, double? altoFijado) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = Size(ancho, 1400);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: CarouselSlider(
              options: CarouselOptions(height: altoFijado, viewportFraction: .83, enlargeCenterPage: true),
              items: List.generate(4, (_) => const ColoredBox(color: Color(0xFFEEEEEE))),
            ),
          ),
        ),
      ),
    );

    return tester.getSize(find.byType(CarouselSlider)).height;
  }

  group('en móvil no cambia nada', () {
    for (final ancho in [375.0, 402.0, 430.0]) {
      test('a $ancho px la fracción sigue siendo la de siempre y el alto es el del aspectRatio', () {
        final g = resolveHomePromoCarouselGeometry(
          breakpoint: FoodlyCarouselBreakpoint.mobile,
          screenWidth: ancho,
        );

        expect(g.viewportFraction, .83);
        // Antes esto devolvía `null` y el alto lo ponía `CarouselSlider` solo,
        // con su aspectRatio por defecto. El número es EL MISMO; lo que cambió
        // es que ahora se calcula acá, y así el shimmer y el placeholder de
        // vacío pueden leerlo y cuadrar con él (ver
        // home_promo_strip_sin_salto_test.dart).
        expect(g.height, closeTo(ancho * 9 / 16, 0.01),
            reason: 'en móvil el alto tiene que seguir siendo el que daba el aspectRatio');
      });
    }
  });

  group('en tablet la card se queda en ancho de teléfono', () {
    const anchos = {'iPad mini': 744.0, 'iPad Air': 820.0, 'iPad Pro 12.9"': 1366.0};

    for (final entry in anchos.entries) {
      test('${entry.key}: la card mide ~334 px, no ${(entry.value * .83).round()}', () {
        final g = resolveHomePromoCarouselGeometry(
          breakpoint: FoodlyCarouselBreakpoint.tablet,
          screenWidth: entry.value,
        );

        final anchoCard = g.viewportFraction * entry.value;

        expect(anchoCard, closeTo(332, 1), reason: '${entry.key} debería mantener el ancho de item de un teléfono');
        expect(g.viewportFraction, lessThan(.83), reason: 'la fracción solo puede achicarse');
      });
    }

    test('el alto se fija y deja de crecer con la pantalla', () {
      final g = resolveHomePromoCarouselGeometry(
        breakpoint: FoodlyCarouselBreakpoint.tablet,
        screenWidth: 1024,
      );

      expect(g.height, 225);
    });
  });

  testWidgets('medido: sin alto fijado la tira se dispara en un iPad; con él, no', (tester) async {
    final sinFijar = await altoReal(tester, 1024, null);
    final fijado = await altoReal(tester, 1024, 225);

    expect(sinFijar, 576, reason: 'esto es lo que pasaba antes: 16/9 sobre 1024');
    expect(fijado, 225);
    expect(fijado, lessThan(sinFijar / 2));
  });

  testWidgets('el alto fijado de tablet coincide con el que da un teléfono de referencia', (tester) async {
    final enTelefonoDeReferencia = await altoReal(tester, kCarouselAdaptiveReferenceWidth, null);
    final g = resolveHomePromoCarouselGeometry(
      breakpoint: FoodlyCarouselBreakpoint.tablet,
      screenWidth: 1024,
    );

    expect(g.height, closeTo(enTelefonoDeReferencia, 0.5),
        reason: 'la card debe conservar sus proporciones de móvil en tablet');
  });
}
