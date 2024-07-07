import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:foodly_world/core/consts/foodly_strings.dart';
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
          menuDM: MenuDM(menu: Menu(uuid: FoodlyStrings.NEW_MENU)),
        ),
        super(const MenuState.initial(MenuVM())) {
    _loadMenu();
  }

  Future<void> _loadMenu() async {
    final String response = await rootBundle.loadString('assets/mocks/menu.json');
    final data = await json.decode(response);
    _vm = _vm.copyWith(menuDM: MenuDM.fromJson(data));
    log('${_vm.menuDM?.menu.uuid}');
    log('${_vm.menuDM?.menu.lastUpdate}');
    log('${_vm.menuDM?.menu.foodCategories}');
    log('${_vm.menuDM?.menu.drinkCategories}');
    log('${_vm.menuDM?.menu.combos}');
    emit(_Loaded(_vm));
  }
}
