import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

/// Superficies de vidrio de Foodly.
///
/// POR QUÉ EXISTE. Hasta el rediseño de la card de promo (2026-09-04) cada
/// sitio que ponía contenido encima de una foto inventaba su propio
/// `BackdropFilter`: el carrusel de la home usaba sigma 6 con
/// `embossMaxWhiteColor` al 50%, el visor de imágenes sigma 6 con negro al
/// 45% y el sheet de detalle sigma 3 con `Colors.white38`. Tres blancos y
/// tres sigmas distintos para el mismo gesto visual. Acá viven las tres
/// recetas y nada más.
///
/// COSTE. `BackdropFilter` obliga a leer lo ya pintado, así que cada panel
/// es una capa de composición. Lo que se paga es el ÁREA difuminada, no la
/// cantidad de widgets: por eso una card de promo lleva UNA cinta grande y
/// botones de 44 px, y no un panel por dato. `ListView` ya envuelve cada
/// hijo en un `RepaintBoundary` (`addRepaintBoundaries` viene en `true`),
/// así que una card fuera de pantalla no vuelve a difuminar.
enum FoodlyGlassTone {
  /// Vidrio claro. La cinta con el título sobre la foto. El blanco alto es
  /// lo que permite escribir en ciruela encima de cualquier foto: sobre una
  /// foto negra el vidrio queda en #BDBDBD y el título sigue dando 8.3:1.
  light(fill: Color(0xBDFFFFFF), border: Color(0xBFFFFFFF), sigma: 11),

  /// Vidrio oscuro. Botones flotantes sobre la foto, con icono blanco.
  dark(fill: Color(0x571A0615), border: Color(0x4DFFFFFF), sigma: 6),

  /// Vidrio teñido de marca. El favorito, que es la acción que queremos que
  /// se distinga del resto de los controles flotantes.
  plum(fill: Color(0x8079005D), border: Color(0x6BFFFFFF), sigma: 6);

  const FoodlyGlassTone({required this.fill, required this.border, required this.sigma});

  final Color fill;
  final Color border;
  final double sigma;
}

/// Panel de vidrio: difumina lo que tiene detrás y pinta un relleno
/// translúcido con un borde de 1 px.
///
/// El `boxShadow` va fuera del `ClipRRect` a propósito: dentro se recortaría
/// contra el propio panel y no se vería.
class FoodlyGlassPanel extends StatelessWidget {
  final Widget child;
  final FoodlyGlassTone tone;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final List<BoxShadow> shadows;

  const FoodlyGlassPanel({
    super.key,
    required this.child,
    this.tone = FoodlyGlassTone.light,
    this.borderRadius = const BorderRadius.all(Radius.circular(18)),
    this.padding = EdgeInsets.zero,
    this.shadows = const [],
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(borderRadius: borderRadius, boxShadow: shadows),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: tone.sigma, sigmaY: tone.sigma),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: tone.fill,
              borderRadius: borderRadius,
              border: Border.all(color: tone.border),
            ),
            child: Padding(padding: padding, child: child),
          ),
        ),
      ),
    );
  }
}

/// Botón flotante de vidrio sobre una foto.
///
/// El lado por defecto son 44 px porque es el mínimo táctil: los controles
/// que reemplaza iban a 28 (el corazón de la card) y a 32 (el de expandir
/// del carrusel), los dos por debajo del umbral.
///
/// Con [child] el botón solo pone el vidrio y deja que el hijo traiga su
/// propio gesto — así se envuelve el `FavoriteButton` compartido sin
/// duplicar su lógica de favoritos.
class FoodlyGlassButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final FoodlyGlassTone tone;
  final double size;
  final double iconSize;
  final Widget? child;

  const FoodlyGlassButton({
    super.key,
    this.icon,
    this.onPressed,
    this.tooltip,
    this.tone = FoodlyGlassTone.dark,
    this.size = 44,
    this.iconSize = 19,
    this.child,
  }) : assert(icon != null || child != null, 'un botón de vidrio necesita un icono o un hijo');

  static const _radius = BorderRadius.all(Radius.circular(16));

  @override
  Widget build(BuildContext context) {
    final content = SizedBox.square(
      dimension: size,
      child: child != null
          ? Center(child: child)
          : Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: _radius,
                onTap: onPressed,
                child: Center(child: Icon(icon, size: iconSize, color: Colors.white)),
              ),
            ),
    );

    final panel = FoodlyGlassPanel(
      tone: tone,
      borderRadius: _radius,
      shadows: const [BoxShadow(color: Color(0x8C000000), blurRadius: 18, spreadRadius: -8, offset: Offset(0, 6))],
      child: content,
    );

    return tooltip == null ? panel : Tooltip(message: tooltip!, child: panel);
  }
}
