import 'dart:developer' show log;

import 'package:animate_do/animate_do.dart';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:foodly_world/core/extensions/string_extensions.dart';
import 'package:foodly_world/core/network/app_config/app_features_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/data_models/group_orders/group_order_dm.dart';
import 'package:foodly_world/data_models/menu/menu_dm.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/favorite_button.dart';
import 'package:foodly_world/ui/shared_widgets/guest/guest_gate_sheet.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/views/group_orders/cubit/active_group_order_cubit.dart';
import 'package:foodly_world/ui/views/visited_business/menu/widgets/menu_snackbars.dart';

import 'package:go_router/go_router.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap, Iconsax;
import 'package:share_plus/share_plus.dart';

class MenuFloatingActionButton extends StatelessWidget {
  const MenuFloatingActionButton({
    super.key,
    required this.floatingButtonKey,
    required this.menuUrl,
    required this.menu,
  });

  final GlobalKey<FabCircularMenuPlusState>? floatingButtonKey;
  final String menuUrl;
  final MenuDM? menu;

  static String _fmtMinor(int minor) => '${(minor / 100).toStringAsFixed(2).replaceAll('.', ',')} €';

  void _closeFAB() {
    if (floatingButtonKey?.currentState?.isOpen ?? false) {
      floatingButtonKey?.currentState?.close();
    }
  }

  /// Botón del FAB para la orden grupal. Sin orden activa: inicia una (gated
  /// por sesión) y avisa que agregue platos con "+". Con orden activa para
  /// ESTE negocio: navega al detalle (cerrar + pagar). Reacciona al cubit
  /// singleton [ActiveGroupOrderCubit], el mismo "carrito" del botón "+".
  Widget _groupOrderButton(BuildContext context, String businessUuid) {
    final cubit = di<ActiveGroupOrderCubit>();
    return BlocBuilder<ActiveGroupOrderCubit, GroupOrderDM?>(
      bloc: cubit,
      builder: (context, order) {
        final active = order != null && order.businessUuid == businessUuid;
        return CustomRoundedNeumorphicButton(
          onPressed: () {
            _closeFAB();
            if (active) {
              context.pushNamed(
                AppRoutes.groupOrder.name,
                pathParameters: {AppRoutes.routeIdParam: order.uuid},
              );
            } else {
              if (!GuestGuard.requireAuth(GuestGateAction.groupOrder)) return;
              cubit.startForBusiness(businessUuid);
              // El mínimo se informa ACÁ, al empezar la cuenta, y no al pagar:
              // la ASAE exige que el comensal lo sepa de forma clara y
              // adecuada, y enterarse recién en el checkout no lo es.
              final minMinor = menu?.business?.cardMinAmountMinor;
              FoodlySnackbars.infoGeneric(
                context,
                minMinor == null
                    ? S.current.groupOrderAddFromMenu
                    : '${S.current.groupOrderAddFromMenu}\n\n'
                        '${S.current.menuCardMinimumNotice(_fmtMinor(minMinor))} — '
                        '${S.current.menuCardMinimumNoticeBody}',
              );
            }
          },
          tooltip: active ? S.current.groupOrderViewOrder : S.current.groupOrderEntryCta,
          iconSize: 26,
          diameter: 38,
          depth: 4,
          iconData: active ? Iconsax.receipt_1_outline : Iconsax.receipt_add_outline,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // El payload del menú trae `business_uuid` plano (no el business anidado).
    final businessUuid = menu?.businessUuid ?? '';
    final showGroupOrder = di<AppFeaturesRepo>().cachedOrDefaults.groupOrdersEnabled && businessUuid.isNotEmpty;

    return FadeIn(
      key: const Key('FAB-Menu'),
      child: Builder(
        builder: (context) => FabCircularMenuPlus(
          // Cannot be `Alignment.center`
          key: floatingButtonKey,
          ringColor: FoodlyThemes.primaryFoodly.withAlpha(69),
          ringDiameter: 400.0,
          ringWidth: 100.0,
          fabSize: 54,
          fabElevation: 7.0,
          fabIconBorder: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          fabColor: FoodlyThemes.primaryFoodly,
          fabOpenIcon: const Icon(Icons.menu_open_outlined, color: Colors.white),
          fabCloseIcon: const Icon(Icons.close_outlined, color: Colors.white),
          animationDuration: Durations.extralong1,
          onDisplayChange: (_) {},
          children: <Widget>[
            // Entrada a la orden grupal (gateada por el flag group_orders_enabled).
            if (showGroupOrder) _groupOrderButton(context, businessUuid),
            CustomRoundedNeumorphicButton(
              onPressed: menuUrl.isNotEmpty
                  ? () async {
                      _closeFAB();
                      try {
                        await Share.share(
                          // Use the flat businessName from BusinessMenuResource
                          // — menu.business is null on this payload (BE doesn't
                          // ship the full BusinessDM here for performance, see
                          // MenuDM doc). Parens around the ?? are mandatory:
                          // ?? has LOWER precedence than `.toBold()`, so
                          // without them the bold extension would only wrap
                          // the '-' fallback.
                          S.current.shareMenuMessage((menu?.businessName ?? '-').toBold(), 'Foodly'.toBold(), menuUrl),
                          subject: S.current.shareMenuSubject,
                        );
                      } catch (e) {
                        log('Error sharing menu: $e', error: e);

                        if (context.mounted) {
                          FoodlySnackbars.errorGeneric(context, S.current.shareMenuError);
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
            FavoriteButton.forMenu(
              key: Key(menu!.uuid),
              menu: menu!,
              tooltip: S.current.saveMenu,
              iconSize: 25,
            ),
          ],
        ),
      ),
    );
  }
}
