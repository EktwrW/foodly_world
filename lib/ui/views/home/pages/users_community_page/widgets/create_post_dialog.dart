import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/core_exports.dart' show FoodlyThemes, PaddingExtension, ScreenSizeExtension;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/utils/image_picker_and_cropper.dart';
import 'package:foodly_world/ui/views/home/pages/users_community_page/cubit/social_cubit.dart';
import 'package:universal_io/io.dart' as uni_io;

class CreatePostDialog extends StatefulWidget {
  const CreatePostDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<SocialCubit>(),
        child: const CreatePostDialog(),
      ),
    );
  }

  @override
  State<CreatePostDialog> createState() => _CreatePostDialogState();
}

class _CreatePostDialogState extends State<CreatePostDialog> {
  final _contentController = TextEditingController();
  String? _photoPath;
  bool _isPosting = false;

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  bool get _canPost => _contentController.text.trim().isNotEmpty && !_isPosting;

  Future<void> _pickPhoto() async {
    final path = await pickImage(
      context,
      aspectRatioPresets: [CropAspectRatioPreset.ratio16x9, CropAspectRatioPreset.square],
      cropStyle: CropStyle.rectangle,
    );
    if (path.isNotEmpty) {
      setState(() => _photoPath = path);
    }
  }

  Future<void> _submit() async {
    if (!_canPost) return;

    setState(() => _isPosting = true);

    final content = _contentController.text.trim();
    final photo = _photoPath != null ? uni_io.File(_photoPath!) : null;

    if (mounted) Navigator.pop(context);

    context.read<SocialCubit>().createPost(content, photo: photo);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: context.screenHeight * 0.65),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            const Divider(height: 1),
            Flexible(child: _buildBody()),
            const Divider(height: 1),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Row(
      children: [
        Expanded(
          child: Text(
            'Create Post',
            style: FoodlyTextStyles.profileSectionTitlePurple,
          ),
        ),
        CloseButton(),
      ],
    ).paddingOnly(left: 16, top: 12, right: 8, bottom: 12);
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _contentController,
            maxLines: 6,
            minLines: 3,
            maxLength: 369,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'What\'s on your mind?',
              hintStyle: FoodlyTextStyles.hintText,
              border: InputBorder.none,
              counterStyle: FoodlyTextStyles.caption.copyWith(color: Colors.black38),
            ),
          ),
          if (_photoPath != null) _buildPhotoPreview(),
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }

  Widget _buildPhotoPreview() {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.file(
            uni_io.File(_photoPath!),
            width: double.infinity,
            height: 180,
            fit: BoxFit.cover,
          ),
        ),
        IconButton(
          onPressed: () => setState(() => _photoPath = null),
          icon: const Icon(Icons.cancel, color: Colors.white),
          style: IconButton.styleFrom(
            backgroundColor: Colors.black38,
          ),
        ).paddingAll(4),
      ],
    ).paddingOnly(bottom: 8);
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: _photoPath == null ? _pickPhoto : null,
          icon: Icon(
            Icons.photo_camera_outlined,
            color: _photoPath == null ? FoodlyThemes.primaryFoodly : FoodlyThemes.secondaryFoodly,
          ),
        ),
        Flexible(
          child: SizedBox.fromSize(
            size: const Size(100, 40),
            child: CustomNeumorphicButton(
              onPressed: _submit,
              disabled: !_canPost,
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              text: 'Post',
              bosShapeRadius: 8,
            ),
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 12, vertical: 8);
  }
}
