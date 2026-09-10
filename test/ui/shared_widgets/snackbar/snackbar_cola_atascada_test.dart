import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';

/// El snackbar atascado, visto desde la COLA.
///
/// Complementa a `snackbar_dismiss_test.dart`, que ya vive al lado: aquel
/// comprueba que el aviso se RETIRA aunque muera el contexto que lo mostró.
/// Este comprueba la consecuencia que se notó de verdad — que el SIGUIENTE
/// aviso llegue a verse.
///
/// EL BUG (reportado el 2026-09-10 desde una tableta, pero es de toda la app).
/// Al cerrar una sesión activa no salía el aviso de éxito. La lista se
/// actualizaba bien. Y después, al volver al perfil y tocar el avatar,
/// aparecía DE GOLPE el aviso atrasado, se cerraba, y solo entonces salía el
/// snackbar del avatar.
///
/// La causa está en `handleDismiss`: espera a que termine el fundido de salida
/// (450 ms) y DESPUÉS comprueba `context.mounted` antes de llamar a
/// `hideCurrentSnackBar()`. Pero el contexto es el de la fila de la lista que
/// la propia acción acaba de borrar. Si la petición vuelve antes de que acabe
/// el fundido —o sea, con buena conexión— la fila ya no está montada, el
/// `hide` NO se ejecuta, y el snackbar de confirmación se queda **activo pero
/// invisible** durante su duración por defecto: `Duration(days: 1)`.
///
/// A partir de ahí todo lo que se muestre se encola detrás de un snackbar que
/// nadie ve. Eso es exactamente lo que destapaba el avatar del perfil, que
/// llama a `hideCurrentSnackBar()` antes de abrir el suyo.
///
/// No es un problema de la pantalla de sesiones: son diez los sitios que usan
/// `buttonBuilder`, y a cualquiera cuya acción borre el widget que abrió el
/// snackbar le pasa lo mismo.
void main() {
  setUpAll(() async => S.load(const Locale('es')));

  testWidgets('con la fila ya desmontada, el siguiente aviso SÍ se ve', (tester) async {
    await tester.pumpWidget(MaterialApp(
      locale: const Locale('es'),
      localizationsDelegates: const [S.delegate, ...GlobalMaterialLocalizations.delegates],
      supportedLocales: S.delegate.supportedLocales,
      home: const _Pantalla.porDefecto(),
    ));

    await tester.tap(find.text('Cerrar sesión'));
    await tester.pumpAndSettle();
    expect(find.text('¿Seguro?'), findsOneWidget, reason: 'la confirmación debería estar visible');

    // Confirmar: arranca el fundido de 450 ms y borra la fila enseguida,
    // que es lo que pasa con una petición rápida.
    await tester.tap(find.text('Sí, cerrar'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));
    expect(find.text('Sesión de prueba'), findsNothing, reason: 'la fila ya se borró');

    // Se deja pasar el fundido entero y bastante más.
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    expect(find.text('Sesión cerrada'), findsOneWidget,
        reason: 'el aviso de éxito se quedó encolado detrás de un snackbar invisible');
  });

  testWidgets('y la confirmación no se queda ocupando el messenger', (tester) async {
    await tester.pumpWidget(MaterialApp(
      locale: const Locale('es'),
      localizationsDelegates: const [S.delegate, ...GlobalMaterialLocalizations.delegates],
      supportedLocales: S.delegate.supportedLocales,
      home: const _Pantalla.porDefecto(),
    ));

    await tester.tap(find.text('Cerrar sesión'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sí, cerrar'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    expect(find.text('¿Seguro?'), findsNothing,
        reason: 'con Duration(days: 1) por defecto, un snackbar sin cerrar se queda un día');
  });
}

/// Pantalla mínima con la misma forma que la de sesiones activas.
class _Pantalla extends StatefulWidget {
  final Duration tardanzaDeRed;

  const _Pantalla.porDefecto() : tardanzaDeRed = const Duration(milliseconds: 30);

  @override
  State<_Pantalla> createState() => _PantallaState();
}

class _PantallaState extends State<_Pantalla> {
  var _sesiones = <String>['Sesión de prueba'];

  void _confirmar(BuildContext contextoDeLaFila) {
    final messenger = ScaffoldMessenger.of(contextoDeLaFila);

    final confirmacion = SnackBarWdg(
      type: SnackBarType.action,
      content: const Text('¿Seguro?'),
      buttonBuilder: (dismiss) => TextButton(
        onPressed: () async {
          final hecho = const SnackBarWdg(
            type: SnackBarType.success,
            content: Text('Sesión cerrada'),
          ).getSnackBar(contextoDeLaFila);

          dismiss();
          await Future<void>.delayed(widget.tardanzaDeRed);
          if (mounted) setState(() => _sesiones = []); // la fila desaparece
          messenger.showSnackBar(hecho);
        },
        child: const Text('Sí, cerrar'),
      ),
      // El contexto de la FILA, como en la pantalla real.
    ).getSnackBar(contextoDeLaFila);

    messenger.showSnackBar(confirmacion);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          for (final s in _sesiones)
            Builder(
              builder: (contextoDeLaFila) => Column(
                children: [
                  Text(s),
                  TextButton(
                    onPressed: () => _confirmar(contextoDeLaFila),
                    child: const Text('Cerrar sesión'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
