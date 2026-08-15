import 'package:foodly_world/ui/views/group_orders/widgets/hosted_rail.dart';

/// País de facturación del formulario de tarjeta del PaymentSheet.
///
/// Sin esto venía Estados Unidos (e2e 2026-08-15): la hoja cae al idioma del
/// dispositivo. Manda el comensal —es el dueño de la tarjeta, igual que en
/// [hostedRailFor]— y si no se sabe, el restaurante, que es mejor apuesta que
/// el locale. Ojo: `merchantCountryCode` viaja al lado y es OTRA cosa, el país
/// del comercio para declarar Apple/Google Pay.
String? billingCountryFor({String? payerCountry, String? businessCountry}) {
  return countryIsoOrNull(payerCountry) ?? countryIsoOrNull(businessCountry);
}
