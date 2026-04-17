import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/event_tracking_service.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/footer_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/visited_business/cubit/visited_business_cubit.dart';
import 'package:foodly_world/ui/views/visited_business/widgets/visit_business_snackbars.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap, BoxIcons;

class VisitBusinessFooterButtons extends StatelessWidget {
  const VisitBusinessFooterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VisitBusinessCubit, VisitBusinessState, BusinessDM?>(
      selector: (state) => state.vm.currentBusiness,
      builder: (context, currentBusiness) {
        final isCatering = currentBusiness?.categoryId?.isCateringOrChefs ?? false;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (isCatering)
              FooterButton(
                onPressed: () => context.goNamed(
                  AppRoutes.visitServicePackages.name,
                  pathParameters: {AppRoutes.routeIdParam: currentBusiness?.uuid ?? '-'},
                  extra: currentBusiness,
                ),
                dimension: 30,
                iconSize: 30,
                iconData: Bootstrap.briefcase,
                buttonText: S.current.packages,
                textStyle: FoodlyTextStyles.footerButtonSmall,
              )
            else
              FooterButton(
                onPressed: () => context.goNamed(
                  AppRoutes.visitMenu.name,
                  pathParameters: {AppRoutes.routeIdParam: currentBusiness?.menus.firstOrNull?.uuid ?? '-'},
                  extra: currentBusiness,
                ),
                dimension: 30,
                iconSize: 30,
                iconData: BoxIcons.bx_food_menu,
                buttonText: S.current.menu,
                textStyle: FoodlyTextStyles.footerButtonSmall,
              ),
            FooterButton(
              onPressed: () => context.goNamed(
                AppRoutes.visitPromotions.name,
                pathParameters: {AppRoutes.routeIdParam: currentBusiness?.uuid ?? '-'},
                extra: currentBusiness,
              ),
              dimension: 30,
              iconSize: 30,
              iconData: Bootstrap.cash_coin,
              buttonText: S.current.promotions,
              textStyle: FoodlyTextStyles.footerButtonSmall,
            ),
            Opacity(
              opacity: (currentBusiness?.allowReservations ?? false) ? 1.0 : 0.4,
              child: FooterButton(
                onPressed: (currentBusiness?.allowReservations ?? false)
                    ? () {
                        di<EventTrackingService>().track(
                          'business.cta_clicked',
                          'business_detail_page',
                          page: 'business_detail',
                          targetType: 'business',
                          targetUuid: currentBusiness?.uuid,
                          data: {'cta_type': 'reserve'},
                        );
                        VisitedBusinessSnackbars.requestReservation(context);
                      }
                    : () {},
                dimension: 30,
                iconSize: 31,
                iconData: Icons.table_restaurant_outlined,
                buttonText: S.current.reservation,
                textStyle: FoodlyTextStyles.footerButtonSmall,
              ),
            ),
            FooterButton(
              onPressed: () async {
                final cubit = context.read<VisitBusinessCubit>();
                final checkResult = await cubit.checkReview();

                if (!context.mounted) return;

                if (checkResult != null && checkResult.hasReviewed && checkResult.review != null) {
                  VisitedBusinessSnackbars.showAlreadyReviewedInfo(context, checkResult.review!);
                } else {
                  VisitedBusinessSnackbars.showInputReviewWdg(context);
                }
              },
              dimension: 30,
              iconSize: 30,
              iconData: Icons.rate_review_outlined,
              buttonText: S.current.review,
              textStyle: FoodlyTextStyles.footerButtonSmall,
            ),
          ],
        );
      },
    );
  }
}
