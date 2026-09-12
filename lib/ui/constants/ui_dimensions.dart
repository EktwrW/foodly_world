import 'package:flutter/widgets.dart';

class UIDimens {
  const UIDimens._();

  static const SCREEN_PADDING_MOB = 18.0;
  static const SCREEN_PADDING_TABLET = 40.0;
  static const CONTENT_MAX_WIDTH = 640.0;
  static const LIST_MAX_WIDTH = 700.0;
  static const DIALOG_MAX_WIDTH = 460.0;

  /// Techo de la cabecera del home. Mas ancho que [LIST_MAX_WIDTH] a proposito
  /// (2026-09-12): la cabecera no es una lista de tarjetas sino una banda —
  /// saludo, boton de drawer y buscador—, y con el techo de 700 los margenes
  /// laterales se comian demasiada pantalla en tableta.
  static const HOME_APP_BAR_MAX_WIDTH = 820.0;

  static const AVATAR_BIG_SIZE_MOB = Size(140, 140);
  static const AVATAR_DRAWER_BIG_MOB = Size(120, 120);
  static const AVATAR_DRAWER_SMALL_MOB = Size(55, 55);
}
