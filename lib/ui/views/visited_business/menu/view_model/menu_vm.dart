import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart' show FabCircularMenuPlusState;
import 'package:flutter/material.dart' show GlobalKey, PageController;
import 'package:foodly_world/core/enums/foodly_enums.dart' show MenuCategory;
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

export 'package:foodly_world/data_models/menu/item_dm.dart';

part 'menu_vm.freezed.dart';

@freezed
class MenuVM with _$MenuVM {
  const MenuVM._();

  const factory MenuVM({
    MenuDM? menuDM,
    @Default(0) int indexView,
    PageController? controller,
    GlobalKey<FabCircularMenuPlusState>? floatingButtonKey,
  }) = _MenuVM;

  bool get foodCategoryIsNull => menuDM?.foodCategories == null;
  bool get drinkCategoryIsNull => menuDM?.drinkCategories == null;
  bool get combosIsEmpty => menuDM?.combos.isEmpty ?? true;

  String get currency => menuDM?.business?.country?.currencySymbol ?? '\$';
  String? get businessLogo => menuDM?.business?.logo;
  String? get businessName => menuDM?.business?.name;
  String? get combosLabel => menuDM?.business?.combosLabel;

  List<String> get tabLabels => MenuCategory.values.map((c) => c.textWith(combosLabel: combosLabel)).toList();

  Map<MenuCategory, List<CategoryDM>?> get menuScreens => {
        MenuCategory.food: menuDM?.foodCategories,
        MenuCategory.drinks: menuDM?.drinkCategories,
        MenuCategory.combos: [
          CategoryDM(items: menuDM?.combos ?? [], name: MenuCategory.combos.textWith(combosLabel: combosLabel), uuid: '')
        ],
      };

  MenuCategory get currentMenuCategory => MenuCategory.values[indexView];
}
