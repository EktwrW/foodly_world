import 'package:foodly_world/ui/views/group_orders/widgets/hosted_rail.dart';

/// Qué país viene puesto en el formulario de tarjeta del PaymentSheet.
///
/// EL PROBLEMA (e2e 2026-08-15): venía **Estados Unidos**. La hoja no sabe nada
/// del comensal más allá de lo que se le pase, así que cae al idioma del
/// dispositivo, y un teléfono en inglés-US le pide a un comensal de Lisboa un
/// ZIP de cinco dígitos para pagar con una tarjeta portuguesa.
///
/// No es un fallo de cobro —el pago pasa igual— es fricción en el peor momento:
/// el comensal tiene que desplegar una lista de doscientos países con el
/// camarero esperando, y el formato del código postal cambia debajo mientras lo
/// hace.
///
/// EL ORDEN DE PREFERENCIA, y por qué:
///
///  1. **El país del comensal.** Es el dueño de la tarjeta. Un español que cena
///     en Lisboa paga con una tarjeta española, y la dirección de facturación
///     es la suya, no la del restaurante. Es el mismo criterio que decide el
///     rail local ([hostedRailFor]) y por el mismo motivo.
///  2. **El país del restaurante.** Cuando del comensal no se sabe nada —se
///     registró sin teléfono ni dirección—, lo más probable es que quien está
///     sentado a esa mesa sea del país donde está la mesa. Es una apuesta, pero
///     es infinitamente mejor apuesta que Estados Unidos.
///  3. **Nada.** Si tampoco se sabe eso, no se inventa: sin dato la hoja se
///     comporta como se comportaba hasta hoy.
///
/// OJO CON LA DIFERENCIA respecto a `merchantCountryCode`, que viaja al lado en
/// la misma llamada y se le parece: ese es el país del COMERCIO y decide si se
/// declaran Apple Pay y Google Pay (Apple exige que coincida con el del
/// adquirente). Este es el país de FACTURACIÓN del que paga. Que en la mayoría
/// de las mesas coincidan es una casualidad estadística, no una regla.
String? billingCountryFor({String? payerCountry, String? businessCountry}) {
  return countryIsoOrNull(payerCountry) ?? countryIsoOrNull(businessCountry);
}
