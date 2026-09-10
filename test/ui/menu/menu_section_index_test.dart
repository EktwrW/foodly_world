import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/ui/shared_widgets/menu/menu_section_index.dart';

/// El índice de secciones de la carta, en tableta y en escritorio.
///
/// LA DECISIÓN QUE HAY DETRÁS (2026-09-10). En tableta el menú era una columna
/// larguísima: para llegar a «Postres» había que bajar por toda la carta, con
/// media pantalla vacía al lado.
///
/// Se valoró partirlo en dos paneles —secciones a la izquierda, platos a la
/// derecha— y se descartó: una carta se navega MIRANDO, no buscando, y al
/// enseñar solo una sección se pierde el descubrimiento de lo que hay al lado.
/// El índice añade el salto sin quitar el hojear, y deja el panel de platos
/// exactamente como está hoy — lo que además acota el riesgo al índice nuevo.
void main() {
  group('cuándo aparece', () {
    test('en teléfono nunca, tenga las secciones que tenga', () {
      for (final n in [1, 3, 8, 20]) {
        expect(debeMostrarIndiceDeSecciones(anchoDisponible: 402, secciones: n), isFalse,
            reason: 'con $n secciones a 402 px no cabe un índice');
      }
    });

    test('con pocas secciones tampoco: no hay recorrido que acortar', () {
      for (final n in [0, 1, 2]) {
        expect(debeMostrarIndiceDeSecciones(anchoDisponible: 1280, secciones: n), isFalse,
            reason: 'con $n secciones el panel sería un adorno que roba 168 px');
      }
    });

    test('en tableta y escritorio con carta de verdad, sí', () {
      for (final ancho in [744.0, 820.0, 1280.0, 1920.0]) {
        expect(debeMostrarIndiceDeSecciones(anchoDisponible: ancho, secciones: 5), isTrue);
      }
    });

    test('el umbral es el mismo sw600 del resto de la app', () {
      expect(debeMostrarIndiceDeSecciones(anchoDisponible: 599, secciones: 5), isFalse);
      expect(debeMostrarIndiceDeSecciones(anchoDisponible: 600, secciones: 5), isTrue);
    });
  });

  group('cómo se pinta', () {
    Future<void> pintar(WidgetTester tester, {required int actual, ValueChanged<int>? onSel}) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: MenuSectionIndex(
            secciones: const ['Entrantes', 'Pizzas', 'Pastas', 'Carnes', 'Postres'],
            seccionActual: actual,
            onSeleccion: onSel ?? (_) {},
            encabezado: 'En esta carta',
          ),
        ),
      ));
      await tester.pump();
    }

    testWidgets('lista todas las secciones', (tester) async {
      await pintar(tester, actual: 0);

      expect(find.text('Entrantes'), findsOneWidget);
      expect(find.text('Postres'), findsOneWidget);
    });

    testWidgets('marca en negrita solo la que se está viendo', (tester) async {
      await pintar(tester, actual: 2);

      expect(tester.widget<Text>(find.text('Pastas')).style!.fontWeight, FontWeight.w700);
      expect(tester.widget<Text>(find.text('Pizzas')).style!.fontWeight, FontWeight.w400);
    });

    testWidgets('tocar una avisa con su índice', (tester) async {
      final tocados = <int>[];
      await pintar(tester, actual: 0, onSel: tocados.add);

      await tester.tap(find.text('Carnes'));
      await tester.pump();

      expect(tocados, [3]);
    });

    testWidgets('cada entrada cumple el suelo táctil de 44 px', (tester) async {
      await pintar(tester, actual: 0);

      for (final s in ['Entrantes', 'Postres']) {
        final alto = tester.getSize(find.ancestor(of: find.text(s), matching: find.byType(InkWell)).first).height;
        expect(alto, greaterThanOrEqualTo(44), reason: '«$s» se queda en $alto');
      }
    });

    testWidgets('un índice fuera de rango no marca ninguna', (tester) async {
      await pintar(tester, actual: -1);

      for (final s in ['Entrantes', 'Postres']) {
        expect(tester.widget<Text>(find.text(s)).style!.fontWeight, FontWeight.w400);
      }
    });
  });
}
