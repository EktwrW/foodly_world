// //import 'package:animate_do/animate_do.dart' show FadeIn;
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui show NeumorphicShape;
// // import 'package:foodly_world/generated/l10n.dart';
// // import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
// // import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
// // import 'package:foodly_world/ui/theme/foodly_themes.dart';
// import 'package:foodly_world/ui/views/starting/cubit/starting_cubit.dart';
// //import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;

// class SocialMediaButtons extends StatelessWidget {
//   const SocialMediaButtons({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<StartingCubit>();

//     return Row(
//       // mainAxisAlignment: MainAxisAlignment.spaceAround,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Expanded(
//           child: BlocBuilder<StartingCubit, StartingState>(
//             builder: (context, state) {
//               return state.maybeWhen(
//                 loading: (vm) => _buildGoogleSignInButton(vm.currentView.isLogin, cubit),
//                 welcome: (vm) => _buildGoogleSignInButton(vm.currentView.isLogin, cubit),
//                 error: (_, vm) => _buildGoogleSignInButton(vm.currentView.isLogin, cubit),
//                 orElse: () => const SizedBox.shrink(),
//               );
//             },
//           ),
//         ),
//         // CustomRoundedNeumorphicButton(
//         //   onPressed: () => cubit.googleSignIn(),
//         //   iconData: Bootstrap.google,
//         //   diameter: 50,
//         // ),
//         // CustomRoundedNeumorphicButton(
//         //   onPressed: () {},
//         //   iconData: Bootstrap.apple,
//         //   diameter: 50,
//         // ),
//         // CustomRoundedNeumorphicButton(
//         //   onPressed: () {},
//         //   iconData: Bootstrap.facebook,
//         //   diameter: 50,
//         // ),
//         // CustomRoundedNeumorphicButton(
//         //   onPressed: () {},
//         //   iconData: Bootstrap.twitter_x,
//         // ),
//       ],
//     );
//   }

//   Widget _buildGoogleSignInButton(bool isLogin, StartingCubit cubit) {
//     return Column(
//       spacing: !isLogin ? 30 : 0,
//       children: [],
//     );
//   }
// }
