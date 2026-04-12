import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly_world/core/core_exports.dart' show FoodlyThemes, PaddingExtension, ScreenSizeExtension, S;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart' show CustomNeumorphicButton;
import 'package:foodly_world/ui/shared_widgets/link_preview/link_preview_card.dart';
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
  final _focusNode = FocusNode();
  String? _photoPath;
  bool _isPosting = false;

  /// Debounced URL extracted from the current text.
  String? _detectedUrl;

  @override
  void initState() {
    super.initState();
    _contentController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _contentController.removeListener(_onTextChanged);
    _contentController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  bool get _canPost => _contentController.text.trim().isNotEmpty && !_isPosting;

  // ── URL detection ──

  void _onTextChanged() {
    final url = extractFirstUrl(_contentController.text);
    if (url != _detectedUrl) setState(() => _detectedUrl = url);
    setState(() {}); // refresh canPost state
  }

  // ── Actions ──

  Future<void> _pickPhoto() async {
    final path = await pickImage(
      context,
      aspectRatioPresets: [CropAspectRatioPreset.ratio16x9, CropAspectRatioPreset.square],
      cropStyle: CropStyle.rectangle,
    );
    if (path.isNotEmpty) setState(() => _photoPath = path);
  }

  Future<void> _submit() async {
    if (!_canPost) return;

    setState(() => _isPosting = true);

    final content = _contentController.text.trim();
    final photo = _photoPath != null ? uni_io.File(_photoPath!) : null;

    if (mounted) Navigator.pop(context);

    context.read<SocialCubit>().createPost(content, photo: photo);
  }

  // ── Build ──

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: context.screenHeight * 0.72),
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
    return Row(
      children: [
        Expanded(
          child: Text(
            S.current.createPostTitle,
            style: FoodlyTextStyles.profileSectionTitlePurple,
          ),
        ),
        CloseButton(
          color: Colors.grey.shade500,
          style: ButtonStyle(
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            minimumSize: WidgetStateProperty.all(const Size(36, 36)),
          ),
        ),
      ],
    ).paddingOnly(left: 16, top: 12, right: 8, bottom: 12);
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Text input ──
          TextField(
            controller: _contentController,
            focusNode: _focusNode,
            maxLines: null,
            minLines: 6,
            maxLength: 1000,
            textCapitalization: TextCapitalization.sentences,
            style: FoodlyTextStyles.label,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: S.current.whatsOnYourMind,
              hintStyle: FoodlyTextStyles.hintText,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
              counterStyle: FoodlyTextStyles.caption.copyWith(color: Colors.black26, fontSize: 11),
            ),
          ),

          // ── Detected URL preview ──
          if (_detectedUrl != null) ...[
            LinkPreviewCard(url: _detectedUrl!, compact: true),
            const SizedBox(height: 8),
          ],

          // ── Photo preview ──
          if (_photoPath != null) _buildPhotoPreview(),
        ],
      ),
    );
  }

  Widget _buildPhotoPreview() {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.file(
            uni_io.File(_photoPath!),
            width: double.infinity,
            height: 140,
            fit: BoxFit.cover,
          ),
        ),
        Material(
          color: Colors.black38,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => setState(() => _photoPath = null),
            child: const Padding(
              padding: EdgeInsets.all(6),
              child: Icon(Icons.close, color: Colors.white, size: 18),
            ),
          ),
        ).paddingAll(6),
      ],
    ).paddingOnly(bottom: 8);
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // ── Photo picker ──
        _ActionIcon(
          icon: Icons.photo_camera_outlined,
          tooltip: S.current.addPhoto,
          enabled: _photoPath == null,
          onTap: _pickPhoto,
        ),

        // ── Post button ──
        SizedBox.fromSize(
          size: const Size(126, 40),
          child: CustomNeumorphicButton(
            onPressed: _canPost ? _submit : null,
            disabled: !_canPost,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            text: S.current.post,
            bosShapeRadius: 8,
            fontSize: 14,
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 12, vertical: 10);
  }
}

/// Small icon button used in the actions bar.
class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final bool enabled;
  final VoidCallback onTap;

  const _ActionIcon({required this.icon, required this.tooltip, required this.enabled, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            size: 22,
            color: enabled ? FoodlyThemes.primaryFoodly : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}
