import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';

/// El snackbar se quedaba comiéndose los taps tras pulsar «cerrar» (2026-09-07).
///
/// Medido en el dispositivo con una sonda, no deducido:
///
/// ```
/// [1301 ms] handleDismiss: ENTRA (botón de cerrar)
/// [1747 ms] animación de salida tardó 446ms
/// [1747 ms] context.mounted = false
/// [1748 ms] NO se oculta — el contexto murió
/// [8153 ms] ← el chip por fin responde
/// ```
///
/// **1301 + 7000 = 8301**: el chip no se destrabó porque el cierre funcionara,
/// sino porque el snackbar EXPIRÓ SOLO a los 7 s. Entre medias seguía montado
/// y, aunque `FadeOutDown` lo había dejado invisible, un `Opacity` a 0 en
/// Flutter **no pinta pero sigue capturando taps**.
///
/// La causa: `handleDismiss()` esperaba 446 ms de animación y **sólo después**
/// llamaba a `ScaffoldMessenger.of(context)`, detrás de un `if (context.mounted)`.
/// Quien lo mostraba era el botón del FAB del menú, que se desmonta a sí mismo
/// (`_closeFAB()`) en el mismo `onPressed` — así que para cuando el usuario
/// pulsaba «cerrar», ese contexto ya no existía.
///
/// La asimetría que lo delató: cerrarlo ARRASTRANDO funcionaba al instante
/// —eso lo retira Flutter sin pasar por `handleDismiss`— y sólo el BOTÓN dejaba
/// la app pegada.
/// Avanza [ms] en frames de 50 ms.
///
/// Un solo `pump(Duration(...))` largo adelanta el reloj pero pinta UN frame,
/// y las animaciones no llegan a correr. Y `pumpAndSettle()` no vale acá: se
/// comería los 7 s de duración del aviso y el test pasaría por CADUCIDAD, que
/// es justo el bug — verde por la razón equivocada.
Future<void> avanzar(WidgetTester tester, int ms) async {
  for (var restante = ms; restante > 0; restante -= 50) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

void main() {
  setUpAll(() async => S.load(const Locale('es')));

  /// Muestra el aviso desde el contexto de un hijo que se desmonta acto
  /// seguido, que es exactamente lo que hace el botón del FAB del menú.
  Future<void> mostrarDesdeUnContextoQueMuere(WidgetTester tester) async {
    final vivo = ValueNotifier<bool>(true);
    addTearDown(vivo.dispose);

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [S.delegate],
        supportedLocales: S.delegate.supportedLocales,
        home: Scaffold(
          body: ValueListenableBuilder<bool>(
            valueListenable: vivo,
            builder: (context, sigueVivo, _) => sigueVivo
                ? Builder(
                    builder: (hijoContext) => ElevatedButton(
                      onPressed: () {
                        final barra = const SnackBarWdg(
                          content: Text('aviso del mínimo'),
                          buttonText: 'Cerrar',
                          duration: Duration(seconds: 7),
                        );
                        ScaffoldMessenger.of(hijoContext).showSnackBar(barra.getSnackBar(hijoContext));
                        vivo.value = false;
                      },
                      child: const Text('crear'),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );

    await tester.tap(find.text('crear'));
    await tester.pump(); // muestra y desmonta
    await avanzar(tester, 900); // entrada del snackbar
  }

  testWidgets(
    'cerrar con el botón retira el aviso aunque el contexto que lo mostró ya no exista',
    (tester) async {
      await mostrarDesdeUnContextoQueMuere(tester);
      expect(find.byType(SnackBar), findsOneWidget, reason: 'el aviso no llegó a mostrarse');

      await tester.tap(find.text('Cerrar'));
      // 1,5 s: de sobra para los 446 ms de la animación de salida y la del
      // propio SnackBar, y MUY por debajo de los 7 s de duración.
      await avanzar(tester, 1500);

      expect(
        find.byType(SnackBar),
        findsNothing,
        reason: 'El aviso sigue montado tras pulsar cerrar: se queda invisible '
            'comiéndose los taps hasta que expire su duración.',
      );
    },
  );

  testWidgets('el contenido del aviso deja de estar en el árbol al cerrarlo', (tester) async {
    await mostrarDesdeUnContextoQueMuere(tester);

    await tester.tap(find.text('Cerrar'));
    await avanzar(tester, 1500);

    expect(
      find.text('aviso del mínimo'),
      findsNothing,
      reason: 'El contenido sigue en el árbol, así que sigue robando punteros.',
    );
  });
}
