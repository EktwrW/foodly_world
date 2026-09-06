import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_icons_data.dart';
import 'package:foodly_world/ui/views/home/widgets/foodly_navigation_rail.dart';

/// La navegación principal en tablet apaisado.
///
/// La barra inferior tiene cuatro iconos y un FAB acoplado a la muesca que es
/// el quinto destino (la página principal). El rail traduce eso poniendo el FAB
/// en `leading` y dejando los cuatro iconos como destinos — así que el índice 4
/// NO tiene destino en la lista y `selectedIndex` tiene que ser null.
///
/// Lo importante de este fichero: la primera parte prueba que en TELÉFONO esto
/// no se enciende nunca. La app está en producción.
void main() {
  setUpAll(() async => S.load(const Locale('es')));

  group('cuándo se usa el rail', () {
    test('en teléfono NUNCA, ni de pie ni tumbado', () {
      for (final orientacion in Orientation.values) {
        expect(
          debeUsarNavigationRail(esTablet: false, esDesktop: false, orientacion: orientacion),
          isFalse,
          reason: 'un teléfono en $orientacion no debe cambiar de navegación',
        );
      }
    });

    test('en tablet solo apaisado', () {
      expect(
        debeUsarNavigationRail(esTablet: true, esDesktop: false, orientacion: Orientation.landscape),
        isTrue,
      );
      expect(
        debeUsarNavigationRail(esTablet: true, esDesktop: false, orientacion: Orientation.portrait),
        isFalse,
        reason: 'de pie sobra alto: la barra inferior sigue siendo lo correcto',
      );
    });

    test('en desktop apaisado también', () {
      expect(
        debeUsarNavigationRail(esTablet: false, esDesktop: true, orientacion: Orientation.landscape),
        isTrue,
      );
    });
  });

  group('el rail', () {
    Future<void> pintar(
      WidgetTester tester, {
      required int activeIndex,
      bool hasUnread = false,
      ValueChanged<int>? onTap,
    }) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(1180, 820);
      addTearDown(tester.view.reset);

      await tester.pumpWidget(MaterialApp(
        locale: const Locale('es'),
        localizationsDelegates: const [S.delegate, ...GlobalMaterialLocalizations.delegates],
        supportedLocales: S.delegate.supportedLocales,
        home: Scaffold(
          body: Row(
            children: [
              FoodlyNavigationRail(
                activeIndex: activeIndex,
                hasUnread: hasUnread,
                onTap: onTap ?? (_) {},
                leading: FloatingActionButton(
                  key: const Key('fab-iso'),
                  onPressed: () {},
                  child: const Icon(Icons.circle),
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ));
      await tester.pumpAndSettle();
    }

    testWidgets('lleva los cuatro iconos de la barra inferior, ni uno más', (tester) async {
      await pintar(tester, activeIndex: 0);

      expect(find.byType(NavigationRailDestination), findsNothing,
          reason: 'NavigationRail no monta las destinations como widgets propios');
      final rail = tester.widget<NavigationRail>(find.byType(NavigationRail));

      expect(rail.destinations.length, UIIconsData.bottomNavigationIcons.length);
      expect(rail.destinations.length, 4);
    });

    testWidgets('el FAB de la página principal va arriba, en leading', (tester) async {
      await pintar(tester, activeIndex: 0);

      expect(find.byKey(const Key('fab-iso')), findsOneWidget);

      final rail = tester.getRect(find.byType(NavigationRail));
      final fab = tester.getRect(find.byKey(const Key('fab-iso')));

      expect(fab.center.dx, closeTo(rail.center.dx, 1), reason: 'centrado en el rail');
      expect(fab.top, lessThan(rail.top + 120), reason: 'y arriba del todo');
    });

    testWidgets('el índice activo se marca en el destino que toca', (tester) async {
      for (var i = 0; i < 4; i++) {
        await pintar(tester, activeIndex: i);
        expect(tester.widget<NavigationRail>(find.byType(NavigationRail)).selectedIndex, i);
      }
    });

    testWidgets('con la página principal activa NO se marca ningún destino', (tester) async {
      await pintar(tester, activeIndex: FoodlyNavigationRail.paginaPrincipal);

      expect(
        tester.widget<NavigationRail>(find.byType(NavigationRail)).selectedIndex,
        isNull,
        reason: 'el destino 4 vive en el FAB, no en la lista: marcar otro sería mentir',
      );
    });

    testWidgets('tocar un destino avisa con el mismo índice que la barra inferior', (tester) async {
      final tocados = <int>[];
      await pintar(tester, activeIndex: 0, onTap: tocados.add);

      await tester.tap(find.text(S.current.notifications), warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(tocados, [3], reason: 'notificaciones es el índice 3, igual que abajo');
    });

    testWidgets('el globo de la campana sale solo si hay sin leer', (tester) async {
      await pintar(tester, activeIndex: 0);
      final sinGlobo = tester.widget<NavigationRail>(find.byType(NavigationRail));

      await pintar(tester, activeIndex: 0, hasUnread: true);
      final conGlobo = tester.widget<NavigationRail>(find.byType(NavigationRail));

      expect(conGlobo.destinations[3].icon, isNot(equals(sinGlobo.destinations[3].icon)));
    });
  });
}
