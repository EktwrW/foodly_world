import 'package:foodly_world/core/enums/foodly_enums.dart' show AssetType;
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart' show AssetData;

class FoodlyAssets {
  const FoodlyAssets._();

  // Branding assets - logos
  static const AssetData logo = AssetData('foodly_purple.webp', AssetType.image);
  static const AssetData logoWhite = AssetData('foodly_white.webp', AssetType.image);
  static const AssetData logo369 = AssetData('logo_369.png', AssetType.image);
  static const AssetData symbol369 = AssetData('369.png', AssetType.image);

  // Foodly categories
  static const AssetData american = AssetData('american.png', AssetType.image);
  static const AssetData bakery = AssetData('bakery.png', AssetType.image);
  static const AssetData coffee = AssetData('coffee.png', AssetType.image);
  static const AssetData fusion = AssetData('fusion.png', AssetType.image);
  static const AssetData international = AssetData('international.png', AssetType.image);
  static const AssetData korean = AssetData('korean.png', AssetType.image);
  static const AssetData mexican = AssetData('mexican.png', AssetType.image);
  static const AssetData pizza = AssetData('pizza.png', AssetType.image);
  static const AssetData portuguese = AssetData('portuguese.png', AssetType.image);
  static const AssetData pubs = AssetData('pubs.png', AssetType.image);
  static const AssetData steakhouse = AssetData('steakhouse.png', AssetType.image);
  static const AssetData stores = AssetData('stores.png', AssetType.image);
  static const AssetData sushi = AssetData('sushi.png', AssetType.image);
  static const AssetData vegetarian = AssetData('vegetarian.png', AssetType.image);
  static const AssetData chef = AssetData('chef.png', AssetType.image);

  // UI utils
  static const AssetData loading0 = AssetData('loading0.png', AssetType.image);
  static const AssetData loading1 = AssetData('loading1.png', AssetType.image);
  static const AssetData loading2 = AssetData('loading2.png', AssetType.image);
  static const AssetData loading3 = AssetData('loading3.png', AssetType.image);
  static const AssetData loading4 = AssetData('loading4.png', AssetType.image);
  static const AssetData isoFoodly = AssetData('iso_foodly.png', AssetType.image);
  static const AssetData isoFoodlyBlack = AssetData('iso_foodly_black.png', AssetType.image);
  static const AssetData isoFoodlyWhite = AssetData('iso_foodly_white.png', AssetType.image);
  static const AssetData isoFoodlyGreen = AssetData('iso_foodly_green.png', AssetType.image);
  static const AssetData trash = AssetData('trash.png', AssetType.image);

  // Login & Sign Up
  static const AssetData wellDone = AssetData('well-done.png', AssetType.image);
  static const AssetData password = AssetData('password.png', AssetType.image);

  // Logout
  static const AssetData exit = AssetData('exit.png', AssetType.image);

  // Dashboard
  static const AssetData coverImages = AssetData('cover.png', AssetType.image);

  // eliminar estos assets de pruebas cuando ya no sean utilizados:
  static const AssetData sushiTemp = AssetData('sushi.webp', AssetType.image);
  static const AssetData panaderia0 = AssetData('panaderia0.jpg', AssetType.image);
  static const AssetData panaderia1 = AssetData('panaderia1.jpg', AssetType.image);
  static const AssetData panaderia2 = AssetData('panaderia2.jpg', AssetType.image);
  static const AssetData panaderia3 = AssetData('panaderia3.jpg', AssetType.image);
  static const AssetData panaderia4 = AssetData('panaderia4.jpg', AssetType.image);
  static const AssetData logoRamalha = AssetData('logo_ramalha.jpg', AssetType.image);
}
