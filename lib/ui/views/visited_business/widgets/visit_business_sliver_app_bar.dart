import 'package:cached_network_image/cached_network_image.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/favorite_button.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/editable_avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/image/image_slider_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/visited_business/cubit/visited_business_cubit.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap, Clarity;

class VisitBusinessSliverAppBar extends StatelessWidget {
  const VisitBusinessSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VisitBusinessCubit, VisitBusinessState, BusinessDM?>(
      selector: (state) => state.vm.currentBusiness,
      builder: (context, currentBusiness) {
        return SliverAppBar(
          centerTitle: true,
          toolbarHeight: 70,
          leadingWidth: 62,
          expandedHeight: 340,
          collapsedHeight: 74,
          shape: UIDecorations.SLIVER_APP_BAR_BOTTOM_SHAPE,
          pinned: true,
          floating: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  currentBusiness?.name ?? '-',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: FoodlyTextStyles.cardSubtitle.copyWith(color: Colors.black, fontSize: 16.5),
                ),
              ),
            ],
          ),
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: CustomRoundedNeumorphicButton(
                  iconSize: 26,
                  diameter: 30,
                  iconData: Bootstrap.caret_left_fill,
                  onPressed: () {
                    di<AppRouter>().goBackToLastRoute(context);
                  },
                ).paddingSymmetric(vertical: 8),
              ),
            ],
          ).paddingLeft(16),
          actions: [
            currentBusiness == null
                ? const LoadingWidgetFoodlyIso(height: 36)
                : SizedBox.square(
                    dimension: 48,
                    child: FavoriteButton.forBusinessPage(
                      business: currentBusiness,
                      diameter: 20,
                      iconSize: 22,
                    ),
                  ).paddingRight(UIDimens.SCREEN_PADDING_MOB),
          ],
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            titlePadding: EdgeInsets.zero,
            centerTitle: true,
            background: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: SizedBox(
                      height: 330,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: ColoredBox(
                              color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.1),
                              child: SizedBox(
                                height: 165,
                                width: double.infinity,
                                child: (currentBusiness?.coverImages.isNotEmpty ?? false)
                                    ? ImageSliderFade(
                                        imageList: currentBusiness!.coverImageUrls
                                            .map(
                                              (e) => CachedNetworkImage(
                                                imageUrl: e,
                                                width: double.infinity,
                                                fadeInDuration: Durations.medium2,
                                                fit: BoxFit.fitWidth,
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
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: EditableAvatarWdg(
                              avatarType: AvatarType.business,
                              size: const Size.square(100),
                              paddingAll: 0,
                              imageUrl: currentBusiness?.logo,
                            ),
                          ),
                        ],
                      ).paddingOnly(top: 80),
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
            ),
          ),
        );
      },
    );
  }
}
