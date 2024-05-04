import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/data_models/user/user_dm.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/views/sign_up/cubit/sign_up_cubit.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SelectUserTypeToggleSwitchWdg extends StatelessWidget {
  const SelectUserTypeToggleSwitchWdg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    return ToggleSwitch(
      initialLabelIndex: cubit.getUserRole != null
          ? cubit.getUserTypes.indexOf(cubit.getUserRole!)
          : 3,
      onToggle: (i) {
        if (cubit.getUserRole == null) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        }
        final index = i ?? 0;
        if (cubit.getUserRole != cubit.getUserTypes[index]) {
          cubit.setUserType(cubit.getUserTypes[index]);
        }
      },
      animate: true,
      animationDuration: 500,
      minHeight: 30,
      labels: cubit.getUserTypes.map((e) => e.renderText).toList(),
      minWidth: (context.screenWidth - 44) / 2,
      cornerRadius: 6.0,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.white,
      totalSwitches: cubit.getUserTypes.length,
      customTextStyles: const [
        TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
      ],
      borderColor: const [
        FoodlyThemes.tertiaryFoodly,
        FoodlyThemes.secondaryFoodly,
        FoodlyThemes.primaryFoodly,
      ],
      dividerColor: FoodlyThemes.secondaryFoodly,
      activeBgColors: const [
        [FoodlyThemes.primaryFoodly],
        [FoodlyThemes.primaryFoodly],
      ],
    ).paddingOnly(bottom: 24, top: 6);
  }
}
