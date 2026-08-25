/// Intención de saltar al MENÚ tras escanear el QR de un negocio.
///
/// POR QUÉ EXISTE. El QR de menú codifica `menu.foodly.solutions/{businessUuid}`
/// y el comensal con sesión aterrizaba en el PERFIL del negocio, no en el
/// menú: tenía que encontrar y tocar "Menu" para poder pedir. Escaneó desde su
/// mesa para ordenar, no para leer reseñas.
///
/// No se puede redirigir directo porque la ruta del menú pide el uuid del
/// MENÚ y el QR trae el del NEGOCIO — y cambiar lo que codifica el QR
/// invalidaría todos los que ya estén impresos y pegados en las mesas. Así que
/// la intención se estaciona acá y la consume la pantalla del negocio cuando
/// ya cargó y conoce `menus.first.uuid`.
///
/// Mismo patrón y misma vida que [PendingTable]: estático, en memoria, de un
/// solo uso. Si el salto no ocurre (negocio sin menú, error de red), no pasa
/// nada: el comensal se queda en el perfil, que es el destino de antes.
class PendingMenuJump {
  PendingMenuJump._();

  static String? _businessUuid;

  /// Estaciona el salto para [businessUuid].
  static void park(String businessUuid) {
    if (businessUuid.isEmpty) return;
    _businessUuid = businessUuid;
  }

  /// ¿Hay que saltar al menú de [businessUuid]? Consume la intención: un
  /// segundo `loaded` del mismo negocio —un refetch, un rebuild— ya no
  /// vuelve a navegar.
  static bool take(String businessUuid) {
    if (_businessUuid != businessUuid) return false;
    _businessUuid = null;

    return true;
  }

  static void clear() => _businessUuid = null;
}
