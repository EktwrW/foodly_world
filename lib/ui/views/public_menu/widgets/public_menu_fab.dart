import 'dart:developer' show log;

import 'package:animate_do/animate_do.dart';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:foodly_world/core/extensions/string_extensions.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/views/visited_business/menu/widgets/menu_snackbars.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;
import 'package:share_plus/share_plus.dart';

class PublicMenuFab extends StatelessWidget {
  const PublicMenuFab({
    super.key,
    required this.floatingButtonKey,
    required this.menu,
  });

  final GlobalKey<FabCircularMenuPlusState>? floatingButtonKey;
  final MenuDM? menu;

  String get _menuUrl => Uri.base.toString();

  void _closeFAB() {
    if (floatingButtonKey?.currentState?.isOpen ?? false) {
      floatingButtonKey?.currentState?.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      key: const Key('FAB-PublicMenu'),
      child: Builder(
        builder: (context) => FabCircularMenuPlus(
          key: floatingButtonKey,
          alignment: context.isMobile ? Alignment.bottomRight : Alignment.bottomCenter,
          ringColor: FoodlyThemes.primaryFoodly.withAlpha(40),
          ringDiameter: 300,
          ringWidth: 73,
          fabSize: context.isMobile ? 46 : 52,
          fabElevation: 7.0,
          fabIconBorder: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          fabColor: FoodlyThemes.primaryFoodly,
          fabOpenIcon: const Icon(Icons.menu_open_outlined, color: Colors.white),
          fabCloseIcon: const Icon(Icons.close_outlined, color: Colors.white),
          animationDuration: Durations.extralong1,
          fabMargin: const EdgeInsets.all(13.0),
          children: <Widget>[
            if (context.isMobile) const SizedBox.shrink(),
            CustomRoundedNeumorphicButton(
              onPressed: () async {
                _closeFAB();
                try {
                  await Share.share(
                    S.current.shareMenuMessage(
                      (menu?.business?.name ?? '-').toBold(),
                      'Foodly'.toBold(),
                      _menuUrl,
                    ),
                    subject: S.current.shareMenuSubject,
                  );
                } catch (e) {
                  log('Error sharing menu: $e', error: e);
                  if (context.mounted) FoodlySnackbars.errorGeneric(context, S.current.shareMenuError);
                }
              },
              tooltip: S.current.shareMenu,
              iconSize: 24,
              diameter: 38,
              depth: 4,
              iconData: Bootstrap.send,
            ),
            if (context.isMobile) const SizedBox.square(dimension: 9),
            CustomRoundedNeumorphicButton(
              onPressed: () {
                MenuSnackbars.showQRCodeSnackBar(context, _menuUrl);
                _closeFAB();
              },
              tooltip: S.current.generateQR,
              iconSize: 28,
              diameter: 38,
              depth: 4,
              iconData: Bootstrap.qr_code_scan,
            ),
            if (context.isMobile) const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
