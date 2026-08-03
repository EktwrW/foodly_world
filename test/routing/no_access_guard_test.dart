import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/core/core_exports.dart' show AppRoutes, GoRouterRedirector;
import 'package:foodly_world/core/routing/no_access_notice.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/no_access_snackbar_gate.dart';

/// Guard de módulo con módulo explícito + aterrizaje de /no-access:
/// - decisión pura del redirector (truth table),
/// - destino de /no-access según sesión (logueado JAMÁS al login),
/// - aviso one-shot + snackbar del gate.

void main() {
  setUpAll(() async => S.load(const Locale('es')));
  setUp(NoAccessNotice.consume); // arranca sin aviso pendiente

  group('accessRedirectPath (decisión pura del guard)', () {
    test('sin acceso → /no-access', () {
      expect(
        GoRouterRedirector.accessRedirectPath(
            guestBrowsable: false, pendingRestore: false, hasAccess: false),
        AppRoutes.noAccess.path,
      );
    });

    test('con acceso → pasa (null)', () {
      expect(
        GoRouterRedirector.accessRedirectPath(
            guestBrowsable: false, pendingRestore: false, hasAccess: true),
        isNull,
      );
    });

    test('bypass invitado browsable y restauración de sesión en curso → pasan '
        'aunque hasAccess sea false', () {
      expect(
        GoRouterRedirector.accessRedirectPath(
            guestBrowsable: true, pendingRestore: false, hasAccess: false),
        isNull,
      );
      expect(
        GoRouterRedirector.accessRedirectPath(
            guestBrowsable: false, pendingRestore: true, hasAccess: false),
        isNull,
      );
    });
  });

  group('noAccessLandingPath (destino de /no-access)', () {
    test('CON sesión → home del usuario, nunca el login', () {
      final path = GoRouterRedirector.noAccessLandingPath(isLoggedIn: true, userUuid: 'u-1');
      expect(path, '/main/home/u-1/foodly-main-page');
      expect(path, isNot(AppRoutes.login.path));
    });

    test('SIN sesión → login', () {
      expect(
        GoRouterRedirector.noAccessLandingPath(isLoggedIn: false, userUuid: ''),
        AppRoutes.login.path,
      );
    });
  });

  group('NoAccessNotice (aviso one-shot)', () {
    test('raise → consume true UNA vez; luego false', () {
      expect(NoAccessNotice.consume(), isFalse);

      NoAccessNotice.raise();
      expect(NoAccessNotice.consume(), isTrue);
      expect(NoAccessNotice.consume(), isFalse); // consumido, no repite
    });
  });

  group('NoAccessSnackbarGate', () {
    Widget host() => const MaterialApp(
          home: Scaffold(body: NoAccessSnackbarGate(child: Text('home'))),
        );

    testWidgets('con aviso pendiente muestra el snackbar y lo consume', (tester) async {
      NoAccessNotice.raise();

      await tester.pumpWidget(host());
      await tester.pumpAndSettle();

      expect(find.text('home'), findsOneWidget);
      expect(find.text(S.current.noAccessSection), findsOneWidget);
      // El aviso quedó consumido: un rebuild no lo repite.
      expect(NoAccessNotice.consume(), isFalse);

      // Drena el timer del snackbar (4s) para no dejar timers pendientes.
      await tester.pump(const Duration(seconds: 5));
      await tester.pumpAndSettle();
    });

    testWidgets('sin aviso es transparente: solo el child, sin snackbar', (tester) async {
      await tester.pumpWidget(host());
      await tester.pumpAndSettle();

      expect(find.text('home'), findsOneWidget);
      expect(find.text(S.current.noAccessSection), findsNothing);
    });
  });
}
