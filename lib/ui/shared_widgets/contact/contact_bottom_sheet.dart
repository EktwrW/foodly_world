import 'package:animate_do/animate_do.dart' show FadeIn;
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart' as ui;
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/contact/cubit/contact_cubit.dart';
import 'package:foodly_world/ui/shared_widgets/contact/cubit/contact_state.dart';
import 'package:foodly_world/ui/shared_widgets/contact/view_model/contact_vm.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:icons_plus/icons_plus.dart';

void showContactBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => BlocProvider(
      create: (_) => ContactCubit(di<MeRepo>()),
      child: const _ContactBottomSheet(),
    ),
  );
}

class _ContactBottomSheet extends StatefulWidget {
  const _ContactBottomSheet();

  @override
  State<_ContactBottomSheet> createState() => _ContactBottomSheetState();
}

class _ContactBottomSheetState extends State<_ContactBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  int _messageLength = 0;

  static const int _maxMessageLength = 369;

  @override
  void initState() {
    super.initState();
    _messageController.addListener(() {
      setState(() => _messageLength = _messageController.text.length);
    });
  }

  @override
  void dispose() {
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactCubit, ContactState>(
      listener: (context, state) {
        state.whenOrNull(
          sent: (_) {
            Navigator.of(context).pop();
            FoodlySnackbars.successGeneric(context, S.current.contactSentSuccess);
          },
          error: (msg, _) => FoodlySnackbars.errorGeneric(context, msg),
        );
      },
      builder: (context, state) {
        final cubit = context.read<ContactCubit>();
        final vm = state.vm;
        final isSending = state.isSending;

        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            decoration: const BoxDecoration(
              color: ui.NeumorphicColors.background,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHandle(),
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 86),
                    child: FadeIn(
                      duration: const Duration(milliseconds: 300),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          spacing: 19,
                          children: [
                            _buildTitle(),
                            _buildRecipientSelector(cubit, vm, isSending),
                            _buildSubjectField(isSending),
                            _buildMessageField(isSending),
                            _buildAttachmentRow(cubit, vm, isSending),
                            _buildButtons(context, cubit, isSending),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHandle() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 12, bottom: 4),
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        const Icon(Bootstrap.mailbox2_flag, size: 22, color: FoodlyThemes.primaryFoodly),
        const SizedBox(width: 10),
        Text(S.current.contactUs, style: FoodlyTextStyles.menuTitle),
      ],
    );
  }

  Widget _buildRecipientSelector(ContactCubit cubit, ContactVM vm, bool isSending) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(S.current.contactSelectRecipient, style: FoodlyTextStyles.labelPurpleBold),
        Row(
          spacing: 10,
          children: [
            Expanded(
              child: _RecipientChip(
                label: S.current.contactRecipientHello,
                subtitle: 'hello@foodly.solutions',
                selected: vm.recipient == ContactRecipient.hello,
                onTap: isSending ? null : () => cubit.setRecipient(ContactRecipient.hello),
              ),
            ),
            Expanded(
              child: _RecipientChip(
                label: S.current.contactRecipientPrivacy,
                subtitle: 'privacy@foodly.solutions',
                selected: vm.recipient == ContactRecipient.privacy,
                onTap: isSending ? null : () => cubit.setRecipient(ContactRecipient.privacy),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSubjectField(bool isSending) {
    return TextFormField(
      controller: _subjectController,
      enabled: !isSending,
      maxLength: 150,
      textInputAction: TextInputAction.next,
      style: FoodlyTextStyles.inputTextValue,
      decoration: _inputDecoration(
        label: S.current.subject,
        hint: S.current.contactSubjectHint,
        counterText: '',
      ),
      validator: (v) => (v == null || v.trim().isEmpty) ? S.current.contactSubjectHint : null,
    );
  }

  Widget _buildMessageField(bool isSending) {
    return TextFormField(
      controller: _messageController,
      enabled: !isSending,
      maxLength: _maxMessageLength,
      maxLines: 9,
      minLines: 6,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      style: FoodlyTextStyles.inputTextValue,
      inputFormatters: [LengthLimitingTextInputFormatter(_maxMessageLength)],
      decoration: _inputDecoration(
        label: S.current.message,
        hint: S.current.contactMessageHint,
        counterText: '$_messageLength / $_maxMessageLength',
      ),
      validator: (v) => (v == null || v.trim().isEmpty) ? S.current.contactMessageHint : null,
    );
  }

  Widget _buildAttachmentRow(ContactCubit cubit, ContactVM vm, bool isSending) {
    final hasAttachment = vm.attachmentPath != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        if (hasAttachment)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            margin: const EdgeInsets.only(bottom: 19),
            decoration: BoxDecoration(
              color: FoodlyThemes.primaryFoodly.withValues(alpha: .06),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: FoodlyThemes.primaryFoodly.withValues(alpha: .3)),
            ),
            child: Row(
              spacing: 8,
              children: [
                const Icon(Bootstrap.image, size: 18, color: FoodlyThemes.primaryFoodly),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.current.contactImageAttached, style: FoodlyTextStyles.labelPurpleBold),
                      Text(
                        vm.attachmentName ?? '',
                        style: FoodlyTextStyles.label,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                if (!isSending)
                  GestureDetector(
                    onTap: cubit.clearAttachment,
                    child: Text(
                      S.current.contactRemoveImage,
                      style: const TextStyle(
                        color: FoodlyThemes.error,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          )
        else
          GestureDetector(
            onTap: isSending ? null : cubit.pickAttachment,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              margin: const EdgeInsets.only(bottom: 19),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSending ? Colors.black12 : FoodlyThemes.primaryFoodly.withValues(alpha: .4),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
                children: [
                  Icon(
                    Bootstrap.paperclip,
                    size: 16,
                    color: isSending ? Colors.black26 : FoodlyThemes.primaryFoodly,
                  ),
                  Text(
                    S.current.contactAttachImage,
                    style: FoodlyTextStyles.label.copyWith(
                      color: isSending ? Colors.black38 : FoodlyThemes.primaryFoodly,
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (vm.attachmentTooLarge) Text(S.current.contactFileTooLarge, style: FoodlyTextStyles.errorInputText),
      ],
    );
  }

  Widget _buildButtons(BuildContext context, ContactCubit cubit, bool isSending) {
    return Row(
      spacing: 12,
      children: [
        Expanded(
          child: CustomNeumorphicButton(
            onPressed: isSending ? null : () => Navigator.of(context).pop(),
            type: CustomNeumorphicBtnType.outlined,
            text: S.current.cancel,
            disabled: isSending,
            padding: const EdgeInsets.all(9),
          ),
        ),
        Expanded(
          child: CustomNeumorphicButton(
            onPressed: isSending
                ? null
                : () {
                    if (_formKey.currentState!.validate()) {
                      cubit.send(
                        subject: _subjectController.text.trim(),
                        message: _messageController.text.trim(),
                      );
                    }
                  },
            text: isSending ? '...' : S.current.send,
            disabled: isSending,
            padding: const EdgeInsets.all(9),
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration({
    required String label,
    required String hint,
    String? counterText,
  }) {
    const borderRadius = BorderRadius.all(Radius.circular(8));

    return InputDecoration(
      labelText: label,
      hintText: hint,
      counterText: counterText,
      hintStyle: FoodlyTextStyles.hintText,
      labelStyle: FoodlyTextStyles.labelPurpleBold,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      enabledBorder: const OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: FoodlyThemes.secondaryFoodly),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: FoodlyThemes.primaryFoodly, width: 1.5),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: FoodlyThemes.error),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: FoodlyThemes.error, width: 1.5),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: Colors.black12),
      ),
      filled: true,
      fillColor: Colors.white,
    );
  }
}

// ── Recipient chip ──────────────────────────────────────────────────────────

class _RecipientChip extends StatelessWidget {
  final String label;
  final String subtitle;
  final bool selected;
  final VoidCallback? onTap;

  const _RecipientChip({
    required this.label,
    required this.subtitle,
    required this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? FoodlyThemes.primaryFoodly : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? FoodlyThemes.primaryFoodly : FoodlyThemes.secondaryFoodly,
            width: selected ? 1.5 : 1,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: FoodlyThemes.primaryFoodly.withValues(alpha: .18),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 2,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: selected ? Colors.white : FoodlyThemes.primaryFoodly,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 10,
                color: selected ? Colors.white70 : Colors.black54,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
