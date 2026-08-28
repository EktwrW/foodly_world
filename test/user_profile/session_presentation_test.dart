import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_world/data_models/user/active_session_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/user_profile/sessions/session_presentation.dart';

/// Cómo se nombra un dispositivo en la lista de sesiones.
///
/// LA DECISIÓN QUE PROTEGEN. El aparato devuelve códigos —`iPhone16,1`,
/// `SM-G991B`—, no nombres comerciales, y se decidió NO traducirlos: la tabla
/// que convierte código en "iPhone 15 Pro" envejece con cada teléfono que sale,
/// así que el primero nuevo aparecería como código hasta que alguien se acuerde
/// de actualizarla. El título dice lo que se sabe seguro y el código queda como
/// detalle.
///
/// Si alguien "mejora" esto metiendo una tabla de modelos, estos tests son lo
/// que le va a recordar por qué no estaba.
void main() {
  setUpAll(() async => S.load(const Locale('es')));

  ActiveSessionDM sesion({String? platform, String? model, String? os, String? app, DateTime? desde}) =>
      ActiveSessionDM(id: 's1', platform: platform, model: model, osVersion: os, appVersion: app, startedAt: desde);

  group('el título', () {
    test('un iPad no se llama iPhone', () {
      expect(sesion(platform: 'ios', model: 'iPad13,1').deviceLabel, 'iPad');
    });

    test('un iPhone sí', () {
      expect(sesion(platform: 'ios', model: 'iPhone16,1').deviceLabel, 'iPhone');
    });

    /// Apple puede estrenar un prefijo mañana. Cae a la plataforma, que sigue
    /// siendo cierta, en vez de adivinar.
    test('un modelo iOS desconocido cae a la plataforma, no a una suposición', () {
      expect(sesion(platform: 'ios', model: 'RealityDevice1,1').deviceLabel, 'iOS');
      expect(sesion(platform: 'ios').deviceLabel, 'iOS');
    });

    test('android no intenta ser Samsung ni nada parecido', () {
      expect(sesion(platform: 'android', model: 'SM-G991B').deviceLabel, 'Android');
    });

    /// En web el modelo ES el navegador, y llega en minúsculas.
    test('en web manda el navegador, con mayúscula', () {
      expect(sesion(platform: 'web', model: 'chrome').deviceLabel, 'Chrome');
    });

    test('sin plataforma se dice que no se sabe, no se inventa', () {
      expect(sesion().deviceLabel, S.current.activeSessionsUnknownDevice);
      expect(sesion().isIdentified, isFalse);
    });
  });

  group('la línea de detalle', () {
    test('junta modelo, sistema y versión de la app', () {
      final linea = sesion(platform: 'ios', model: 'iPhone16,1', os: '18.2', app: '2.0.2')
          .detailLine((d) => 'ignorada');

      expect(linea, 'iPhone16,1 · 18.2 · Foodly 2.0.2');
    });

    /// En web el modelo ya está en el título; repetirlo sería ruido.
    test('en web no repite el navegador que ya está arriba', () {
      final linea = sesion(platform: 'web', model: 'chrome', os: 'MacIntel', app: '1.9.4')
          .detailLine((d) => 'ignorada');

      expect(linea, 'MacIntel · Foodly 1.9.4');
    });

    test('lo que falte simplemente no aparece', () {
      expect(sesion(platform: 'android', model: 'SM-G991B').detailLine((d) => 'x'), 'SM-G991B');
    });

    /// Las sesiones anteriores a esta función no tienen NADA de dispositivo.
    /// Se dice la fecha de inicio, que es el único dato que existe, en vez de
    /// dejar la línea vacía y que parezca un fallo.
    test('una sesión heredada muestra su fecha de inicio', () {
      final linea = sesion(desde: DateTime(2026, 8, 12)).detailLine((d) => '12 de agosto');

      expect(linea, S.current.activeSessionsStartedOn('12 de agosto'));
    });

    test('una heredada sin fecha no inventa una línea', () {
      expect(sesion().detailLine((d) => 'x'), isEmpty);
    });
  });
}
