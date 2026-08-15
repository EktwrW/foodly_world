/// Qué método de pago local le toca al comensal en el Checkout hosteado.
///
/// POR QUÉ HAY UN SEGUNDO BOTÓN. Ni MB WAY ni Bizum existen dentro de la app:
/// el Mobile Payment Element no los soporta y stripe-android ni los
/// implementa, así que la única forma de cobrarlos es sacar al comensal al
/// navegador. Eso solo se justifica si allí encuentra algo que aquí no hay —
/// de ahí que la página se restrinja a UN método y el botón lo nombre. Un
/// "otros métodos de pago" que lleva a la misma tarjeta no es una alternativa,
/// es un desvío (e2e 2026-08-14).
///
/// LA LLAVE ES EL COMENSAL, NO EL RESTAURANTE. Stripe muestra estos métodos
/// por "customer location": Portugal para MB WAY, España para Bizum. En una
/// mesa de Lisboa conviven un portugués con MB WAY y un turista español con
/// Bizum, y la primera versión de esta regla —que miraba el país del negocio—
/// le daba a los dos el mismo botón.
///
/// ESTE ARCHIVO ES EL ESPEJO DE `HostedRail` EN EL BACKEND. El backend decide
/// de verdad —con el país del comensal MÁS las capabilities del restaurante y
/// el importe— y aquí solo se decide qué BOTÓN pintar, que es la mitad de la
/// regla: la que solo mira al comensal. Si las dos discrepan, el modo de fallo
/// es benigno: el botón promete un método y el navegador ofrece la página
/// dinámica de siempre. Se paga igual.
library;

/// El método local del comensal, o [none] si no tiene ninguno.
enum HostedRail {
  none,

  /// Portugal. Se paga con el número de teléfono y se aprueba en la app MB WAY.
  mbWay,

  /// España. Se paga con el número de teléfono y se aprueba en la app del banco.
  bizum,
}

/// ISO-2 del país → método local. Fuera de estos dos no hay segundo botón:
/// un francés o un brasileño ven un único CTA, como siempre.
///
/// Multibanco no entra por decisión de producto (2026-08-14): su comisión no
/// compensa.
const _railByCountry = <String, HostedRail>{
  'PT': HostedRail.mbWay,
  'ES': HostedRail.bizum,
};

/// Nombres largos que puede traer el país según de dónde salga.
///
/// `user.phoneCountryCode` es ISO ('PT'), pero el país de la dirección
/// principal viaja como nombre ('Portugal'). `UserDM.currentPhoneCountryCode`
/// ya normaliza a ISO — esto es la red por si algún caller pasa el otro.
const _aliases = <String, String>{
  'PORTUGAL': 'PT',
  'SPAIN': 'ES',
  'ESPAÑA': 'ES',
  'ESPANA': 'ES',
};

/// El ISO-2 de [country], o null si no se puede afirmar cuál es.
///
/// Acepta ISO-2 o nombre, en cualquier caja y con espacios de sobra: el dato
/// llega de un formulario de registro y de una dirección tecleada a mano.
///
/// Devuelve null en vez de adivinar: recortar 'PRT' daría 'PR', Puerto Rico.
/// Valida la FORMA, no que el país exista — 'XX' y 'UK' pasan. No duele: el
/// rail busca en un mapa cerrado y Stripe valida por su cuenta.
String? countryIsoOrNull(String? country) {
  final normalizado = (country ?? '').trim().toUpperCase();
  final iso = _aliases[normalizado] ?? normalizado;

  return _dosLetras.hasMatch(iso) ? iso : null;
}

/// Fuera de la función: [hostedRailFor] se llama desde un `build`.
final _dosLetras = RegExp(r'^[A-Z]{2}$');

/// El método local de un comensal de [payerCountry].
HostedRail hostedRailFor(String? payerCountry) {
  return _railByCountry[countryIsoOrNull(payerCountry)] ?? HostedRail.none;
}
