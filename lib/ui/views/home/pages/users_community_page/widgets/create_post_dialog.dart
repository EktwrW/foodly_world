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
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      // Material 3 default tiñe el surface del Dialog con el primary del
      // theme según la elevación → como `primaryFoodly` es purple, el chrome
      // (header + action row) salía rosado y el tinte interno del wrapper
      // del TextField se confundía con el fondo. Forzamos blanco puro para
      // que el contenedor interno sí se lea como "campo" sobre fondo limpio.
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: context.screenHeight * 0.72),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            Flexible(child: _buildBody()),
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
            style: FoodlyTextStyles.confirmationTextPrimary,
          ),
        ),
        const CloseButton(
          color: FoodlyThemes.secondaryFoodly,
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.zero),
            minimumSize: WidgetStatePropertyAll(Size(32, 32)),
          ),
        ),
      ],
    ).paddingOnly(left: 16, top: 12, right: 16, bottom: 12);
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Text input ──
          //
          // Se envuelve en un Container con tinte primario muy sutil para
          // que el área editable se lea como un campo y no como prosa
          // suelta dentro del dialog. El contraste con el fondo blanco
          // del body es deliberadamente bajo (alpha 0.04) — el objetivo
          // es delimitar, no competir con el contenido. counterText se
          // suprime acá y el contador real se renderiza en la action row
          // (ver _buildActions) para que el counter no flote contra el
          // borde del Container.
          const SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
            child: TextField(
              controller: _contentController,
              focusNode: _focusNode,
              maxLines: null,
              minLines: 6,
              maxLength: 1000,
              textCapitalization: TextCapitalization.sentences,
              style: FoodlyTextStyles.actionsBody,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: S.current.whatsOnYourMind,
                hintStyle: FoodlyTextStyles.hintText,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isCollapsed: true,
                contentPadding: EdgeInsets.zero,
                counterText: '',
              ),
            ),
          ),
          const SizedBox(height: 8),

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
    final length = _contentController.text.characters.length;
    // Highlight cuando el counter se acerca al límite (≥90 %). El warning
    // amarillo de los temas Foodly comunica "atención sin error" — pasar a
    // error rojo justo en el corte sería castigar al usuario por usar todo
    // el espacio disponible.
    final nearLimit = length >= 900;
    return Row(
      children: [
        // ── Photo picker ──
        _ActionIcon(
          icon: Icons.photo_camera_outlined,
          tooltip: S.current.addPhoto,
          enabled: _photoPath == null,
          onTap: _pickPhoto,
        ),
        const Spacer(),
        // ── Counter ──
        // Se mueve acá desde InputDecoration.counterStyle para que viva
        // junto al CTA y no flote contra el borde del Container del
        // TextField. Mantiene el límite visible sin pelearse con el body.
        Text(
          '$length/1000',
          style: FoodlyTextStyles.caption.copyWith(
            fontSize: 11,
            color: nearLimit ? FoodlyThemes.warning : FoodlyThemes.secondaryFoodly,
          ),
        ),
        const SizedBox(width: 12),

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
        borderRadius: BorderRadius.circular(22),
        // Padding 10 + icon 22 = touch target 42pt → más cómodo que los
        // 38pt previos y por encima del mínimo de Material (40pt) sin
        // engordar el footer del dialog.
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            icon,
            size: 22,
            color: enabled ? FoodlyThemes.primaryFoodly : FoodlyThemes.secondaryFoodly.withValues(alpha: 0.35),
          ),
        ),
      ),
    );
  }
}
