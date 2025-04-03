import 'package:flex_color_scheme/flex_color_scheme.dart' show FlexStringExtensions;
import 'package:flutter/material.dart';
import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_favorites_vm.freezed.dart';

@freezed
class MyFavoritesVM with _$MyFavoritesVM {
  const MyFavoritesVM._();

  const factory MyFavoritesVM({
    @Default([]) List<BusinessDM> favoriteBusinesses,
    @Default([]) List<MenuDM> favoriteMenus,
    @Default([]) List<PromotionDM> favoritePromos,
    @Default([]) List<ItemDM> favoriteFoodItems,
    @Default([]) List<ItemDM> favoriteDrinkItems,
    @Default([]) List<ItemDM> favoriteComboItems,
    @Default(0) int indexView,
    PageController? controller,
    @Default(true) isInitializing,
    @Default(false) isGridView,
    @Default(BusinessSortType.open) BusinessSortType businessSortType,
    @Default(true) bool isBusinessSortAscending,
  }) = _MyFavoritesVM;

  bool get hasNoFavoriteBusinesses => favoriteBusinesses.isEmpty;
  bool get hasNoFavoriteMenus => favoriteMenus.isEmpty;
  bool get hasNoFavoritePromos => favoritePromos.isEmpty;
  bool get hasNoFavoriteFoodItems => favoriteFoodItems.isEmpty;
  bool get hasNoFavoriteDrinkItems => favoriteDrinkItems.isEmpty;
  bool get hasNoFavoriteComboItems => favoriteComboItems.isEmpty;

  /// Devuelve la lista de negocios favoritos ordenados según el criterio seleccionado
  List<BusinessDM> get sortedFavoriteBusinesses {
    if (favoriteBusinesses.isEmpty) return [];

    final sortedList = List<BusinessDM>.from(favoriteBusinesses);

    switch (businessSortType) {
      case BusinessSortType.open:
        // Para ordenamiento por apertura
        if (isBusinessSortAscending) {
          // Primero los negocios abiertos, luego los cerrados
          sortedList.sort((a, b) {
            final aIsOpen = a.businessDays.isOpen;
            final bIsOpen = b.businessDays.isOpen;
            if (aIsOpen != bIsOpen) return aIsOpen ? -1 : 1;
            return (a.name?.toLowerCase() ?? '').compareTo((b.name?.toLowerCase() ?? ''));
          });
        } else {
          // Primero los negocios cerrados, luego los abiertos
          sortedList.sort((a, b) {
            final aIsOpen = a.businessDays.isOpen;
            final bIsOpen = b.businessDays.isOpen;
            if (aIsOpen != bIsOpen) return aIsOpen ? 1 : -1;
            return (a.name?.toLowerCase() ?? '').compareTo((b.name?.toLowerCase() ?? ''));
          });
        }
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

enum MyFavoritesView {
  businesses(0),
  menus(1),
  menuItems(2);

  final int indexView;
  const MyFavoritesView(this.indexView);

  String get label =>
      switch (this) { businesses => S.current.businesses.capitalize, menus => 'Menus', menuItems => 'Items' };
}

enum BusinessSortType {
  open,
  alphabetical;

  String get label => switch (this) {
        open => 'Open',
        alphabetical => 'A-Z',
      };
}
