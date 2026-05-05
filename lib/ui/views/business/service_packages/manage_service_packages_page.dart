import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart' show UIDecorations;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart'
    show CustomRoundedNeumorphicButton;
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/views/business/service_packages/cubit/service_packages_cubit.dart';
import 'package:foodly_world/ui/views/business/service_packages/widgets/professional_profile_form_sheet.dart';
import 'package:foodly_world/ui/views/business/service_packages/widgets/service_package_card.dart';
import 'package:foodly_world/ui/views/business/service_packages/widgets/service_package_form_sheet.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart' show Bootstrap;

class ManageServicePackagesPage extends StatelessWidget {
  final String businessUuid;

  const ManageServicePackagesPage({super.key, required this.businessUuid});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ServicePackagesCubit(
        repo: di(),
        logger: di(),
        businessUuid: businessUuid,
      ),
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: AppBar(
            key: const Key('manage-service-packages-app-bar'),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: UIDecorations.GLASSMORPHIC_PURPLE_GRADIENT,
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 60,
            actions: [
              Text(
                S.current.servicePackages,
                overflow: TextOverflow.ellipsis,
                style: FoodlyTextStyles.secondaryTitle.copyWith(color: Colors.white, fontSize: 20),
              ).paddingOnly(right: 18),
            ],
            leading: CustomRoundedNeumorphicButton(
              iconSize: 26,
              diameter: 32,
              iconData: Bootstrap.caret_left_fill,
              onPressed: () {
                if (context.canPop()) {
                  di<AppRouter>().removeLastRouteHistory();
                  context.pop();
                } else {
                  di<AppRouter>().goBackToLastRoute();
                }
              },
            ).paddingSymmetric(vertical: 8, horizontal: 8),
            leadingWidth: 60,
          ),
          floatingActionButton: Builder(
              builder: (ctx) => FloatingActionButton(
                    onPressed: () => _showCreatePackageSheet(ctx),
                    splashColor: FoodlyThemes.primaryLighten73.withValues(alpha: 0.39),
                    backgroundColor: FoodlyThemes.primaryFoodly.withValues(alpha: 0.73),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    elevation: 8.0,
                    child: const Icon(Bootstrap.plus_lg, color: Colors.white, size: 28),
                  ).paddingOnly(bottom: context.screenWidth * 0.039, right: 12)),
          body: const SafeArea(
            child: _ServicePackagesBody(),
          ),
        ),
      ),
    );
  }

  void _showCreatePackageSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<ServicePackagesCubit>(),
        child: const ServicePackageFormSheet(),
      ),
    );
  }
}

class _ServicePackagesBody extends StatelessWidget {
  const _ServicePackagesBody();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicePackagesCubit, ServicePackagesState>(
      listener: (context, state) {
        state.mapOrNull(
          saved: (s) => FoodlySnackbars.successGeneric(context, s.message),
          deleted: (s) => FoodlySnackbars.successGeneric(context, s.message),
          error: (s) => FoodlySnackbars.errorGeneric(context, s.message),
        );
      },
      builder: (context, state) {
        final cubit = context.read<ServicePackagesCubit>();
        final vm = state.vm;

        return state.maybeMap(
          loading: (_) => const Center(child: CircularProgressIndicator()),
          orElse: () {
            return RefreshIndicator(
              onRefresh: cubit.fetchAll,
              child: CustomScrollView(
                slivers: [
                  // Professional profile summary card
                  SliverToBoxAdapter(child: _ProfileSummaryCard(vm: vm)),

                  // Section header
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${S.current.packages} (${vm.packages.length})',
                            style: FoodlyTextStyles.actionsBodyBold,
                          ),
                          if (vm.packages.length > 1)
                            TextButton.icon(
                              onPressed: vm.isReordering ? null : () => _showReorderHint(context),
                              icon: Icon(
                                Bootstrap.arrows_move,
                                size: 14,
                                color: vm.isReordering ? Colors.grey : FoodlyThemes.primaryFoodly,
                              ),
                              label: Text(
                                S.current.reorder,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: vm.isReordering ? Colors.grey : FoodlyThemes.primaryFoodly,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),

                  // Package list or empty state
                  if (vm.packages.isEmpty)
                    SliverFillRemaining(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Bootstrap.box_seam, size: 64, color: FoodlyThemes.secondaryFoodly),
                            const SizedBox(height: 12),
                            Text(S.current.noPackagesYet, style: FoodlyTextStyles.label),
                            const SizedBox(height: 6),
                            Text(
                              S.current.tapPlusToCreate,
                              style: FoodlyTextStyles.caption,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final pkg = vm.packages[index];
                          return ServicePackageCard(
                            package: pkg,
                            isManager: true,
                            onEdit: () => _showEditPackageSheet(context, pkg),
                            onDelete: () => _confirmDelete(context, cubit, pkg.uuid!),
                          );
                        },
                        childCount: vm.packages.length,
                      ),
                    ),

                  // Bottom padding
                  const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showEditPackageSheet(BuildContext context, dynamic package) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<ServicePackagesCubit>(),
        child: ServicePackageFormSheet(existingPackage: package),
      ),
    );
  }

  void _confirmDelete(BuildContext context, ServicePackagesCubit cubit, String uuid) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(S.current.deletePackage),
        content: Text(S.current.deletePackageConfirmation),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(S.current.cancel)),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              cubit.deletePackage(uuid);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(S.current.delete),
          ),
        ],
      ),
    );
  }

  void _showReorderHint(BuildContext context) {
    FoodlySnackbars.infoGeneric(context, S.current.longPressToDrag);
  }
}

class _ProfileSummaryCard extends StatelessWidget {
  final dynamic vm;

  const _ProfileSummaryCard({required this.vm});

  @override
  Widget build(BuildContext context) {
    final profile = vm.profile;

    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showProfileForm(context),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: profile == null
              ? Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: FoodlyThemes.tertiaryFoodly.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Bootstrap.person_badge, size: 24, color: FoodlyThemes.tertiaryFoodly),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(S.current.setupProfessionalProfile, style: FoodlyTextStyles.actionsBodyBold),
                          const SizedBox(height: 2),
                          Text(
                            S.current.addSpecialtiesAndDetails,
                            style: FoodlyTextStyles.caption,
                          ),
                        ],
                      ),
                    ),
                    const Icon(Bootstrap.chevron_right, size: 16, color: FoodlyThemes.secondaryFoodly),
                  ],
                )
              : Row(
                  children: [
                    SizedBox.square(
                      dimension: 39,
                      child: FoodlyCategories.cateringAndChefs.avatar,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(S.current.professionalProfile, style: FoodlyTextStyles.actionsBodyBold),
                          const SizedBox(height: 2),
                          if (profile.specialties.isNotEmpty)
                            Text(
                              profile.specialties.take(3).join(', '),
                              style: FoodlyTextStyles.caption,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                        ],
                      ),
                    ),
                    if (profile.isVerified)
                      const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(Bootstrap.patch_check_fill, size: 18, color: FoodlyThemes.tertiaryFoodly),
                      ),
                    const Icon(Bootstrap.chevron_right, size: 16, color: FoodlyThemes.secondaryFoodly),
                  ],
                ),
        ),
      ),
    );
  }

  void _showProfileForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<ServicePackagesCubit>(),
        child: const ProfessionalProfileFormSheet(),
      ),
    );
  }
}
