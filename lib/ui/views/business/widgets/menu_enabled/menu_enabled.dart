import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart'
    show LightSource, NeumorphicShape, NeumorphicSwitch, NeumorphicSwitchStyle;
import 'package:foodly_world/generated/l10n.dart' show S;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart' show FoodlyThemes;
import 'package:foodly_world/ui/views/business/bloc/business_bloc.dart';

/// Toggle del menú digital opt-in para la vertical **Catering & Chefs**.
///
/// El resto de las categorías siempre muestran su menú; catering lidera con
/// los paquetes de servicio y muestra el menú solo si el manager lo habilita.
/// Controla `business.menu_enabled`; cuando está activo, el botón "Menú"
/// aparece en los footers (manager y consumer) junto a "Paquetes".
///
/// Se renderiza únicamente para negocios de catering (gateado en
/// [BusinessPage]); por eso acá no repetimos el chequeo de categoría.
class MenuEnabled extends StatelessWidget {
  const MenuEnabled({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessBloc, BusinessState>(
      buildWhen: (prev, curr) =>
          prev.vm.currentBusiness?.menuEnabled != curr.vm.currentBusiness?.menuEnabled ||
          prev.vm.loggedUserCanEdit != curr.vm.loggedUserCanEdit,
      builder: (context, state) {
        final bloc = context.read<BusinessBloc>();
        final business = state.vm.currentBusiness;
        final menuEnabled = business?.menuEnabled ?? false;
        final canEdit = state.vm.loggedUserCanEdit;

        return Row(
          spacing: 16,
          children: [
            NeumorphicSwitch(
              value: menuEnabled,
              duration: Durations.medium2,
              curve: Curves.decelerate,
              onChanged: canEdit ? (val) => bloc.add(BusinessEvent.toggleMenuEnabled(val)) : null,
              height: 32,
              style: NeumorphicSwitchStyle(
                activeTrackColor: FoodlyThemes.primaryFoodly.withValues(alpha: .73),
                inactiveTrackColor: Colors.black12,
                activeThumbColor: FoodlyThemes.success,
                inactiveThumbColor: FoodlyThemes.secondaryFoodly,
                thumbShape: NeumorphicShape.convex,
                lightSource: LightSource.topRight,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.current.enableDigitalMenu,
                    style: FoodlyTextStyles.actionsBody,
                  ),
                  Text(
                    S.current.enableDigitalMenuHint,
                    style: FoodlyTextStyles.cardsSmallSubtitle.copyWith(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
