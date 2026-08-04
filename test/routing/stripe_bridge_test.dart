import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/core_exports.dart' show AppRoutes, GoRouterRedirector;
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/public_menu/stripe_bridge_page.dart';

/// Puente del onboarding de Stripe (bug e2e F4a: el botón "volver a Foodly"
/// aterrizaba en NotFound tanto en la app como en la pestaña web):
/// - decisión pura del destino en la app,
/// - página web amable para la pestaña huérfana (return y refresh).

void main() {
  setUpAll(() async => S.load(const Locale('es')));

  group('stripeBridgeLandingPath (app, decisión pura)', () {
    test('con negocio → panel "Órdenes en vivo" de ESE negocio', () {
      expect(
        GoRouterRedirector.stripeBridgeLandingPath(ownerBusinessUuid: 'biz-1'),
        '/main/biz-1/my-business/live-orders',
      );
    });

    test('sin sesión o sin negocio (cold start) → start', () {
      expect(
        GoRouterRedirector.stripeBridgeLandingPath(ownerBusinessUuid: null),
        AppRoutes.start.path,
      );
    });
  });

  group('StripeBridgePage (web)', () {
    testWidgets('return: onboarding completado, invita a volver a la app', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: StripeBridgePage(completed: true)));

      expect(find.text(S.current.stripeBridgeReturnTitle), findsOneWidget);
      expect(find.text(S.current.stripeBridgeReturnBody), findsOneWidget);
      expect(find.byIcon(Icons.check_circle_rounded), findsOneWidget);
    });

    testWidgets('refresh: flujo incompleto, indica retomar desde la app', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: StripeBridgePage(completed: false)));

      expect(find.text(S.current.stripeBridgeRefreshTitle), findsOneWidget);
      expect(find.text(S.current.stripeBridgeRefreshBody), findsOneWidget);
      expect(find.byIcon(Icons.hourglass_top_rounded), findsOneWidget);
    });
  });
}
