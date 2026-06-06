import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/ui/shared_widgets/carousel/foodly_carousel.dart';

/// Tests para la resolución responsive PURA de [FoodlyCarousel]
/// ([resolveCarouselViewportFraction] / [resolveCarouselHeight]).
///
/// Son funciones sin estado ni BuildContext a propósito, justamente para poder
/// validar la matemática del "peek" y la garantía de no-overflow sin levantar
/// el árbol de widgets.
void main() {
  group('resolveCarouselViewportFraction', () {
    test('mobile NUNCA cambia la fracción base (phones quedan intactos)', () {
      for (final base in [1.0, 0.3, 0.25, 0.41]) {
        for (final w in [320.0, 344.0, 390.0, 430.0, 599.0]) {
          expect(
            resolveCarouselViewportFraction(
              base: base,
              breakpoint: FoodlyCarouselBreakpoint.mobile,
              screenWidth: w,
            ),
            base,
            reason: 'mobile base=$base w=$w debe quedar igual',
          );
        }
      }
    });

    test('el override explícito gana sobre el default', () {
      expect(
        resolveCarouselViewportFraction(
          base: 1.0,
          breakpoint: FoodlyCarouselBreakpoint.tablet,
          screenWidth: 820,
          tablet: 0.62,
        ),
        0.62,
      );
    });

    test('desktop hereda del tablet, y tablet del smallTablet, si faltan', () {
      // desktop sin valor propio -> usa tablet
      expect(
        resolveCarouselViewportFraction(
          base: 1.0,
          breakpoint: FoodlyCarouselBreakpoint.desktop,
          screenWidth: 1280,
          tablet: 0.62,
        ),
        0.62,
      );
      // tablet sin valor propio -> usa smallTablet
      expect(
        resolveCarouselViewportFraction(
          base: 1.0,
          breakpoint: FoodlyCarouselBreakpoint.tablet,
          screenWidth: 820,
          smallTablet: 0.7,
        ),
        0.7,
      );
    });

    test('default constante: mantiene el ancho de item ~base*referenceWidth', () {
      // base 1.0, ref 400 => item objetivo 400px. En 800px => f=0.5.
      expect(
        resolveCarouselViewportFraction(
          base: 1.0,
          breakpoint: FoodlyCarouselBreakpoint.tablet,
          screenWidth: 800,
        ),
        closeTo(0.5, 1e-9),
      );
    });

    test('el default nunca supera la base (solo achica = muestra más items)', () {
      final f = resolveCarouselViewportFraction(
        base: 0.3,
        breakpoint: FoodlyCarouselBreakpoint.smallTablet,
        screenWidth: 600,
      );
      expect(f, lessThanOrEqualTo(0.3));
    });

    test('clamp inferior: no baja de minFraction en pantallas anchas', () {
      final f = resolveCarouselViewportFraction(
        base: 0.25,
        breakpoint: FoodlyCarouselBreakpoint.desktop,
        screenWidth: 2560,
      );
      expect(f, 0.12);
    });
  });

  group('resolveCarouselHeight', () {
    test('sin overrides usa la altura base en todos los breakpoints', () {
      for (final bp in FoodlyCarouselBreakpoint.values) {
        expect(
          resolveCarouselHeight(base: 363, breakpoint: bp),
          363,
        );
      }
    });

    test('override por breakpoint con fallback hacia abajo', () {
      expect(
        resolveCarouselHeight(
          base: 363,
          breakpoint: FoodlyCarouselBreakpoint.desktop,
          tablet: 420,
        ),
        420,
      );
    });
  });

  group('promos: garantía de no-overflow (imagen 16/9 dentro de 363px)', () {
    // La card de promo es una imagen AspectRatio 16/9. Para no desbordar el
    // SizedBox de 363px, el alto de la imagen (ancho_card * 9/16) debe ser ≤363.
    // ancho_card = f*W - margenHorizontal(16). Validamos en todo el rango tablet.
    const cardMargin = 16.0;
    const carouselHeight = 363.0;

    double imageHeight(double f, double w) => (f * w - cardMargin) * 9 / 16;

    test('f=0.62 no desborda en 600..1023 (rango smallTablet+tablet)', () {
      for (var w = 600.0; w <= 1023.0; w += 1) {
        expect(
          imageHeight(0.62, w),
          lessThanOrEqualTo(carouselHeight),
          reason: 'overflow en w=$w con f=0.62',
        );
      }
    });

    test('iPad Air (820px): ~1/4 de peek y sin overflow', () {
      const w = 820.0;
      const f = 0.62;
      final peek = (1 - f) / (2 * f); // fracción de vecina visible por lado
      expect(peek, closeTo(0.306, 0.01)); // ≈ un cuarto
      expect(imageHeight(f, w), lessThan(carouselHeight));
    });
  });
}
