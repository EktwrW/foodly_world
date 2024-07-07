import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/routing/app_router.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/rounded_button.dart';
import 'package:foodly_world/ui/shared_widgets/dialogs/dialog_service.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/editable_avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/image_slider_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/utils/image_picker_and_cropper.dart';
import 'package:foodly_world/ui/views/business/bloc/business_bloc.dart';
import 'package:foodly_world/ui/views/business/widgets/business_name/business_name.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart' as ui;
import 'package:icons_plus/icons_plus.dart' show Bootstrap, Clarity;

class BusinessSliverAppBar extends StatelessWidget {
  const BusinessSliverAppBar({super.key});

  get userAvatarWdg => AvatarWidget(
        avatarUrl: di<AuthSessionService>().userSessionDM?.user.avatarUrl,
        height: 45,
        width: 45,
      );

  static final isExpanded = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessBloc, BusinessState>(
      builder: (context, state) {
        final vm = state.vm;
        final bloc = context.read<BusinessBloc>();

        return SliverAppBar(
          centerTitle: true,
          toolbarHeight: 70,
          leadingWidth: 76,
          expandedHeight: vm.isEditingName ? 420 : 350,
          collapsedHeight: vm.isEditingName ? 200 : 110,
          shape: UIDecorations.SLIVER_APP_BAR_BOTTOM_SHAPE,
          pinned: true,
          floating: true,
          title: Text(
            S.current.dashboard,
            style: FoodlyTextStyles.secondaryTitle,
          ),
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: RoundedButtonMobileFoodly(
                  shape: ui.NeumorphicShape.concave,
                  iconSize: 26,
                  depth: 2,
                  diameter: 30,
                  iconData: Bootstrap.caret_left_fill,
                  onPressed: () => di<AppRouter>().goBackToLastRoute(context),
                ).paddingSymmetric(vertical: 8, horizontal: 15),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: ValueListenableBuilder(
                    valueListenable: isExpanded,
                    builder: (_, isExpandedValue, __) {
                      if (vm.currentBusiness?.logo?.isNotEmpty ?? false) {
                        return AnimatedCrossFade(
                          firstChild: userAvatarWdg,
                          secondChild: AvatarWidget(
                            avatarUrl: vm.currentBusiness?.logo,
                            height: 45,
                            width: 45,
                          ),
                          crossFadeState: isExpandedValue ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                          duration: Durations.medium3,
                        );
                      }
                      return userAvatarWdg;
                    },
                  ),
                ),
              ],
            ).paddingRight(15),
          ],
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              var top = constraints.biggest.height;
              WidgetsBinding.instance.addPostFrameCallback((_) => isExpanded.value = top >= 250);

              return FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                titlePadding: EdgeInsets.zero,
                centerTitle: true,
                expandedTitleScale: vm.isEditingName ? 1 : 1.5,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [BusinessNameWdg(vm: vm)],
                ).paddingHorizontal(14),
                background: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: SizedBox(
                          height: 296,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: ColoredBox(
                                  color: FoodlyThemes.primaryFoodly.withOpacity(0.1),
                                  child: SizedBox(
                                    height: 165,
                                    width: double.infinity,
                                    child: (vm.currentBusiness?.coverImages.isNotEmpty ?? false)
                                        ? ImageSliderFade(
                                            imageList: vm.currentBusiness!.coverImageUrls
                                                .map(
                                                  (e) => CachedNetworkImage(
                                                    imageUrl: e,
                                                    width: double.infinity,
                                                    fadeInDuration: Durations.medium2,
                                                    fit: BoxFit.fitWidth,
                                                    progressIndicatorBuilder: (context, url, progress) =>
                                                        const LoadingWidgetFoodlyLogo(),
                                                  ),
                                                )
                                                .toList(),
                                          )
                                        : Icon(Clarity.picture_solid,
                                            color: FoodlyThemes.primaryFoodly.withOpacity(.75), size: 140),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: SizedBox.square(
                                  dimension: 45,
                                  child: RoundedButtonMobileFoodly(
                                    onPressed: () => bloc.add(const BusinessEvent.editCoverImagesDialog()),
                                    buttonColor: FoodlyThemes.primaryFoodly.withOpacity(.15),
                                    iconColor: Colors.white70,
                                    iconData: Bootstrap.pencil_square,
                                    iconSize: 28,
                                    iconShape: ui.NeumorphicShape.concave,
                                    shape: ui.NeumorphicShape.concave,
                                    disableDepth: true,
                                  ),
                                ).paddingAll(6),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: EditableAvatarWdg(
                                  onPressed: () async => await pickImageFile(
                                    context,
                                    ImageSource.gallery,
                                  ).then((path) => bloc.add(BusinessEvent.updateLogo(path))),
                                  avatarType: AvatarType.business,
                                  size: const Size(85, 85),
                                  paddingAll: 0,
                                  imageUrl: vm.currentBusiness?.logo,
                                ),
                              ),
                            ],
                          ).paddingOnly(top: 80),
                        ),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
