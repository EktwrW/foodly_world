import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/placeholders/foodly_empty_view.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_categories/categories_page.dart';
import 'package:foodly_world/ui/views/home/widgets/business_results_view.dart';

/// Una lista de negocios vacia NUNCA es «aun no hay nada»: es «no hay nada con
/// este criterio». `BusinessResultsView` la pintan dos pantallas con palancas
/// distintas —el radio en categorias, la consulta en la busqueda— y por eso el
/// vacio lo trae quien llama.
///
/// Lo que se fija: que la palanca del radio proponga el SIGUIENTE salto, y que
/// no proponga nada cuando no hay salto o no hay ubicacion, porque la busqueda
/// por radio va con `latitude!`.
void main() {
  setUpAll(() async => S.load(const Locale('es')));

  FoodlyEmptyView vacio(WidgetTester tester) => tester.widget<FoodlyEmptyView>(find.byType(FoodlyEmptyView));

  double? ampliadoA;
  setUp(() => ampliadoA = null);

  Future<void> pintarCategoria(WidgetTester tester, {required double radio, bool hayUbicacion = true}) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VacioDeCategoria(
          radioActual: radio,
          hayUbicacion: hayUbicacion,
          onAmpliarRadio: (r) => ampliadoA = r,
        ),
      ),
    ));
    await tester.pump();
  }

  group('categorias', () {
    testWidgets('propone el siguiente salto del selector, no el mayor', (tester) async {
      await pintarCategoria(tester, radio: 5);

      final v = vacio(tester);
      expect(v.intent, FoodlyEmptyIntent.filtro);
      expect(v.title, S.current.categoryEmptyTitle);
      expect(v.subtitle, S.current.noNearbyBusinessesInCategory(5));
      expect(find.text(S.current.widenRadius(10)), findsOneWidget);
      expect(find.text(S.current.widenRadius(25)), findsNothing);
    });

    testWidgets('el boton amplia de verdad, al radio que anuncia', (tester) async {
      await pintarCategoria(tester, radio: 10);

      await tester.tap(find.text(S.current.widenRadius(15)));
      await tester.pump();

      expect(ampliadoA, 15);
    });

    testWidgets('en el radio mayor no hay nada que ampliar: sin boton', (tester) async {
      await pintarCategoria(tester, radio: 25);

      expect(vacio(tester).onAction, isNull);
      expect(find.textContaining('km'), findsOneWidget, reason: 'solo el subtitulo, que dice el radio actual');
    });

    testWidgets('sin ubicacion resuelta tampoco, porque la busqueda por radio la exige', (tester) async {
      await pintarCategoria(tester, radio: 5, hayUbicacion: false);

      expect(vacio(tester).onAction, isNull);
    });
  });

  group('la vista compartida', () {
    testWidgets('sin resultados pinta el vacio que le pasan', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: BusinessResultsView(
            searchResults: [],
            isGridView: false,
            emptyState: VacioDeCategoria(radioActual: 5, hayUbicacion: true, onAmpliarRadio: _nada),
          ),
        ),
      ));
      await tester.pump();

      expect(find.text(S.current.categoryEmptyTitle), findsOneWidget);
    });

    testWidgets('sin resultados y sin vacio propio, cae en el de busqueda y NO en uno de novato', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(body: BusinessResultsView(searchResults: [], isGridView: false)),
      ));
      await tester.pump();

      final v = vacio(tester);
      expect(v.intent, FoodlyEmptyIntent.filtro);
      expect(v.title, S.current.searchEmptyTitle);
      expect(v.onAction, isNull, reason: 'quien no trae palanca no puede ofrecer salida');
    });
  });
}

void _nada(double _) {}
