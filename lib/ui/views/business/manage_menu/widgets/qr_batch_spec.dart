import 'package:foodly_world/core/services/pending_table.dart';

/// Qué mesas entran en el lote y qué URL lleva el QR de cada una.
///
/// Es la parte del lote que se puede razonar sin PDF ni pantalla: se separa
/// para poder testearla, igual que [PendingTable]. El dibujo del PDF y la hoja
/// de selección viven aparte y consumen esto.
class QrBatchSpec {
  const QrBatchSpec._();

  /// Tope duro de páginas por lote.
  ///
  /// No es una limitación técnica —el PDF es liviano— sino de sentido: un
  /// negocio con más de 100 mesas es un caso que merece hablarse antes de
  /// generarlo a ciegas. Además acota la memoria del documento en el móvil.
  static const maxTables = 100;

  /// Etiquetas del lote para un rango inclusivo.
  ///
  /// Devuelve vacío si el rango no tiene sentido (invertido o fuera de escala),
  /// para que quien llame decida qué avisar en vez de recibir una lista rara.
  static List<String> labelsForRange({required int from, required int to, required String prefix}) {
    if (from < 1 || to < from) return const [];
    if (to - from + 1 > maxTables) return const [];

    final clean = prefix.trim();
    return [
      for (var n = from; n <= to; n++) clean.isEmpty ? '$n' : '$clean $n',
    ];
  }

  /// URL que codifica el QR de una mesa: el menú público con `?t={mesa}`.
  ///
  /// El `t` va como query param —y no como segmento de path— porque la ruta del
  /// menú es `/:businessUuid`: un segmento extra no matchearía, y un QR viejo
  /// sin `?t=` tiene que seguir funcionando igual.
  ///
  /// Se recorta a [PendingTable.maxLength], que es la capacidad de
  /// `group_orders.table_label`. Truncar acá y no allá evita imprimir 200 QRs
  /// con una mesa que el backend después va a rechazar con 422.
  static String urlForTable({required String menuUrl, required String label}) {
    final clean = label.trim();
    if (clean.isEmpty) return menuUrl;

    final capped = clean.length > PendingTable.maxLength ? clean.substring(0, PendingTable.maxLength) : clean;

    return Uri.parse(menuUrl).replace(queryParameters: {'t': capped}).toString();
  }
}
