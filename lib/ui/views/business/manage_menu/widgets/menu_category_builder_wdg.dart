import 'dart:io';

import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clay_containers/widgets/clay_text.dart';
import 'package:collection/collection.dart' show ListExtensions;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/core_exports.dart' show FoodlyStrings, FoodlyThemes, S;
import 'package:foodly_world/core/extensions/iterable_extension.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart' show di;
import 'package:foodly_world/core/services/foodly_image_cache.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/ui/constants/image_decode_sizes.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/favorite_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/save_and_cancel_buttons.dart';
import 'package:foodly_world/ui/shared_widgets/dialogs/dialog_service.dart' show LoadingWidgetFoodlyIso;
import 'package:foodly_world/ui/shared_widgets/image/feed_multi_image_view/feed_multi_image_view.dart' show ImageViewer;
import 'package:foodly_world/ui/shared_widgets/image/feed_multi_image_view/feed_multi_image_view.dart';
import 'package:foodly_world/ui/shared_widgets/menu/menu_item_price_tag.dart';
import 'package:foodly_world/ui/shared_widgets/placeholders/no_items_view_wdg.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/utils/image_picker_and_cropper.dart';
import 'package:foodly_world/ui/views/business/manage_menu/cubit/manage_menu_cubit.dart';
import 'package:foodly_world/ui/views/business/manage_menu/view_model/manage_menu_vm.dart';
import 'package:foodly_world/ui/views/business/manage_menu/widgets/menu_snackbars.dart';
import 'package:foodly_world/ui/views/business/menu_import/widgets/menu_import_empty_state_wdg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap, BoxIcons, EvaIcons;
import 'package:logger/logger.dart';

part 'adaptive_item_version_selector_wdg.dart';
part 'manage_menu_item_wdgs/fav_and_edit_item_btns.dart';
part 'manage_menu_item_wdgs/item_name_and_description_wdg.dart';
part 'manage_menu_item_wdgs/menu_disclaimer_wdg.dart';
part 'manage_menu_item_wdgs/menu_item_picture_wdg.dart';
part 'manage_menu_item_wdgs/menu_item_wdg.dart';
part 'sub_category_wdg.dart';

class MenuCategoryPage extends StatefulWidget {
  const MenuCategoryPage({
    super.key,
    required this.categories,
    required this.vm,
    required this.menuCategory,
    required this.onScrollStart,
    required this.onScrollEnd,
  });

  final List<CategoryDM>? categories;
  final ManageMenuVM vm;
  final MenuCategory menuCategory;
  final VoidCallback onScrollStart;
  final VoidCallback onScrollEnd;

  @override
  State<MenuCategoryPage> createState() => _MenuCategoryPageState();
}

class _MenuCategoryPageState extends State<MenuCategoryPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ManageMenuCubit>();

    return Column(
      children: [
        if (widget.menuCategory != MenuCategory.combos)
          _CategoryEditButtons(
            key: const Key('add-new-sub-category'),
            editMode: widget.vm.editMode,
            canAdd: !widget.vm.menuIsEditing,
            onPressed: () {
              cubit.addNewSubCategory(widget.menuCategory);
              ScaffoldMessenger.maybeOf(context)?.hideCurrentSnackBar();
            },
            iconData: Bootstrap.plus_circle,
            text: S.current.addNewCategory,
          ),
        if ((widget.categories?.isEmpty ?? false) && !widget.vm.editMode)
          // Empty state contextual:
          //   - Manager logueado + categoría vacía + no en editMode →
          //     banner hero del feature "Importar menú con IA" con CTA
          //     directo a la ruta `manageMenuImport`. Es el path más
          //     prominente; la creación manual sigue disponible vía FAB.
          //   - Visitor (no manager) → mantenemos el `NoItemsViewWdg`
          //     plano que ya existía: "no hay items aún" con asset
          //     genérico de menú vacío.
          Flexible(
            child: (widget.vm.loggerUserCanEdit && (widget.vm.menuDM?.uuid.isNotEmpty ?? false))
                ? MenuImportEmptyStateWdg(menuUuid: widget.vm.menuDM!.uuid).paddingBottom(90)
                : const NoItemsViewWdg().paddingBottom(90),
          ),
        if (widget.categories?.isNotEmpty ?? false)
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollStartNotification) {
                  widget.onScrollStart();
                } else if (notification is ScrollEndNotification) {
                  widget.onScrollEnd();
                }
                return true;
              },
              child: ListView.builder(
                controller: _scrollController,
                key: PageStorageKey('menu_category_${widget.menuCategory.name}'),
                // No usar controller aquí para evitar conflictos con NestedScrollView
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: widget.categories?.length ?? 0,
                padding: const EdgeInsets.only(bottom: 90),
                itemBuilder: (context, index) {
                  final subCategory = widget.categories?[index];
                  final isLastSubCategory = index == ((widget.categories?.length ?? 1000) - 1);

                  return SubCategoryWdgKeepAlive(
                    key: ValueKey(subCategory?.uuid),
                    menuCategory: widget.menuCategory,
                    cubit: cubit,
                    subCategory: subCategory,
                    isLastSubCategory: isLastSubCategory,
                    categoryIndex: index,
                    totalCategories: widget.categories?.length ?? 0,
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}

// Widget envoltorio para SubCategoryWdg con keep-alive
class SubCategoryWdgKeepAlive extends StatefulWidget {
  const SubCategoryWdgKeepAlive({
    super.key,
    required this.menuCategory,
    required this.cubit,
    required this.subCategory,
    required this.isLastSubCategory,
    required this.categoryIndex,
    required this.totalCategories,
  });

  final MenuCategory menuCategory;
  final ManageMenuCubit cubit;
  final CategoryDM? subCategory;
  final bool isLastSubCategory;
  final int categoryIndex;
  final int totalCategories;

  @override
  State<SubCategoryWdgKeepAlive> createState() => _SubCategoryWdgKeepAliveState();
}

class _SubCategoryWdgKeepAliveState extends State<SubCategoryWdgKeepAlive> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return RepaintBoundary(
      child: SubCategoryWdg(
        key: ObjectKey(widget.subCategory?.uuid),
        menuCategory: widget.menuCategory,
        cubit: widget.cubit,
        subCategory: widget.subCategory,
        isLastSubCategory: widget.isLastSubCategory,
        categoryIndex: widget.categoryIndex,
        totalCategories: widget.totalCategories,
      ),
    );
  }
}

class _CategoryEditButtons extends StatelessWidget {
  const _CategoryEditButtons({
    super.key,
    required this.editMode,
    required this.canAdd,
    required this.onPressed,
    required this.text,
    required this.iconData,
    this.isSubCategory = false,
  });

  final bool editMode;
  final bool canAdd;
  final VoidCallback onPressed;
  final String text;
  final IconData iconData;
  final bool isSubCategory;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Durations.medium4,
      child: AnimatedOpacity(
        duration: Durations.long2,
        opacity: editMode ? 1 : 0.0,
        child: SizedBox(
          height: editMode ? null : 0,
          child: TextButton(
            onPressed: canAdd ? onPressed : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isSubCategory)
                  ClayText(
                    text,
                    textColor: canAdd ? FoodlyThemes.primaryFoodly : Colors.grey,
                    style: FoodlyTextStyles.sectionsTitle.copyWith(fontSize: 15),
                  ).paddingLeft(10),
                if (isSubCategory)
                  IconButton.outlined(
                    onPressed: canAdd ? onPressed : null,
                    tooltip: text,
                    style: const ButtonStyle(
                      side: WidgetStatePropertyAll(BorderSide(color: FoodlyThemes.secondaryFoodly)),
                    ),
                    color: FoodlyThemes.primaryFoodly,
                    constraints: BoxConstraints.tight(const Size(30, 30)),
                    icon: Icon(iconData, size: 18),
                    padding: EdgeInsets.zero,
                  )
                else
                  IconButton.filled(
                    onPressed: canAdd ? onPressed : null,
                    tooltip: text,
                    constraints: BoxConstraints.tight(const Size(24, 24)),
                    icon: Icon(iconData, size: 16, color: Colors.white),
                    padding: EdgeInsets.zero,
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
