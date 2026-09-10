import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
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

        expect(tester.takeException(), isNull,
            reason: 'antes desbordaba 250 px a 820 y 595 a 1280');
      });
    }

    testWidgets('y se acota: en tableta no se estira a todo el ancho', (tester) async {
      await pintar(tester, 1280, EmptyNewReleasesWidget(isError: false, onRetry: () {}));

      // OJO con qué se mide: el nodo externo de FoodlyEmptyMediaCard es un
      // `Center` que ocupa todo el ancho — el techo va por dentro. Midiendo ese
      // salen 1280 y parece que no acota nada. Es el mismo despiste que con las
      // hojas inferiores de Material 3.
      final tarjeta = tester.getSize(
        find.descendant(of: find.byType(FoodlyEmptyMediaCard).first, matching: find.byType(ClipRRect)).first,
      );

      expect(tarjeta.width, lessThanOrEqualTo(440),
          reason: 'sin techo, en una tableta de 1280 se iba a 1256 de ancho');
    });
  });

  /// El hueco y la tarjeta cargada tienen que medir LO MISMO de ancho.
  ///
  /// Estuvo a punto de no ser así: al acotar el placeholder a 420 px, la
  /// tarjeta real se seguía estirando a 1244 en una tableta. Pasar de vacío a
  /// cargado habría dado un salto brutal, y encima solo se ve cuando por fin
  /// aparece un negocio — el peor momento para descubrirlo.
  testWidgets('el hueco de negocios mide lo mismo que su techo compartido', (tester) async {
    await pintar(tester, 1280, EmptyNewReleasesWidget(isError: false, onRetry: () {}));

    final hueco = tester.getSize(
      find.descendant(of: find.byType(FoodlyEmptyMediaCard).first, matching: find.byType(ClipRRect)).first,
    );

    expect(hueco.width, UIDimens.NEW_RELEASES_MAX_WIDTH,
        reason: 'la tarjeta real se acota al mismo número en foodly_main_page');
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
}
