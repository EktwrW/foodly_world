import 'package:foodly_world/core/enums/foodly_categories_enums.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_vm.freezed.dart';

@freezed
class MenuVM with _$MenuVM {
  const MenuVM._();

  const factory MenuVM({
    MenuDM? menuDM,
    MenuDM? menuEditionDM,
    @Default(0) int indexView,
  }) = _MenuVM;

  bool get foodCategoryIsNull => menuEditionDM?.menu.foodCategories == null;
  bool get drinkCategoryIsNull => menuEditionDM?.menu.drinkCategories == null;
  bool get combosIsEmpty => menuEditionDM?.menu.combos?.isEmpty ?? true;

  int get initialIndex => menuEditionDM?.menu.business?.category == FoodlyCategories.drinkHouse ? 1 : 0;

  String get currency => menuEditionDM?.menu.business?.country?.currencySymbol ?? '\$';
  String? get businessLogo => menuEditionDM?.menu.business?.logo;
  String? get businessName => menuEditionDM?.menu.business?.name;
}
