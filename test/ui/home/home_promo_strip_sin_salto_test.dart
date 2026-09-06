import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/carousel/foodly_carousel.dart';
import 'package:foodly_world/ui/shared_widgets/shimmer/home_shimmer_widgets.dart';
import 'package:foodly_world/ui/views/home/widgets/main_top_offers_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// La tira de promos de la home tiene TRES estados —shimmer de carga,
/// placeholder de vacío/error y carrusel cargado— y los tres tienen que medir
/// exactamente lo mismo de alto. Si no, al terminar de cargar las promos todo
/// lo que hay debajo (el título "Nuevos en Foodly" y su tarjeta) pega un salto.
///
/// EL SALTO QUE HABÍA (medido el 2026-09-06, pintando los widgets):
///
/// | ancho | shimmer | vacío  | cargado | salto  |
/// |-------|---------|--------|---------|--------|
/// | 375   | 333     | 301,9  | 210,9   | +122   |
/// | 402   | 333     | 317,1  | 226,1   | +107   |
/// | 430   | 333     | 332,9  | 241,9   | +91    |
/// | 744   | 333     | 509,5  | 225,0   | +285   |
/// | 1024  | 333     | 667,0  | 225,0   | +442   |
///
/// Tres alturas distintas por tres caminos distintos: el shimmer llevaba un
/// `333` a mano, el placeholder de vacío sumaba 96 px de hueco bajo un
/// `AspectRatio` que además crecía con la pantalla, y el carrusel no llevaba
/// `height` en móvil, así que caía a su `aspectRatio` 16/9 sobre el ancho
/// disponible.
///
/// El arreglo es que los tres lean [resolveHomePromoCarouselGeometry]. El que
/// manda es el CARRUSEL: su alto no cambió ni un píxel, los otros dos se
/// mudaron a él.
///
/// Estos tests miden los widgets de verdad, no una copia de sus números.
void main() {
  setUpAll(() async => S.load(const Locale('es')));

  /// 320 es la pantalla más angosta que soportamos; 1024 entra en desktop.
  const anchos = <String, double>{
    'pantalla mínima': 320,
    'iPhone SE': 375,
    'iPhone 16 Pro': 402,
    'iPhone 16 Pro Max': 430,
    'iPad mini': 744,
    'iPad Air': 820,
    'iPad Pro 12.9"': 1024,
  };

  Future<double> alturaPintada(WidgetTester tester, double ancho, Widget hijo, Type tipo) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = Size(ancho, 2200);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child ?? const SizedBox.shrink(),
        breakpoints: DeviceSize.breakpoints,
      ),
      home: Scaffold(body: SingleChildScrollView(child: hijo)),
    ));
    // El placeholder de vacío arranca su vídeo en un `Future`; el segundo pump
    // deja que caiga en su estado final antes de medir.
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    return tester.getSize(find.byType(tipo).first).height;
  }

  /// El carrusel cargado, pintado con las MISMAS opciones que usa la home
  /// ([homePromoCarouselOptions]) — no con una copia que se pueda desincronizar.
  Widget carruselCargado() => Builder(
        builder: (context) => CarouselSlider(
          options: homePromoCarouselOptions(
            breakpoint: foodlyCarouselBreakpointOf(context),
            screenWidth: MediaQuery.of(context).size.width,
          ),
          items: List.generate(4, (_) => const ColoredBox(color: Color(0xFFEEEEEE))),
        ),
      );

  group('los tres estados de la tira miden lo mismo', () {
    for (final entry in anchos.entries) {
      testWidgets('${entry.key} (${entry.value.toInt()} px)', (tester) async {
        final ancho = entry.value;

        final cargado = await alturaPintada(tester, ancho, carruselCargado(), CarouselSlider);
        final shimmer = await alturaPintada(tester, ancho, const PromoCarouselShimmer(), PromoCarouselShimmer);
        final vacio = await alturaPintada(
          tester,
          ancho,
          EmptyOffersWidget(isError: false, onRetry: () {}),
          EmptyOffersWidget,
        );
        final error = await alturaPintada(
          tester,
          ancho,
          EmptyOffersWidget(isError: true, onRetry: () {}),
          EmptyOffersWidget,
        );

        // Sub-píxel: los tres salen de la misma división, así que la tolerancia
        // es sólo por redondeo de coma flotante.
        expect(shimmer, closeTo(cargado, 0.01),
            reason: 'el shimmer mide $shimmer y el carrusel cargado $cargado: '
                'al cargar las promos la tira daría un salto de ${(shimmer - cargado).abs().toStringAsFixed(1)} px');
        expect(vacio, closeTo(cargado, 0.01),
            reason: 'el placeholder de vacío mide $vacio y el carrusel cargado $cargado');
        expect(error, closeTo(cargado, 0.01), reason: 'el placeholder de error mide $error y el cargado $cargado');
      });
    }
  });

  group('ningún estado desborda', () {
    for (final entry in anchos.entries) {
      testWidgets('${entry.key} (${entry.value.toInt()} px)', (tester) async {
        await alturaPintada(tester, entry.value, const PromoCarouselShimmer(), PromoCarouselShimmer);
        expect(tester.takeException(), isNull, reason: 'el shimmer desborda a ${entry.value} px');

        await alturaPintada(tester, entry.value, EmptyOffersWidget(isError: true, onRetry: () {}), EmptyOffersWidget);
        expect(tester.takeException(), isNull, reason: 'el placeholder desborda a ${entry.value} px');
      });
    }
  });

  group('en móvil el usuario sigue viendo exactamente lo mismo que antes', () {
    /// Lo que la tira medía ANTES de este arreglo: `CarouselSlider` sin
    /// `height`, cayendo a su aspectRatio por defecto. Fijar el alto en móvil
    /// no puede cambiar ese número — sólo hacerlo legible para los otros dos
    /// estados.
    Future<double> conAspectRatioPorDefecto(WidgetTester tester, double ancho) async {
      return alturaPintada(
        tester,
        ancho,
        Builder(
          builder: (context) => CarouselSlider(
            options: CarouselOptions(
              // Explícito aunque sea el default: ES el estado anterior que se
              // está comparando, no un descuido.
              // ignore: avoid_redundant_argument_values
              height: null,
              viewportFraction: resolveHomePromoCarouselGeometry(
                breakpoint: foodlyCarouselBreakpointOf(context),
                screenWidth: MediaQuery.of(context).size.width,
              ).viewportFraction,
              enlargeCenterPage: true,
            ),
            items: List.generate(4, (_) => const ColoredBox(color: Color(0xFFEEEEEE))),
          ),
        ),
        CarouselSlider,
      );
    }

    for (final ancho in [320.0, 375.0, 402.0, 430.0]) {
      testWidgets('a ${ancho.toInt()} px el alto fijado es el que daba el aspectRatio', (tester) async {
        final antes = await conAspectRatioPorDefecto(tester, ancho);
        final ahora = await alturaPintada(tester, ancho, carruselCargado(), CarouselSlider);

        expect(ahora, closeTo(antes, 0.01),
            reason: 'fijar el alto en móvil cambió la tira: antes $antes, ahora $ahora');
        expect(ahora, closeTo(ancho * 9 / 16, 0.01));
      });
    }
  });

  testWidgets('el alto que comparten los tres sale de la geometría, no de una constante', (tester) async {
    // Guarda contra volver a hardcodear un número en cualquiera de los tres.
    for (final ancho in [375.0, 402.0, 1024.0]) {
      final esperado = resolveHomePromoCarouselGeometry(
        breakpoint: ancho >= 600 ? FoodlyCarouselBreakpoint.desktop : FoodlyCarouselBreakpoint.mobile,
        screenWidth: ancho,
      ).height;

      final shimmer = await alturaPintada(tester, ancho, const PromoCarouselShimmer(), PromoCarouselShimmer);
      expect(shimmer, closeTo(esperado, 0.01), reason: 'a $ancho px el shimmer no sigue a la geometría compartida');
    }
  });
}
