import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show GlobalKey, PageController;
import 'package:flutter/services.dart' show rootBundle;
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/enums/foodly_categories_enums.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/ui/views/business/menu/view_model/menu_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_state.dart';
part 'menu_cubit.freezed.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuVM _vm;
  MenuCubit({
    required String menuId,
  })  : _vm = MenuVM(
          menuDM: MenuDM(uuid: FoodlyStrings.NEW_MENU),
          controller: PageController(),
          floatingButtonKey: GlobalKey(),
        ),
        super(const MenuState.initial(MenuVM())) {
    _loadMenu();
  }

  Future<void> _loadMenu() async {
    final String response = await rootBundle.loadString('assets/mocks/menu.json');
    final rawData = await json.decode(response);
    final menuData = MenuResponse.fromJson(rawData);
    _vm = _vm.copyWith(
      menuDM: menuData.menuDM,
      editMenuDM: menuData.menuDM,
      indexView: menuData.menuDM.business?.category == FoodlyCategories.drinkHouse ? 1 : 0,
    );
    log('${_vm.menuDM?.uuid}');
    log('${_vm.menuDM?.lastUpdate}');
    log('${_vm.menuDM?.foodCategories}');
    log('${_vm.menuDM?.drinkCategories}');
    log('${_vm.menuDM?.combos}');
    emit(_Loaded(_vm));
  }

  void updateView(int index) {
    emit(_Loaded(_vm = _vm.copyWith(indexView: index)));
  }

  void updateItemVersion(ItemDM item, MenuCategory menuCategory, String subCategoryName) {
    final updateFunctions = {
      MenuCategory.food: (ItemDM item, String subCategoryName) => _updateFoodItemVersion(item, subCategoryName),
      MenuCategory.drinks: (ItemDM item, String subCategoryName) => _updateDrinkItemVersion(item, subCategoryName),
      MenuCategory.combos: (ItemDM item, String subCategoryName) => _updateComboItemVersion(item)
    };

    updateFunctions[menuCategory]?.call(item, subCategoryName);

    emit(_Loaded(_vm));
  }

  void _updateFoodItemVersion(ItemDM item, String subCategoryName) {
    final updatedFoodCategories = _vm.editMenuDM?.foodCategories?.map((foodCat) {
      if (foodCat.name == subCategoryName) {
        final updatedItems = foodCat.items.map((i) => i.id == item.id ? item : i).toList();

        // Return a new FoodCategory with the updated items
        return foodCat.copyWith(items: updatedItems);
      } else {
        return foodCat; // No change needed for other categories
      }
    }).toList();

    _vm = _vm.copyWith(editMenuDM: _vm.editMenuDM?.copyWith(foodCategories: updatedFoodCategories));
  }

  void _updateDrinkItemVersion(ItemDM item, String subCategoryName) {
    final updatedDrinkCategories = _vm.editMenuDM?.drinkCategories?.map((drinkCat) {
      if (drinkCat.name == subCategoryName) {
        final updatedItems = drinkCat.items.map((i) => i.id == item.id ? item : i).toList();

        // Return a new DrinkCategory with the updated items
        return drinkCat.copyWith(items: updatedItems);
      } else {
        return drinkCat; // No change needed for other categories
      }
    }).toList();

    _vm = _vm.copyWith(editMenuDM: _vm.editMenuDM?.copyWith(drinkCategories: updatedDrinkCategories));
  }

  void _updateComboItemVersion(ItemDM item) {
    final updatedItems = _vm.editMenuDM?.combos?.map((i) => i.id == item.id ? item : i).toList();

    _vm = _vm.copyWith(editMenuDM: _vm.editMenuDM?.copyWith(combos: updatedItems));
    emit(_Loaded(_vm));
  }
}
