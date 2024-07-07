import 'package:collection/collection.dart' show IterableExtension;
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:go_router/go_router.dart';

enum ModuleGuardType {
  accountSettings,
  home,
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
        AppRoutes.home.name: ModuleGuardType.home,
        AppRoutes.foodlyMainPage.name: ModuleGuardType.home,
        AppRoutes.notifications.name: ModuleGuardType.home,
        AppRoutes.savedPromotions.name: ModuleGuardType.home,
        AppRoutes.favedBusiness.name: ModuleGuardType.home,
        AppRoutes.usersCommunity.name: ModuleGuardType.home,
        AppRoutes.business.name: ModuleGuardType.business,
        AppRoutes.menu.name: ModuleGuardType.business,
        AppRoutes.profileScreen.name: ModuleGuardType.accountSettings,
        '': ModuleGuardType.unknown,
      };
}
