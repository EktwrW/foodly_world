import 'dart:io';

import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart' show ListExtensions;
import 'package:flutter_neumo/flutter_neumo.dart' as ui;
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/core_exports.dart' hide CategoryDM;
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/favorite_button.dart';
import 'package:foodly_world/ui/shared_widgets/placeholders/no_items_view_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/visited_business/menu/cubit/menu_cubit.dart';
import 'package:foodly_world/ui/views/visited_business/menu/view_model/menu_vm.dart';

import 'package:google_fonts/google_fonts.dart';

part 'adaptive_item_version_selector_wdg.dart';
part 'menu_item_wdgs/fav_and_edit_item_btns.dart';
part 'menu_item_wdgs/item_name_and_description_wdg.dart';
part 'menu_item_wdgs/menu_disclaimer_wdg.dart';
part 'menu_item_wdgs/menu_item_picture_wdg.dart';
part 'menu_item_wdgs/menu_item_wdg.dart';
part 'sub_category_wdg.dart';

// Widget separado para mejorar el rendimiento de la paginación
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
  final MenuVM vm;
  final MenuCategory menuCategory;
  final VoidCallback onScrollStart;
  final VoidCallback onScrollEnd;

  @override
  State<MenuCategoryPage> createState() => _MenuCategoryPageState();
}

class _MenuCategoryPageState extends State<MenuCategoryPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final cubit = context.read<MenuCubit>();

    return Column(
      children: [
        if (widget.categories?.isEmpty ?? true)
          Expanded(child: const NoItemsViewWdg().paddingBottom(80))
        else
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
                key: PageStorageKey('menu_category_${widget.menuCategory.name}'),
                // No usar controller aquí para evitar conflictos con NestedScrollView
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: widget.categories?.length ?? 0, padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final subCategory = widget.categories?[index];
                  final isLastSubCategory = index == ((widget.categories?.length ?? 1000) - 1);

                  return SubCategoryWdg(
                    key: ValueKey(subCategory?.uuid),
                    menuCategory: widget.menuCategory,
                    cubit: cubit,
                    subCategory: subCategory,
                    isLastSubCategory: isLastSubCategory,
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
