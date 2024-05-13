import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/footer_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:icons_plus/icons_plus.dart' show Clarity, Bootstrap;

class DashboardFooterButtons extends StatelessWidget {
  const DashboardFooterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        // final vm = state.vm;
        // final bloc = context.read<DashboardBloc>();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FooterButton(
              onPressed: () {},
              dimension: 30,
              iconSize: 30,
              iconData: Bootstrap.menu_up,
              buttonText: 'Ver/Editar',
              secondButtonText: 'Menu',
              textStyle: FoodlyTextStyles.footerButtonSmall,
            ),
            FooterButton(
              onPressed: () {},
              dimension: 30,
              iconSize: 30,
              iconData: Bootstrap.cash_coin,
              buttonText: 'Ver/Editar',
              secondButtonText: 'Promociones',
              textStyle: FoodlyTextStyles.footerButtonSmall,
            ),
            FooterButton(
              onPressed: () {},
              dimension: 30,
              iconSize: 30,
              iconData: Clarity.applications_solid_badged,
              buttonText: 'Crear',
              secondButtonText: 'Notificacion',
              textStyle: FoodlyTextStyles.footerButtonSmall,
            ),
            FooterButton(
              onPressed: () {},
              dimension: 30,
              iconSize: 30,
              iconData: Bootstrap.folder_plus,
              buttonText: 'Crear',
              secondButtonText: 'Negocio',
              textStyle: FoodlyTextStyles.footerButtonSmall,
            ),
          ],
        ).paddingHorizontal(6);
      },
    );
  }
}
