import 'package:flutter/material.dart';
import 'package:foodly_world/core/utils/soporte_de_orientacion.dart' show kLadoCortoDeTableta;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

/// Minimo de secciones para que el indice valga la pena.
///
/// Con una o dos, el panel lateral seria un adorno que roba 168 px a los
/// platos. El indice existe para acortar un recorrido largo; si el recorrido es
/// corto, no hay nada que acortar.
const int kMinimoDeSeccionesParaIndice = 3;

/// Si toca pintar el indice de secciones al lado de la carta.
///
/// POR QUE ESTE ENFOQUE Y NO UN MAESTRO-DETALLE (2026-09-10). En tableta el
/// menu era una columna unica larguisima: para llegar a «Postres» hay que bajar
/// por toda la carta, y encima media pantalla vacia.
///
/// Se valoro partirlo en dos paneles —secciones a la izquierda, platos a la
/// derecha— y se descarto: **una carta se navega mirando, no buscando**. Al
/// enseñar solo una seccion se pierde el descubrimiento de lo que hay al lado,
/// que es lo que vende platos. El indice añade el salto rapido sin quitar el
/// hojear, y deja el panel de platos exactamente como esta hoy.
///
/// El umbral es el mismo `sw600` que usa el resto de la app, asi que sirve
/// igual en tableta y en el build web de escritorio.
bool debeMostrarIndiceDeSecciones({required double anchoDisponible, required int secciones}) =>
    anchoDisponible >= kLadoCortoDeTableta && secciones >= kMinimoDeSeccionesParaIndice;

/// El indice de secciones de una carta: dice donde estas y deja saltar.
class MenuSectionIndex extends StatelessWidget {
  final List<String> secciones;

  /// La seccion que se esta viendo. Fuera de rango = ninguna marcada.
  final int seccionActual;

  final ValueChanged<int> onSeleccion;

  /// Titulo del panel. Opcional: sin el, el indice arranca directo.
  final String? encabezado;

  const MenuSectionIndex({
    super.key,
    required this.secciones,
    required this.seccionActual,
    required this.onSeleccion,
    this.encabezado,
  });

  static const ancho = 168.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ancho,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 11),
        children: [
          if (encabezado?.isNotEmpty ?? false)
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 6),
              child: Text(
                encabezado!.toUpperCase(),
                style: FoodlyTextStyles.caption.copyWith(
                  fontSize: 9.5,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  color: FoodlyThemes.secondaryFoodlyText,
                ),
              ),
            ),
          for (var i = 0; i < secciones.length; i++) _EntradaDelIndice(
            texto: secciones[i],
            activa: i == seccionActual,
            onTap: () => onSeleccion(i),
          ),
        ],
      ),
    );
  }
}

class _EntradaDelIndice extends StatelessWidget {
  final String texto;
  final bool activa;
  final VoidCallback onTap;

  const _EntradaDelIndice({required this.texto, required this.activa, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: activa ? FoodlyThemes.alternativeUnselectedLightColor : Colors.transparent,
      borderRadius: BorderRadius.circular(7),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(7),
        child: Container(
          // 44 px de suelo tactil, como el resto de la app.
          constraints: const BoxConstraints(minHeight: 44),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          alignment: Alignment.centerLeft,
          child: Text(
            texto,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: FoodlyTextStyles.label.copyWith(
              fontSize: 12.5,
              fontWeight: activa ? FontWeight.w700 : FontWeight.w400,
              color: activa ? FoodlyThemes.titleOnGlass : FoodlyThemes.promoSubtitleOnGlass,
            ),
          ),
        ),
      ),
    );
  }
}
