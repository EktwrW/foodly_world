import 'package:foodly_world/core/network/moderation/moderation_client.dart' show BlockedUserDM;
import 'package:foodly_world/core/network/moderation/moderation_repo.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:foodly_world/ui/shared_widgets/buttons/custom_neumorphic_button.dart';
import 'package:foodly_world/ui/shared_widgets/image/avatar_widget.dart';
import 'package:foodly_world/ui/shared_widgets/snackbar/foodly_snackbars.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        title: Text(S.current.blockedUsers, style: FoodlyTextStyles.sectionsTitle),
        centerTitle: true,
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
                          CustomNeumorphicButton(
                            onPressed: busy ? null : () => _unblock(u),
                            type: CustomNeumorphicBtnType.outlined,
                            text: busy ? '...' : S.current.unblock,
                            disabled: busy,
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
