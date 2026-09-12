import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/placeholders/foodly_brand_surface.dart';
import 'package:foodly_world/ui/shared_widgets/placeholders/foodly_empty_media_card.dart';
import 'package:foodly_world/ui/views/home/widgets/main_top_offers_widget.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases_card.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Los dos huecos con vídeo del home.
///
/// EL VACÍO NO ES UN FALLO, y hasta ahora se pintaban igual. Si no hay promos
/// todavía, el hueco se aprovecha para CONTAR la sección: tres tarjetas que
/// rotan igual que rotarían las promos. Si la petición se cayó, no toca
/// enseñar nada — toca reintentar.
///
/// EL DESBORDAMIENTO (medido el 2026-09-10 en la tableta de Héctor). El hueco
/// de negocios nuevos era un `SizedBox(height: 430)` con un `AspectRatio(4/3)`
/// dentro. Con el padding lateral del home, en tableta el vídeo pedía el ancho
/// entero por 3/4 de alto: **250 px de más a 820 y 595 a 1280**. En teléfono
/// colaba de milagro.
void main() {
  setUpAll(() async => S.load(const Locale('es')));

  Future<void> pintar(WidgetTester tester, double ancho, Widget hijo) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = Size(ancho, 2200);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(MaterialApp(
      key: UniqueKey(),
      locale: const Locale('es'),
      localizationsDelegates: const [S.delegate, ...GlobalMaterialLocalizations.delegates],
      supportedLocales: S.delegate.supportedLocales,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child ?? const SizedBox.shrink(),
        breakpoints: DeviceSize.breakpoints,
      ),
      home: Scaffold(body: SingleChildScrollView(child: hijo)),
    ));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
  }

  group('promos: el vacío enseña la sección', () {
    testWidgets('sin promos son TRES tarjetas, no una', (tester) async {
      await pintar(tester, 402, EmptyOffersWidget(isError: false, onRetry: () {}));

      expect(find.byType(CarouselSlider), findsOneWidget, reason: 'el vacío ES el carrusel, no un sucedáneo');
      expect(find.byType(FoodlyEmptyMediaCard), findsWidgets);
      expect(find.text(S.current.promosTeaserSaveTitle), findsOneWidget);
    });

    testWidgets('con fallo es UNA sola, y con salida', (tester) async {
      await pintar(tester, 402, EmptyOffersWidget(isError: true, onRetry: () {}));

      expect(find.byType(CarouselSlider), findsNothing, reason: 'si falló no toca enseñar la sección');
      expect(find.text(S.current.retry), findsOneWidget);
      expect(find.text(S.current.promosTeaserSaveTitle), findsNothing);
    });

    testWidgets('sin fallo NO hay botón de reintentar: no hay nada que reintentar', (tester) async {
      await pintar(tester, 402, EmptyOffersWidget(isError: false, onRetry: () {}));

      expect(find.text(S.current.retry), findsNothing);
    });
  });

  group('la tercera cambia según quién mire', () {
    testWidgets('a un comensal le habla de compartir, y sin botón', (tester) async {
      await pintar(tester, 402, EmptyOffersWidget(isError: false, onRetry: () {}));

      final rail = tester.widget<CarouselSlider>(find.byType(CarouselSlider));
      final tercera = rail.items!.last as FoodlyEmptyMediaCard;

      expect(tercera.title, S.current.promosTeaserShareTitle);
      expect(tercera.onAction, isNull, reason: 'un comensal no tiene adónde ir desde aquí');
    });

    testWidgets('a un dueño le habla de publicar, y con botón', (tester) async {
      await pintar(
        tester,
        402,
        EmptyOffersWidget(isError: false, isBusinessOwner: true, onRetry: () {}),
      );

      final rail = tester.widget<CarouselSlider>(find.byType(CarouselSlider));
      final tercera = rail.items!.last as FoodlyEmptyMediaCard;

      expect(tercera.title, S.current.promosTeaserOwnerTitle);
      expect(tercera.actionLabel, S.current.promosTeaserOwnerCta);
      expect(tercera.onAction, isNotNull, reason: 'es el único de los tres huecos con adónde ir');
    });
  });

  group('negocios nuevos: ya no se desborda', () {
    for (final ancho in [402.0, 820.0, 1280.0]) {
      testWidgets('a ${ancho.toInt()} px', (tester) async {
        await pintar(tester, ancho, EmptyNewReleasesWidget(isError: false, onRetry: () {}));

        expect(tester.takeException(), isNull, reason: 'antes desbordaba 250 px a 820 y 595 a 1280');
      });
    }

    /// EL CRITERIO CAMBIÓ, y conviene saber por qué (2026-09-11).
    ///
    /// Primero acoté el hueco a un techo fijo (420) y la tarjeta real al mismo
    /// número, para que no hubiera salto entre vacío y cargado. Héctor lo probó
    /// en una tableta grande y tenía razón: **un techo fijo no escala** — a
    /// 1280 px se ve igual de pequeño que a 744, y la tarjeta quedaba diminuta
    /// con media pantalla vacía al lado.
    ///
    /// Ahora el ancho lo decide el PADDING por breakpoint, y el hueco no lleva
    /// techo propio para poder seguir a la tarjeta. Lo que este test protege
    /// sigue siendo lo mismo de antes: que los dos midan igual. Si alguien le
    /// vuelve a poner un techo al hueco, el vacío y el cargado se separan y
    /// vuelve el salto — que encima solo se ve cuando por fin aparece un
    /// negocio, el peor momento para descubrirlo.
    testWidgets('el hueco ocupa el ancho que le den, sin techo propio', (tester) async {
      const anchoDisponible = 600.0;

      await pintar(
        tester,
        1280,
        Center(
          child: SizedBox(
            width: anchoDisponible,
            child: EmptyNewReleasesWidget(isError: false, onRetry: () {}),
          ),
        ),
      );

      // OJO con qué se mide: el nodo externo de FoodlyEmptyMediaCard es un
      // `Center` que ocupa todo el ancho — un techo iría por dentro, así que
      // midiendo ese nodo no se vería. Mismo despiste que con las hojas de
      // Material 3.
      final tarjeta = tester.getSize(
        find.descendant(of: find.byType(FoodlyEmptyMediaCard).first, matching: find.byType(ClipRRect)).first,
      );

      expect(tarjeta.width, anchoDisponible,
          reason: 'con techo propio dejaría de seguir a la tarjeta real y volvería el salto');
    });
  });

  group('el botón de reintentar dejó de ser neumórfico', () {
    testWidgets('mide al menos el suelo táctil de 44 px', (tester) async {
      await pintar(tester, 402, EmptyOffersWidget(isError: true, onRetry: () {}));

      final alto = tester.getSize(find.ancestor(of: find.text(S.current.retry), matching: find.byType(InkWell)).first);

      expect(alto.height, greaterThanOrEqualTo(44), reason: 'el neumórfico medía 32');
    });

    testWidgets('y responde', (tester) async {
      var tocado = 0;
      await pintar(tester, 402, EmptyOffersWidget(isError: true, onRetry: () => tocado++));

      await tester.tap(find.text(S.current.retry));
      await tester.pump();

      expect(tocado, 1);
    });
  });

  /// LA TARJETA NO PUEDE NACER EN BLANCO (2026-09-12). Visto por Héctor en la
  /// tableta: al entrar al home se veía aparecer **la sombra de la tarjeta** y,
  /// un instante después, el contenido.
  ///
  /// La causa es que el `VideoPlayerController` tarda 100-300 ms en arrancar
  /// —cada vez, porque el State se monta de cero— y mientras tanto el fondo era
  /// `primaryFoodly` al 4 % sobre el fondo de la página, que es casi el mismo
  /// color. Con la cinta de vidrio (blanco al 74 %) encima de eso, lo único que
  /// separaba la tarjeta de la página era su sombra.
  ///
  /// Con contenido real no pasa: las fotos vienen de la caché y pintan en el
  /// primer frame.
  ///
  /// En un test el vídeo NUNCA está listo (no hay canal de plataforma), así que
  /// lo que se mide aquí es exactamente ese primer momento.
  group('sin vídeo todavía, la tarjeta ya está completa', () {
    testWidgets('el hueco de promos pinta superficie de marca desde el primer frame', (tester) async {
      await pintar(tester, 402, EmptyOffersWidget(isError: true, onRetry: () {}));

      expect(
        find.descendant(
          of: find.byType(FoodlyEmptyMediaCard),
          matching: find.byType(FoodlyBrandSurface),
        ),
        findsWidgets,
        reason: 'sin fondo de verdad, la tarjeta es un recuadro con sombra',
      );
    });

    testWidgets('el hueco de negocios nuevos, igual', (tester) async {
      await pintar(tester, 402, EmptyNewReleasesWidget(isError: false, onRetry: () {}));

      expect(
        find.descendant(
          of: find.byType(FoodlyEmptyMediaCard),
          matching: find.byType(FoodlyBrandSurface),
        ),
        findsWidgets,
      );
    });

    testWidgets('y el vídeo entra con un fundido, no de golpe', (tester) async {
      await pintar(tester, 402, EmptyOffersWidget(isError: true, onRetry: () {}));

      final fundido = tester.widget<AnimatedOpacity>(
        find.descendant(of: find.byType(FoodlyEmptyMediaCard), matching: find.byType(AnimatedOpacity)).first,
      );
      expect(fundido.opacity, 0, reason: 'sin vídeo listo, la capa del vídeo no tapa la superficie');
      expect(fundido.duration, greaterThan(Duration.zero));
    });

    testWidgets('ya no hay indicador de carga DENTRO de la tarjeta', (tester) async {
      // Era un indicador de carga dentro de algo que ya venía de un shimmer.
      await pintar(tester, 402, EmptyOffersWidget(isError: true, onRetry: () {}));

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text(S.current.retry), findsOneWidget, reason: 'la salida sigue ahí');
    });
  });
}
