import 'package:flutter/widgets.dart';
import 'package:foodly_world/data_models/user/active_session_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart';

/// Cómo se nombra y se dibuja un dispositivo en la lista de sesiones.
///
/// NO SE TRADUCE EL MODELO A NOMBRE COMERCIAL. El aparato devuelve códigos
/// (`iPhone16,1`, `SM-G991B`), no "iPhone 15 Pro" ni "Galaxy S21", y la tabla
/// que hace esa conversión envejece con cada dispositivo que sale al mercado:
/// el primer teléfono nuevo aparecería como código hasta que alguien se
/// acuerde de actualizarla.
///
/// Así que el título dice lo que se sabe con certeza —la plataforma— y el
/// código queda como detalle. Para lo que sirve esta pantalla, que es
/// reconocer "esto es mío" o "esto no lo soy yo", mandan la plataforma y la
/// última actividad; el nombre comercial no añade nada.
extension SessionPresentation on ActiveSessionDM {
  /// El título de la tarjeta.
  String get deviceLabel {
    switch (platform) {
      case 'ios':
        // Único caso donde el modelo sí distingue algo que importa: un iPad no
        // es un iPhone, y el prefijo del código lo dice sin tabla ninguna.
        final m = model ?? '';
        if (m.startsWith('iPad')) return 'iPad';
        if (m.startsWith('iPhone')) return 'iPhone';

        return 'iOS';
      case 'android':
        return 'Android';
      case 'web':
        // En web el modelo ES el navegador (`chrome`, `safari`), así que se
        // usa como título; en minúsculas queda descuidado.
        final navegador = model;

        return (navegador == null || navegador.isEmpty)
            ? S.current.activeSessionsBrowser
            : navegador[0].toUpperCase() + navegador.substring(1);
      case 'desktop':
        return S.current.activeSessionsDesktop;
      default:
        return S.current.activeSessionsUnknownDevice;
    }
  }

  IconData get deviceIcon => switch (platform) {
        'ios' => Bootstrap.apple,
        'android' => Bootstrap.android2,
        'web' => Bootstrap.globe,
        'desktop' => Bootstrap.laptop,
        _ => Bootstrap.question_circle,
      };

  /// La línea de detalle: el código del modelo, el sistema y la versión de la
  /// app, con lo que falte simplemente ausente.
  ///
  /// Para una sesión anterior a esta función no hay nada de eso, así que se
  /// dice la fecha en que se abrió — el único dato que sí existe.
  String detailLine(String Function(DateTime) formatDate) {
    if (!isIdentified) {
      final desde = startedAt;

      return desde == null ? '' : S.current.activeSessionsStartedOn(formatDate(desde));
    }

    return [
      if (model != null && platform != 'web') model!,
      if (sistema != null) sistema!,
      if (appVersion != null) 'Foodly $appVersion',
    ].join(' · ');
  }

  /// La versión del sistema, con su nombre delante y sin la morralla.
  ///
  /// Se normaliza al PINTAR, no solo en el origen. Las sesiones abiertas antes
  /// de este arreglo guardaron la cadena entera que devuelve iOS —"Version
  /// 18.6 (Build 22G86)"— y siguen vivas hasta que cada aparato vuelva a
  /// pasar por el login o por un refresco. El número de build no le importa a
  /// nadie, y además hacía que la línea se partiera en dos y las tarjetas
  /// quedaran de distinto alto.
  ///
  /// El nombre del sistema se pone SOLO donde se sabe con certeza. En
  /// `desktop` no: puede ser macOS, Windows o Linux, y ponerle uno sería
  /// adivinar.
  String? get sistema {
    final crudo = osVersion;
    if (crudo == null || crudo.isEmpty) return null;

    final numero = RegExp(r'\d+(?:\.\d+)*').firstMatch(crudo)?.group(0) ?? crudo;
    final nombre = switch (platform) {
      'ios' => 'iOS',
      'android' => 'Android',
      _ => null,
    };

    return nombre == null ? numero : '$nombre $numero';
  }
}
