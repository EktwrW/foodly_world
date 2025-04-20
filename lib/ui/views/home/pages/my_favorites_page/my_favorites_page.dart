import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/extensions/category_extension.dart';
import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/core/extensions/string_extensions.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/favorite_button.dart';
import 'package:foodly_world/ui/shared_widgets/cards/business_card.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_main_page.dart';
import 'package:foodly_world/ui/views/home/pages/my_favorites_page/cubit/my_favorites_cubit.dart';
import 'package:foodly_world/ui/views/home/widgets/secondary_main_app_bar.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:local_hero/local_hero.dart';
import 'package:share_plus/share_plus.dart';
import 'package:toggle_switch/toggle_switch.dart';

part 'my_favorites_views/my_favorite_businesses_view.dart';
part 'my_favorites_views/widgets/my_favorites_toggle_switch.dart';
part 'my_favorites_views/widgets/business_sort_selector.dart';
part 'my_favorites_views/my_favorite_menus_view.dart';

class MyFavoritesPage extends StatelessWidget {
  const MyFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyFavoritesCubit, MyFavoritesState>(
      listener: (context, state) {
        final dialogService = di<DialogService>();

        state.whenOrNull(
          loading: (vm) => vm.isInitializing ? null : dialogService.showLoading(),
          loaded: (_) => dialogService.hideLoading(),
          error: (_, msg) {
            dialogService.hideLoading();
            if (context.mounted) {
              FoodlySnackbars.errorGeneric(context, msg);
            }
          },
        );
      },
      child: Scaffold(
        appBar: const SecondaryMainAppBar(
          key: Key('my-favorites-app-bar'),
          actionText: 'My Favorites',
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, __) => const [_MyFavoritesToggleSwitch(key: Key('my-favorites-toggle-switch'))],
          body: const _MyFavoritesPageContent(key: Key('my-favorites-content')),
        ),
      ),
    );
  }
}

const _myFavoritesViews = [
  MyFavoriteBusinessesView(),
  MyFavoriteMenusView(),
  Text('Items'),
];

class _MyFavoritesPageContent extends StatelessWidget {
  const _MyFavoritesPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyFavoritesCubit>();

    return BlocSelector<MyFavoritesCubit, MyFavoritesState, bool>(
      selector: (state) {
        return state.vm.isInitializing;
      },
      builder: (context, isInitializing) {
        return AnimatedCrossFade(
          duration: Durations.medium4,
          crossFadeState: isInitializing ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: const Center(child: LoadingWidgetFoodlyIso(height: 90)),
          secondChild: BlocSelector<MyFavoritesCubit, MyFavoritesState, PageController?>(
            selector: (state) {
              return state.vm.controller;
            },
            builder: (context, controller) {
              return SizedBox.fromSize(
                size: Size(context.screenWidth, context.screenHeight),
                child: PageView.builder(
                  controller: controller,
                  physics: const PageScrollPhysics(),
                  itemCount: _myFavoritesViews.length,
                  onPageChanged: (i) => cubit.changeView(i),
                  itemBuilder: (context, index) => _myFavoritesViews[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
