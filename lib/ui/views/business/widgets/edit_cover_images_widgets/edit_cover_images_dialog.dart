import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/image/adaptive_image_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/utils/image_picker_and_cropper.dart';
import 'package:foodly_world/ui/views/business/bloc/business_bloc.dart';
import 'package:foodly_world/ui/views/business/widgets/edit_cover_images_widgets/edit_image_popup_menu_button.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart' as ui;
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class EditCoverImagesDialog extends StatelessWidget {
  const EditCoverImagesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessBloc, BusinessState>(
      builder: (context, state) {
        final vm = state.vm;
        final bloc = context.read<BusinessBloc>();

        return FadeIn(
          duration: const Duration(milliseconds: 350),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Durations.medium1,
                height: vm.picturesPath.length < 6 ? 630 : 580,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
                padding: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: FoodlyThemes.primaryFoodly,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (vm.picturesPath.any((p) => p.imageId == null) || vm.targetForDelete != null)
                          FadeIn(
                            child: InkWell(
                              onTap: () {
                                if (vm.targetForDelete != null) {
                                  context
                                      .read<BusinessBloc>()
                                      .add(BusinessEvent.deleteCoverImageById(vm.targetForDelete!));
                                } else {
                                  bloc.add(const BusinessEvent.uploadPictures());
                                }
                              },
                              child: Text(
                                vm.targetForDelete != null ? S.current.confirm : S.current.save,
                                style: FoodlyTextStyles.dialogCloseText,
                              ),
                            ),
                          ),
                        FadeIn(
                          child: InkWell(
                            onTap: () async {
                              if (vm.targetForDelete != null) {
                                bloc.add(const BusinessEvent.cancelDeleteCoverImage());
                              } else {
                                Navigator.of(context).pop();
                                await Future.delayed(Durations.short4);
                                bloc.add(const BusinessEvent.cancelUploadPictures());
                              }
                            },
                            child: Text(
                                vm.picturesPath.any((p) => p.imageId == null) || vm.targetForDelete != null
                                    ? S.current.cancel
                                    : S.current.close,
                                style: FoodlyTextStyles.dialogCloseText),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: Durations.medium1,
                height: vm.picturesPath.length < 6 ? 580 : 530,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ui.NeumorphicColors.background,
                ),
                margin: const EdgeInsets.only(
                  bottom: 50,
                  right: UIDimens.SCREEN_PADDING_MOB,
                  left: UIDimens.SCREEN_PADDING_MOB,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Asset(FoodlyAssets.coverImages, height: 50).paddingBottom(18),
                      Text(
                        S.current.editCoverImages,
                        textAlign: TextAlign.center,
                        style: FoodlyTextStyles.confirmationTextPrimary,
                      ).paddingBottom(30),
                      if (vm.targetForDelete != null)
                        SizedBox(
                          height: 300,
                          child: AnimatedCrossFade(
                            duration: Durations.medium3,
                            crossFadeState: state == BusinessState.pictureDeleted(vm)
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            firstChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  S.current.doYouWantToDeleteThisCoverImage,
                                  textAlign: TextAlign.center,
                                  style: FoodlyTextStyles.captionPurpleBold,
                                ).paddingBottom(32),
                                FadeIn(child: AdaptiveImage(imagePath: vm.targetForDelete!.url ?? '')),
                              ],
                            ),
                            secondChild: ElasticIn(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Asset(FoodlyAssets.trash, height: 60).paddingBottom(24),
                                  Text(S.current.successfullyDeleted),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (vm.picturesPath.isNotEmpty && vm.targetForDelete == null)
                        FadeIn(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: context.screenWidth * .022,
                            runSpacing: 10,
                            children: vm.picturesPath
                                .map(
                                  (coverImageDM) => ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: SizedBox(
                                      width: context.screenWidth * .4,
                                      child: Stack(
                                        children: [
                                          AdaptiveImage(imagePath: coverImageDM.url ?? ''),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: EditImagePopupMenuButton(coverImageDM: coverImageDM),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      if (vm.picturesPath.length < 6 && vm.targetForDelete == null)
                        FadeIn(
                          child: IconButton.filled(
                            onPressed: () async => await pickImageFile(
                              context,
                              ImageSource.gallery,
                              aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
                              cropStyle: CropStyle.rectangle,
                              aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
                            ).then(
                              (path) => path.isNotEmpty ? bloc.add(BusinessEvent.addPicture(path)) : null,
                            ),
                            tooltip: S.current.pressToAddPhotosUpToMaxImages(6),
                            icon: const Icon(Bootstrap.plus_circle, size: 28),
                            padding: const EdgeInsets.all(4),
                          ).paddingTop(20),
                        ),
                    ],
                  ).paddingTop(10),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
