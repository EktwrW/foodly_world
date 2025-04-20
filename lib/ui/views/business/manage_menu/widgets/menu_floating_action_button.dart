import 'package:animate_do/animate_do.dart';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:foodly_world/core/extensions/string_extensions.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/favorite_button.dart';
import 'package:foodly_world/ui/views/business/manage_menu/cubit/manage_menu_cubit.dart';
import 'package:foodly_world/ui/views/business/manage_menu/widgets/menu_snackbars.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;
import 'package:share_plus/share_plus.dart';

class MenuFloatingActionButton extends StatelessWidget {
  const MenuFloatingActionButton({
    super.key,
    required this.floatingButtonKey,
    required this.loggedUserCanEdit,
    required this.menuUrl,
    required this.menu,
  });

  final GlobalKey<FabCircularMenuPlusState>? floatingButtonKey;
  final bool loggedUserCanEdit;
  final String menuUrl;
  final MenuDM? menu;

  void _closeFAB() {
    if (floatingButtonKey?.currentState?.isOpen ?? false) {
      floatingButtonKey?.currentState?.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ManageMenuCubit>();
    final logger = di<Logger>();

    return !cubit.state.vm.editMode
        ? FadeIn(
            key: const Key('FAB-Menu'),
            child: Builder(
              builder: (context) => FabCircularMenuPlus(
                // Cannot be `Alignment.center`
                key: floatingButtonKey,
                ringColor: FoodlyThemes.primaryFoodly.withAlpha(40),
                ringDiameter: 400.0,
                ringWidth: 100.0,
                fabSize: 54,
                fabElevation: 7.0,
                fabIconBorder: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                fabColor: FoodlyThemes.primaryFoodly,
                fabOpenIcon: const Icon(Icons.menu_open_outlined, color: Colors.white),
                fabCloseIcon: const Icon(Icons.close_outlined, color: Colors.white),
                animationDuration: Durations.extralong1,
                onDisplayChange: (isOpen) => logger.i('The menu is open: $isOpen'),
                children: <Widget>[
                  CustomRoundedNeumorphicButton(
                    onPressed: menuUrl.isNotEmpty
                        ? () async {
                            _closeFAB();
                            try {
                              await Share.share(
                                S.current.shareMenuMessage(
                                    menu?.business?.name ?? '-'.toBold(), ('Foodly').toBold(), menuUrl),
                                subject: S.current.shareMenuSubject,
                              );
                            } catch (e) {
                              logger.e('Error sharing menu: $e');

                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  //TODO: set custom snackbar instead of generic
                                  SnackBar(content: Text(S.current.shareMenuError)),
                                );
                              }
                            }
                          }
                        : null,
                    tooltip: S.current.shareMenu,
                    iconSize: 24,
                    diameter: 38,
                    depth: 4,
                    iconData: Bootstrap.send,
                  ),
                  CustomRoundedNeumorphicButton(
                    onPressed: menuUrl.isNotEmpty
                        ? () {
                            MenuSnackbars.showQRCodeSnackBar(context, menuUrl);
                            _closeFAB();
                          }
                        : null,
                    tooltip: S.current.generateQR,
                    iconSize: 28,
                    depth: 4,
                    iconData: Bootstrap.qr_code_scan,
                  ),
                  if (loggedUserCanEdit)
                    CustomRoundedNeumorphicButton(
                      onPressed: () async {
                        _closeFAB();
                        await Future.delayed(Durations.long4);
                        cubit.updateEditMode();
                      },
                      tooltip: S.current.editMenu,
                      iconSize: 26,
                      depth: 4,
                      iconData: Bootstrap.pencil_square,
                    ),
                  if (!loggedUserCanEdit && menu != null)
                    FavoriteButton.forMenu(
                      key: Key(menu!.uuid),
                      menu: menu!,
                      tooltip: S.current.saveMenu,
                      iconSize: 25,
                    ),
                ],
              ),
            ),
          )
        : FadeIn(
            key: const Key('FAB-editEnds'),
            child: FloatingActionButton(
              heroTag: UniqueKey(),
              mini: true,
              tooltip: S.current.finishEdit,
              onPressed: () => cubit.updateEditMode(),
              child: const Icon(Bootstrap.check_circle),
            ).paddingAll(16),
          );
  }
}
