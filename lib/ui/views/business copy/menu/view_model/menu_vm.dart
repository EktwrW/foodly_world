import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart' show FabCircularMenuPlusState;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
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
    @Default(false) bool editMode,
    @Default(false) bool avoidFocus,
    GlobalKey<FormState>? formKey,
    @Default(AutovalidateMode.disabled) AutovalidateMode autovalidateMode,
  }) = _MenuVM;

  bool get foodCategoryIsNull => editMenuDM?.foodCategories == null;
  bool get drinkCategoryIsNull => editMenuDM?.drinkCategories == null;
  bool get combosIsEmpty => editMenuDM?.combos.isEmpty ?? true;

  bool get loggerUserCanEdit =>
      di<AuthSessionService>().userSessionDM?.user.business.any((b) => b.uuid == menuDM?.business?.uuid) ?? false;

  String get currency => editMenuDM?.business?.country?.currencySymbol ?? '\$';
  String? get businessLogo => editMenuDM?.business?.logo;
  String? get businessName => editMenuDM?.business?.name;

  Map<MenuCategory, List<CategoryDM>?> get menuScreens => {
        MenuCategory.food: editMenuDM?.foodCategories,
        MenuCategory.drinks: editMenuDM?.drinkCategories,
        MenuCategory.combos: [CategoryDM(items: editMenuDM?.combos ?? [], name: MenuCategory.combos.text, uuid: '')],
      };

  bool get _anyItemIsEditing =>
      menuScreens.entries.any((e) => e.value?.any((v) => v.items.any((i) => i.isEditing)) ?? false);
  bool get _anyTitleIsEditing => menuScreens.entries.any((e) => e.value?.any((v) => v.editingName) ?? false);
  bool get enableEditCategoryBtns => !_anyItemIsEditing && !_anyTitleIsEditing;

  MenuCategory get currentMenuCategory => MenuCategory.values[indexView];

  bool get isAnyComboEditing => editMenuDM?.combos.any((item) => item.isEditing) ?? false;
  // Verificar si hay algún item en edición o categoría siendo editada
  bool get isAnyItemEditing => currentMenuCategory.isCombos
      ? isAnyComboEditing
      : editMenuDM?.subCategories[currentMenuCategory]
              ?.expand((category) => category.items)
              .any((item) => item.isEditing) ??
          false;
  bool get isAnyCategoryEditing => currentMenuCategory.isCombos
      ? false // combos no tienen categorías editables
      : editMenuDM?.subCategories[currentMenuCategory]?.any((category) => category.editingName) ?? false;

  bool get menuIsEditing => isAnyItemEditing || isAnyCategoryEditing;
  bool get menuIsEditingFood => menuIsEditing && indexView == 0;
  bool get menuIsEditingDrinks => menuIsEditing && indexView == 1;
  bool get menuIsEditingCombos => menuIsEditing && indexView == 2;
}
