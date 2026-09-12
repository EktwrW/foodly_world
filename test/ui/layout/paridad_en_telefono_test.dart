import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/ui/shared_widgets/layout/content_column.dart';

/// ¿El techo de ancho cambia ALGO en un teléfono?
///
/// La app está en producción, así que la pregunta no es retórica. El techo
/// (640/700) no muerde por debajo de 744, pero `ContentColumn` es un `Align`, y
/// un `Align` le pasa al hijo constraints SUELTAS donde el `Scaffold` daba
/// ancho AJUSTADO. Eso puede cambiar el tamaño de una `Column` aunque el ancho
/// disponible sea idéntico.
///
/// Estos tests pintan cada forma dos veces —tal cual y envuelta— a anchos de
/// teléfono reales, y comparan el rectángulo de TODOS los descendientes que
/// llevan marca. Si algo se mueve un píxel, sale en rojo.
void main() {
  const anchosDeTelefono = <String, double>{
    'iPhone SE': 375,
    'iPhone 16 Pro': 402,
    'iPhone 16 Pro Max': 440,
  };

  /// Rectángulos de cada widget marcado con una Key('m:...').
  Future<Map<String, Rect>> geometria(WidgetTester tester, double ancho, Widget cuerpo) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = Size(ancho, 900);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(MaterialApp(key: UniqueKey(), home: Scaffold(body: cuerpo)));
    await tester.pump();

    final resultado = <String, Rect>{};
    for (final elemento in find.byWidgetPredicate((w) => w.key is ValueKey<String>).evaluate()) {
      final clave = (elemento.widget.key! as ValueKey<String>).value;
      resultado[clave] = tester.getRect(find.byKey(elemento.widget.key!));
    }

    return resultado;
  }

  Future<void> comparar(
    WidgetTester tester,
    String nombre,
    Widget Function() construir,
    Widget Function(Widget) envolver,
  ) async {
    for (final entrada in anchosDeTelefono.entries) {
      final sinTecho = await geometria(tester, entrada.value, construir());
      final conTecho = await geometria(tester, entrada.value, envolver(construir()));

      expect(sinTecho, isNotEmpty, reason: 'la forma "$nombre" no dejó nada que medir');
      expect(conTecho, sinTecho, reason: '"$nombre" se mueve en ${entrada.key} (${entrada.value} px)');
    }
  }

  Widget marca(String id, {double? alto, double? ancho}) =>
      SizedBox(key: ValueKey('m:$id'), height: alto ?? 30, width: ancho, child: const Placeholder());

  // ---------------------------------------------------------------------------
  // Las formas REALES que quedaron envueltas en las 16 pantallas del grupo A.
  // ---------------------------------------------------------------------------

  testWidgets('Column suelta y centrada (not_found)', (tester) async {
    await comparar(
      tester,
      'Column centrada',
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [marca('logo', ancho: 250), marca('texto'), marca('boton', ancho: 100)],
      ),
      (hijo) => ContentColumn(alignment: Alignment.center, child: hijo),
    );
  });

  testWidgets('Column con crossAxisAlignment.stretch (join_by_link)', (tester) async {
    await comparar(
      tester,
      'Column stretch',
      () => Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [marca('icono'), marca('titulo'), marca('boton')],
          ),
        ),
      ),
      (hijo) => ContentColumn(alignment: Alignment.center, child: hijo),
    );
  });

  testWidgets('Column con Expanded + pie (about_page)', (tester) async {
    await comparar(
      tester,
      'Column con Expanded',
      () => Column(
        children: [
          Expanded(child: ListView(children: [marca('fila1'), marca('fila2')])),
          marca('pie'),
        ],
      ),
      (hijo) => ContentColumn(child: hijo),
    );
  });

  testWidgets('ListView.separated (terms, privacy, blocked_users)', (tester) async {
    await comparar(
      tester,
      'ListView.separated',
      () => ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 48),
        itemCount: 3,
        separatorBuilder: (_, __) => const Divider(height: 32),
        itemBuilder: (_, i) => marca('item$i'),
      ),
      (hijo) => ContentColumn(child: hijo),
    );
  });

  testWidgets('SafeArea con Column y Expanded (my_reservations, manage_reservations)', (tester) async {
    await comparar(
      tester,
      'SafeArea + Expanded',
      () => SafeArea(
        child: Column(
          children: [
            marca('filtro'),
            Expanded(child: ListView(children: [marca('reserva')]))
          ],
        ),
      ),
      (hijo) => ContentColumn.list(child: hijo),
    );
  });

  testWidgets('Form con SingleChildScrollView (sign_up_business)', (tester) async {
    await comparar(
      tester,
      'Form + scroll',
      () => Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(children: [marca('campo1'), marca('campo2'), marca('enviar')]),
        ),
      ),
      (hijo) => ContentColumn(child: hijo),
    );
  });

  /// Aquí el techo va POR DENTRO del sliver, que es como está puesto en
  /// user_profile y sign_up_user: la portada del `SliverAppBar` tiene que
  /// seguir a sangre, así que solo se acota el contenido.
  testWidgets('dentro de un sliver (user_profile, sign_up_user)', (tester) async {
    Widget contenido() =>
        Column(children: [marca('seccion1'), marca('seccion2')]).paddingOnly(right: 18, left: 18, top: 36, bottom: 60);

    Widget scroll(Widget dentroDelSliver) => CustomScrollView(
          slivers: [SliverToBoxAdapter(child: dentroDelSliver)],
        );

    for (final entrada in anchosDeTelefono.entries) {
      final sinTecho = await geometria(tester, entrada.value, scroll(contenido()));
      final conTecho = await geometria(tester, entrada.value, scroll(ContentColumn(child: contenido())));

      expect(sinTecho, isNotEmpty);
      expect(conTecho, sinTecho, reason: 'el sliver se mueve en ${entrada.key} (${entrada.value} px)');
    }
  });

  // ---------------------------------------------------------------------------
  // Los cambios que NO son un simple envoltorio.
  // ---------------------------------------------------------------------------

  /// El mapa del alta de negocio pasó de `width: context.screenWidth - 36` a
  /// `Expanded`. Los 36 eran el padding lateral del scroll (18+18), así que en
  /// teléfono tiene que dar exactamente lo mismo — pero eso hay que medirlo, no
  /// suponerlo.
  testWidgets('el mapa del alta de negocio: Expanded da lo mismo que screenWidth - 36', (tester) async {
    Widget pagina(Widget mapa) => SingleChildScrollView(
          padding: const EdgeInsets.only(right: 18, left: 18, top: 12, bottom: 36),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [mapa]),
              marca('siguienteCampo'),
            ],
          ),
        );

    for (final entrada in anchosDeTelefono.entries) {
      final antes = await geometria(
        tester,
        entrada.value,
        pagina(SizedBox(height: 166, width: entrada.value - 36, child: marca('mapa', alto: 166))),
      );
      final ahora = await geometria(
        tester,
        entrada.value,
        pagina(Expanded(child: SizedBox(height: 166, child: marca('mapa', alto: 166)))),
      );

      expect(antes, isNotEmpty);
      expect(ahora, antes, reason: 'el mapa cambia de sitio en ${entrada.key}');
    }
  });

  /// `saved_promotions` es la forma más enrevesada que quedó envuelta: un
  /// `CustomScrollView` cuyo sliver lleva un `SizedBox.fromSize` con el ancho de
  /// pantalla dentro.
  testWidgets('saved_promotions: CustomScrollView con SizedBox de ancho de pantalla', (tester) async {
    Widget cuerpo(double ancho) => CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox.fromSize(
                size: Size(ancho, 400),
                child: PageView(children: [marca('promo1', alto: 200)]),
              ),
            ),
          ],
        );

    for (final entrada in anchosDeTelefono.entries) {
      final sinTecho = await geometria(tester, entrada.value, cuerpo(entrada.value));
      final conTecho = await geometria(tester, entrada.value, ContentColumn.list(child: cuerpo(entrada.value)));

      expect(sinTecho, isNotEmpty);
      expect(conTecho, sinTecho, reason: 'saved_promotions se mueve en ${entrada.key}');
    }
  });
}

extension on Widget {
  Widget paddingOnly({double right = 0, double left = 0, double top = 0, double bottom = 0}) =>
      Padding(padding: EdgeInsets.only(right: right, left: left, top: top, bottom: bottom), child: this);
}
