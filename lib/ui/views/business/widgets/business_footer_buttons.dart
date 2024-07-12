import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/consts/foodly_strings.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/routing/app_routes.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/footer_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/bloc/business_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap, BoxIcons, Clarity;

class BusinessFooterButtons extends StatelessWidget {
  const BusinessFooterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessBloc, BusinessState>(
      builder: (context, state) {
        final vm = state.vm;
        // final bloc = context.read<DashboardBloc>();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FooterButton(
              onPressed: () => context.pushNamed(AppRoutes.menu.name,
                  pathParameters: {AppRoutes.routeIdParam: vm.currentBusiness?.menuId ?? FoodlyStrings.NEW_MENU}),
              dimension: 30,
              iconSize: 30,
              iconData: BoxIcons.bx_food_menu,
              buttonText: S.current.viewEdit,
              secondButtonText: S.current.menu,
              textStyle: FoodlyTextStyles.footerButtonSmall,
            ),
            FooterButton(
              onPressed: () {},
              dimension: 30,
              iconSize: 30,
              iconData: Bootstrap.cash_coin,
              buttonText: S.current.viewEdit,
              secondButtonText: S.current.promotions,
              textStyle: FoodlyTextStyles.footerButtonSmall,
            ),
            FooterButton(
              onPressed: () {},
              dimension: 30,
              iconSize: 30,
              iconData: Clarity.applications_solid_badged,
              buttonText: S.current.create,
              secondButtonText: S.current.notification,
              textStyle: FoodlyTextStyles.footerButtonSmall,
            ),
            FooterButton(
              onPressed: () {},
              dimension: 30,
              iconSize: 30,
              iconData: Bootstrap.folder_plus,
              buttonText: S.current.create,
              secondButtonText: S.current.business,
              textStyle: FoodlyTextStyles.footerButtonSmall,
            ),
          ],
        ).paddingHorizontal(6);
      },
    );
  }
}
