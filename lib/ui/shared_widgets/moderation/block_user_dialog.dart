import 'package:foodly_world/core/network/moderation/moderation_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

/// Diálogo de confirmación para bloquear un usuario (App Store Guideline 1.2).
/// Al confirmar, llama al BE y dispara [onBlocked] (para que la pantalla quite
/// el contenido del usuario bloqueado de la lista).
Future<void> showBlockUserDialog(
  BuildContext context, {
  required String userUuid,
  required String userName,
  VoidCallback? onBlocked,
}) async {
  await showDialog<void>(
    context: context,
    builder: (dialogContext) => _BlockUserDialog(
      userUuid: userUuid,
      userName: userName,
      onBlocked: onBlocked,
    ),
  );
}

class _BlockUserDialog extends StatefulWidget {
  final String userUuid;
  final String userName;
  final VoidCallback? onBlocked;
  const _BlockUserDialog({required this.userUuid, required this.userName, this.onBlocked});

  @override
  State<_BlockUserDialog> createState() => _BlockUserDialogState();
}

class _BlockUserDialogState extends State<_BlockUserDialog> {
  bool _busy = false;

  Future<void> _block() async {
    if (_busy) return;
    setState(() => _busy = true);

    final result = await di<ModerationRepo>().blockUser(widget.userUuid);

    if (!mounted) return;
    result.when(
      success: (_) {
        Navigator.of(context).pop();
        FoodlySnackbars.successGeneric(context, S.current.blockedSuccess);
        widget.onBlocked?.call();
      },
      failure: (_) {
        setState(() => _busy = false);
        FoodlySnackbars.errorGeneric(context, S.current.somethingWentWrong);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      icon: const Icon(Icons.block, color: FoodlyThemes.error, size: 36),
      title: Text(S.current.blockUser, textAlign: TextAlign.center, style: FoodlyTextStyles.actionsBodyBold),
      content: Text(
        S.current.blockUserConfirm(widget.userName.trim().isEmpty ? S.current.thisUser : widget.userName),
        textAlign: TextAlign.center,
        style: FoodlyTextStyles.label,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        CustomNeumorphicButton(
          onPressed: _busy ? null : _block,
          text: _busy ? '...' : S.current.blockUser,
          disabled: _busy,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        ),
        CustomNeumorphicButton(
          onPressed: _busy ? null : () => Navigator.of(context).pop(),
          type: CustomNeumorphicBtnType.outlined,
          text: S.current.cancel,
          disabled: _busy,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        ).paddingTop(19),
      ],
    );
  }
}
