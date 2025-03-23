import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';

class FavoritesVM {
  // Lista de IDs (para verificaciones rápidas)
  final List<String> favoriteBusinessIds;
  final List<String> favoriteMenuIds;
  final List<String> favoriteItemIds; // No hay distinción entre comida/bebida
  final List<String> savedPromotionIds;

  // Objetos completos (para mostrar en UI)
  final List<BusinessDM> favoriteBusinesses;
  final List<MenuDM> favoriteMenus;
  final List<ItemDM> favoriteFoodItems;
  final List<ItemDM> favoriteDrinkItems;
  final List<PromotionDM> favoritePromotions;

  const FavoritesVM({
    this.favoriteBusinessIds = const [],
    this.favoriteMenuIds = const [],
    this.favoriteItemIds = const [],
    this.savedPromotionIds = const [],
    this.favoriteBusinesses = const [],
    this.favoriteMenus = const [],
    this.favoriteFoodItems = const [],
    this.favoriteDrinkItems = const [],
    this.favoritePromotions = const [],
  });

  /// Crea un VM a partir del UserDM (solo IDs)
  factory FavoritesVM.fromUserDM(UserDM? user) {
    if (user == null) {
      return const FavoritesVM();
    }
    return FavoritesVM(
      favoriteBusinessIds: user.favoriteBusiness,
      favoriteMenuIds: user.favoriteMenus,
      favoriteItemIds: user.favoriteItems,
      savedPromotionIds: user.savedPromotions,
    );
  }

  FavoritesVM copyWith({
    List<String>? favoriteBusinessIds,
    List<String>? favoriteMenuIds,
    List<String>? favoriteItemIds,
    List<String>? savedPromotionIds,
    List<BusinessDM>? favoriteBusinesses,
    List<MenuDM>? favoriteMenus,
    List<ItemDM>? favoriteFoodItems,
    List<ItemDM>? favoriteDrinkItems,
    List<PromotionDM>? favoritePromotions,
  }) {
    return FavoritesVM(
      favoriteBusinessIds: favoriteBusinessIds ?? this.favoriteBusinessIds,
      favoriteMenuIds: favoriteMenuIds ?? this.favoriteMenuIds,
      favoriteItemIds: favoriteItemIds ?? this.favoriteItemIds,
      savedPromotionIds: savedPromotionIds ?? this.savedPromotionIds,
      favoriteBusinesses: favoriteBusinesses ?? this.favoriteBusinesses,
      favoriteMenus: favoriteMenus ?? this.favoriteMenus,
      favoriteFoodItems: favoriteFoodItems ?? this.favoriteFoodItems,
      favoriteDrinkItems: favoriteDrinkItems ?? this.favoriteDrinkItems,
      favoritePromotions: favoritePromotions ?? this.favoritePromotions,
    );
  }
}
