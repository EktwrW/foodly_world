import 'package:foodly_world/core/consts/foodly_assets.dart' show FoodlyAssets;
import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart' show Asset;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/snackbar_wdg.dart';
import 'package:foodly_world/ui/shared_widgets/text_inputs/foodly_primary_input_text.dart'
    show FoodlyPrimaryInputText, FoodlyInputType;
import 'package:foodly_world/ui/theme/foodly_text_styles.dart' show FoodlyTextStyles;
import 'package:foodly_world/ui/views/visited_business/cubit/visited_business_cubit.dart';

class VisitedBusinessSnackbars {
  const VisitedBusinessSnackbars._();

  static void showInputReviewWdg(
    BuildContext context,
  ) {
    final cubit = context.read<VisitBusinessCubit>();
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final snackBar = SnackBarWdg(
      type: SnackBarType.action,
      onDismiss: () {},
      buttonBuilder: (dismiss) {
        return BlocProvider.value(
          value: context.read<VisitBusinessCubit>(),
          child: BlocSelector<VisitBusinessCubit, VisitBusinessState, bool>(
            selector: (state) => state.vm.canSubmitReview,
            builder: (context, canSubmitReview) {
              return CustomNeumorphicButton(
                disabled: !canSubmitReview,
                onPressed: () async {
                  await cubit.createReview();
                  scaffoldMessenger.hideCurrentSnackBar();
                  await Future.delayed(Durations.short4);
                  if (context.mounted) {
                    FoodlySnackbars.successGeneric(context, 'Review submitted successfully!');
                  }
                },
                text: 'Submit Review',
              );
            },
          ),
        );
      },
      content: BlocProvider.value(
        value: context.read<VisitBusinessCubit>(),
        child: BlocBuilder<VisitBusinessCubit, VisitBusinessState>(
          builder: (context, state) {
            final vm = state.vm;
            return Column(
              children: [
                const Asset(FoodlyAssets.review, height: 42, width: 42),
                Text(
                  'Write a Review for ${vm.currentBusiness?.name ?? 'this business'}',
                  style: FoodlyTextStyles.promoTitle.copyWith(fontSize: 16),
                ).paddingVertical(24),
                CustomRoundedNeumorphicButton(
                  onPressed: () {},
                  tooltip: 'Add photos to your review',
                  diameter: 30,
                  iconSize: 24,
                  iconData: Icons.add_photo_alternate_outlined,
                ),
                FoodlyPrimaryInputText(
                  controller: vm.reviewTextController,
                  maxLength: 369,
                  maxLines: 6,
                  minLines: 3,
                  enabled: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputTextType: FoodlyInputType.generic,
                  hideCurrentSnackBarWhenOnTap: false,
                  hintText: 'Write your review here...',
                ),
              ],
            );
          },
        ),
      ),
    );

    scaffoldMessenger
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar.getSnackBar(context));
  }
}
