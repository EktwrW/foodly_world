import 'package:flutter/cupertino.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/ui/shared_widgets/cards/business_card.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/home/pages/foodly_main_page/foodly_main_page.dart';
import 'package:foodly_world/ui/views/home/pages/my_favorites_page/cubit/my_favorites_cubit.dart';
import 'package:foodly_world/ui/views/home/widgets/secondary_main_app_bar.dart';
import 'package:local_hero/local_hero.dart';
import 'package:toggle_switch/toggle_switch.dart';

part 'widgets/my_favorites_business_view.dart';
part 'widgets/my_favorites_toggle_switch.dart';
part 'widgets/business_sort_selector.dart';

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

class _MyFavoritesPageContent extends StatelessWidget {
  const _MyFavoritesPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MyFavoritesCubit, MyFavoritesState, bool>(
      selector: (state) {
        return state.vm.isInitializing;
      },
      builder: (context, isInitializing) {
        return AnimatedCrossFade(
          duration: Durations.medium4,
          crossFadeState: isInitializing ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: const Center(child: LoadingWidgetFoodlyIso(height: 90)),
          secondChild: const MyFavoriteBusinessesView(),
        );
      },
    );
  }
}
