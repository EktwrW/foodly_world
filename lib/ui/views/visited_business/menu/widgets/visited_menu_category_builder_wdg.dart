import 'dart:async' show Timer;
import 'dart:io';

import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart' show ListExtensions;
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/core_exports.dart' hide CategoryDM;
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/favorite_button.dart';
import 'package:foodly_world/ui/shared_widgets/image/feed_multi_image_view/feed_multi_image_view.dart';
import 'package:foodly_world/ui/shared_widgets/menu/menu_item_price_tag.dart';
import 'package:foodly_world/ui/shared_widgets/placeholders/no_items_view_wdg.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/manage_menu/widgets/menu_category_builder_wdg.dart'
    show MenuDisclaimerWdg;
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:foodly_world/ui/views/visited_business/menu/cubit/visited_menu_cubit.dart';
import 'package:foodly_world/ui/views/visited_business/menu/view_model/menu_vm.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show BoxIcons;

// El selector de versiones ahora está integrado en visited_menu_item_wdg.dart
part 'menu_item_wdgs/fav_menu_item_btns.dart';
part 'menu_item_wdgs/item_name_and_description_wdg.dart';
part 'menu_item_wdgs/visited_menu_item_picture_wdg.dart';
part 'menu_item_wdgs/visited_menu_item_wdg.dart';
part 'sub_category_wdg.dart';

// Widget separado para mejorar el rendimiento de la paginación
class VisitedMenuCategoryPage extends StatefulWidget {
  const VisitedMenuCategoryPage({
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
  State<VisitedMenuCategoryPage> createState() => _VisitedMenuCategoryPageState();
}

class _VisitedMenuCategoryPageState extends State<VisitedMenuCategoryPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final cubit = context.read<VisitedMenuCubit>();

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
                controller: _scrollController,
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
