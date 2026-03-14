part of '../user_profile_page.dart';

class _DeleteAccountSection extends StatelessWidget {
  final VoidCallback onDeleteConfirmed;

  const _DeleteAccountSection({super.key, required this.onDeleteConfirmed});

  void _showConfirmDialog(BuildContext context, bool hasActiveBusiness) {
    showDialog<bool>(
      context: context,
      builder: (_) => _DeleteAccountDialog(
        hasActiveBusiness: hasActiveBusiness,
        onConfirm: () {
          Navigator.of(context).pop();
          onDeleteConfirmed();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.read<UserProfileCubit>().state.vm;
    final hasActiveBusiness = vm.currentUser?.business.isNotEmpty ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: [
        FoodlySectionsTitle(
          firstText: S.current.dangerZone,
          secondText: '',
          isDangerZone: true,
        ),
        CustomNeumorphicButton(
          onPressed: () => _showConfirmDialog(context, hasActiveBusiness),
          type: CustomNeumorphicBtnType.outlined,
          disabled: false,
          leading: const Icon(
            Icons.delete_forever_outlined,
            size: 24,
            color: FoodlyThemes.error,
          ),
          text: S.current.deleteAccount,
          foregroundColor: FoodlyThemes.error,
          padding: const EdgeInsets.symmetric(vertical: 9),
        ).paddingHorizontal(9),
      ],
    ).paddingOnly(top: 16, bottom: 49);
  }
}

class _DeleteAccountDialog extends StatelessWidget {
  final bool hasActiveBusiness;
  final VoidCallback onConfirm;

  const _DeleteAccountDialog({
    required this.hasActiveBusiness,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: Colors.red.shade700),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              S.current.deleteAccountTitle,
              style: TextStyle(color: Colors.red.shade700, fontSize: 17),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.current.deleteAccountWarning, style: const TextStyle(fontSize: 14)),
          if (hasActiveBusiness) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.store_mall_directory_outlined, color: Colors.red.shade700, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      S.current.deleteAccountBusinessWarning,
                      style: TextStyle(fontSize: 13, color: Colors.red.shade800),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(S.current.cancel, style: const TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          onPressed: onConfirm,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade700,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Text(S.current.deleteAccountConfirm),
        ),
      ],
    );
  }
}
