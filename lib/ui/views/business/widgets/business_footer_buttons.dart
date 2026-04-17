import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/footer_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap, BoxIcons;

class BusinessFooterButtons extends StatelessWidget {
  const BusinessFooterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessBloc, BusinessState>(
      builder: (context, state) {
        final vm = state.vm;
        final isCatering = vm.currentBusiness?.categoryId?.isCateringOrChefs ?? false;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (isCatering)
              FooterButton(
                onPressed: () => context.goNamed(
                  AppRoutes.manageServicePackages.name,
                  pathParameters: {AppRoutes.routeIdParam: vm.currentBusiness?.uuid ?? ''},
                ),
                dimension: 30,
                iconSize: 30,
                iconData: Bootstrap.briefcase,
                buttonText: S.current.viewEdit,
                secondButtonText: S.current.packages,
                textStyle: FoodlyTextStyles.footerButtonSmall,
              )
            else
              FooterButton(
                onPressed: () => context.goNamed(
                  AppRoutes.manageMenu.name,
                  pathParameters: {
                    AppRoutes.routeIdParam: vm.currentBusiness?.menus.firstOrNull?.uuid ?? FoodlyStrings.NEW_MENU
                  },
                  extra: vm.currentBusiness,
                ),
                dimension: 30,
                iconSize: 30,
                iconData: BoxIcons.bx_food_menu,
                buttonText: S.current.viewEdit,
                secondButtonText: S.current.menu,
                textStyle: FoodlyTextStyles.footerButtonSmall,
              ),
            FooterButton(
              onPressed: () => context.goNamed(
                AppRoutes.managePromotions.name,
                pathParameters: {AppRoutes.routeIdParam: vm.currentBusiness?.uuid ?? ''},
                extra: vm.currentBusiness,
              ),
              dimension: 30,
              iconSize: 30,
              iconData: Bootstrap.cash_coin,
              buttonText: S.current.viewEdit,
              secondButtonText: S.current.promotions,
              textStyle: FoodlyTextStyles.footerButtonSmall,
            ),
            FooterButton(
              onPressed: () => context.goNamed(
                AppRoutes.manageReservations.name,
                pathParameters: {AppRoutes.routeIdParam: vm.currentBusiness?.uuid ?? ''},
                extra: vm.currentBusiness,
              ),
              dimension: 30,
              iconSize: 30,
              iconData: Icons.table_restaurant_outlined,
              buttonText: S.current.viewEdit,
              secondButtonText: S.current.reservations,
              textStyle: FoodlyTextStyles.footerButtonSmall,
            ),
            FooterButton(
              onPressed: () => context.goNamed(
                AppRoutes.businessAnalytics.name,
                pathParameters: {AppRoutes.routeIdParam: vm.currentBusiness?.uuid ?? ''},
                extra: vm.currentBusiness,
              ),
              dimension: 30,
              iconSize: 30,
              iconData: Bootstrap.file_bar_graph,
              buttonText: S.current.view,
              secondButtonText: S.current.analytics,
              textStyle: FoodlyTextStyles.footerButtonSmall,
            ),
          ],
        ).paddingHorizontal(6);
      },
    );
  }
}
