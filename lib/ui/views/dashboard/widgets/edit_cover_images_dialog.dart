import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/consts/foodly_assets.dart';
import 'package:foodly_world/core/extensions/padding_extension.dart';
import 'package:foodly_world/core/extensions/screen_size_extension.dart';
import 'package:foodly_world/core/utils/assets_handler/assets_handler.dart';
import 'package:foodly_world/data_models/organization/business_cover_image_dm.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/constants/ui_dimensions.dart';
import 'package:foodly_world/ui/shared_widgets/image/adaptive_image_widget.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:foodly_world/ui/utils/image_picker_and_cropper.dart';
import 'package:foodly_world/ui/views/dashboard/bloc/dashboard_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart' as ui;

class EditCoverImagesDialog extends StatelessWidget {
  const EditCoverImagesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        final vm = state.vm;
        final bloc = context.read<DashboardBloc>();

        return FadeIn(
          duration: const Duration(milliseconds: 350),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Durations.medium1,
                height: vm.picturesPath.length < 6 ? 600 : 550,
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
                        InkWell(
                          onTap: () {
                            if (vm.targetForDelete != null) {
                              context
                                  .read<DashboardBloc>()
                                  .add(DashboardEvent.deleteCoverImageById(vm.targetForDelete!));
                            } else {
                              bloc.add(const DashboardEvent.uploadPictures());
                            }
                          },
                          child: Text(
                            vm.targetForDelete != null ? 'Confirmar' : 'Guardar',
                            style: FoodlyTextStyles.dialogCloseText,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (vm.targetForDelete != null) {
                              bloc.add(const DashboardEvent.cancelDeleteCoverImage());
                            } else {
                              Navigator.of(context).pop();
                              bloc.add(const DashboardEvent.cancelUploadPictures());
                            }
                          },
                          child: Text(S.current.cancel, style: FoodlyTextStyles.dialogCloseText),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: Durations.medium1,
                height: vm.picturesPath.length < 6 ? 550 : 500,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: const Asset(FoodlyAssets.coverImages, height: 70).paddingRight(0)),
                          const Expanded(
                            flex: 2,
                            child: Text(
                              'Editar fotos de Portada',
                              textAlign: TextAlign.center,
                              style: FoodlyTextStyles.confirmationTextPrimary,
                            ),
                          ),
                        ],
                      ).paddingBottom(30),
                      if (vm.targetForDelete != null) AdaptiveImage(imagePath: vm.targetForDelete!.url ?? ''),
                      if (vm.picturesPath.isNotEmpty && vm.targetForDelete == null)
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 10,
                          runSpacing: 10,
                          children: vm.picturesPath
                              .map(
                                (coverImageDM) => SizedBox(
                                  width: context.screenWidth * .4,
                                  child: Stack(
                                    children: [
                                      AdaptiveImage(imagePath: coverImageDM.url ?? ''),
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: EditImagePopupMenuButton(coverImageDM: coverImageDM)),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      if (vm.picturesPath.length < 6)
                        IconButton.filled(
                          onPressed: () async => await pickImageFile(
                            context,
                            ImageSource.gallery,
                            aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
                            cropStyle: CropStyle.rectangle,
                            aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
                          ).then(
                            (path) => path.isNotEmpty ? bloc.add(DashboardEvent.addPicture(path)) : null,
                          ),
                          tooltip: 'Presiona para agregar fotos, hasta un maximo de 6 imagenes',
                          icon: const Icon(Bootstrap.plus_circle, size: 28),
                          padding: const EdgeInsets.all(4),
                        ).paddingTop(20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class EditImagePopupMenuButton extends StatelessWidget {
  final BusinessCoverImageDM coverImageDM;

  const EditImagePopupMenuButton({super.key, required this.coverImageDM});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: const Icon(Icons.more_vert, color: Colors.white),
      constraints: const BoxConstraints(maxWidth: 50),
      onSelected: (item) => onItemSelected(context, item),
      color: Colors.white70,
      itemBuilder: (context) => [
        const PopupMenuItem(
          height: 36,
          value: 1,
          child: Icon(Bootstrap.pencil_square, size: 24, color: FoodlyThemes.primaryFoodly),
        ),
        const PopupMenuItem(
          height: 36,
          value: 2,
          child: Icon(Bootstrap.trash3, size: 24, color: FoodlyThemes.primaryFoodly),
        ),
      ],
    );
  }

  void onItemSelected(BuildContext context, int item) {
    switch (item) {
      case 1:
        break;
      case 2:
        context.read<DashboardBloc>().add(DashboardEvent.deleteCoverImageById(coverImageDM));
        break;

      default:
        break;
    }
  }
}
