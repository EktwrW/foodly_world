import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show di;
import 'package:foodly_world/core/services/location_service.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/cards/promotion_card_view.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:intl/date_symbol_data_local.dart';

/// La card grande de una promoción, después del rediseño de 2026-09-04.
///
/// LO QUE SE PROTEGE ACÁ SON DOS COSAS.
///
/// La primera es que el rediseño no se llevó contenido por delante. Se
/// cambió la composición entera —cinta de vidrio, riel de fechas, barra de
/// compartir— y en un cambio así lo fácil es que un dato se caiga sin que
/// nadie lo note hasta que un negocio se queja de que su promo no dice
/// cuándo termina.
///
/// La segunda es el bug de los días. Estaban en un `Wrap` con chips de
/// `minWidth: 54` y `spacing: 12`: siete no entran en una fila de 390 dp
/// (7 × 54 + 6 × 12 = 450) y caían 6 + 1, con el último suelto y centrado
/// debajo. Ahora son siete `Expanded` en un `Row`, así que la fila no puede
/// envolver ni en 320 dp — que es donde peor estaba.
void main() {
  setUpAll(() async {
    await S.load(const Locale('es'));
    await initializeDateFormatting('es');
    if (!di.isRegistered<LocationService>()) di.registerSingleton<LocationService>(LocationService());
  });

  PromotionDM promo({
    String title = 'Aprovecha el 30% off',
    String subTitle = 'Descuentos en comida y bebida',
    PromoDaysDM days = const PromoDaysDM(
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
    ),
  }) {
    return PromotionDM(
      id: 1,
      uuid: 'promo-1',
      title: title,
      subTitle: subTitle,
      description: 'Este abril y mayo, 30% de descuento en todas tus órdenes.',
      startDate: DateTime(2026, 4, 11),
      expireDate: DateTime(2026, 5, 31),
      business: null,
      promoDays: days,
    );
  }

  Future<void> pump(WidgetTester tester, PromotionDM p, {double width = 390}) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = Size(width, 2400);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: PromotionCardView(promo: p, trailingAction: const SizedBox.square(dimension: 44)),
          ),
        ),
      ),
    );
    await tester.pump();
  }

  testWidgets('no se perdió ningún dato de la promo por el camino', (tester) async {
    await pump(tester, promo());

    expect(find.text('Aprovecha el 30% off'), findsOneWidget);
    expect(find.text('Descuentos en comida y bebida'), findsOneWidget);
    expect(find.text('Este abril y mayo, 30% de descuento en todas tus órdenes.'), findsOneWidget);

    // Las dos fechas, con el mismo formato que ya usaba la card.
    expect(find.textContaining('11'), findsWidgets);
    expect(find.textContaining('31'), findsWidgets);

    expect(find.text(S.current.valid.toUpperCase()), findsOneWidget);
    expect(find.text(S.current.sharePromotion), findsOneWidget);
  });

  testWidgets('los siete días caben en una sola fila, incluso en 320 dp', (tester) async {
    await pump(tester, promo(), width: 320);

    final labels = [
      S.current.weekdayShort1,
      S.current.weekdayShort2,
      S.current.weekdayShort3,
      S.current.weekdayShort4,
      S.current.weekdayShort5,
      S.current.weekdayShort6,
      S.current.weekdayShort7,
    ];

    final tops = <double>[];
    for (final label in labels) {
      final finder = find.text(label);
      expect(finder, findsOneWidget, reason: 'falta el día $label');
      tops.add(tester.getTopLeft(finder).dy);
    }

    // Si el Wrap volviera, el séptimo caería a una segunda fila y su `dy`
    // sería distinto al del primero.
    expect(tops.toSet(), hasLength(1), reason: 'los días se partieron en más de una fila: $tops');
  });

  testWidgets('los días en los que la promo NO aplica se dibujan apagados', (tester) async {
    await pump(
      tester,
      promo(days: const PromoDaysDM(monday: true, tuesday: true, wednesday: true, thursday: true, friday: true)),
    );

    Color pillColor(String label) {
      final container = tester.widget<Container>(
        find.ancestor(of: find.text(label), matching: find.byType(Container)).first,
      );

      return (container.decoration! as BoxDecoration).color!;
    }

    expect(pillColor(S.current.weekdayShort2), FoodlyThemes.primaryFoodly);
    expect(pillColor(S.current.weekdayShort1), FoodlyThemes.promoDayOff);
    expect(pillColor(S.current.weekdayShort7), FoodlyThemes.promoDayOff);
  });

  testWidgets('sin imagen no se ofrece ampliarla', (tester) async {
    await pump(tester, promo());

    expect(find.byTooltip(S.current.expandImage), findsNothing);
  });

  test('ampliar la imagen solo aplica a promos con una imagen de verdad', () {
    const media = PromoMediaDM(
      id: 1,
      uuid: 'media-1',
      mediaUrl: 'https://example.test/promo.jpg',
      promoItemId: 1,
      mediaType: MediaType.image,
    );

    final conImagen = promo().copyWith(promoMedia: const [media]);
    expect(conImagen.mediaFileIsImage && conImagen.mediaFileUrl.isNotEmpty, isTrue);

    final conVideo = promo().copyWith(promoMedia: [media.copyWith(mediaType: MediaType.video)]);
    expect(conVideo.mediaFileIsImage, isFalse);

    final conYoutube = promo().copyWith(mediaLink: 'https://youtu.be/abc');
    expect(conYoutube.mediaFileIsImage, isFalse);

    // El caso que hacía falta blindar: media de tipo imagen pero sin URL. La
    // card dibuja el placeholder y el botón de ampliar abriría un visor vacío.
    final sinUrl = promo().copyWith(promoMedia: [media.copyWith(mediaUrl: '')]);
    expect(sinUrl.mediaFileIsImage && sinUrl.mediaFileUrl.isNotEmpty, isFalse);
  });
}
