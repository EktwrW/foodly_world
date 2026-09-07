import 'dart:ui' show Size;

import 'package:flutter/services.dart' show DeviceOrientation;

/// Lado corto (en px logicos) a partir del cual tratamos la pantalla como
/// tableta. Es el `sw600dp` de Android, el mismo umbral que usa el sistema para
/// elegir recursos de pantalla grande.
const double kLadoCortoDeTableta = 600;

/// Las orientaciones que la app permite, segun el tamaño de la pantalla.
///
/// POR QUE EXISTE (2026-09-07). `main()` bloqueaba la app en vertical para
/// todo el mundo:
///
/// ```dart
/// await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
/// ```
///
/// En un telefono eso esta bien y se queda igual. En una tableta significaba
/// que no giraba, que es raro de usar y que Play lo señala en sus revisiones de
/// pantalla grande — y ademas dejaba el `NavigationRail` de la home, que solo
/// aparece en apaisado, como codigo inalcanzable.
///
/// Se mide el LADO CORTO y no el ancho porque la app puede arrancar ya girada:
/// una tableta apaisada de 1133x744 tiene el lado corto en 744 y sigue siendo
/// una tableta.
///
/// Ante la duda, vertical. Si el tamaño no viene o es absurdo —puede pasar en
/// el arranque en frio antes de que la vista tenga medidas— se devuelve el
/// comportamiento de siempre en vez de arriesgar un giro no probado.
List<DeviceOrientation> orientacionesPermitidas(Size? tamanoLogico) {
  const soloVertical = [DeviceOrientation.portraitUp];

  if (tamanoLogico == null) return soloVertical;
  if (tamanoLogico.width <= 0 || tamanoLogico.height <= 0) return soloVertical;

  return tamanoLogico.shortestSide >= kLadoCortoDeTableta ? DeviceOrientation.values : soloVertical;
}
