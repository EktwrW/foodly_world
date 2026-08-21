import 'package:flutter/material.dart';
import 'package:foodly_world/core/core_exports.dart' show PaddingExtension;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';

/// Pill verde `tertiaryFoodly` con `currency:precio` que muestra el precio
/// de un menu item. Patrón canónico del menú en Foodly:
///
///   ┌──────────────────────────┐
///   │  €:           12.50      │
///   └──────────────────────────┘
///
/// El símbolo de currency vive **dentro** del badge, alineado a la
/// izquierda del precio. Ambos textos van en blanco sobre el verde
/// `tertiaryFoodly` para que la pareja se lea como una unidad y no como
/// "currency colgado afuera + precio adentro".
///
/// Originalmente solo el manager (modo no-edit) usaba este patrón; ahora
/// también lo usan visited business y public menu para mantener la lectura
/// del precio idéntica en cualquier vista del menú.
///
/// [currency] — símbolo monetario que ya viene resuelto por la vista
///   (BusinessDM.country?.currencySymbol, MenuVM.currency, o el currency
///   del query del public menu). No agregamos lookup acá para no acoplar
///   este shared widget a un service de auth/country.
/// [price] — string ya formateado (`'$currentPrice'` en la mayoría de
///   callsites). Cuando es null o vacío se muestra `-` — el FE lo usa para
///   indicar items no disponibles sin tener que ramificar el render.
/// [priceFontSize] — fontSize opcional del precio. El manager venía con
///   el default de `bodyWhiteSemibold` (~14); visited y public usaban
///   16.5 para que el número sea más prominente en el feed público.
///   Se preserva esa diferencia pasando el fontSize en cada callsite.
class MenuItemPriceTag extends StatelessWidget {
  final String currency;
  final String? price;

  const MenuItemPriceTag({
    super.key,
    required this.currency,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final priceText = (price == null || price!.isEmpty) ? '-' : price!;
    return SizedBox(
      width: 104,
      height: 36,
      child: Card.filled(
        elevation: 3,
        color: FoodlyThemes.tertiaryFoodly,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$currency:',
              style: FoodlyTextStyles.label.copyWith(color: Colors.white),
            ).paddingHorizontal(3),
            Text(
              priceText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: FoodlyTextStyles.bodyWhiteSemibold,
            ),
          ],
        ).paddingHorizontal(6),
      ),
    );
  }
}
