import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/footer_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/visited_business/cubit/visited_business_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap, BoxIcons;

class VisitBusinessFooterButtons extends StatelessWidget {
  const VisitBusinessFooterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VisitBusinessCubit, VisitBusinessState, BusinessDM?>(
      selector: (state) => state.vm.currentBusiness,
      builder: (context, currentBusiness) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FooterButton(
              onPressed: () => context.goNamed(
                AppRoutes.visitMenu.name,
                pathParameters: {AppRoutes.routeIdParam: currentBusiness?.menus.firstOrNull?.uuid ?? '-'},
                extra: currentBusiness,
              ),
              dimension: 30,
              iconSize: 30,
              iconData: BoxIcons.bx_food_menu,
              buttonText: S.current.view,
              secondButtonText: S.current.menu,
              textStyle: FoodlyTextStyles.footerButtonSmall,
            ),
            FooterButton(
              onPressed: () => context.goNamed(
                AppRoutes.visitPromotions.name,
                pathParameters: {AppRoutes.routeIdParam: currentBusiness?.uuid ?? '-'},
              ),
              dimension: 30,
              iconSize: 30,
              iconData: Bootstrap.cash_coin,
              buttonText: S.current.view,
              secondButtonText: S.current.promotions,
              textStyle: FoodlyTextStyles.footerButtonSmall,
            ),
            FooterButton(
              onPressed: () {},
              dimension: 30,
              iconSize: 30,
              iconData: Icons.table_restaurant_outlined,
              buttonText: S.current.request,
              secondButtonText: S.current.reservation,
              textStyle: FoodlyTextStyles.footerButtonSmall,
            ),
          ],
        );
      },
    );
  }
}
