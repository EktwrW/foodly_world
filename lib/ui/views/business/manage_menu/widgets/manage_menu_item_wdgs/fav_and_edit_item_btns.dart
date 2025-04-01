part of '../menu_category_builder_wdg.dart';

class FavAndEditItemBtns extends StatelessWidget {
  const FavAndEditItemBtns({
    super.key,
    required this.subCategory,
    required this.item,
    required this.menuCategory,
  });

  final CategoryDM subCategory;
  final ItemDM item;
  final MenuCategory menuCategory;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageMenuCubit, ManageMenuState>(
      builder: (context, state) {
        final vm = state.vm;
        final cubit = context.read<ManageMenuCubit>();

        if (vm.editMode) {
          return PopupMenuButton<String>(
            enabled: !vm.menuIsEditing || item.isEditing, // Habilitar solo si no hay otros en edición o es este item
            offset: const Offset(-10, 10),
            surfaceTintColor: Colors.white,
            icon: Icon(
              Bootstrap.three_dots_vertical,
              color: vm.menuIsEditing && !item.isEditing ? Colors.grey : FoodlyThemes.primaryFoodly,
              size: 22,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'edit',
                enabled: !vm.menuIsEditing || item.isEditing,
                child: Row(
                  children: [
                    Icon(
                      item.isEditing ? Icons.settings_backup_restore : Bootstrap.pencil_square,
                      size: 16,
                      color: vm.menuIsEditing && !item.isEditing ? Colors.grey : FoodlyThemes.primaryFoodly,
                    ),
                    Text(
                      item.isEditing ? S.current.cancelEdit : S.current.edit,
                      style: TextStyle(
                        color: vm.menuIsEditing && !item.isEditing ? Colors.grey : FoodlyThemes.primaryFoodly,
                      ),
                    ).paddingLeft(8),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'delete',
                enabled: !vm.menuIsEditing || item.isEditing,
                child: Row(
                  children: [
                    Icon(
                      Bootstrap.trash3,
                      size: 16,
                      color: vm.menuIsEditing && !item.isEditing ? Colors.grey : FoodlyThemes.primaryFoodly,
                    ),
                    Text(
                      S.current.delete,
                      style: TextStyle(
                        color: vm.menuIsEditing && !item.isEditing ? Colors.grey : FoodlyThemes.primaryFoodly,
                      ),
                    ).paddingLeft(8),
                  ],
                ),
              ),
              if (item.hasSavedPhotos)
                PopupMenuItem(
                  value: 'remove-photos',
                  enabled: !vm.menuIsEditing || item.isEditing,
                  child: Row(
                    children: [
                      Icon(
                        Bootstrap.trash2,
                        size: 16,
                        color: vm.menuIsEditing && !item.isEditing ? Colors.grey : FoodlyThemes.primaryFoodly,
                      ),
                      Text(
                        S.current.removePhotos,
                        style: TextStyle(
                          color: vm.menuIsEditing && !item.isEditing ? Colors.grey : FoodlyThemes.primaryFoodly,
                        ),
                      ).paddingLeft(8),
                    ],
                  ),
                ),
            ],
            onSelected: (value) {
              switch (value) {
                case 'edit':
                  if (item.isEditing) {
                    cubit.cancelEditItemOrSubCategory(
                        itemRecord: item.photosRemovedDuringEdition ? (item, menuCategory, subCategory.uuid) : null);
                    break;
                  }

                  cubit.updateItemNameOrDescription(
                    item.copyWith(editingField: ItemEditing.name),
                    menuCategory,
                    subCategory.uuid,
                  );
                  break;
                case 'delete':
                  MenuSnackbars.showDeleteItemSnackBar(
                    context,
                    cubit,
                    item,
                    menuCategory,
                  );
                case 'remove-photos':
                  cubit.deleteItemPhotos(item, menuCategory, subCategory.uuid);
                  break;
              }
            },
          );
        }

        return (menuCategory.isDrinks
                ? FavoriteButton.forDrinkItem(
                    key: Key(item.uuid),
                    diameter: 28,
                    iconSize: 16,
                    item: item,
                  )
                : FavoriteButton.forFoodItem(
                    key: Key(item.uuid),
                    diameter: 28,
                    iconSize: 16,
                    item: item,
                  ))
            .paddingOnly(top: 4, right: 2);
      },
    );
  }
}
