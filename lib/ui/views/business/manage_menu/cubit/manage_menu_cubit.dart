import 'package:flutter/foundation.dart' show listEquals;
import 'package:flutter/material.dart' show GlobalKey, PageController;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart' show FoodlyStrings;
import 'package:foodly_world/core/extensions/iterable_extension.dart';
import 'package:foodly_world/core/network/business/business_repo.dart' show BusinessRepo;
import 'package:foodly_world/core/services/dependency_injection_service.dart' show Logger, di;
import 'package:foodly_world/data_models/business/business_dm.dart' show BusinessDM, FoodlyCategories;
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/data_transfer_objects/menu/category_register_dto.dart';
import 'package:foodly_world/data_transfer_objects/menu/menu_register_dto.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/views/business/manage_menu/view_model/manage_menu_vm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_menu_state.dart';
part 'manage_menu_cubit.freezed.dart';

class ManageMenuCubit extends Cubit<ManageMenuState> {
  ManageMenuVM _vm;
  final BusinessRepo _businessRepo;

  ManageMenuCubit(
    BusinessRepo businessRepo, {
    required String? uuid,
    required BusinessDM? businessDM,
  })  : _vm = ManageMenuVM(
          menuDM: MenuDM(
            uuid: uuid ?? FoodlyStrings.NEW_MENU,
            business: businessDM,
            businessUuid: businessDM?.uuid ?? '',
          ),
          controller: PageController(),
          floatingButtonKey: GlobalKey(),
        ),
        _businessRepo = businessRepo,
        super(const ManageMenuState.initial(ManageMenuVM())) {
    _loadMenu();
  }

  Future<void> _loadMenu() async {
    await Future.microtask(() => emit(_Loading(_vm)));

    late final MenuDM menuData;

    if (_vm.menuDM?.uuid == FoodlyStrings.NEW_MENU) {
      final body = MenuRegisterDTO(businessId: _vm.menuDM?.business?.intId ?? -1);

      menuData = await _businessRepo.createMenu(body).then((result) async {
        return result.when(
          success: (data) async => await _handleSuccessMenuResponse(data),
          failure: (e) {
            emit(_Error(e.errorMsg, _vm));
            return _vm.menuDM!;
          },
        );
      });
    } else {
      menuData = await _businessRepo.getMenu(_vm.menuDM?.uuid ?? '').then((result) async {
        return result.when(
          success: (data) async => await _handleSuccessMenuResponse(data),
          failure: (e) {
            emit(_Error(e.errorMsg, _vm));
            return _vm.menuDM!;
          },
        );
      });
    }

    _vm = _vm.copyWith(
      menuDM: menuData,
      editMenuDM: menuData,
      indexView: menuData.business?.category?.id == FoodlyCategories.drinkHouse ? 1 : 0,
    );

    emit(_Loaded(_vm));
  }

  Future<MenuDM> _handleSuccessMenuResponse(MenuDM data) async {
    late final MenuDM menuData;

    if (_vm.menuDM?.business != null) {
      menuData = data.copyWith(business: _vm.menuDM?.business);
    } else {
      await _businessRepo.fetchBusinessById(data.businessUuid).then((result) async {
        result.when(
          success: (business) => menuData = data.copyWith(business: business),
          failure: (e) => emit(_Error(e.errorMsg, _vm)),
        );
      });
    }
    return menuData;
  }

  void updateView(int index) => emit(_Loaded(_vm = _vm.copyWith(indexView: index)));

  void updateEditMode() => emit(_Loaded(_vm = _vm.copyWith(editMode: !_vm.editMode, editMenuDM: _vm.menuDM)));

  void setAvoidFocus(bool avoidFocus) => emit(_Loaded(_vm = _vm.copyWith(avoidFocus: avoidFocus)));

  void addNewItem(
    CategoryDM subCategory,
    MenuCategory menuCategory,
  ) {
    final subCategories =
        menuCategory == MenuCategory.combos ? [subCategory] : _vm.editMenuDM?.subCategories[menuCategory];
    if (subCategories == null) return;

    if (subCategory.items.any((i) => i.uuid == FoodlyStrings.NEW_ITEM)) return;

    final newItem = ItemDM(
      uuid: FoodlyStrings.NEW_ITEM,
      name: '',
      versions: [Version.regular],
      prices: const Prices(),
      editingField: ItemEditing.name,
      id: null,
      foodCategoryId: menuCategory.isFood ? subCategory.id : null,
      drinkCategoryId: menuCategory.isDrinks ? subCategory.id : null,
      comboCategoryId: menuCategory.isCombos ? subCategory.id : null,
    );

    if (menuCategory == MenuCategory.combos) {
      final updatedCombos = List<ItemDM>.from(_vm.editMenuDM?.combos ?? [])..add(newItem);

      _vm = _vm.copyWith(
        editMenuDM: _vm.editMenuDM?.copyWith(combos: updatedCombos),
        menuDM: _vm.menuDM?.copyWith(combos: updatedCombos),
      );
    } else {
      final updatedSubCategories = subCategories.map((category) {
        if (category.uuid != subCategory.uuid) return category;
        return category.copyWith(
          items: [...category.items, newItem],
        );
      }).toList();

      _updateFoodOrDrinkCategory(updatedSubCategories, menuCategory);
    }

    emit(_Loaded(_vm));
  }

  void cancelEditItemOrSubCategory({(ItemDM, MenuCategory, String)? itemRecord}) {
    if (itemRecord != null) {
      _vm = _vm.copyWith(editMenuDM: _vm.menuDM, avoidFocus: false);
      updateItem(itemRecord.$1.copyWith(editingField: ItemEditing.none), itemRecord.$2, itemRecord.$3,
          updateOriginalMenuDM: true);
    } else {
      emit(_Loaded(_vm = _vm.copyWith(editMenuDM: _vm.menuDM, avoidFocus: false)));
    }
  }

  void updateItemNameOrDescription(
    ItemDM item,
    MenuCategory menuCategory,
    String subCategoryUuid, {
    String? newName,
    String? newDescription,
  }) {
    _vm = _vm.copyWith(avoidFocus: false);

    item = item.copyWith(name: newName ?? item.name, description: newDescription ?? item.description);

    updateItem(item, menuCategory, subCategoryUuid);
  }

  void updateItemPhotoPath(
    ItemDM item,
    MenuCategory menuCategory,
    String subCategoryUuid,
    String path,
  ) {
    updateItem(item.copyWith(imagePaths: [path]), menuCategory, subCategoryUuid);
  }

  void toggleItemVersion(
    ItemDM item,
    MenuCategory menuCategory,
    String subCategoryUuid,
    Version version,
  ) {
    final newVersions = List<Version>.from(item.sortedVersions);
    if (newVersions.contains(version)) {
      newVersions.remove(version);
    } else {
      newVersions.add(version);
    }
    updateItem(
      item.copyWith(versions: newVersions, available: newVersions.isNotEmpty),
      menuCategory,
      subCategoryUuid,
    );
  }

  void updateItemVersionPrice(
    ItemDM item,
    MenuCategory menuCategory,
    String subCategoryUuid,
    Version version,
    double newPrice,
  ) {
    final newPrices = item.prices.copyWith(
      regular: version == Version.regular ? newPrice : item.prices.regular,
      medium: version == Version.medium ? newPrice : item.prices.medium,
      big: version == Version.big ? newPrice : item.prices.big,
    );
    updateItem(item.copyWith(prices: newPrices), menuCategory, subCategoryUuid);
  }

  void toggleItemAvailability(ItemDM item, MenuCategory menuCategory, String subCategoryUuid) =>
      updateItem(item.copyWith(available: !item.available), menuCategory, subCategoryUuid);

  Future<void> editSubCategoryName(
    MenuCategory menuCategory,
    bool editingName,
    String uuid,
  ) async {
    if (menuCategory == MenuCategory.combos) {
      // Para combos, actualizar el estado de edición en el menuDM
      _vm = _vm.copyWith();
    } else {
      // Para food y drinks, mantener la lógica existente
      final rawList = _vm.editMenuDM?.subCategories[menuCategory] ?? [];
      final updatedList = List<CategoryDM>.generate(
          rawList.length, (i) => rawList[i].uuid == uuid ? rawList[i].copyWith(editingName: editingName) : rawList[i]);

      _updateFoodOrDrinkCategory(updatedList, menuCategory);
    }

    emit(_Loaded(_vm));
  }

  void updateSubCategoryName(MenuCategory category, String text, String uuid) {
    final rawList = _vm.editMenuDM?.subCategories[category] ?? [];
    final updatedList = List<CategoryDM>.generate(rawList.length,
        (i) => rawList[i].uuid == uuid ? rawList[i].copyWith(name: text, editingName: true) : rawList[i]);

    _updateFoodOrDrinkCategory(updatedList, category);

    emit(_Loaded(_vm));
  }

  void addNewSubCategory(MenuCategory menuCategory) {
    final list = List<CategoryDM>.from(_vm.editMenuDM?.subCategories[menuCategory] ?? [])
      ..insert(0, CategoryDM(name: '', items: [], uuid: FoodlyStrings.NEW_CATEGORY, editingName: true));

    _updateFoodOrDrinkCategory(list, menuCategory);

    emit(_Loaded(_vm));
  }

  void updateItem(
    ItemDM item,
    MenuCategory menuCategory,
    String subCategoryUuid, {
    bool showModal = false,
    String message = '',
    bool updateOriginalMenuDM = false,
  }) {
    final updateFunctions = {
      MenuCategory.food: (item, subCategoryUuid) =>
          _updateFoodItem(item, subCategoryUuid, updateOriginalMenuDM: updateOriginalMenuDM),
      MenuCategory.drinks: (item, subCategoryUuid) =>
          _updateDrinkItem(item, subCategoryUuid, updateOriginalMenuDM: updateOriginalMenuDM),
      MenuCategory.combos: (item, subCategoryUuid) => _updateComboItem(item, updateOriginalMenuDM: updateOriginalMenuDM)
    };

    updateFunctions[menuCategory]?.call(item, subCategoryUuid);

    if (showModal) {
      emit(_ShowSnackbar(_vm, message));
    } else {
      emit(_Loaded(_vm));
    }
  }

  void _updateFoodItem(ItemDM item, String subCategoryUuid, {bool updateOriginalMenuDM = false}) {
    final updatedFoodCategories = _vm.editMenuDM?.foodCategories.map((foodCat) {
      if (foodCat.uuid == subCategoryUuid) {
        final updatedItems =
            foodCat.items.map((i) => (i.uuid == item.uuid || i.uuid == FoodlyStrings.NEW_ITEM) ? item : i).toList();
        return foodCat.copyWith(items: updatedItems);
      }
      return foodCat;
    }).toList();

    if (updateOriginalMenuDM) {
      _vm = _vm.copyWith(
          menuDM: _vm.menuDM?.copyWith(foodCategories: updatedFoodCategories ?? _vm.menuDM?.foodCategories ?? []));
    }

    _vm = _vm.copyWith(
        editMenuDM:
            _vm.editMenuDM?.copyWith(foodCategories: updatedFoodCategories ?? _vm.editMenuDM?.foodCategories ?? []));
  }

  void _updateDrinkItem(ItemDM item, String subCategoryUuid, {bool updateOriginalMenuDM = false}) {
    final updatedDrinkCategories = _vm.editMenuDM?.drinkCategories.map((drinkCat) {
      if (drinkCat.uuid == subCategoryUuid) {
        final updatedItems =
            drinkCat.items.map((i) => (i.uuid == item.uuid || i.uuid == FoodlyStrings.NEW_ITEM) ? item : i).toList();

        // Return a new DrinkCategory with the updated items
        return drinkCat.copyWith(items: updatedItems);
      } else {
        return drinkCat; // No change needed for other categories
      }
    }).toList();

    if (updateOriginalMenuDM) {
      _vm = _vm.copyWith(
          menuDM: _vm.menuDM?.copyWith(drinkCategories: updatedDrinkCategories ?? _vm.menuDM?.drinkCategories ?? []));
    }

    _vm = _vm.copyWith(editMenuDM: _vm.editMenuDM?.copyWith(drinkCategories: updatedDrinkCategories ?? []));
  }

  void _updateComboItem(ItemDM item, {bool updateOriginalMenuDM = false}) {
    final updatedItems = _vm.editMenuDM?.combos
        .map((i) => (i.uuid == item.uuid || i.isNewItem) ? item : i)
        .toList();

    if (updateOriginalMenuDM) {
      _vm = _vm.copyWith(menuDM: _vm.menuDM?.copyWith(combos: updatedItems ?? _vm.menuDM?.combos ?? []));
    }

    _vm = _vm.copyWith(editMenuDM: _vm.editMenuDM?.copyWith(combos: updatedItems ?? _vm.editMenuDM?.combos ?? []));
    emit(_Loaded(_vm));
  }

  void _updateFoodOrDrinkCategory(List<CategoryDM> subCategories, MenuCategory category) {
    if (category.isFood) {
      _vm = _vm.copyWith(editMenuDM: _vm.editMenuDM?.copyWith(foodCategories: subCategories));
    }
    if (category.isDrinks) {
      _vm = _vm.copyWith(editMenuDM: _vm.editMenuDM?.copyWith(drinkCategories: subCategories));
    }
  }

  void updateCategoryTitle(CategoryDM subCategory, MenuCategory menuCategory, String newName) async {
    emit(_Loading(_vm));
    final body = CategoryDTO(name: newName.trim());

    final categoryResult = await (menuCategory.isFood
        ? _businessRepo.updateFoodCategory(subCategory.uuid, body)
        : _businessRepo.updateDrinkCategory(subCategory.uuid, body));

    await categoryResult.when(success: (data) async {
      final updatedCategories = List<CategoryDM>.from(_vm.editMenuDM?.subCategories[menuCategory] ?? [])
          .map((cat) => cat.uuid == subCategory.uuid ? data : cat)
          .toList();

      _updateFoodOrDrinkCategory(updatedCategories, menuCategory);

      emit(_ShowSnackbar(_vm, S.current.categoryTitleUpdated));
    }, failure: (e) {
      emit(_Error(e.errorMsg, _vm));
      return;
    });
  }

  void deleteCategory(CategoryDM subCategory, MenuCategory menuCategory) async {
    emit(_Loading(_vm));

    final categoryResult = await (menuCategory.isFood
        ? _businessRepo.deleteFoodCategory(subCategory.uuid)
        : _businessRepo.deleteDrinkCategory(subCategory.uuid));

    await categoryResult.when(success: (data) async {
      final updatedCategories = List<CategoryDM>.from(_vm.editMenuDM?.subCategories[menuCategory] ?? [])
        ..removeWhere((cat) => cat.uuid == subCategory.uuid);

      // Update both editMenuDM and menuDM
      _vm = _vm.copyWith(
        editMenuDM: menuCategory.isFood
            ? _vm.editMenuDM?.copyWith(foodCategories: updatedCategories)
            : _vm.editMenuDM?.copyWith(drinkCategories: updatedCategories),
        menuDM: menuCategory.isFood
            ? _vm.menuDM?.copyWith(foodCategories: updatedCategories)
            : _vm.menuDM?.copyWith(drinkCategories: updatedCategories),
      );

      emit(_ShowSnackbar(_vm, S.current.categoryDeletedSuccess));
    }, failure: (e) {
      emit(_Error(e.errorMsg, _vm));
      return;
    });
  }

  MenuDM? _updateMenuWithItem(ItemDM item, MenuCategory menuCategory, CategoryDM? subCategory, MenuDM? menu) {
    if (menuCategory.isCombos) {
      return menu?.copyWith(
        combos: menu.combos.map((i) => i.uuid == item.uuid || i.isNewItem ? item : i).toList(),
      );
    }

    return menu?.copyWith(
      foodCategories: menuCategory.isFood
          ? menu.foodCategories
              .map((cat) => cat.uuid == subCategory?.uuid
                  ? cat.copyWith(
                      items: subCategory!.items.map((i) => i.uuid == item.uuid || i.isNewItem ? item : i).toList())
                  : cat.copyWith(items: cat.items.map((i) => i.isNewItem ? item : i).toList()))
              .toList()
          : menu.foodCategories,
      drinkCategories: menuCategory.isDrinks
          ? menu.drinkCategories
              .map((cat) => cat.uuid == subCategory?.uuid
                  ? cat.copyWith(
                      items: subCategory!.items.map((i) => i.uuid == item.uuid || i.isNewItem ? item : i).toList())
                  : cat.copyWith(items: cat.items.map((i) => i.isNewItem ? item : i).toList()))
              .toList()
          : menu.drinkCategories,
    );
  }

  Future<void> storeItem(ItemDM item, MenuCategory menuCategory, CategoryDM? subCategory) async {
    emit(_Loading(_vm));

    // Verificar si es necesario hacer update del item
    final originalItem = menuCategory.isCombos
        ? _vm.menuDM?.combos.firstWhereOrNull((i) => i.uuid == item.uuid)
        : _vm.menuDM?.subCategories[menuCategory]
            ?.firstWhereOrNull((cat) => cat.uuid == subCategory?.uuid)
            ?.items
            .firstWhereOrNull((i) => i.uuid == item.uuid);

    final hasItemChanges = !item.isNewItem &&
        originalItem != null &&
        (item.name != originalItem.name ||
            item.description != originalItem.description ||
            !listEquals(item.versions, originalItem.versions) ||
            item.prices != originalItem.prices ||
            item.available != originalItem.available);

    final hasPhotoChanges = item.imagePaths.isNotEmpty;

    // Validar que tengamos una categoría válida
    if (subCategory == null && !menuCategory.isCombos) {
      emit(_Error(S.current.validCategoryRequired, _vm));
      return;
    }

    void updateItemData(ItemDM updatedItem) {
      _vm = _vm.copyWith(
        menuDM: _updateMenuWithItem(updatedItem, menuCategory, subCategory, _vm.menuDM),
        editMenuDM: _updateMenuWithItem(updatedItem, menuCategory, subCategory, _vm.editMenuDM),
      );
    }

    // Si el item no es nuevo y solo cambiara las fotos:
    if (!item.isNewItem && !hasItemChanges && hasPhotoChanges) {
      await _storeOrUpdateItemPhoto(item, menuCategory, updateItemData);
      emit(_ShowSnackbar(_vm, S.current.itemUpdatedSuccess));
      return;
    }

    // Si es una nueva categoría, crearla primero
    if (subCategory?.uuid == FoodlyStrings.NEW_CATEGORY && !menuCategory.isCombos) {
      final subCategoryBody = CategoryDTO(name: subCategory?.name.trim() ?? '', businessMenuId: _vm.menuDM?.id);

      if (subCategoryBody.name.isEmpty) {
        emit(_Error(S.current.categoryNameEmpty, _vm));
        return;
      }

      final categoryResult = await (menuCategory.isFood
          ? _businessRepo.createFoodCategory(subCategoryBody)
          : _businessRepo.createDrinkCategory(subCategoryBody));

      await categoryResult.when(success: (data) async {
        // Actualizar el categoryId del item y su estado de edición
        item = item.copyWith(
          foodCategoryId: menuCategory.isFood ? data.id : null,
          drinkCategoryId: menuCategory.isDrinks ? data.id : null,
          comboCategoryId: menuCategory.isCombos ? data.id : null,
          editingField: ItemEditing.none, // Asegurar que salga del modo edición
        );

        // Crear una nueva instancia de la categoría con todos los campos necesarios
        final updatedCategory = data.copyWith(
          items: [item],
          editingName: false,
          uuid: data.uuid,
          id: data.id,
        );

        final updatedCategories = List<CategoryDM>.from(_vm.editMenuDM?.subCategories[menuCategory] ?? [])
            .map((cat) => cat.uuid == FoodlyStrings.NEW_CATEGORY ? updatedCategory : cat)
            .toList();

        _updateFoodOrDrinkCategory(updatedCategories, menuCategory);

        // Actualizar también el menú original
        _vm = _vm.copyWith(
          menuDM: _vm.menuDM?.copyWith(
            foodCategories: menuCategory.isFood ? updatedCategories : _vm.menuDM?.foodCategories ?? [],
            drinkCategories: menuCategory.isDrinks ? updatedCategories : _vm.menuDM?.drinkCategories ?? [],
          ),
        );
      }, failure: (e) {
        emit(_Error(e.errorMsg, _vm));
        return;
      });
    }

    try {
      final response = await (item.isNewItem
          ? _businessRepo.createItem(
              item,
              menuCategory,
              comboCategoryId: _vm.menuDM?.id,
            )
          : _businessRepo.updateItem(
              item,
              menuCategory,
              comboCategoryId: _vm.menuDM?.id,
            ));

      response.when(
        success: (updatedItem) async {
          if (item.imagePaths.isNotEmpty && updatedItem.id != null) {
            updatedItem = await _storeOrUpdateItemPhoto(
              updatedItem.copyWith(imagePaths: item.imagePaths),
              menuCategory,
              updateItemData,
            );
          } else {
            updateItemData(updatedItem);
          }

          emit(_ShowSnackbar(_vm, item.isNewItem ? S.current.itemCreatedSuccess : S.current.itemUpdatedSuccess));
        },
        failure: (error) => emit(_Error(error.errorMsg, _vm)),
      );
    } catch (e) {
      emit(_Error(e.toString(), _vm));
    }
  }

  Future<ItemDM> _storeOrUpdateItemPhoto(
    ItemDM item,
    MenuCategory menuCategory,
    void Function(ItemDM updatedItem) updateItemData,
  ) async {
    final hasExistingPhotos = item.referencePhotos?.isNotEmpty ?? false;

    final photoResponse = hasExistingPhotos
        ? await _businessRepo.updateItemPhotos(
            filePaths: item.imagePaths,
            uuid: item.referencePhotos?.lastOrNull?.uuid ?? '',
            menuCategory: menuCategory,
          )
        : await _businessRepo.storeItemPhotos(
            filePaths: item.imagePaths,
            itemId: item.id!,
            menuCategory: menuCategory,
          );

    await photoResponse.when(
      success: (data) {
        item = item.copyWith(
          newPhotos: data.foodReferencePhotos ?? data.drinkReferencePhotos ?? data.comboReferencePhotos,
          editingField: ItemEditing.none,
          photosRemovedDuringEdition: hasExistingPhotos,
        );
        updateItemData(item);
      },
      failure: (error) async {
        di<Logger>().e(error.errorMsg);
        emit(_Error(S.current.photosSaveError(hasExistingPhotos ? 'updating' : 'saving', error.errorMsg), _vm));
      },
    );
    return item;
  }

  Future<void> deleteItem(ItemDM item, MenuCategory menuCategory) async {
    emit(_Loading(_vm));

    final deleteFunction = {
      MenuCategory.food: _businessRepo.deleteFoodItem,
      MenuCategory.drinks: _businessRepo.deleteDrinkItem,
      MenuCategory.combos: _businessRepo.deleteComboItem,
    }[menuCategory];

    if (deleteFunction == null) {
      emit(_Error(S.current.invalidMenuCategory, _vm));
      return;
    }

    final result = await deleteFunction(item.uuid);

    result.when(
      success: (_) async {
        if (menuCategory.isCombos) {
          final updatedCombos = (_vm.editMenuDM?.combos ?? []).where((i) => i.uuid != item.uuid).toList();

          _vm = _vm.copyWith(
            editMenuDM: _vm.editMenuDM?.copyWith(combos: updatedCombos),
            menuDM: _vm.menuDM?.copyWith(combos: updatedCombos),
          );
        } else {
          final updatedCategories = _vm.editMenuDM?.subCategories[menuCategory]?.map((category) {
            final updatedItems = category.items.where((i) => i.uuid != item.uuid).toList();
            return category.copyWith(items: updatedItems);
          }).toList();

          if (updatedCategories != null) {
            _updateFoodOrDrinkCategory(updatedCategories, menuCategory);
          }
        }

        emit(_ShowSnackbar(_vm, S.current.itemDeletedSuccess));
      },
      failure: (e) => emit(_Error(e.errorMsg, _vm)),
    );
  }

  Future<void> deleteItemPhotos(ItemDM item, MenuCategory menuCategory, String subCategoryUuid) async {
    _vm = _vm.copyWith(avoidFocus: true);
    emit(_Loading(_vm));

    final result = await _businessRepo.deleteItemPhotos(
      uuid: item.referencePhotos?.lastOrNull?.uuid ?? '',
      menuCategory: menuCategory,
    );

    result.when(
      success: (_) {
        final updatedItem = item.copyWith(
          newPhotos: null,
          imagePaths: [],
          foodPhotos: null,
          drinkPhotos: null,
          comboPhotos: null,
          photosRemovedDuringEdition: item.isEditing,
        );

        updateItem(
          updatedItem,
          menuCategory,
          subCategoryUuid,
          showModal: true,
          message: S.current.photosDeletedSuccess,
          updateOriginalMenuDM: true,
        );
      },
      failure: (error) => emit(_Error(S.current.failedDeletePhotos(error.errorMsg), _vm)),
    );
  }
}
