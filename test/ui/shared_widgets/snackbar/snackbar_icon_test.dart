import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart';

/// `SnackBarWdg.icon` deja pisar el ícono que le tocaría al tipo, para avisos
/// con identidad propia (invitar a la mesa) donde el ícono ES el mensaje.
///
/// Es un widget compartido por toda la app: lo que se protege acá es que los
/// avisos que ya existían —los que NO pasan `icon`— sigan pintando exacto lo
/// mismo que antes.
void main() {
  setUpAll(() async => S.load(const Locale('es')));

  Future<void> pump(WidgetTester tester, SnackBarWdg wdg) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () =>
                  ScaffoldMessenger.of(context).showSnackBar(wdg.getSnackBar(context)),
              child: const Text('go'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('go'));
    await tester.pumpAndSettle();
  }

  IconData iconOf(WidgetTester tester) => tester.widget<Icon>(find.byType(Icon)).icon!;

  testWidgets('sin icon: cada tipo conserva el suyo', (tester) async {
    await pump(tester, const SnackBarWdg(content: Text('x'), type: SnackBarType.success));
    expect(iconOf(tester), FontAwesome.circle_check_solid);
  });

  testWidgets('con icon: gana el explícito, sin tocar el color del tipo', (tester) async {
    await pump(tester, const SnackBarWdg(
      content: Text('x'),
      type: SnackBarType.success,
      icon: FontAwesome.user_plus_solid,
    ));
    expect(iconOf(tester), FontAwesome.user_plus_solid);
  });

  testWidgets('type action sigue sin ícono si no se pide uno', (tester) async {
    await pump(tester, const SnackBarWdg(content: Text('x'), type: SnackBarType.action));
    expect(find.byType(Icon), findsNothing);
  });

  testWidgets('type action CON icon lo muestra: pedirlo es decir "este sí"', (tester) async {
    await pump(tester, const SnackBarWdg(
      content: Text('x'),
      type: SnackBarType.action,
      icon: FontAwesome.user_plus_solid,
    ));
    expect(iconOf(tester), FontAwesome.user_plus_solid);
  });
}
