import 'package:flex_color_scheme/flex_color_scheme.dart' show FlexStringExtensions;
import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/generated/l10n.dart';

// Enums para el manejo de UI
enum MyFavoritesView {
  businesses(0),
  menus(1),
  menuItems(2);

  final int indexView;
  const MyFavoritesView(this.indexView);

  String get label => switch (this) {
        businesses => S.current.businesses.capitalize,
        menus => S.current.menus.capitalize,
        menuItems => S.current.items.capitalize
      };
}

enum BusinessSortType {
  open,
  alphabetical;

  String get label => switch (this) {
        open => S.current.open,
        alphabetical => S.current.alphabetical,
      };
}

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
  final List<ItemDM> favoriteComboItems;
  final List<FavoriteItemDM> favoriteItems;
  final List<PromotionDM> favoritePromotions;

  // Seguimiento de elementos que han sido cambiados explícitamente
  // para controlar la animación
  final Set<String> toggledItemIds;

  // Estados de UI (agregados desde MyFavoritesVM)
  final int indexView;
  final PageController? controller;
  final bool isGridView;
  final BusinessSortType businessSortType;
  final bool isBusinessSortAscending;
  final bool isInitializing;

  const FavoritesVM({
    this.favoriteBusinessIds = const [],
    this.favoriteMenuIds = const [],
    this.favoriteItemIds = const [],
    this.savedPromotionIds = const [],
    this.favoriteBusinesses = const [],
    this.favoriteMenus = const [],
    this.favoriteFoodItems = const [],
    this.favoriteDrinkItems = const [],
    this.favoriteComboItems = const [],
    this.favoriteItems = const [],
    this.favoritePromotions = const [],
    this.toggledItemIds = const {},
    this.indexView = 0,
    this.controller,
    this.isGridView = false,
    this.businessSortType = BusinessSortType.open,
    this.isBusinessSortAscending = true,
    this.isInitializing = true,
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
    List<ItemDM>? favoriteComboItems,
    List<FavoriteItemDM>? favoriteItems,
    List<PromotionDM>? favoritePromotions,
    Set<String>? toggledItemIds,
    int? indexView,
    PageController? controller,
    bool? isGridView,
    BusinessSortType? businessSortType,
    bool? isBusinessSortAscending,
    bool? isInitializing,
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
      favoriteComboItems: favoriteComboItems ?? this.favoriteComboItems,
      favoriteItems: favoriteItems ?? this.favoriteItems,
      favoritePromotions: favoritePromotions ?? this.favoritePromotions,
      toggledItemIds: toggledItemIds ?? this.toggledItemIds,
      indexView: indexView ?? this.indexView,
      controller: controller ?? this.controller,
      isGridView: isGridView ?? this.isGridView,
      businessSortType: businessSortType ?? this.businessSortType,
      isBusinessSortAscending: isBusinessSortAscending ?? this.isBusinessSortAscending,
      isInitializing: isInitializing ?? this.isInitializing,
    );
  }

  FavoritesVM withToggledItem(String itemId) {
    final newToggledItemIds = Set<String>.from(toggledItemIds)..add(itemId);
    return copyWith(toggledItemIds: newToggledItemIds);
  }

  /// Verifica si un elemento ha sido togglado anteriormente
  bool hasBeenToggled(String itemId) {
    return toggledItemIds.contains(itemId);
  }

  // Propiedades para facilitar la verificación de estados vacíos
  bool get hasNoFavoriteBusinesses => favoriteBusinesses.isEmpty;
  bool get hasNoFavoriteMenus => favoriteMenus.isEmpty;
  bool get hasNoFavoritePromos => favoritePromotions.isEmpty;
  bool get hasNoFavoriteFoodItems => favoriteFoodItems.isEmpty;
  bool get hasNoFavoriteDrinkItems => favoriteDrinkItems.isEmpty;
  bool get hasNoFavoriteComboItems => favoriteComboItems.isEmpty;

  /// Devuelve la lista de negocios favoritos ordenados según el criterio seleccionado
  List<BusinessDM> get sortedFavoriteBusinesses {
    if (favoriteBusinesses.isEmpty) return [];

    var sortedList = List<BusinessDM>.from(favoriteBusinesses);

    switch (businessSortType) {
      case BusinessSortType.open:
        // Para ordenamiento por apertura
        final openBusinesses = sortedList.where((business) => business.businessDays.isOpen).toList()
          ..sort((a, b) => (a.name?.toLowerCase() ?? '').compareTo((b.name?.toLowerCase() ?? '')));

        final closedBusinesses = sortedList.where((business) => !business.businessDays.isOpen).toList()
          ..sort((a, b) => (a.name?.toLowerCase() ?? '').compareTo((b.name?.toLowerCase() ?? '')));

        sortedList = isBusinessSortAscending
            ? [...openBusinesses, ...closedBusinesses] // Primero abiertos, luego cerrados
            : [...closedBusinesses, ...openBusinesses]; // Primero cerrados, luego abiertos

      case BusinessSortType.alphabetical:
        // Para ordenamiento alfabético
        if (isBusinessSortAscending) {
          // Orden A-Z
          sortedList.sort((a, b) => (a.name?.toLowerCase() ?? '').compareTo((b.name?.toLowerCase() ?? '')));
        } else {
          // Orden Z-A
          sortedList.sort((a, b) => (b.name?.toLowerCase() ?? '').compareTo((a.name?.toLowerCase() ?? '')));
        }
    }

    return sortedList;
  }
}

class FavoriteItemDM {
  final String businessUuid;
  final BusinessDM? business;
  final List<ItemDM> favoriteFoodItems;
  final List<ItemDM> favoriteDrinkItems;
  final List<ItemDM> favoriteComboItems;

  const FavoriteItemDM({
    required this.businessUuid,
    this.business,
    this.favoriteFoodItems = const [],
    this.favoriteDrinkItems = const [],
    this.favoriteComboItems = const [],
  });

  FavoriteItemDM copyWith({
    String? businessUuid,
    BusinessDM? business,
    List<ItemDM>? favoriteFoodItems,
    List<ItemDM>? favoriteDrinkItems,
    List<ItemDM>? favoriteComboItems,
  }) {
    return FavoriteItemDM(
      businessUuid: businessUuid ?? this.businessUuid,
      business: business ?? this.business,
      favoriteFoodItems: favoriteFoodItems ?? this.favoriteFoodItems,
      favoriteDrinkItems: favoriteDrinkItems ?? this.favoriteDrinkItems,
      favoriteComboItems: favoriteComboItems ?? this.favoriteComboItems,
    );
  }

  String get menuUuid {
    if (favoriteFoodItems.any((fi) => fi.menuUuid?.isNotEmpty == true)) {
      return favoriteFoodItems.firstWhere((fi) => fi.menuUuid!.isNotEmpty).menuUuid ?? '';
    }
    if (favoriteDrinkItems.any((fi) => fi.menuUuid?.isNotEmpty == true)) {
      return favoriteDrinkItems.firstWhere((fi) => fi.menuUuid!.isNotEmpty).menuUuid ?? '';
    }
    return favoriteComboItems.firstWhere((fi) => fi.menuUuid!.isNotEmpty).menuUuid ?? '';
  }
}
