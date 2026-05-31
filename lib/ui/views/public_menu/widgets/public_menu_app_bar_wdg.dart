import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart' show Brand, Brands, FontAwesome;
import 'package:toggle_switch/toggle_switch.dart';
import 'package:url_launcher/url_launcher.dart';

class PublicPrimaryMenuSliverAppBar extends StatelessWidget {
  final BusinessDM business;

  const PublicPrimaryMenuSliverAppBar({super.key, required this.business});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      toolbarHeight: 62,
      leadingWidth: 76,
      expandedHeight: context.isMobile ? 86 : 90,
      collapsedHeight: 64,
      actionsPadding: context.isMobile ? const EdgeInsets.only(right: 6) : const EdgeInsets.only(right: 16),
      floating: true,
      pinned: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(26)),
      ),
      automaticallyImplyLeading: false,
      actions: [
        const _DownloadAppButton(),
      ],
      leading: AvatarWidget(
        avatarUrl: business.logo,
        avatarType: AvatarType.business,
        height: 53,
        width: 53,
      ).paddingSymmetric(vertical: 6, horizontal: 13),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        titlePadding: EdgeInsets.zero,
        centerTitle: true,
        expandedTitleScale: context.isMobile ? 1.3 : 1.5,
        title: DecoratedBox(
          decoration: UIDecorations.BACKGROUND_GRADIENT_1.copyWith(borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(S.current.menu, style: FoodlyTextStyles.secondaryTitle.copyWith(fontSize: 15))
                        .paddingBottom(6),
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ui.NeumorphicText(
                          business.name ?? '',
                          style: const ui.NeumorphicStyle(color: FoodlyThemes.primaryFoodly),
                          textStyle: ui.NeumorphicTextStyle(
                            fontFamily: GoogleFonts.poppinsTextTheme().bodyLarge?.fontFamily,
                            fontSize: context.isMobile ? 12.3 : 14.9,
                            fontWeight: FontWeight.bold,
                          ),
                        ).paddingBottom(6),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _AppStore { googlePlay, apple }

class _DownloadAppButton extends StatelessWidget {
  const _DownloadAppButton();

  Future<void> _launch(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_AppStore>(
      icon: const Icon(FontAwesome.mobile_screen_solid, size: 29, color: FoodlyThemes.primaryFoodly).paddingAll(3.9),
      tooltip: S.current.downloadApp,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      color: Colors.white,
      elevation: 4,
      onSelected: (store) => _launch(
        store == _AppStore.googlePlay ? FoodlyStrings.PLAY_STORE_URL : FoodlyStrings.APP_STORE_URL,
      ),
      itemBuilder: (_) => [
        PopupMenuItem(
          value: _AppStore.googlePlay,
          child: Row(
            children: [
              Brand(Brands.google_play, size: 26),
              const SizedBox(width: 12),
              const Text('Google Play', style: FoodlyTextStyles.label),
            ],
          ),
        ),
        // App Store sólo cuando Apple ya aprobó. Mientras tanto el item se
        // omite del popup para no exponer un link "page not found".
        // Flipear `FoodlyStrings.IOS_APP_LIVE` cuando publiquemos en iOS.
        if (FoodlyStrings.IOS_APP_LIVE)
          PopupMenuItem(
            value: _AppStore.apple,
            child: Row(
              children: [
                Brand(Brands.apple_logo, size: 26, colorFilter: const ColorFilter.mode(Colors.black87, BlendMode.srcIn)),
                const SizedBox(width: 12),
                const Text('App Store', style: FoodlyTextStyles.label),
              ],
            ),
          ),
      ],
    ).paddingTop(3);
  }
}

class PublicSecondaryMenuSliverAppBar extends StatelessWidget {
  final PageController pageController;
  final ValueNotifier<int> indexNotifier;
  final String? combosLabel;

  const PublicSecondaryMenuSliverAppBar({
    super.key,
    required this.pageController,
    required this.indexNotifier,
    this.combosLabel,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: indexNotifier,
      builder: (context, index, _) {
        return SliverAppBar(
          primary: false,
          pinned: true,
          backgroundColor: Colors.transparent,
          expandedHeight: 56,
          collapsedHeight: 56,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: LayoutBuilder(builder: (context, constraints) {
            final padding = context.isMobile ? 0.0 : constraints.maxWidth * 0.19;

            return Center(
              child: ToggleSwitch(
                initialLabelIndex: index,
                onToggle: (i) {
                  pageController.animateToPage(i ?? 0, duration: Durations.short4, curve: Curves.decelerate);
                  indexNotifier.value = i ?? 0;
                },
                animate: true,
                animationDuration: 500,
                minHeight: 32,
                labels: MenuCategory.values.map((c) => c.textWith(combosLabel: combosLabel)).toList(),
                minWidth: constraints.maxWidth * 0.3,
                cornerRadius: 6.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white,
                totalSwitches: MenuCategory.values.length,
                customTextStyles: [
                  FoodlyTextStyles.toogleButtonText,
                  FoodlyTextStyles.toogleButtonText,
                  FoodlyTextStyles.toogleButtonText,
                ],
                borderWidth: 1.5,
                borderColor: const [
                  FoodlyThemes.primaryFoodly,
                  FoodlyThemes.primaryFoodly,
                  FoodlyThemes.tertiaryFoodly,
                  FoodlyThemes.primaryFoodly,
                  FoodlyThemes.primaryFoodly,
                ],
                dividerColor: FoodlyThemes.secondaryFoodly,
                activeBgColors: const [
                  [FoodlyThemes.primaryFoodly],
                  [FoodlyThemes.primaryFoodly],
                  [FoodlyThemes.primaryFoodly],
                ],
              ).paddingHorizontal(padding),
            );
          }),
        );
      },
    );
  }
}
