import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/moderation/moderation_client.dart' show BlockedUserDM;
import 'package:foodly_world/core/network/moderation/moderation_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/constants/ui_decorations.dart' show UIDecorations;
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_rounded_neumorphic_button.dart'
    show CustomRoundedNeumorphicButton;
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart' show Bootstrap;

/// Pantalla de gestión de usuarios bloqueados (App Store Guideline 1.2):
/// lista los usuarios bloqueados y permite desbloquearlos.
class BlockedUsersPage extends StatefulWidget {
  const BlockedUsersPage({super.key});

  @override
  State<BlockedUsersPage> createState() => _BlockedUsersPageState();
}

class _BlockedUsersPageState extends State<BlockedUsersPage> {
  bool _loading = true;
  List<BlockedUserDM> _users = [];
  final Set<String> _busy = {};

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final result = await di<ModerationRepo>().getBlockedUsers();
    if (!mounted) return;
    result.when(
      success: (list) => setState(() {
        _users = list;
        _loading = false;
      }),
      failure: (_) => setState(() => _loading = false),
    );
  }

  Future<void> _unblock(BlockedUserDM user) async {
    if (_busy.contains(user.uuid)) return;
    setState(() => _busy.add(user.uuid));

    final result = await di<ModerationRepo>().unblockUser(user.uuid);
    if (!mounted) return;
    result.when(
      success: (_) => setState(() {
        _users.removeWhere((u) => u.uuid == user.uuid);
        _busy.remove(user.uuid);
      }),
      failure: (_) {
        setState(() => _busy.remove(user.uuid));
        FoodlySnackbars.errorGeneric(context, S.current.somethingWentWrong);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        final router = di<AppRouter>();
        if (!router.isOnShellRoute) router.goBackToLastRoute();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        // Secondary nav bar de Foodly (gradiente glassmórfico + back redondo),
        // consistente con About / Mis reservas.
        appBar: AppBar(
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
              S.current.blockedUsers,
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
            padding: const EdgeInsets.all(6),
          ).paddingSymmetric(vertical: 10, horizontal: 10),
          leadingWidth: 60,
        ),
        body: _loading
            ? const Center(child: CircularProgressIndicator.adaptive())
            : _users.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Text(
                        S.current.blockedUsersEmpty,
                        textAlign: TextAlign.center,
                        style: FoodlyTextStyles.label,
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: _users.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (_, i) {
                      final u = _users[i];
                      final busy = _busy.contains(u.uuid);
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            AvatarWidget(avatarUrl: u.avatarUrl),
                            const SizedBox(width: 12),
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(u.name.isEmpty ? u.username : u.name,
                                      style: FoodlyTextStyles.labelBold, overflow: TextOverflow.ellipsis),
                                  if (u.username.isNotEmpty)
                                    Text('@${u.username}',
                                        style: FoodlyTextStyles.caption.copyWith(color: Colors.grey)),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: CustomNeumorphicButton(
                                onPressed: busy ? null : () => _unblock(u),
                                type: CustomNeumorphicBtnType.outlined,
                                text: busy ? '...' : S.current.unblock,
                                disabled: busy,
                                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                                fontSize: 11,
                                margin: const EdgeInsets.all(3),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
