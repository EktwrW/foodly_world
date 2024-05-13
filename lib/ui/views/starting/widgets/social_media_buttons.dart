import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/rounded_button.dart';
import 'package:foodly_world/ui/views/starting/cubit/starting_cubit.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class SocialMediaButtonsRow extends StatelessWidget {
  const SocialMediaButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RoundedButtonMobileFoodly(
          onPressed: () => context.read<StartingCubit>().googleSignIn(),
          iconData: Bootstrap.google,
        ),
        RoundedButtonMobileFoodly(
          onPressed: () {},
          iconData: Bootstrap.apple,
        ),
        RoundedButtonMobileFoodly(
          onPressed: () {},
          iconData: Bootstrap.facebook,
        ),
        RoundedButtonMobileFoodly(
          onPressed: () {},
          iconData: Bootstrap.twitter_x,
        ),
      ],
    );
  }
}
