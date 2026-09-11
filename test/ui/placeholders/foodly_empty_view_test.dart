import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/placeholders/foodly_empty_view.dart';
import 'package:foodly_world/ui/shared_widgets/placeholders/no_items_view_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

/// El estado vacío compartido.
///
/// Lo que estos tests protegen no es el estilo, es la DISTINCIÓN: que un vacío
/// de novato, uno por filtro y un fallo de carga no se vean iguales, porque la
/// salida de cada uno es distinta. Antes de esto, Foodly le decía «aún no
/// tienes nada» a un usuario cuya petición se había caído.
void main() {
  setUpAll(() async => S.load(const Locale('es')));

  Future<void> pintar(WidgetTester tester, Widget vista) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(402, 874);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(MaterialApp(
      locale: const Locale('es'),
      localizationsDelegates: const [S.delegate, ...GlobalMaterialLocalizations.delegates],
      supportedLocales: S.delegate.supportedLocales,
      home: Scaffold(body: vista),
    ));
    await tester.pump();
  }

  group('las tres intenciones se distinguen', () {
    testWidgets('cada una tiñe su medallón de un color distinto', (tester) async {
      final colores = <FoodlyEmptyIntent, Color?>{};

      for (final intent in FoodlyEmptyIntent.values) {
        await pintar(tester, FoodlyEmptyView(intent: intent, title: 'Vacío'));

        final medallon = tester.widget<Container>(
          find
              .descendant(of: find.byType(FoodlyEmptyView), matching: find.byType(Container))
              .first,
        );
        colores[intent] = (medallon.decoration! as BoxDecoration).color;
      }

      expect(colores.values.toSet(), hasLength(3), reason: 'los tres deben verse distintos: $colores');
    });

    testWidgets('el fallo usa el rojo oscurecido, no el error crudo del tema', (tester) async {
      await pintar(tester, const FoodlyEmptyView(intent: FoodlyEmptyIntent.fallo, title: 'No pudimos cargarlo'));

      final medallon = tester.widget<Container>(
        find.descendant(of: find.byType(FoodlyEmptyView), matching: find.byType(Container)).first,
      );

      expect((medallon.decoration! as BoxDecoration).color, FoodlyThemes.failureWash);
      expect(FoodlyThemes.failureOnSurface, isNot(FoodlyThemes.error),
          reason: 'el error crudo vibra en un medallón de 96 px');
    });
  });

  group('la salida', () {
    testWidgets('sin callback NO se pinta botón, aunque haya etiqueta', (tester) async {
      await pintar(tester, const FoodlyEmptyView(title: 'Vacío', actionLabel: 'Explorar'));

      expect(find.text('Explorar'), findsNothing,
          reason: 'mejor sin salida que con un botón que no lleva a ninguna parte');
    });

    testWidgets('con callback se pinta y responde', (tester) async {
      var tocado = 0;
      await pintar(tester, FoodlyEmptyView(title: 'Vacío', actionLabel: 'Explorar', onAction: () => tocado++));

      await tester.tap(find.text('Explorar'));
      await tester.pump();

      expect(tocado, 1);
    });

    testWidgets('cumple el suelo táctil de 44 px', (tester) async {
      for (final intent in FoodlyEmptyIntent.values) {
        await pintar(
          tester,
          FoodlyEmptyView(intent: intent, title: 'Vacío', actionLabel: 'Actuar', onAction: () {}),
        );

        final alto = tester.getSize(find.ancestor(of: find.text('Actuar'), matching: find.byType(InkWell))).height;

        expect(alto, greaterThanOrEqualTo(FoodlyEmptyView.alturaDeAccion), reason: '$intent se queda en $alto');
      }
    });
  });

  group('el subtítulo', () {
    testWidgets('es opcional: sin él no queda hueco', (tester) async {
      await pintar(tester, const FoodlyEmptyView(title: 'Solo título'));
      final sinSub = tester.getSize(find.byType(FoodlyEmptyView));

      await pintar(tester, const FoodlyEmptyView(title: 'Solo título', subtitle: 'Con una frase debajo.'));
      final conSub = tester.getSize(find.byType(FoodlyEmptyView));

      expect(find.text('Con una frase debajo.'), findsOneWidget);
      expect(conSub.height, equals(sinSub.height), reason: 'el Center ocupa lo mismo; lo que crece es la columna');
    });

    testWidgets('usa el estilo del sistema, no uno retocado en sitio', (tester) async {
      await pintar(tester, const FoodlyEmptyView(title: 'T', subtitle: 'S'));

      expect(tester.widget<Text>(find.text('T')).style, FoodlyTextStyles.emptyTitle);
      expect(tester.widget<Text>(find.text('S')).style, FoodlyTextStyles.emptySubtitle);
    });

    testWidgets('sin tope no lo tiene: el copy propio es corto por construcción', (tester) async {
      await pintar(tester, const FoodlyEmptyView(title: 'T', subtitle: 'S'));

      final sub = tester.widget<Text>(find.text('S'));
      expect(sub.maxLines, isNull);
      expect(sub.overflow, isNull);
    });

    testWidgets('con tope recorta: lo necesita quien pinta un mensaje del servidor', (tester) async {
      // El panel de analíticas pinta el mensaje de error tal como llega del
      // backend, que puede tener cualquier longitud. Sin tope, un mensaje largo
      // estira el bloque hasta desbordar la pantalla.
      const largo = 'Algo salió mal al pedir los datos y este mensaje viene del servidor, '
          'así que puede ser tan largo como al servidor le apetezca, sin que nadie '
          'lo haya escrito pensando en el hueco donde se va a pintar, ni en pantallas pequeñas.';

      await pintar(tester, const FoodlyEmptyView(title: 'T', subtitle: largo));
      final sinTope = tester.getSize(find.byType(Column).first).height;

      await pintar(tester, const FoodlyEmptyView(title: 'T', subtitle: largo, subtitleMaxLines: 3));
      final conTope = tester.getSize(find.byType(Column).first).height;

      expect(conTope, lessThan(sinTope));
      final sub = tester.widget<Text>(find.text(largo));
      expect(sub.maxLines, 3);
      expect(sub.overflow, TextOverflow.ellipsis);
    });
  });

  group('NoItemsViewWdg sigue funcionando igual para quien ya lo usaba', () {
    testWidgets('sin texto cae al de siempre', (tester) async {
      await pintar(tester, const NoItemsViewWdg());

      expect(find.text(S.current.noItemsYet), findsOneWidget);
    });

    testWidgets('por defecto es de novato', (tester) async {
      await pintar(tester, const NoItemsViewWdg());

      expect(tester.widget<FoodlyEmptyView>(find.byType(FoodlyEmptyView)).intent, FoodlyEmptyIntent.nuevo);
    });

    testWidgets('«no hay promociones en esta sección» ya se marca como filtro', (tester) async {
      await pintar(tester, NoItemsViewWdg(text: S.current.noPromotionsInSection, intent: FoodlyEmptyIntent.filtro));

      final vista = tester.widget<FoodlyEmptyView>(find.byType(FoodlyEmptyView));

      expect(vista.intent, FoodlyEmptyIntent.filtro);
      expect(vista.icon, isNull, reason: 'el asset de menú es del vacío de novato, no del de filtro');
    });
  });
}
