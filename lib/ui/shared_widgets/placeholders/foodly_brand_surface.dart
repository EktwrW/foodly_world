import 'package:flutter/material.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

/// El fondo de las tarjetas que enseñan una seccion vacia.
///
/// POR QUE NO ES UNA FOTO (2026-09-10). Se valoro generar imagenes de comida
/// con IA. Se descarto: un plato dentro de una tarjeta con forma de promocion
/// **se lee como una promocion de verdad**, el usuario la toca esperando una
/// oferta y no hay ninguna. Y el valor de Foodly es el contrario — las fotos
/// son las que suben los negocios. Un vacio que finge contenido es peor que uno
/// que no finge nada.
///
/// Tres cosas mas a favor de la superficie dibujada:
///
/// - No pesa: [FoodlyAssets.isoFoodlyWhite] ya viaja en el bundle. Cero assets
///   nuevos y cero decodificacion de video, que era el limite que puso Hector.
/// - El contraste del vidrio deja de ser una loteria. Sobre una foto cualquiera
///   el suelo del texto es el que toque; sobre un degradado que elegimos es
///   conocido y comprobable en test.
/// - Escala sin pixelarse, asi que sirve igual en telefono, tableta y web.
enum FoodlyBrandTint {
  /// Ciruela profundo. Para la tarjeta de favoritos.
  ciruela(Color(0xFF79005D), FoodlyThemes.titleOnGlass),

  /// Ciruela que se abre a verde. Para la de compartir y la del dueño.
  verde(Color(0xFF5E1A52), Color(0xFF14683C));

  const FoodlyBrandTint(this.desde, this.hasta);

  final Color desde;
  final Color hasta;
}

/// Degradado de marca con el iso de marca de agua y una trama diagonal fina.
class FoodlyBrandSurface extends StatelessWidget {
  final FoodlyBrandTint tint;

  const FoodlyBrandSurface({super.key, required this.tint});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [tint.desde, tint.hasta],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // El iso sangra por la esquina a proposito: se lee como textura de
          // marca, no como un logo puesto encima.
          Positioned(
            right: -34,
            bottom: -26,
            width: 210,
            child: Transform.rotate(
              angle: -.14,
              child: const Opacity(
                opacity: .14,
                child: Asset(FoodlyAssets.isoFoodlyWhite),
              ),
            ),
          ),
          const _TramaDiagonal(),
        ],
      ),
    );
  }
}

/// Rayado diagonal muy tenue. Le quita el aspecto de degradado plano sin
/// competir con el texto del vidrio.
class _TramaDiagonal extends StatelessWidget {
  const _TramaDiagonal();

  @override
  Widget build(BuildContext context) => CustomPaint(painter: _PintorDeTrama());
}

class _PintorDeTrama extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pincel = Paint()
      ..color = Colors.white.withValues(alpha: .05)
      ..strokeWidth = 2;

    // Diagonales cada 9 px, cubriendo el ancho mas el alto para que la
    // inclinacion no deje esquinas sin rayar.
    for (var x = -size.height; x < size.width; x += 9) {
      canvas.drawLine(Offset(x, size.height), Offset(x + size.height, 0), pincel);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
