import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/dialogs/foodly_dialog.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/starting/widgets/social_consent_dialog.dart';

/// El techo de ancho de los diálogos.
///
/// EL PROBLEMA (2026-09-06). Un `Dialog` se estira hasta el ancho de pantalla
/// menos su `insetPadding`. Medido en este mismo test: 322 px en un iPhone 16
/// Pro, 944 en un iPad de 1024. Los 13 diálogos de Foodly están escritos para
/// el primer número.
///
/// Las hojas inferiores NO comparten el problema: Material 3 ya las acota a
/// 640. Ese caso también se mide aquí, para que quede constancia de por qué no
/// se tocaron.
void main() {
  setUpAll(() async => S.load(const Locale('es')));

  Future<double> anchoDelDialogo(WidgetTester tester, double anchoPantalla, Widget dialogo) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = Size(anchoPantalla, 1200);
    addTearDown(tester.view.reset);

    late BuildContext ctx;
    // Key nueva en cada llamada: sin ella el elemento MaterialApp se reutiliza
    // entre pumps, el Navigator conserva su estado y la ruta del diálogo
    // ANTERIOR sigue montada — `find.byType(Dialog).first` devolvía el de la
    // medición previa y el test pasaba por la razón equivocada.
    await tester.pumpWidget(MaterialApp(
      key: UniqueKey(),
      theme: FoodlyThemes.lightTheme(),
      locale: const Locale('es'),
      localizationsDelegates: const [S.delegate, ...GlobalMaterialLocalizations.delegates],
      supportedLocales: S.delegate.supportedLocales,
      home: Builder(builder: (c) {
        ctx = c;
        return const Scaffold(body: SizedBox());
      }),
    ));

    unawaited(showDialog<void>(context: ctx, builder: (_) => dialogo));
    await tester.pumpAndSettle();

    final material = find.descendant(of: find.byType(Dialog), matching: find.byType(Material)).first;

    return tester.getSize(material).width;
  }

  group('FoodlyDialog', () {
    testWidgets('en teléfono no hace nada: el diálogo es el de siempre', (tester) async {
      const contenido = SizedBox(height: 120, width: double.infinity);

      final conTecho = await anchoDelDialogo(tester, 402, const FoodlyDialog(child: contenido));
      final sinTecho = await anchoDelDialogo(tester, 402, const Dialog(child: contenido));

      expect(conTecho, sinTecho, reason: 'a 402 px el techo de 460 no debe morder');
    });

    testWidgets('en iPad acota, y sin el techo se iría a 944', (tester) async {
      const contenido = SizedBox(height: 120, width: double.infinity);

      final sinTecho = await anchoDelDialogo(tester, 1024, const Dialog(child: contenido));
      final conTecho = await anchoDelDialogo(tester, 1024, const FoodlyDialog(child: contenido));

      expect(sinTecho, 944, reason: 'esto es lo que pasaba antes');
      expect(conTecho, lessThanOrEqualTo(UIDimens.DIALOG_MAX_WIDTH));
    });

    /// Los 13 sitios migrados no pasan todos el mismo `insetPadding`. En
    /// teléfono ninguno debe moverse ni un píxel: la app está en producción.
    testWidgets('en teléfono NINGÚN insetPadding real cambia el ancho', (tester) async {
      const insets = <String, EdgeInsets>{
        'sin insetPadding': EdgeInsets.symmetric(horizontal: 40, vertical: 24),
        'SCREEN_PADDING_MOB (18)': EdgeInsets.symmetric(horizontal: 18),
        '16/32 (create_post)': EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        '13/24 (reservas)': EdgeInsets.symmetric(vertical: 24, horizontal: 13),
        '32/24 (menu_import)': EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        'all 18 (group_order)': EdgeInsets.all(18),
        'zero (DialogService)': EdgeInsets.zero,
      };

      for (final ancho in [375.0, 402.0, 440.0]) {
        for (final inset in insets.entries) {
          const contenido = SizedBox(height: 120, width: double.infinity);

          final antes = await anchoDelDialogo(
              tester, ancho, Dialog(insetPadding: inset.value, child: contenido));
          final ahora = await anchoDelDialogo(
              tester, ancho, FoodlyDialog(insetPadding: inset.value, child: contenido));

          expect(ahora, antes, reason: '${inset.key} cambia a $ancho px');
        }
      }
    });

    testWidgets('el techo está por encima del teléfono más ancho', (tester) async {
      expect(UIDimens.DIALOG_MAX_WIDTH, greaterThan(430),
          reason: 'si bajara de 430 empezaría a morder en teléfonos verticales');
    });
  });

  group('un diálogo de verdad, ya migrado', () {
    testWidgets('SocialConsentDialog se acota en iPad y no en teléfono', (tester) async {
      final enTelefono = await anchoDelDialogo(tester, 402, const SocialConsentDialog());
      final enTablet = await anchoDelDialogo(tester, 1024, const SocialConsentDialog());

      expect(enTelefono, 402 - UIDimens.SCREEN_PADDING_MOB * 2);
      expect(enTablet, lessThanOrEqualTo(UIDimens.DIALOG_MAX_WIDTH));
      expect(enTablet, lessThan(944));
    });
  });

  group('las hojas inferiores ya venían acotadas por Material 3', () {
    testWidgets('640 sin que nosotros hagamos nada', (tester) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(1024, 900);
      addTearDown(tester.view.reset);

      late BuildContext ctx;
      await tester.pumpWidget(MaterialApp(
        theme: FoodlyThemes.lightTheme(),
        home: Builder(builder: (c) {
          ctx = c;
          return const Scaffold(body: SizedBox());
        }),
      ));

      unawaited(showModalBottomSheet<void>(
        context: ctx,
        builder: (_) => const SizedBox(key: Key('hoja'), height: 200, width: double.infinity),
      ));
      await tester.pumpAndSettle();

      expect(tester.getSize(find.byKey(const Key('hoja'))).width, 640);
    });
  });
}
