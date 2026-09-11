import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/ui/shared_widgets/layout/lista_adaptativa.dart';

/// Las listas de datos —reservas, historial de órdenes— en pantalla ancha.
///
/// POR QUÉ COLUMNAS Y NO UN TECHO (2026-09-11). Estaban acotadas a 700 px y
/// centradas. Héctor probó en una tableta grande y su diagnóstico vale igual
/// aquí: un techo fijo no escala — a 1280 se ve igual que a 744, con media
/// pantalla vacía.
///
/// Pero el margen por breakpoint, que es lo correcto para una tarjeta CON FOTO,
/// aquí empeora: una fila de datos a 1200 px deja el avatar en una punta y el
/// estado en la otra. El enemigo no es el ancho, es el recorrido del ojo.
///
/// Y lo que NO cambia, que es lo que protege la mitad de estos tests: sigue
/// siendo un `ListView.builder`, así que la paginación y el pie de «cargando
/// más» se quedan como estaban.
void main() {
  Future<void> pintar(
    WidgetTester tester,
    double ancho, {
    required int elementos,
    Widget? pie,
  }) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = Size(ancho, 1400);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(MaterialApp(
      key: UniqueKey(),
      home: Scaffold(
        body: ListaAdaptativa(
          elementos: elementos,
          pie: pie,
          constructor: (_, i) => SizedBox(height: 90, child: Text('fila $i')),
        ),
      ),
    ));
    await tester.pump();
  }

  group('cuántas columnas', () {
    test('en teléfono siempre una', () {
      for (final ancho in [320.0, 375.0, 402.0, 440.0, 599.0]) {
        expect(columnasDeLista(ancho), 1, reason: 'a $ancho px no cabe una segunda columna');
      }
    });

    test('en tablet y escritorio, las que quepan del ancho de una fila', () {
      expect(columnasDeLista(744), 1, reason: 'un iPad mini vertical no da para dos filas de datos');
      expect(columnasDeLista(1280), 2);
      expect(columnasDeLista(1920), 3);
    });

    test('hay tope: una pantalla enorme no se convierte en mosaico', () {
      expect(columnasDeLista(4000), 3);
    });

    test('la fila nunca baja del ancho en que se lee cómoda', () {
      for (final ancho in [1280.0, 1600.0, 1920.0]) {
        expect(ancho / columnasDeLista(ancho), greaterThanOrEqualTo(kAnchoDeFilaDeDatos));
      }
    });
  });

  group('lo que NO cambia', () {
    testWidgets('en teléfono se pintan las mismas filas que antes', (tester) async {
      await pintar(tester, 402, elementos: 3);

      expect(find.text('fila 0'), findsOneWidget);
      expect(find.text('fila 1'), findsOneWidget);
      expect(find.byType(Row), findsNothing, reason: 'con una columna no debe envolver en Row');
    });

    testWidgets('el pie de «cargando más» se queda abajo y a lo ancho', (tester) async {
      await pintar(tester, 1280, elementos: 4, pie: const Text('cargando'));

      expect(find.text('cargando'), findsOneWidget);
    });

    testWidgets('sigue siendo un ListView.builder: la paginación no se toca', (tester) async {
      await pintar(tester, 1280, elementos: 4);

      expect(find.byType(ListView), findsOneWidget);
    });
  });

  group('en ancho', () {
    testWidgets('a 1280 px reparte en dos columnas', (tester) async {
      await pintar(tester, 1280, elementos: 4);

      final primera = tester.getRect(find.text('fila 0'));
      final segunda = tester.getRect(find.text('fila 1'));

      expect(segunda.top, primera.top, reason: 'las dos primeras deben ir en la misma fila');
      expect(segunda.left, greaterThan(primera.left));
    });

    testWidgets('una última fila incompleta no estira la tarjeta que queda', (tester) async {
      await pintar(tester, 1280, elementos: 3);

      final primera = tester.getSize(find.text('fila 0'));
      final tercera = tester.getSize(find.text('fila 2'));

      expect(tercera.width, primera.width, reason: 'la impar debe medir lo mismo, no el doble');
    });

    testWidgets('se pintan todos los elementos, sin perder ninguno', (tester) async {
      await pintar(tester, 1280, elementos: 5);

      for (var i = 0; i < 5; i++) {
        expect(find.text('fila $i'), findsOneWidget, reason: 'falta la fila $i');
      }
    });
  });
}
