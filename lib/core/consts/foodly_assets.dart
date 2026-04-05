import 'package:foodly_world/core/enums/foodly_enums.dart' show AssetType;
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart' show AssetData;

class FoodlyAssets {
  const FoodlyAssets._();

  // Branding assets - logos
  static const AssetData logo = AssetData('foodly_purple.webp', AssetType.image);
  static const AssetData logoWhite = AssetData('foodly_white.webp', AssetType.image);
  static const AssetData logo369 = AssetData('logo_369.png', AssetType.image);
  static const AssetData symbol369 = AssetData('369.png', AssetType.image);

  // Profile user
  static const AssetData available = AssetData('available.png', AssetType.image);
  static const AssetData unavailable = AssetData('unavailable.png', AssetType.image);
  static const AssetData searchAvailability = AssetData('search_availability.png', AssetType.image);

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

  // Features
  static const AssetData trends = AssetData('trends.png', AssetType.image);
  static const AssetData mic = AssetData('mic.png', AssetType.image);

  // Business & Dashboard
  static const AssetData coverImages = AssetData('cover.png', AssetType.image);
  static const AssetData editLocation = AssetData('edit_location.png', AssetType.image);
  static const AssetData noCustomerReviewsYet = AssetData('no_customer_reviews.png', AssetType.image);
  static const AssetData emptyMenu = AssetData('empty_menu.png', AssetType.image);
  static const AssetData ai = AssetData('ai.png', AssetType.image);
  static const AssetData searchBusiness = AssetData('search_business.png', AssetType.image);
  static const AssetData searchBusinessAgain = AssetData('search_business_again.png', AssetType.image);
  static const AssetData reserveBar = AssetData('reserve_bar.png', AssetType.image);
  static const AssetData reserveCoffeeTable = AssetData('reserve_coffee_table.png', AssetType.image);
  static const AssetData reserveTable = AssetData('reserve_table.png', AssetType.image);
  static const AssetData reserved = AssetData('reserved.png', AssetType.image);
  static const AssetData review = AssetData('review.png', AssetType.image);
  static const AssetData newBusinessPlaceholder = AssetData('new_business_placeholder.png', AssetType.image);
  static const AssetData promoPlaceholder = AssetData('promo_placeholder.webp', AssetType.image);
}
