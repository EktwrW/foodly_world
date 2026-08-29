import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
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

    await result.when(
      success: (_) async {
        di<Logger>().i('Business deleted successfully: $businessUuid');

        // Refresh user session so role reverts to Customer
        final refreshResult = await di<MeRepo>().fetchLoggedUser();

        if (!context.mounted) return;

        await refreshResult.when(
          success: (userDM) async {
            di<Logger>().i('User refreshed after deletion, business count: ${userDM.business.length}');

            final current = di<AuthSessionService>().userSessionDM;
            if (current != null) {
              final updated = current.copyWith(user: userDM);
              di<AuthSessionService>().setSession(updated);
              context.read<RootBloc>().add(RootEvent.cacheAuthSession(userSessionDM: updated));
            }
          },
          failure: (error) async {
            di<Logger>().w('Could not refresh user after business deletion: ${error.errorMsg}');
          },
        );

        if (!context.mounted) return;

        FoodlySnackbars.successGeneric(context, S.current.deleteBusinessSuccess);

        // Wait for session update to complete
        await Future.delayed(const Duration(milliseconds: 100));

        if (!context.mounted) return;

        di<Logger>().i('Navigating to home after business deletion');
        final userUuid = di<AuthSessionService>().uuid;
        context.goNamed(
          AppRoutes.foodlyMainPage.name,
          pathParameters: {AppRoutes.routeIdParam: userUuid},
        );
        di<MainDrawerCubit>().updateSelectedIndex(0);
      },
      failure: (e) async {
        di<Logger>().e('Failed to delete business: ${e.errorMsg}');
        FoodlySnackbars.errorGeneric(context, e.errorMsg);
      },
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
            child: Text(S.current.cancel, style: const TextStyle(color: FoodlyThemes.neutralTextGrey)),
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
