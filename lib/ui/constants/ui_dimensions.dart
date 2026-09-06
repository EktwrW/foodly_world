import 'package:flutter/widgets.dart';

class UIDimens {
  const UIDimens._();

  static const SCREEN_PADDING_MOB = 18.0;

  /// Ancho máximo de la columna de contenido en pantallas anchas.
  ///
  /// NO es un ancho de dispositivo, es un ancho de LECTURA. `DeviceSize
  /// .maxWidth` (1440) es el tope del build web y no sirve para tablet: todos
  /// los iPad miden entre 744 y 1024 px, o sea por debajo de ese número, así
  /// que ahí no recorta nada. Lo que hay que acotar en tablet no es la
  /// ventana, es la columna.
  ///
  /// 640 son unos 70 caracteres a 14 px, que es el rango donde una línea se
  /// sigue leyendo sin perder el renglón. Para formularios, texto largo y
  /// listas de una sola columna.
  static const CONTENT_MAX_WIDTH = 640.0;

  /// Igual que [CONTENT_MAX_WIDTH] pero para listas de tarjetas, que aguantan
  /// algo más de ancho porque cada tarjeta tiene su propio marco y el ojo no
  /// tiene que volver al principio de una línea.
  ///
  /// El tope de los dos está por debajo de 744, que es el iPad más estrecho
  /// (mini en vertical). Un techo por encima de eso no recortaría nada en el
  /// aparato donde más falta: el primer valor que puse fue 760 y el test lo
  /// cazó.
  static const LIST_MAX_WIDTH = 700.0;
  /// Ancho maximo de un dialogo.
  ///
  /// Un `Dialog` se estira hasta el ancho de pantalla menos su `insetPadding`:
  /// medido, 322 px en un iPhone 16 Pro pero **944 en un iPad de 1024**. El
  /// contenido esta pensado para el primero.
  ///
  /// 460 deja intactos todos los telefonos en vertical (el mas ancho ronda los
  /// 430) y muerde en tablet y en telefono apaisado, que es justo donde hace
  /// falta. Al contrario que las hojas inferiores, que Material 3 ya acota solo
  /// a 640, los dialogos no traen tope.
  static const DIALOG_MAX_WIDTH = 460.0;
  static const AVATAR_BIG_SIZE_MOB = Size(140, 140);
  static const AVATAR_DRAWER_BIG_MOB = Size(120, 120);
  static const AVATAR_DRAWER_SMALL_MOB = Size(55, 55);
}
