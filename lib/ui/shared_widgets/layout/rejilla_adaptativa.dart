import 'package:foodly_world/core/utils/soporte_de_orientacion.dart' show kLadoCortoDeTableta;

/// Columnas de la rejilla de negocios en telefono. Es el numero que hay hoy en
/// produccion y no se mueve.
const int kColumnasEnTelefono = 2;

/// Tope de columnas. Mas alla de esto la card deja de leerse como card y la
/// rejilla se convierte en un mosaico.
const int kColumnasMaximas = 6;

/// Ancho al que se pinta una card de negocio en un telefono, medido: a 402 px
/// de pantalla, con dos columnas y 2 px de separacion, cada card mide
/// `(402 - 2) / 2 = 200`.
const double kAnchoDeCardDeNegocio = 200;

/// Cuantas columnas caben en [anchoDisponible] manteniendo la card en su ancho
/// de telefono.
///
/// POR QUE (2026-09-07). Las rejillas de negocios tenian `crossAxisCount: 2`
/// clavado, asi que en una tableta salian dos cards de 500 px de ancho en vez
/// de mas cards del tamaño de siempre. Misma idea que en el carrusel de promos:
/// en pantalla ancha se enseñan MAS elementos, no elementos mas grandes.
///
/// Por debajo del umbral de tableta devuelve [kColumnasEnTelefono] tal cual, sin
/// pasar por la cuenta: el telefono esta en produccion y no se toca.
int columnasDeRejilla(double anchoDisponible, {double anchoObjetivo = kAnchoDeCardDeNegocio}) {
  if (anchoDisponible < kLadoCortoDeTableta) return kColumnasEnTelefono;

  return (anchoDisponible / anchoObjetivo).floor().clamp(kColumnasEnTelefono, kColumnasMaximas);
}
