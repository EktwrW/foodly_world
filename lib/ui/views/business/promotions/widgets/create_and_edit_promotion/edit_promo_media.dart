part of '../../promotions_page.dart';

class _EditPromoMediaWdg extends StatelessWidget {
  const _EditPromoMediaWdg({
    super.key,
    required this.vm,
  });

  final PromotionsVM vm;
  static const _maxVideoDuration = Duration(seconds: 20);

  void _addYoutubeUrl(BuildContext context) {
    if (vm.youtubeUrlCtrl != null && vm.youtubeUrlFormKey != null) {
      final cubit = context.read<PromotionsCubit>();

      di<DialogService>().showCustomDialog(
        YoutubeUrlDialog(
          controller: vm.youtubeUrlCtrl!,
          formKey: vm.youtubeUrlFormKey!,
          onTap: () {
            cubit.attachYoutubeUrl();
            cubit.updateEditMode(PromotionEditing.media);
            Navigator.of(context).pop();
          },
        ),
        2,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: ColoredBox(
            color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.1),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: _buildMediaContent(),
            ),
          ),
        ),
        PopupMenuButton(
          elevation: 3,
          style: vm.hasMediaContent
              ? ButtonStyle(backgroundColor: WidgetStatePropertyAll(FoodlyThemes.primaryFoodly.withValues(alpha: .25)))
              : null,
          icon: Icon(Bootstrap.three_dots_vertical,
              color: vm.hasMediaContent ? Colors.white : FoodlyThemes.primaryFoodly),
          itemBuilder: (context) => [
            if (vm.newPromo?.mediaFileIsImage ?? false)
              PopupMenuItem(
                child: Text(S.current.removePhotos),
                onTap: () => _editImage(context),
              ),
            if (vm.newPromo?.mediaFileIsVideo ?? false)
              PopupMenuItem(
                child: Text(S.current.removeVideo),
                onTap: () => _editVideo(context),
              ),
            PopupMenuItem(
              child: const Text('Upload Image'),
              onTap: () => _pickImage(context),
            ),
            PopupMenuItem(
              child: const Text('Upload Video'),
              onTap: () => _pickVideo(context),
            ),
            PopupMenuItem(
              child: const Text('Add YouTube URL'),
              onTap: () => _addYoutubeUrl(context),
            ),
          ],
        ).paddingAll(6),
      ],
    );
  }

  Widget _buildMediaContent() {
    if (vm.newPromo?.mediaFileIsExternalLink ?? false || (vm.youtubeUrlCtrl?.text.isNotEmpty ?? false)) {
      return YouTubeVideoPlayer(
        url: vm.newPromo?.mediaFileUrl ?? vm.youtubeUrlCtrl?.text ?? '',
        videoTitle: vm.newPromo?.title,
      );
    }

    if (vm.newPromoMediaPath?.$2.mediaFileIsVideo == true) {
      // Usar una key única basada en el path para forzar la reconstrucción
      return VideoPreview(
        key: ValueKey(vm.newPromoMediaPath!.$1),
        filePath: vm.newPromoMediaPath!.$1,
      );
    }

    if (vm.imageBytes != null) {
      return Image.memory(
        vm.imageBytes!,
        width: double.infinity,
        fit: BoxFit.fitHeight,
      );
    }

    if (vm.newPromoMediaPath?.$1.isNotEmpty ?? false) {
      if (vm.newPromoMediaPath?.$2.mediaFileIsVideo == true) {
        return VideoPreview(key: ValueKey(vm.newPromoMediaPath!.$1), filePath: vm.newPromoMediaPath!.$1);
      }
      return kIsWeb
          ? Image.network(vm.newPromoMediaPath!.$1, fit: BoxFit.cover, width: double.infinity)
          : Image.file(File(vm.newPromoMediaPath!.$1), width: double.infinity, fit: BoxFit.cover);
    }

    if (vm.newPromo?.promoMedia.isNotEmpty ?? false) {
      if (vm.newPromo?.mediaFileIsVideo == true) {
        return NetworkVideoPlayer(
            key: ValueKey(vm.newPromo!.promoMedia.first.uuid), url: vm.newPromo!.promoMedia.first.mediaUrl);
      }
      return ImageSliderFade(
        imageList: vm.newPromo!.promoMedia
            .map((e) => CachedNetworkImage(
                  imageUrl: e.mediaUrl,
                  width: double.infinity,
                  fadeInDuration: Durations.medium2,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (_, __, ___) => const LoadingWidgetFoodlyIso(),
                ))
            .toList(),
      );
    }

    return Icon(
      Clarity.picture_solid,
      color: FoodlyThemes.primaryFoodly.withValues(alpha: .7),
      size: 120,
    );
  }

  Future<void> _pickImage(BuildContext context) async {
    final cubit = context.read<PromotionsCubit>();
    cubit.updateEditMode(PromotionEditing.media);

    final path = await pickImage(
      context,
      aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
      cropStyle: CropStyle.rectangle,
      aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
    );

    if (path.isNotEmpty && context.mounted) {
      cubit.updatePromoMediaPath((path, MediaType.image));
    }
  }

  Future<void> _pickVideo(BuildContext context) async {
    final cubit = context.read<PromotionsCubit>();
    cubit.updateEditMode(PromotionEditing.media);

    final result = await FilePicker.platform.pickFiles(type: FileType.video);

    if (result != null && result.files.isNotEmpty && context.mounted) {
      final file = File(result.files.first.path!);

      // Validar duración
      final tempController = VideoPlayerController.file(file);
      try {
        await tempController.initialize();

        if (tempController.value.duration > _maxVideoDuration) {
          if (context.mounted) {
            FoodlySnackbars.errorGeneric(context, S.current.videoIsTooLong);
          }
          await tempController.dispose();
          return;
        }

        await tempController.dispose();
        // Actualizar el path después de disponer el controller temporal
        cubit.updatePromoMediaPath((file.path, MediaType.video));
      } catch (e) {
        await tempController.dispose();
        if (context.mounted) {
          FoodlySnackbars.errorGeneric(context, S.current.errorLoadingVideo);
        }
      }
    }
  }

  void _editImage(BuildContext context) {
    if (vm.newPromo?.promoMedia.isNotEmpty ?? false) {
      _pickImage(context);
    }
  }

  void _editVideo(BuildContext context) {
    if (vm.newPromo?.promoMedia.isNotEmpty ?? false) {
      _pickVideo(context);
    }
  }
}

class YoutubeUrlDialog extends StatefulWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final void Function()? onTap;

  const YoutubeUrlDialog({
    super.key,
    required this.controller,
    required this.formKey,
    this.onTap,
  });

  @override
  YoutubeUrlDialogState createState() => YoutubeUrlDialogState();
}

class YoutubeUrlDialogState extends State<YoutubeUrlDialog> {
  bool isValid = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_validateInput);
  }

  void _validateInput() {
    if (mounted) {
      setState(() {
        isValid = widget.formKey.currentState?.validate() ?? false;
      });
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_validateInput);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: Durations.medium3,
      child: Form(
        key: widget.formKey,
        child: Stack(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: UIDimens.SCREEN_PADDING_MOB),
              padding: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: FoodlyThemes.primaryFoodly),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: isValid ? widget.onTap : null,
                    child: Text(
                      'Attach video to promo',
                      style: FoodlyTextStyles.dialogCloseText.copyWith(
                        color: isValid ? null : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ui.NeumoColors.background,
              ),
              margin: const EdgeInsets.only(
                bottom: 50,
                right: UIDimens.SCREEN_PADDING_MOB,
                left: UIDimens.SCREEN_PADDING_MOB,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FoodlyPrimaryInputText(
                    controller: widget.controller,
                    maxLines: 1,
                    autofocus: true,
                    inputTextType: FoodlyInputType.youtubeUrl,
                    autovalidateMode: AutovalidateMode.always,
                    enabled: true,
                    showLeading: false,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
