import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'moderation_client.g.dart';

/// Cliente de moderación de contenido (App Store Guideline 1.2):
/// reportar contenido objetable y bloquear/desbloquear usuarios.
@RestApi()
abstract class ModerationClient {
  factory ModerationClient(Dio dio) = _ModerationClient;

  /// POST /reports — body: { reportable_type, reportable_uuid, reason, details? }
  @POST('/reports')
  Future<void> reportContent(@Body() Map<String, dynamic> body);

  @POST('/users/{uuid}/block')
  Future<void> blockUser(@Path('uuid') String uuid);

  @DELETE('/users/{uuid}/block')
  Future<void> unblockUser(@Path('uuid') String uuid);

  @GET('/users/blocked')
  Future<BlockedUsersResponseDM> getBlockedUsers();
}

/// { blocked_users: [ { uuid, name, username, avatar_url } ] }
class BlockedUsersResponseDM {
  final List<BlockedUserDM> blockedUsers;

  BlockedUsersResponseDM({required this.blockedUsers});

  factory BlockedUsersResponseDM.fromJson(Map<String, dynamic> json) {
    final list = (json['blocked_users'] as List<dynamic>? ?? [])
        .map((e) => BlockedUserDM.fromJson(e as Map<String, dynamic>))
        .toList();
    return BlockedUsersResponseDM(blockedUsers: list);
  }
}

class BlockedUserDM {
  final String uuid;
  final String name;
  final String username;
  final String? avatarUrl;

  BlockedUserDM({
    required this.uuid,
    required this.name,
    required this.username,
    this.avatarUrl,
  });

  factory BlockedUserDM.fromJson(Map<String, dynamic> json) {
    return BlockedUserDM(
      uuid: (json['uuid'] ?? '') as String,
      name: (json['name'] ?? '') as String,
      username: (json['username'] ?? '') as String,
      avatarUrl: json['avatar_url'] as String?,
    );
  }
}
