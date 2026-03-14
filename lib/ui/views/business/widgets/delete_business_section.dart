import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/shared_widgets/texts/foodly_sections_text_wdgs.dart' show FoodlySectionsTitle;
import 'package:go_router/go_router.dart';

class DeleteBusinessSection extends StatelessWidget {
  const DeleteBusinessSection({super.key});

  Future<void> _onConfirmDelete(BuildContext context, String businessUuid) async {
    final dialogService = di<DialogService>();
    dialogService.showLoading();

    final result = await di<BusinessRepo>().deleteBusiness(businessUuid);

    dialogService.hideLoading();

    if (!context.mounted) return;

    result.when(
      success: (_) async {
        // Refresh user session so role reverts to Customer
        final refreshResult = await di<MeRepo>().fetchLoggedUser();
        if (context.mounted) {
          refreshResult.whenOrNull(
            success: (userDM) {
              final current = di<AuthSessionService>().userSessionDM;
              if (current != null) {
                final updated = current.copyWith(user: userDM);
                di<AuthSessionService>().setSession(updated);
                context.read<RootBloc>().add(RootEvent.cacheAuthSession(userSessionDM: updated));
              }
            },
          );
          FoodlySnackbars.successGeneric(context, S.current.deleteBusinessSuccess);
          context.goNamed(AppRoutes.home.name);
        }
      },
      failure: (e) => FoodlySnackbars.errorGeneric(context, e.errorMsg),
    );
  }

  void _showConfirmDialog(BuildContext context, String businessUuid) {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.red.shade700),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                S.current.deleteBusinessTitle,
                style: TextStyle(color: Colors.red.shade700, fontSize: 17),
              ),
            ),
          ],
        ),
        content: Text(S.current.deleteBusinessWarning, style: const TextStyle(fontSize: 14)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(S.current.cancel, style: const TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _onConfirmDelete(context, businessUuid);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade700,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(S.current.deleteBusinessConfirm),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessBloc, BusinessState>(
      builder: (context, state) {
        final uuid = state.vm.currentBusiness?.uuid;
        if (uuid == null) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 36, 0, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              FoodlySectionsTitle(
                firstText: S.current.dangerZone,
                secondText: '',
                isDangerZone: true,
              ),
              CustomNeumorphicButton(
                onPressed: () => _showConfirmDialog(context, uuid),
                type: CustomNeumorphicBtnType.outlined,
                disabled: false,
                leading: const Icon(
                  Icons.delete_forever_outlined,
                  size: 24,
                  color: FoodlyThemes.error,
                ),
                text: S.current.deleteBusiness,
                foregroundColor: FoodlyThemes.error,
                padding: const EdgeInsets.symmetric(vertical: 9),
              ).paddingHorizontal(9),
            ],
          ),
        );
      },
    );
  }
}
