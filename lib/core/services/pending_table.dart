/// Mesa pendiente, capturada del QR pegado en la mesa (Fase 2).
///
/// El QR del menú puede llevar `?t={mesa}`: `menu.foodly.solutions/{uuid}?t=12`.
/// El comensal escanea, la app abre el menú de ese negocio y, cuando arranca
/// una orden, la mesa ya viaja puesta — sin que él la diga ni el manager la
/// escriba comanda por comanda.
///
/// **Por qué hace falta estacionarla** y no basta con leer el query param donde
/// se crea la orden: el redirect de `publicMenu` → `visitBusiness` arma el
/// destino con `path.replaceFirst(':id', uuid)`, que DESCARTA el query string.
/// Para cuando el menú in-app está en pantalla, el `?t=` ya no existe. Hay que
/// rescatarlo en el redirect global, que corre antes de ese salto.
///
/// Mismo patrón y mismo motivo que [PendingGroupJoin]: funciones puras, fuera
/// del router, para poder testearlas. Efímero en memoria a propósito — un
/// cold-start descarta el intento, igual que allí.
///
/// **Va emparejada con el negocio.** A diferencia del código de invitación, que
/// es único global, una mesa solo significa algo para el negocio de cuyo QR
/// salió: "Mesa 7" del bar de la esquina no es "Mesa 7" del de enfrente. Sin
/// esa condición, escanear en un sitio y pedir en otro colaría una mesa ajena
/// en la comanda.
class PendingTable {
  PendingTable._();

  /// `group_orders.table_label` es `varchar(30)`. Se recorta acá para que una
  /// URL manipulada a mano degrade a una mesa truncada y no a un 422 que
  /// dejaría al comensal sin poder crear la orden.
  static const maxLength = 30;

  static String? _businessUuid;
  static String? _label;

  static String? get label => _label;

  static String? get businessUuid => _businessUuid;

  /// Estaciona la mesa si [uri] es un deep link de menú con `?t=`.
  ///
  /// El path del menú es `/:businessUuid` — un solo segmento. Sirve tanto la
  /// forma interna (`/abc-123?t=12`) como la URL completa del App Link
  /// (`https://menu.foodly.solutions/abc-123?t=12`): `pathSegments` normaliza
  /// las dos.
  ///
  /// No hace falta excluir otras rutas de un segmento (`/login`, `/home`…):
  /// ninguna lleva `?t=`, y aunque lo llevara quedaría emparejada con un
  /// "negocio" que nunca va a coincidir en [forBusiness], así que es inerte.
  static void captureFromUri(Uri uri) {
    if (uri.pathSegments.length != 1) return;

    final raw = uri.queryParameters['t'];
    if (raw == null) return;

    // Se limpian los caracteres de control ANTES de estacionar. El backend los
    // rechaza con 422, y un QR mal impreso o una URL retocada no deberían
    // dejar a nadie sin poder pedir: la mesa es un extra, nunca un bloqueo.
    final clean = raw.replaceAll(RegExp(r'[\x00-\x1F\x7F]'), '').trim();
    if (clean.isEmpty) return;

    _businessUuid = uri.pathSegments.first;
    _label = clean.length > maxLength ? clean.substring(0, maxLength) : clean;
  }

  /// La mesa estacionada, solo si se capturó para [businessUuid].
  static String? forBusiness(String businessUuid) => _businessUuid == businessUuid ? _label : null;

  /// Se consume al crear la orden con la mesa puesta. Si la creación falla, no
  /// se llama: la mesa sigue estacionada y el reintento la conserva.
  static void clearFor(String businessUuid) {
    if (_businessUuid == businessUuid) clear();
  }

  static void clear() {
    _businessUuid = null;
    _label = null;
  }
}
