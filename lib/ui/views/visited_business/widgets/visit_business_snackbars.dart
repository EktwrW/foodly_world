import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_linear_calendar/flutter_linear_calendar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
import 'package:foodly_world/ui/utils/image_picker_and_cropper.dart';
import 'package:foodly_world/ui/views/visited_business/cubit/visited_business_cubit.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;
import 'package:intl/intl.dart' show Intl, DateFormat;
import 'package:universal_io/io.dart' show File;

class VisitedBusinessSnackbars {
  const VisitedBusinessSnackbars._();

  static void showInputReviewWdg(
    BuildContext context,
  ) {
    final cubit = context.read<VisitBusinessCubit>();
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final snackBar = SnackBarWdg(
      type: SnackBarType.action,
      buttonBuilder: (dismiss) {
        return BlocProvider.value(
          value: context.read<VisitBusinessCubit>(),
          child: BlocSelector<VisitBusinessCubit, VisitBusinessState, bool>(
            selector: (state) => state.vm.canSubmitReview,
            builder: (context, canSubmitReview) {
              return ValueListenableBuilder(
                  valueListenable: cubit.state.vm.reviewTextController ?? TextEditingController(),
                  builder: (context, value, child) {
                    return CustomNeumorphicButton(
                      disabled: !canSubmitReview || value.text.isEmpty,
                      onPressed: () async {
                        await cubit.createReview();
                        scaffoldMessenger.hideCurrentSnackBar();
                        await Future.delayed(Durations.short4);
                        if (context.mounted) {
                          FoodlySnackbars.successGeneric(context, 'Review submitted successfully!');
                        }
                      },
                      text: 'Submit Review',
                    ).paddingVertical(16);
                  });
            },
          ),
        );
      },
      content: BlocProvider.value(
        value: context.read<VisitBusinessCubit>(),
        child: BlocBuilder<VisitBusinessCubit, VisitBusinessState>(
          builder: (context, state) {
            final vm = state.vm;
            final locale = Intl.getCurrentLocale();

            return Column(
              spacing: 12,
              children: [
                const Asset(FoodlyAssets.review, height: 42, width: 42),
                Text(
                  'Write a Review for ${vm.currentBusiness?.name ?? 'this business'}',
                  style: FoodlyTextStyles.promoTitle.copyWith(fontSize: 16),
                ).paddingVertical(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    if (vm.reviewPhotoPaths.isNotEmpty)
                      ...vm.reviewPhotoPaths.map((path) => Flexible(
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.file(
                                    File(path),
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: CustomRoundedNeumorphicButton(
                                    onPressed: () {
                                      final index = vm.reviewPhotoPaths.indexOf(path);
                                      if (index != -1) {
                                        cubit.removeReviewPhoto(index);
                                      }
                                    },
                                    diameter: 18,
                                    iconSize: 18,
                                    padding: const EdgeInsets.all(4),
                                    iconData: Bootstrap.trash3,
                                    buttonColor: Colors.black54,
                                    iconColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    if (vm.reviewPhotoPaths.length < 3)
                      Flexible(
                        child: CustomRoundedNeumorphicButton(
                          onPressed: () async => await pickImageFile(
                            context,
                            ImageSource.gallery,
                            aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
                            cropStyle: CropStyle.rectangle,
                            aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
                            hideCurrentSnackBar: false,
                          ).then(
                            (path) => path.isNotEmpty ? cubit.addReviewPhoto(path) : null,
                          ),
                          tooltip: S.current.pressToAddPhotosUpToMaxImages(3),
                          diameter: 30,
                          iconSize: 26,
                          iconData: Icons.add_photo_alternate_outlined,
                        ).paddingHorizontal(16),
                      ),
                  ],
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
                const Text('Rate your experience:', style: FoodlyTextStyles.captionBold).paddingTop(16),
                RatingBar.builder(
                  initialRating: vm.currentReviewStars?.toDouble() ?? 0.0,
                  minRating: 1,
                  itemSize: 32,
                  unratedColor: FoodlyThemes.secondaryFoodly,
                  itemBuilder: (context, i) => const Icon(
                    Icons.star,
                    color: FoodlyThemes.warning,
                  ),
                  onRatingUpdate: (rating) => cubit.setReviewStars(rating.toInt()),
                ).paddingBottom(24),
                const Text('When did you visit?', style: FoodlyTextStyles.captionBold),
                LinearCalendar(
                  initialSelectedDate: vm.dateOfVisitForReview,
                  daysBeforeToday: 90,
                  daysAfterToday: 0,
                  selectedColor: FoodlyThemes.tertiaryFoodly,
                  foregroundColor: Colors.black,
                  onDateChanged: (date) => cubit.setDateOfVisitForReview(date),
                  dateBuilder: (context, date, _) {
                    final isSelected = vm.dateOfVisitForReview != null &&
                        date.year == vm.dateOfVisitForReview!.year &&
                        date.month == vm.dateOfVisitForReview!.month &&
                        date.day == vm.dateOfVisitForReview!.day;

                    return AnimatedContainer(
                      duration: Durations.medium3,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected ? FoodlyThemes.tertiaryFoodly : Colors.transparent,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: isSelected ? FoodlyThemes.tertiaryFoodly : FoodlyThemes.secondaryFoodly,
                          width: .5,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            DateFormat('MMM', locale).format(date).capitalize,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black54,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            DateFormat('EEE\nd', locale).format(date).capitalize,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );

    scaffoldMessenger
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar.getSnackBar(context)).closed.then((reason) {
        cubit.resetReviewInput();
      });
  }
}
