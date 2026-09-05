import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/enums/foodly_countries.dart';
import 'package:foodly_world/data_models/business/business_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/image/feed_multi_image_view/feed_multi_image_view.dart';
import 'package:foodly_world/ui/views/home/widgets/new_releases_card.dart';

/// La tarjeta de negocio de "Nuevos en Foodly", después del rediseño de
/// 2026-09-04.
///
/// LOS TRES BUGS QUE TENÍA, Y QUE ES LO QUE SE PROTEGE ACÁ.
///
/// 1. El nombre desbordaba. Vivía en un `Text` dentro de un `Column` dentro de
///    un `Row`, sin `Expanded` ni `Flexible`: con un nombre corto entraba, con
///    uno largo se salía de la tarjeta y Flutter pintaba las rayas de overflow.
///
/// 2. Tocar la foto no abría el negocio. La portada usaba
///    `FeedMultipleImageView`, que trae su propio `GestureDetector` y abre el
///    visor de imágenes. El gesto que navega estaba fuera, así que la zona más
///    grande de la tarjeta hacía otra cosa que el resto.
///
/// 3. La descripción se rellenaba con saltos de línea. Vivía en un
///    `SizedBox(height: 60)` cuyo valor por defecto era la cadena `'\n \n'`,
///    o sea que sin descripción quedaba un hueco con texto invisible dentro.
void main() {
  setUpAll(() async => S.load(const Locale('es')));

  BusinessDM negocio({String? name = 'Taberna Da Cidade', String? intro, String? city = 'Covilhã'}) => BusinessDM(
        uuid: 'b1',
        name: name,
        logo: '',
        introMessage: intro,
        city: city,
        country: city == null ? null : FoodlyCountries.PORTUGAL,
        rating: 4,
      );

  Future<void> pump(WidgetTester tester, BusinessDM business, {double width = 390}) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = Size(width, 1400);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: NewReleaseBusinessCard(business: business),
            ),
          ),
        ),
      ),
    );
    await tester.pump();
  }

  testWidgets('un nombre largo no desborda la tarjeta', (tester) async {
    await pump(
      tester,
      negocio(name: 'Restaurante Tradicional da Serra da Estrela e Adega do Vale'),
      // 320 dp es la pantalla más angosta que soportamos: donde peor estaba.
      width: 320,
    );

    expect(tester.takeException(), isNull, reason: 'el nombre volvió a desbordar');
  });

  testWidgets('la portada no se roba el tap: es el collage sin gesto', (tester) async {
    await pump(tester, negocio());

    expect(find.byType(FeedMultipleImageView), findsNothing,
        reason: 'FeedMultipleImageView abre el visor de imágenes y se come el tap de la tarjeta');
  });

  testWidgets('sin descripción no se rellena con saltos de línea', (tester) async {
    await pump(tester, negocio());

    // El hueco se reserva —ver el test de abajo— pero vacío, no con la cadena
    // '\n \n' que usaba el diseño anterior para empujar el layout.
    expect(find.textContaining('\n'), findsNothing);
  });

  /// EL SALTO DEL SCROLL (2026-09-05). Esta sección rota sola cada 4 segundos
  /// dentro de un `SingleChildScrollView`. Cuando las tarjetas medían distinto
  /// según tuvieran descripción o no, cada rotación movía todo lo que había
  /// debajo — sin que el usuario tocara nada, y pudiendo desplazar justo lo que
  /// estaba por tocar.
  ///
  /// Animar ese cambio de alto (`AnimatedSize`) lo suavizaba pero no lo
  /// quitaba. Lo que lo quita es que todas las tarjetas midan lo mismo por
  /// construcción: nombre a una línea y hueco de descripción siempre
  /// reservado. Este test es lo que impide que vuelva.
  testWidgets('todas las tarjetas miden lo mismo, tengan descripción o no', (tester) async {
    Future<double> alto(BusinessDM b) async {
      await pump(tester, b);

      return tester.getSize(find.byType(NewReleaseBusinessCard)).height;
    }

    final conDescripcion = await alto(negocio(intro: 'Esperamos por ti na nossa fantástica taberna.'));
    final sinDescripcion = await alto(negocio());
    final descripcionLarga = await alto(negocio(
      intro: 'Uma casa de comida tradicional da Beira Interior, com forno a lenha, adega própria e uma esplanada '
          'com vista para a serra que vale a pena conhecer com tempo.',
    ));
    final nombreLargo = await alto(negocio(name: 'Restaurante Tradicional da Serra da Estrela e Adega do Vale'));

    expect(sinDescripcion, conDescripcion);
    expect(descripcionLarga, conDescripcion);
    expect(nombreLargo, conDescripcion);
  });

  testWidgets('con descripción, se muestra junto al resto del contenido', (tester) async {
    await pump(tester, negocio(intro: 'Esperamos por ti na nossa fantástica taberna.'));

    expect(find.text('Taberna Da Cidade'), findsOneWidget);
    expect(find.text('Esperamos por ti na nossa fantástica taberna.'), findsOneWidget);
    expect(find.text('Covilhã, Portugal'), findsOneWidget);
    expect(find.text(S.current.moreInfo), findsOneWidget);
  });
}
