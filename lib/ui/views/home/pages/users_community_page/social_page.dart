import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, ReadContext;
import 'package:foodly_world/core/core_exports.dart'
    show FoodlyThemes, PaddingExtension, ScreenSizeExtension, di, DialogService;
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/cubit/social_cubit.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/view_model/social_vm.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/widgets/create_post_dialog.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/widgets/posts_feed_wdg.dart';
import 'package:foodly_world/ui/views/home/widgets/main_search_widget.dart' show CurrentLocationButton;
import 'package:foodly_world/ui/views/home/widgets/secondary_main_app_bar.dart';
import 'package:toggle_switch/toggle_switch.dart' show ToggleSwitch;

class SocialPage extends StatefulWidget {
  const SocialPage({super.key});

  @override
  State<SocialPage> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  @override
  void initState() {
    super.initState();
    context.read<SocialCubit>().loadPosts(refresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryMainAppBar(
        key: Key('community-app-bar'),
        actionText: 'Social Community',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => CreatePostDialog.show(context),
        backgroundColor: FoodlyThemes.primaryFoodly,
        child: const Icon(Icons.edit, color: Colors.white),
      ).paddingOnly(bottom: 80, right: 12),
      body: BlocConsumer<SocialCubit, SocialState>(
        listener: (context, state) {
          final dialogService = di<DialogService>();

          state.whenOrNull(
            loading: (vm) => dialogService.showLoading(),
            loaded: (vm) => dialogService.hideLoading(),
            error: (vm, message) {
              dialogService.hideLoading();
              FoodlySnackbars.errorGeneric(context, message);
            },
          );
        },
        builder: (context, state) {
          final vm = state.vm;

          return Column(
            children: [
              const CurrentLocationButton().paddingSymmetric(horizontal: 12, vertical: 24),
              ToggleSwitch(
                labels: SocialPageViews.values.map((e) => e.title).toList(),
                initialLabelIndex: vm.currentView.index,
                animate: true,
                animationDuration: 500,
                minHeight: 30,
                minWidth: (context.screenWidth - 44) / 2,
                cornerRadius: 6.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white,
                totalSwitches: SocialPageViews.values.length,
                customTextStyles: const [
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                ],
                borderColor: const [
                  FoodlyThemes.tertiaryFoodly,
                  FoodlyThemes.secondaryFoodly,
                  FoodlyThemes.primaryFoodly,
                ],
                dividerColor: FoodlyThemes.secondaryFoodly,
                activeBgColors: const [
                  [FoodlyThemes.primaryFoodly],
                  [FoodlyThemes.primaryFoodly],
                ],
                onToggle: (index) {
                  if (index != null) {
                    context.read<SocialCubit>().changeView(SocialPageViews.values[index]);
                  }
                },
              ),
              const SizedBox(height: 12),
              Expanded(
                child: IndexedStack(
                  index: vm.currentView.index,
                  children: const [
                    PostsFeedWidget(),
                    Center(child: Text('Users - Coming Soon')),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
