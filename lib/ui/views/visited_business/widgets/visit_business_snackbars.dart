import 'package:flutter/cupertino.dart' show CupertinoDatePicker, CupertinoDatePickerMode;
import 'package:flutter_linear_calendar/flutter_linear_calendar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart' show FoodlyAssets;
import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/core/extensions/datetime_extension.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart' show Asset;
import 'package:foodly_world/data_models/reviews/review_dm.dart' show ReviewDM;
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
import 'package:universal_io/io.dart' show File;

class VisitedBusinessSnackbars {
  const VisitedBusinessSnackbars._();

  static DateTime _roundedInitialTime() {
    final now = DateTime.now();
    final roundedMinute = (now.minute / 15).ceil() * 15;
    return DateTime(now.year, now.month, now.day, now.hour + (roundedMinute >= 60 ? 1 : 0), roundedMinute % 60);
  }

  static void showInputReviewWdg(
    BuildContext context, {
    ReviewDM? existingReview,
  }) {
    final cubit = context.read<VisitBusinessCubit>();
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final isEditMode = existingReview != null;

    if (isEditMode) {
      cubit.initializeInputForEditReview(existingReview);
    } else {
      cubit.initializeInputForReview();
    }

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
                    final isCommentChanged = isEditMode && value.text != (existingReview.comment ?? '');
                    return CustomNeumorphicButton(
                      disabled: value.text.isEmpty || (!canSubmitReview && !isCommentChanged),
                      onPressed: () async {
                        if (isEditMode) {
                          await cubit.updateReview();
                        } else {
                          await cubit.createReview();
                        }
                        scaffoldMessenger.hideCurrentSnackBar();
                        await Future.delayed(Durations.short4);
                        if (context.mounted) {
                          FoodlySnackbars.successGeneric(
                            context,
                            isEditMode ? S.current.reviewUpdatedSuccessfully : S.current.reviewSubmittedSuccessfully,
                          );
                        }
                      },
                      text: isEditMode ? S.current.updateReview : S.current.submitReview,
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
            final currentEditingReview = vm.editingReview;
            final editingPhotoUrls = currentEditingReview?.photoUrls ?? [];
            final existingPhotoCount = isEditMode ? editingPhotoUrls.length : 0;

            return Column(
              spacing: 12,
              children: [
                const Asset(FoodlyAssets.review, height: 42, width: 42),
                Text(
                  isEditMode
                      ? S.current.editYourReviewFor(vm.currentBusiness?.name ?? S.current.thisBusiness)
                      : S.current.writeReviewFor(vm.currentBusiness?.name ?? S.current.thisBusiness),
                  style: FoodlyTextStyles.promoTitle.copyWith(fontSize: 16),
                ).paddingVertical(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    if (isEditMode && editingPhotoUrls.isNotEmpty)
                      ...editingPhotoUrls.map((url) => Flexible(
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.network(
                                    url,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: CustomRoundedNeumorphicButton(
                                    onPressed: () {
                                      final reviewPhotoDM =
                                          currentEditingReview!.photos.firstWhere((p) => p.photoUrl == url);
                                      if (reviewPhotoDM.photoUuid?.isNotEmpty ?? false) {
                                        cubit.deleteReviewPhoto(reviewPhotoDM.photoUuid!);
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
                    if (existingPhotoCount + vm.reviewPhotoPaths.length < 3)
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
                  maxLength: 99,
                  maxLines: 6,
                  minLines: 3,
                  enabled: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputTextType: FoodlyInputType.generic,
                  hideCurrentSnackBarWhenOnTap: false,
                  hintText: S.current.writeYourReviewHint,
                ),
                Text(S.current.rateYourExperience, style: FoodlyTextStyles.captionBold).paddingTop(16),
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
                Text(S.current.whenDidYouVisit, style: FoodlyTextStyles.captionBold),
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
                            date.getMonthAbreviatedFormat,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black54,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            date.getDayNumberAndNameAbreviatedFormat,
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

  static void showDeleteReviewConfirmation(
    BuildContext context,
    VisitBusinessCubit cubit,
    ReviewDM review,
  ) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.hideCurrentSnackBar();

    final snackBar = SnackBarWdg(
      type: SnackBarType.action,
      onPressed: () async {
        await cubit.deleteReview(review.reviewUuid!);
        await Future.delayed(Durations.short4);
        if (context.mounted) {
          FoodlySnackbars.successGeneric(context, S.current.reviewDeletedSuccessfully);
        }
      },
      buttonText: S.current.confirm,
      content: Text.rich(
        TextSpan(
          style: FoodlyTextStyles.snackBarLightBody,
          children: <TextSpan>[
            TextSpan(text: '${S.current.delete} '),
            const TextSpan(text: 'your review?', style: FoodlyTextStyles.actionsBodyBold),
            TextSpan(text: '\n${S.current.cannotUndone}'),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );

    scaffoldMessenger.showSnackBar(snackBar.getSnackBar(context));
  }

  static void showAlreadyReviewedInfo(
    BuildContext context,
    ReviewDM existingReview,
  ) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.hideCurrentSnackBar();

    final snackBar = SnackBarWdg(
      type: SnackBarType.action,
      buttonText: S.current.editReview,
      onPressed: () {
        if (context.mounted) {
          Future.delayed(Durations.short4, () {
            if (context.mounted) {
              showInputReviewWdg(context, existingReview: existingReview);
            }
          });
        }
      },
      content: Text(
        S.current.alreadyReviewedPrompt,
        textAlign: TextAlign.center,
        style: FoodlyTextStyles.snackBarLightBody,
      ),
    );

    scaffoldMessenger.showSnackBar(snackBar.getSnackBar(context));
  }

  static void requestReservation(BuildContext context) {
    final cubit = context.read<VisitBusinessCubit>();
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    cubit.initializeReservationInput();

    final snackBar = SnackBarWdg(
      type: SnackBarType.action,
      buttonBuilder: (dismiss) {
        return BlocProvider.value(
          value: cubit,
          child: BlocSelector<VisitBusinessCubit, VisitBusinessState, bool>(
            selector: (state) => state.vm.canSubmitReservation,
            builder: (context, canSubmit) {
              return SizedBox(
                height: 50,
                child: CustomNeumorphicButton(
                  disabled: !canSubmit,
                  fontSize: 14,
                  onPressed: () async {
                    final successSnack = SnackBarWdg(
                      type: SnackBarType.success,
                      content: Text(S.current.reservationRequestSent,
                          textAlign: TextAlign.center, style: FoodlyTextStyles.snackBarLightBody),
                      duration: const Duration(seconds: 5),
                    ).getSnackBar(context);
                    final errorSnack = SnackBarWdg(
                      type: SnackBarType.error,
                      content: Text(S.current.reservationRequestFailed,
                          textAlign: TextAlign.center, style: FoodlyTextStyles.snackBarLightBody),
                      duration: const Duration(seconds: 4),
                    ).getSnackBar(context);

                    final success = await cubit.createReservation();
                    scaffoldMessenger.hideCurrentSnackBar();
                    await Future.delayed(Durations.short4);
                    scaffoldMessenger.showSnackBar(success ? successSnack : errorSnack);
                  },
                  text: S.current.requestReservation,
                ),
              );
            },
          ),
        );
      },
      content: BlocProvider.value(
        value: cubit,
        child: BlocBuilder<VisitBusinessCubit, VisitBusinessState>(
          builder: (context, state) {
            final vm = state.vm;
            final maxSize = vm.currentBusiness?.reservationsSizeLimit ?? 6;

            return Column(
              spacing: 12,
              children: [
                if (vm.currentBusiness?.bussinessReservationImage != null)
                  Asset(vm.currentBusiness!.bussinessReservationImage, height: 48),
                Text(
                  S.current.reserveTableAt(vm.currentBusiness?.name ?? S.current.thisBusiness),
                  style: FoodlyTextStyles.promoTitle.copyWith(fontSize: 16),
                ).paddingVertical(16),

                // Date picker
                Text(S.current.selectADate, style: FoodlyTextStyles.captionBold),
                LinearCalendar(
                  initialSelectedDate: vm.reservationDateTime,
                  selectedColor: FoodlyThemes.tertiaryFoodly,
                  foregroundColor: Colors.black,
                  onDateChanged: (date) => cubit.setReservationDate(date),
                  dateBuilder: (context, date, _) {
                    final isSelected = vm.reservationDateTime != null &&
                        date.year == vm.reservationDateTime!.year &&
                        date.month == vm.reservationDateTime!.month &&
                        date.day == vm.reservationDateTime!.day;

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
                            date.getMonthAbreviatedFormat,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black54,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            date.getDayNumberAndNameAbreviatedFormat,
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

                // Time picker
                Text(S.current.selectATime, style: FoodlyTextStyles.captionBold).paddingTop(8),
                SizedBox(
                  height: 80,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    initialDateTime: _roundedInitialTime(),
                    use24hFormat: true,
                    minuteInterval: 15,
                    showTimeSeparator: true,
                    onDateTimeChanged: (dateTime) {
                      cubit.setReservationTime(
                        '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}',
                      );
                    },
                  ),
                ),

                // Party size
                Text(S.current.partySize, style: FoodlyTextStyles.captionBold).paddingTop(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 16,
                  children: [
                    CustomRoundedNeumorphicButton(
                      onPressed: (vm.reservationSize ?? 0) > 1
                          ? () => cubit.setReservationSize((vm.reservationSize ?? 2) - 1)
                          : null,
                      diameter: 20,
                      iconSize: 20,
                      iconData: Icons.remove,
                    ),
                    Text(
                      '${vm.reservationSize ?? 1}',
                      style: FoodlyTextStyles.promoTitle,
                    ),
                    CustomRoundedNeumorphicButton(
                      onPressed: (vm.reservationSize ?? 1) < maxSize
                          ? () => cubit.setReservationSize((vm.reservationSize ?? 0) + 1)
                          : null,
                      diameter: 20,
                      iconSize: 20,
                      iconData: Icons.add,
                    ),
                  ],
                ),
                Text(S.current.maxSize(maxSize), style: FoodlyTextStyles.captionPurple),

                // Special requests
                SizedBox(
                  height: 73,
                  child: FoodlyPrimaryInputText(
                    controller: vm.specialRequestsController,
                    maxLength: 500,
                    maxLines: 1,
                    minLines: 1,
                    enabled: true,
                    autovalidateMode: AutovalidateMode.disabled,
                    inputTextType: FoodlyInputType.generic,
                    hideCurrentSnackBarWhenOnTap: false,
                    hintText: S.current.specialRequestsOptional,
                    hintTextSize: 12,
                  ),
                ).paddingVertical(12),
              ],
            );
          },
        ),
      ),
    );

    scaffoldMessenger
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar.getSnackBar(context)).closed.then((reason) {
        cubit.resetReservationInput();
      });
  }
}
