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
