/// Helpers de formato para los widgets de Group Orders.
library;

/// Símbolo de moneda a partir del código ISO. Por defecto el código mismo.
String currencySymbol(String currency) {
  switch (currency.toUpperCase()) {
    case 'EUR':
      return '€';
    case 'USD':
      return '\$';
    case 'ARS':
      return '\$';
    default:
      return currency;
  }
}

/// Formatea un monto con su símbolo: 12.5, 'EUR' -> "€12.50".
String formatMoney(double amount, String currency) =>
    '${currencySymbol(currency)}${amount.toStringAsFixed(2)}';

/// Prefijo del payload de los QR de invitación a órdenes grupales (F3a).
/// El sheet de invitar lo codifica y el escáner de "unirse" lo parsea;
/// el código corto tipeable queda como fallback.
const String kGroupOrderInvitePrefix = 'FOODLY-GO:';

/// URL base de invitación (App Links): abre Foodly y une automáticamente;
/// sin app instalada, la landing sirve /join/{code} con fallback y stores.
const String kGroupOrderInviteUrlBase = 'https://foodly.solutions/join/';

/// e2e r7: ¿corresponde celebrar el cierre de la orden (sheet de éxito +
/// salida al menú)? Pura para testear la matriz completa:
///  - una sola vez ([alreadyShown]);
///  - solo si VIMOS la orden viva antes ([sawAliveOrder]) — abrir una orden
///    ya cerrada desde el historial NO debe disparar el festejo;
///  - y solo cuando la orden llegó de verdad a su final.
///
/// e2e 2026-08-06 — qué es "el final" DEPENDE del modo, y confundirlo fue el
/// origen de dos bugs:
///  · prepago por ronda: pagar ES confirmar → `confirmed` cierra el ciclo;
///  · cuenta abierta: `confirmed` significa "primera tanda enviada a cocina",
///    la orden recién empieza. Festejar ahí ponía "¡Orden confirmada!" detrás
///    del sheet "Pedido enviado a cocina", y lo repetía en cada orden nueva.
///    Acá el final es el PAGO.
bool shouldCelebrateConfirmation({
  required bool alreadyShown,
  required bool sawAliveOrder,
  required bool isConfirmed,
  bool isOpenTab = false,
  bool isPaid = false,
}) {
  if (alreadyShown || !sawAliveOrder) return false;
  return isOpenTab ? isPaid : isConfirmed;
}
