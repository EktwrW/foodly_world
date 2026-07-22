import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/animations/sliver_app_bar_animations.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/editable_avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/feed_multi_image_view/feed_multi_image_view.dart';
import 'package:foodly_world/ui/shared_widgets/image/image_slider_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/utils/image_picker_and_cropper.dart';
import 'package:foodly_world/ui/views/business/widgets/business_name/business_name.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap, Clarity;

class BusinessSliverAppBar extends StatelessWidget {
  const BusinessSliverAppBar({super.key});

  Widget get _userAvatarWdg => AvatarWidget(
        avatarUrl: di<AuthSessionService>().userSessionDM?.user.avatarUrl,
        height: SliverAppBarActionWidgets.buttonDiameter,
        width: SliverAppBarActionWidgets.buttonDiameter,
      );

  static final _isExpanded = ValueNotifier<bool>(true);

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
          expandedHeight: vm.isEditingName ? 450 : 380,
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
                child: CustomRoundedNeumorphicButton(
                  shape: ui.NeumorphicShape.concave,
                  iconSize: 26,
                  diameter: 30,
                  iconData: Bootstrap.caret_left_fill,
                  onPressed: () {
                    context.read<MainDrawerCubit>().goToPreviousIndex();
                    di<AppRouter>().goBackToLastRoute();
                  },
                ).paddingSymmetric(vertical: 8, horizontal: 15),
              ),
            ],
          ),
          actions: [
            ValueListenableBuilder(
                valueListenable: _isExpanded,
                builder: (_, isExpandedValue, __) {
                  return SliverAppBarActionWidgets(
                    imageUrl: vm.currentBusiness?.logo,
                    isExpanded: isExpandedValue,
                    placeholder: _userAvatarWdg,
                  );
                }),
          ],
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              var top = constraints.biggest.height;
              WidgetsBinding.instance.addPostFrameCallback((_) => _isExpanded.value = top >= 250);

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
                          height: 326,
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: (vm.currentBusiness?.coverImages.isNotEmpty ?? false)
                                    ? () => ImageViewer.open(context, vm.currentBusiness!.coverImageUrls)
                                    : null,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: ColoredBox(
                                    color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.1),
                                    child: SizedBox(
                                      height: 209,
                                      width: double.infinity,
                                      child: (vm.currentBusiness?.coverImages.isNotEmpty ?? false)
                                          ? ImageSliderFade(
                                              imageList: vm.currentBusiness!.coverImageUrls
                                                  .map(
                                                    (e) => CachedNetworkImage(
                                                      imageUrl: e,
                                                      height: 209,
                                                      width: double.infinity,
                                                      fadeInDuration: Durations.medium2,
                                                      fit: BoxFit.cover,
                                                      progressIndicatorBuilder: (context, url, progress) =>
                                                          const LoadingWidgetFoodlyIso().paddingAll(24),
                                                    ),
                                                  )
                                                  .toList(),
                                            )
                                          : Icon(Clarity.picture_solid,
                                              color: FoodlyThemes.primaryFoodly.withValues(alpha: .75), size: 140),
                                    ),
                                  ),
                                ),
                              ),
                              if (vm.loggedUserCanEdit)
                                Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox.square(
                                    dimension: 45,
                                    child: CustomRoundedNeumorphicButton(
                                      onPressed: () => bloc.add(const BusinessEvent.editCoverImagesDialog()),
                                      buttonColor: FoodlyThemes.primaryFoodly.withValues(alpha: .39),
                                      iconColor: Colors.white,
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
