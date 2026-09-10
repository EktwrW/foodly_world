import 'package:flutter/material.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/shared_widgets/glass/foodly_glass.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

/// Ancho al que se acota una tarjeta de estado vacío.
///
/// Es el hueco de UNA promoción en el carrusel de la home (`.83` de un teléfono
/// de referencia de 400 px). Que sea ese número y no otro es el punto: el vacío
/// tiene la forma de lo que falta.
///
/// Sin este techo, en una tableta de 1280 px la tarjeta salía a 1264 × 225: una
/// tira de buzón. No se veía pequeña, se veía **aplastada**.
const double kAnchoDeTarjetaVacia = 334;

/// Una tarjeta de estado vacío con fondo de medio: el vídeo de siempre, o una
/// superficie de marca.
///
/// Unifica lo que eran dos implementaciones casi idénticas —el hueco de promos
/// y el de negocios nuevos— cada una con su alto escrito a mano.
///
/// Aquí el vidrio SÍ es vidrio de verdad, al contrario que en [FoodlyEmptyView]:
/// hay un vídeo o un degradado detrás que desenfocar. Por eso la cinta usa
/// [FoodlyGlassPanel] y no un panel teñido.
class FoodlyEmptyMediaCard extends StatelessWidget {
  /// El vídeo o la superficie de marca. Se pinta a sangre, detrás de todo.
  final Widget background;

  final String title;
  final String subtitle;

  /// Icono de la esquina superior izquierda. Dice de qué va la tarjeta antes de
  /// que se lea el título.
  final IconData? icon;

  /// La salida. Sin [onAction] no se pinta botón — un botón que no lleva a
  /// ninguna parte es peor que ninguno.
  final String? actionLabel;
  final VoidCallback? onAction;

  /// Alto. Lo da quien la coloca, normalmente la misma función que dimensiona
  /// el carrusel cargado, para que no haya salto al aparecer contenido.
  final double? height;

  final double maxWidth;

  const FoodlyEmptyMediaCard({
    super.key,
    required this.background,
    required this.title,
    required this.subtitle,
    this.icon,
    this.actionLabel,
    this.onAction,
    this.height,
    this.maxWidth = kAnchoDeTarjetaVacia,
  });

  static const _radio = BorderRadius.all(Radius.circular(20));

  @override
  Widget build(BuildContext context) {
    final hayAccion = onAction != null && (actionLabel?.isNotEmpty ?? false);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: SizedBox(
          height: height,
          child: DecoratedBox(
            decoration: const BoxDecoration(borderRadius: _radio, boxShadow: UIDecorations.CARD_SHADOW),
            child: ClipRRect(
              borderRadius: _radio,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  background,
                  if (icon != null)
                    Positioned(
                      left: 14,
                      top: 13,
                      child: Icon(icon, size: 26, color: Colors.white.withValues(alpha: .92)),
                    ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 12,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FractionallySizedBox(
                          widthFactor: .86,
                          child: FoodlyGlassPanel(
                            borderRadius: BorderRadius.circular(16),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  title,
                                  style: FoodlyTextStyles.promoTitleOnGlass.copyWith(fontSize: 15, height: 1.18),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  subtitle,
                                  style: FoodlyTextStyles.homeAppBarSmallSubtitle.copyWith(fontSize: 11.5, height: 1.35),
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (hayAccion) ...[
                          const SizedBox(height: 9),
                          _AccionDeVidrio(label: actionLabel!, onPressed: onAction!),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// El botón de reintentar, en el mismo vidrio que la cinta.
///
/// ANTES ERA NEUMÓRFICO (2026-09-10). Un `CustomNeumorphicButton` —relieve y
/// esquinas de 4 px— metido dentro de una composición de vidrio: dos lenguajes
/// peleándose en 200 píxeles. Y medía 32 px de alto, por debajo del suelo
/// táctil de 44 que usa el resto de la app.
class _AccionDeVidrio extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _AccionDeVidrio({required this.label, required this.onPressed});

  static const _radio = BorderRadius.all(Radius.circular(22));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: _radio,
        child: FoodlyGlassPanel(
          borderRadius: _radio,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 44,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.refresh_rounded, size: 16, color: FoodlyThemes.titleOnGlass),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: FoodlyTextStyles.promoTitleOnGlass.copyWith(fontSize: 12.5, height: 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
