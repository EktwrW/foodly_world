import 'package:flutter/material.dart';

/// Ancho al que se lee comoda una fila de datos —avatar, nombre, fechas,
/// estado—. Por encima, el ojo tiene que viajar demasiado entre la primera
/// columna y la ultima.
///
/// No es un ancho de lectura de TEXTO (eso son ~640): una fila de datos aguanta
/// mas porque se escanea por bloques, no se lee palabra a palabra.
const double kAnchoDeFilaDeDatos = 620;

/// Cuantas columnas de tarjetas caben.
///
/// POR QUE COLUMNAS Y NO UN TECHO (2026-09-11). Estas listas estaban acotadas a
/// 700 px y centradas. Hector probo en una tableta grande y el diagnostico
/// vale igual aqui: **un techo fijo no escala** — a 1280 px se ve igual que a
/// 744, con media pantalla vacia.
///
/// Pero el margen por breakpoint, que es lo correcto para una tarjeta CON FOTO,
/// aqui empeora las cosas: una fila de datos a 1200 px deja el avatar en una
/// punta y el estado en la otra. El enemigo no es el ancho, es el recorrido del
/// ojo.
///
/// La salida es la misma que en las rejillas de negocios: mas elementos del
/// mismo tamaño, no elementos mas grandes.
int columnasDeLista(double anchoDisponible, {double anchoObjetivo = kAnchoDeFilaDeDatos}) {
  // Sin guarda de telefono a proposito: con 620 px de objetivo, la cuenta ya
  // da 1 por debajo de 1240. Comprobado quitandola: los tests seguian verdes
  // porque el `clamp` ya lo garantizaba. Una guarda que no guarda nada es peor
  // que ninguna — invita a confiar en ella.
  return (anchoDisponible / anchoObjetivo).floor().clamp(1, 3);
}

/// Reparte [elementos] en filas de [columnas], rellenando la ultima con nulos.
///
/// Para listas AGRUPADAS, donde [ListaAdaptativa] no sirve: el historial de
/// ordenes lleva una cabecera por dia que debe ocupar todo el ancho, y solo las
/// ordenes de debajo se reparten. Ahi hay que emitir las filas a mano.
List<List<T?>> enFilasDe<T>(List<T> elementos, int columnas) {
  if (columnas <= 1)
    return [
      for (final e in elementos) [e]
    ];

  return [
    for (var i = 0; i < elementos.length; i += columnas)
      [for (var c = 0; c < columnas; c++) i + c < elementos.length ? elementos[i + c] : null],
  ];
}

/// Una lista que en pantalla ancha reparte sus elementos en columnas.
///
/// Sigue siendo un `ListView.builder`: **la paginacion, el scroll y el pie de
/// "cargando mas" se quedan exactamente como estan**. Lo unico que cambia es
/// que cada elemento de la lista puede ser una fila de varias tarjetas. Con una
/// columna el resultado es identico a no usar esto.
class ListaAdaptativa extends StatelessWidget {
  /// Cuantos elementos hay. NO incluye el pie de carga.
  final int elementos;

  final Widget Function(BuildContext context, int indice) constructor;

  /// Se pinta debajo de todo, a ancho completo. Para el "cargando mas".
  final Widget? pie;

  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final Key? claveDeLista;

  /// Separacion entre tarjetas de la misma fila.
  final double separacion;

  const ListaAdaptativa({
    super.key,
    required this.elementos,
    required this.constructor,
    this.pie,
    this.controller,
    this.padding,
    this.claveDeLista,
    this.separacion = 12,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columnas = columnasDeLista(constraints.maxWidth);
        final filas = (elementos / columnas).ceil();

        return ListView.builder(
          key: claveDeLista,
          controller: controller,
          padding: padding,
          itemCount: filas + (pie != null ? 1 : 0),
          itemBuilder: (context, indiceDeFila) {
            if (indiceDeFila == filas) return pie;
            if (columnas == 1) return constructor(context, indiceDeFila);

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var c = 0; c < columnas; c++) ...[
                  if (c > 0) SizedBox(width: separacion),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final indice = indiceDeFila * columnas + c;

                        // La ultima fila puede ir incompleta: los huecos se
                        // dejan vacios para que las tarjetas no se estiren.
                        return indice < elementos ? constructor(context, indice) : const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              ],
            );
          },
        );
      },
    );
  }
}
