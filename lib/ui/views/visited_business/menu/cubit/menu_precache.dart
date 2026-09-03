import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';

/// Ancho de decodificación de las fotos en las tarjetas del menú (se pintan a
/// ~100 px). La precarga usa el mismo para compartir la clave de la caché en
/// memoria.
const int menuCardMemCacheWidth = 400;

/// Qué fotos del menú precargar antes de mostrar la pantalla.
///
/// Antes se precargaban TODAS (hasta 26 fotos de ~290 KB) con tope de 4 s: en
/// móvil el tope se agotaba casi siempre, el comensal miraba un spinner 4 s y
/// las fotos entraban igual a cuentagotas. Ahora solo las que caben en la
/// primera pantalla, más dos de margen: en un móvil 6–8, en una tablet 10–12,
/// en escritorio hasta 16. El resto entra con el fundido de `CachedNetworkImage`.
///
/// El orden es el de pantalla: la página inicial primero (bebidas si el
/// negocio es una casa de bebidas), y solo si sobra cupo, las siguientes.
List<String> menuPhotosToPrecache(
  MenuDM menu, {
  required bool drinksFirst,
  required double viewportHeight,
  double cardHeight = 110,
}) {
  // Con NaN o infinito `ceil()` lanza; se asume un móvil.
  final alto = viewportHeight.isFinite ? viewportHeight : 800.0;
  final n = ((alto / cardHeight).ceil() + 2).clamp(6, 16);

  String? url(ItemDM item) =>
      item.foodPhotos?.lastOrNull?.businessFoodPhotoUrl ??
      item.drinkPhotos?.lastOrNull?.businessDrinkPhotoUrl ??
      item.comboPhotos?.lastOrNull?.businessComboPhotoUrl;

  final food = menu.foodCategories.expand((c) => c.items);
  final drinks = menu.drinkCategories.expand((c) => c.items);
  final pages = drinksFirst ? [drinks, food, menu.combos] : [food, drinks, menu.combos];

  return pages
      .expand((items) => items)
      .map(url)
      .whereType<String>()
      .where((u) => u.isNotEmpty)
      .take(n)
      .toList();
}
