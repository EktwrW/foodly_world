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

/// e2e r7: ¿corresponde celebrar la confirmación de la orden (sheet de éxito
/// + salida al menú)? Pura para testear la matriz completa:
///  - una sola vez ([alreadyShown]);
///  - solo si VIMOS la orden viva antes ([sawAliveOrder]) — abrir una orden
///    ya confirmada desde el historial NO debe disparar el festejo;
///  - y solo cuando el estado actual es confirmado.
bool shouldCelebrateConfirmation({
  required bool alreadyShown,
  required bool sawAliveOrder,
  required bool isConfirmed,
}) =>
    !alreadyShown && sawAliveOrder && isConfirmed;
