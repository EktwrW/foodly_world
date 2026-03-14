import 'package:collection/collection.dart' show IterableExtension;
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:go_router/go_router.dart';

enum ModuleGuardType {
  accountSettings,
  home,
  menu,
  business,
  unknown;

  static ModuleGuardType getModuleGuardTypeByRoute(GoRouterState state) {
    return _appModulesMap.entries.firstWhereOrNull((e) => e.key.contains(state.name ?? ''))?.value ??
        ModuleGuardType.unknown;
  }

  //! when adding a new route, if the route needs to be guarded, add parsing of the ModuleGuardType matching the route
  ///! this is a temporary solution to guard app modules until we have a proper permissions matrix to handle
  /// access to the following app modules
  static Map<String, ModuleGuardType> get _appModulesMap => {
        AppRoutes.home.name: home,
        AppRoutes.categories.name: home,
        AppRoutes.foodlyMainPage.name: home,
        AppRoutes.notifications.name: home,
        AppRoutes.savedPromotions.name: home,
        AppRoutes.favedBusiness.name: home,
        AppRoutes.usersCommunity.name: home,
        AppRoutes.myBusiness.name: business,
        AppRoutes.manageMenu.name: menu,
        AppRoutes.managePromotions.name: business,
        AppRoutes.visitBusiness.name: home,
        AppRoutes.visitMenu.name: menu,
        AppRoutes.visitPromotions.name: home,
        AppRoutes.profileScreen.name: accountSettings,
        AppRoutes.myReservations.name: home,
        AppRoutes.manageReservations.name: home,
        AppRoutes.privacyPolicy.name: menu,
        '': unknown,
      };
}
