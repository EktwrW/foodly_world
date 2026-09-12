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
          for (var i = 0; i < secciones.length; i++)
            _EntradaDelIndice(
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

/// La parte delicada del indice: saber en que seccion estas y llevarte a otra,
/// sobre una lista PEREZOSA.
///
/// Vive aqui y no en cada pantalla porque las tres cartas —visitada, gestion y
/// publica— repiten la misma forma, y este es justo el codigo que no conviene
/// tener por triplicado: son posiciones de scroll y ciclos de vida, no layout.
class MenuSectionIndexController extends ChangeNotifier {
  MenuSectionIndexController({required this.scrollController}) {
    scrollController.addListener(_recalcular);
  }

  final ScrollController scrollController;

  final _claves = <String, GlobalKey>{};
  var _orden = <String>[];
  int _seccionActual = 0;

  /// La seccion que se esta viendo, como indice dentro del orden actual.
  int get seccionActual => _seccionActual;

  /// La clave de una seccion, POR SU UUID y no por su posicion.
  ///
  /// Es deliberado: una clave por indice se le pega a «lo que haya en el sitio
  /// 3», asi que al añadir o borrar una seccion el estado con `keep-alive` se
  /// mapearia a la seccion equivocada. Ademas, al ser una `GlobalKey` sustituye
  /// a la `ValueKey(uuid)` que ya llevaban estos widgets sin perder identidad.
  GlobalKey claveDe(String uuid) => _claves.putIfAbsent(uuid, GlobalKey.new);

  /// El orden actual de las secciones. Se llama en cada build: es lo que
  /// traduce entre uuid y posicion.
  void sincronizarOrden(List<String> uuids) => _orden = uuids;

  /// Distancia desde arriba a partir de la cual se considera que una seccion
  /// "ya paso". No es cero porque encima de la lista hay barras.
  static const _margenSuperior = 140.0;

  /// Marca la seccion cuyo encabezado esta mas cerca del borde de arriba sin
  /// haberlo pasado.
  ///
  /// Solo mira las secciones CONSTRUIDAS: la lista es perezosa y una seccion
  /// lejana no tiene `RenderObject`. No hace falta mas — las que importan para
  /// «donde estoy» son justo las que se ven.
  void _recalcular() {
    var candidata = _seccionActual;
    var mejorDistancia = double.infinity;

    for (var i = 0; i < _orden.length; i++) {
      final render = _claves[_orden[i]]?.currentContext?.findRenderObject();
      if (render is! RenderBox || !render.attached) continue;

      final y = render.localToGlobal(Offset.zero).dy;
      if (y > _margenSuperior) continue;

      final distancia = (_margenSuperior - y).abs();
      if (distancia < mejorDistancia) {
        mejorDistancia = distancia;
        candidata = i;
      }
    }

    if (candidata != _seccionActual) {
      _seccionActual = candidata;
      notifyListeners();
    }
  }

  /// Lleva el scroll hasta una seccion.
  ///
  /// Si todavia no esta construida se salta primero a una posicion estimada por
  /// proporcion y se afina en el frame siguiente: sin ese primer salto,
  /// `ensureVisible` no tiene a que agarrarse.
  Future<void> irA(int indice) async {
    if (indice < 0 || indice >= _orden.length) return;

    Future<bool> afinar() async {
      final contexto = _claves[_orden[indice]]?.currentContext;
      if (contexto == null) return false;

      await Scrollable.ensureVisible(
        contexto,
        duration: Durations.medium2,
        curve: Curves.easeOutCubic,
        alignment: .02,
      );

      return true;
    }

    if (await afinar()) return;
    if (!scrollController.hasClients) return;

    final maximo = scrollController.position.maxScrollExtent;
    await scrollController.animateTo(
      (maximo * indice / _orden.length).clamp(0, maximo),
      duration: Durations.medium2,
      curve: Curves.easeOutCubic,
    );
    await WidgetsBinding.instance.endOfFrame;
    await afinar();
  }

  @override
  void dispose() {
    scrollController.removeListener(_recalcular);
    super.dispose();
  }
}
