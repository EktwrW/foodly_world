import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart' show FabCircularMenuPlusState;
import 'package:flutter/material.dart' show GlobalKey, PageController;
import 'package:foodly_world/data_models/menu/item_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

export 'package:foodly_world/data_models/menu/item_dm.dart';

part 'menu_vm.freezed.dart';

@freezed
class MenuVM with _$MenuVM {
  const MenuVM._();

  const factory MenuVM({
    MenuDM? menuDM,
    MenuDM? editMenuDM,
    @Default(0) int indexView,
    PageController? controller,
    GlobalKey<FabCircularMenuPlusState>? floatingButtonKey,
  }) = _MenuVM;

  bool get foodCategoryIsNull => editMenuDM?.foodCategories == null;
  bool get drinkCategoryIsNull => editMenuDM?.drinkCategories == null;
  bool get combosIsEmpty => editMenuDM?.combos?.isEmpty ?? true;

  String get currency => editMenuDM?.business?.country?.currencySymbol ?? '\$';
  String? get businessLogo => editMenuDM?.business?.logo;
  String? get businessName => editMenuDM?.business?.name;

  Map<MenuCategory, List<Category>?> get menuScreens => {
        MenuCategory.food: editMenuDM?.foodCategories,
        MenuCategory.drinks: editMenuDM?.drinkCategories,
        MenuCategory.combos: [Category(items: editMenuDM?.combos ?? [], name: MenuCategory.combos.text)],
      };
}
