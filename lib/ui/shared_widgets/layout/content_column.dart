import 'package:flutter/widgets.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';

/// Centra el contenido y le pone un techo de ancho, para que no se estire en
/// pantallas anchas.
///
/// POR QUÉ EXISTE (2026-09-05). Foodly ya tenía `responsive_framework`
/// cableado y una extensión completa de `isTablet` / `isDesktop`, pero no las
/// usaba ninguna de las 38 pantallas. En un iPad eso no se ve como algo roto:
/// se ve como que todo se estira. Líneas de texto de 1024 px, formularios de
/// borde a borde, botones de un metro.
///
/// Este widget es el arreglo del caso más común — el de las pantallas que en
/// tablet no necesitan otra composición, solo dejar de estirarse. Debajo del
/// techo no hace nada, así que en móvil es transparente: mismo layout, mismo
/// resultado, cero condicionales por dispositivo repartidos por la app.
///
/// Para lo que NO sirve: contenido a sangre —cabeceras con degradado,
/// carruseles, portadas— que sí debe ocupar todo el ancho. Ahí el techo va por
/// dentro, solo alrededor del texto.
class ContentColumn extends StatelessWidget {
  final Widget child;

  /// Techo de ancho. Por defecto [UIDimens.CONTENT_MAX_WIDTH], pensado para
  /// texto y formularios; las listas de tarjetas suelen querer
  /// [UIDimens.LIST_MAX_WIDTH].
  final double maxWidth;

  /// Alineación cuando sobra ancho. Centrado por defecto.
  final AlignmentGeometry alignment;

  const ContentColumn({
    super.key,
    required this.child,
    this.maxWidth = UIDimens.CONTENT_MAX_WIDTH,
    this.alignment = Alignment.topCenter,
  });

  /// Variante para listas de tarjetas.
  const ContentColumn.list({
    super.key,
    required this.child,
    this.alignment = Alignment.topCenter,
  }) : maxWidth = UIDimens.LIST_MAX_WIDTH;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
