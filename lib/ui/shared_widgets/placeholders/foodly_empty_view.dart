import 'package:flutter/material.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

/// Por qué está vacía la pantalla. Determina el color y, sobre todo, **qué
/// puede hacer el usuario a continuación**.
///
/// LA RAZÓN DE QUE ESTO EXISTA (2026-09-10). Foodly tenía 24 estados vacíos
/// escritos a mano, con nueve tratamientos de texto y cuatro tamaños de icono
/// distintos. Pero el problema de fondo no era el estilo: era que **tres cosas
/// distintas se pintaban igual**. Al usuario nuevo se le decía «aún no tienes
/// nada» tanto cuando de verdad no tenía nada, como cuando un filtro no
/// encajaba, como cuando la petición se había caído.
///
/// Alguien ya había llegado a esta conclusión una vez: el feed de comunidad
/// distingue por dentro entre «no hay publicaciones cerca» y «no sigues a
/// nadie», y lo explica en un comentario. No se propagó a ninguna otra
/// pantalla.
enum FoodlyEmptyIntent {
  /// No hay nada todavía. La salida es empezar algo.
  nuevo,

  /// Sí hay contenido, pero no con este criterio. La salida es cambiarlo.
  filtro,

  /// No se pudo cargar. La salida es reintentar — nunca dar ánimos.
  fallo;

  Color get _tinte => switch (this) {
        nuevo => FoodlyThemes.primaryFoodly,
        filtro => FoodlyThemes.secondaryFoodlyText,
        fallo => FoodlyThemes.failureOnSurface,
      };

  Color get _lavado => switch (this) {
        nuevo => FoodlyThemes.alternativeUnselectedLightColor,
        filtro => FoodlyThemes.promoDayOff,
        fallo => FoodlyThemes.failureWash,
      };
}

/// El estado vacío de Foodly: medallón, título, y —cuando hace falta—
/// subtítulo y una salida.
///
/// El lenguaje de vidrio del rediseño de promociones NO se hereda literalmente
/// aquí, y es a propósito: un `BackdropFilter` necesita algo detrás que
/// desenfocar, y un estado vacío se pinta sobre fondo plano, así que el vidrio
/// sería un panel teñido y nada más. Lo que sí se hereda es la paleta, la
/// tipografía, los radios y el suelo táctil de 44 px.
class FoodlyEmptyView extends StatelessWidget {
  /// Por qué está vacío. Ver [FoodlyEmptyIntent].
  final FoodlyEmptyIntent intent;

  final String title;

  /// Qué puede hacer el usuario, en una frase. Opcional mientras el copy no
  /// esté aprobado para cada pantalla.
  final String? subtitle;

  /// Tope de líneas del subtítulo. Nulo —sin tope— para el copy propio, que es
  /// corto por construcción. Lo necesita quien pinta un mensaje que viene del
  /// SERVIDOR y puede tener cualquier longitud.
  final int? subtitleMaxLines;

  /// Icono del medallón. Se pinta a 40 px; si se pasa un [Widget] propio
  /// (un `Asset`, por ejemplo) se respeta tal cual.
  final Widget? icon;

  /// La salida. Sin [onAction] no se pinta botón: es preferible un estado
  /// vacío sin salida a un botón que no lleva a ninguna parte.
  final String? actionLabel;
  final VoidCallback? onAction;

  const FoodlyEmptyView({
    super.key,
    required this.title,
    this.intent = FoodlyEmptyIntent.nuevo,
    this.subtitle,
    this.subtitleMaxLines,
    this.icon,
    this.actionLabel,
    this.onAction,
  });

  static const _medallon = 96.0;
  static const _icono = 40.0;

  /// Suelo táctil, el mismo que los botones de vidrio de la card de promo.
  static const alturaDeAccion = 44.0;

  IconData get _iconoPorDefecto => switch (intent) {
        FoodlyEmptyIntent.nuevo => Icons.inbox_outlined,
        FoodlyEmptyIntent.filtro => Icons.filter_alt_outlined,
        FoodlyEmptyIntent.fallo => Icons.wifi_off_outlined,
      };

  @override
  Widget build(BuildContext context) {
    final hayAccion = onAction != null && (actionLabel?.isNotEmpty ?? false);

    return Center(
      child: Padding(
        // Fijo, NO `screenWidth * .1`: ese porcentaje daba 40 px en un iPhone
        // y 102 en un iPad, dentro de un bloque que mide lo mismo en los dos.
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: _medallon,
                  height: _medallon,
                  decoration: BoxDecoration(color: intent._lavado, shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: icon ?? Icon(_iconoPorDefecto, size: _icono, color: intent._tinte),
                ),
                const SizedBox(height: 20),
                Text(title, style: FoodlyTextStyles.emptyTitle, textAlign: TextAlign.center),
                if (subtitle?.isNotEmpty ?? false) ...[
                  const SizedBox(height: 8),
                  Text(
                    subtitle!,
                    style: FoodlyTextStyles.emptySubtitle,
                    textAlign: TextAlign.center,
                    maxLines: subtitleMaxLines,
                    overflow: subtitleMaxLines == null ? null : TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
            if (hayAccion) ...[
              const SizedBox(height: 24),
              _AccionDeVacio(intent: intent, label: actionLabel!, onPressed: onAction!),
            ],
          ],
        ),
      ),
    );
  }
}

/// La salida, con la forma que corresponde a cada intención: empezar algo pesa
/// más que quitar un filtro, y reintentar tiene que leerse como recuperación,
/// no como una invitación.
class _AccionDeVacio extends StatelessWidget {
  final FoodlyEmptyIntent intent;
  final String label;
  final VoidCallback onPressed;

  const _AccionDeVacio({required this.intent, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final esRelleno = intent == FoodlyEmptyIntent.nuevo;
    final esTexto = intent == FoodlyEmptyIntent.filtro;
    final color = intent._tinte;

    return Material(
      color: esRelleno ? color : Colors.transparent,
      borderRadius: BorderRadius.circular(alturaDeAccionMedia),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(alturaDeAccionMedia),
        child: Container(
          constraints: const BoxConstraints(minHeight: FoodlyEmptyView.alturaDeAccion),
          padding: EdgeInsets.symmetric(horizontal: esTexto ? 20 : 26),
          decoration: esRelleno || esTexto
              ? null
              : BoxDecoration(
                  border: Border.all(color: color, width: 1.5),
                  borderRadius: BorderRadius.circular(alturaDeAccionMedia),
                ),
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (intent == FoodlyEmptyIntent.fallo) ...[
                Icon(Icons.refresh_rounded, size: 16, color: color),
                const SizedBox(width: 8),
              ],
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: esRelleno ? Colors.white : color,
                  decoration: esTexto ? TextDecoration.underline : null,
                  decorationColor: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static const alturaDeAccionMedia = FoodlyEmptyView.alturaDeAccion / 2;
}
