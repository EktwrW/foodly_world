import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/core/services/event_tracking_service.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/footer_button.dart';
import 'package:foodly_world/ui/shared_widgets/guest/guest_gate_sheet.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/visited_business/cubit/visited_business_cubit.dart';
import 'package:foodly_world/ui/views/visited_business/widgets/visit_business_snackbars.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap, BoxIcons;

class VisitBusinessFooterButtons extends StatelessWidget {
  const VisitBusinessFooterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<VisitBusinessCubit, VisitBusinessState, BusinessDM?>(
      selector: (state) => state.vm.currentBusiness,
      builder: (context, currentBusiness) {
        final isCatering = currentBusiness?.categoryId?.isCateringOrChefs ?? false;
        // Catering lidera con paquetes; el menú es opt-in (menu_enabled). El
        // resto de las categorías siempre muestran el menú.
        final showMenu = !isCatering || (currentBusiness?.menuEnabled ?? false);

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
                dimension: 24,
                iconSize: 26,
                iconData: Bootstrap.briefcase,
                buttonText: S.current.packages,
                textStyle: FoodlyTextStyles.footerButtonSmall,
              ),
            if (showMenu)
              FooterButton(
                onPressed: () => context.goNamed(
                  AppRoutes.visitMenu.name,
                  pathParameters: {AppRoutes.routeIdParam: currentBusiness?.menus.firstOrNull?.uuid ?? '-'},
                  extra: currentBusiness,
                ),
                dimension: 24,
                iconSize: 26,
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
              dimension: 24,
              iconSize: 26,
              iconData: Bootstrap.cash_coin,
              buttonText: S.current.promotions,
              textStyle: FoodlyTextStyles.footerButtonSmall,
            ),
            // Table reservation is only relevant for verticals that actually
            // have tables (restaurants, bars, cafés). Catering & chefs take
            // bookings exclusively via the service-packages flow ("Paquetes"
            // button above) — they don't have tables to reserve. Showing this
            // button on a catering profile would also expose the old
            // LinearCalendar modal which has no availability filtering.
            if (!isCatering)
              Opacity(
                opacity: (currentBusiness?.allowReservations ?? false) ? 1.0 : 0.4,
                child: FooterButton(
                  onPressed: (currentBusiness?.allowReservations ?? false)
                      ? () {
                          // Modo invitado (5.1.1.v): reservar requiere cuenta.
                          if (!GuestGuard.requireAuth(GuestGateAction.reserve)) return;
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
                  dimension: 24,
                  iconSize: 31,
                  iconData: Icons.table_restaurant_outlined,
                  buttonText: S.current.reservation,
                  textStyle: FoodlyTextStyles.footerButtonSmall,
                ),
              ),
            FooterButton(
              onPressed: () async {
                // Modo invitado (5.1.1.v): dejar una reseña requiere cuenta.
                if (!GuestGuard.requireAuth(GuestGateAction.review)) return;
                if (di<AuthSessionService>().userSessionDM?.user.business.any((b) => b.uuid == currentBusiness?.uuid) ==
                    true) {
                  FoodlySnackbars.infoGeneric(context, S.current.cannotReviewOwnBusiness,
                      duration: const Duration(seconds: 3));
                  return;
                }

                final cubit = context.read<VisitBusinessCubit>();
                final checkResult = await cubit.checkReview();

                if (!context.mounted) return;

                if (checkResult != null && checkResult.hasReviewed && checkResult.review != null) {
                  VisitedBusinessSnackbars.showAlreadyReviewedInfo(context, checkResult.review!);
                } else {
                  VisitedBusinessSnackbars.showInputReviewWdg(context);
                }
              },
              dimension: 24,
              iconSize: 26,
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
