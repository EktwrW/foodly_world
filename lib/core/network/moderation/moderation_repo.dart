import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/moderation/moderation_client.dart';

/// Tipos de contenido reportable (debe coincidir con el BE ContentReportController).
enum ReportableType {
  review,
  post;

  String get apiValue => name;
}

/// Motivos de reporte (deben coincidir con ContentReportController::REASONS).
enum ReportReason {
  spam,
  offensive,
  harassment,
  hateSpeech,
  sexual,
  violence,
  misinformation,
  other;

  String get apiValue => switch (this) {
        ReportReason.hateSpeech => 'hate_speech',
        _ => name,
      };
}

class ModerationRepo {
  final ModerationClient _client;

  const ModerationRepo({required ModerationClient client}) : _client = client;

  Future<ApiResult<bool>> reportContent({
    required ReportableType type,
    required String reportableUuid,
    required ReportReason reason,
    String? details,
  }) async {
    try {
      await _client.reportContent({
        'reportable_type': type.apiValue,
        'reportable_uuid': reportableUuid,
        'reason': reason.apiValue,
        if (details != null && details.trim().isNotEmpty) 'details': details.trim(),
      });
      return ApiResult.success(true);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<bool>> blockUser(String userUuid) async {
    try {
      await _client.blockUser(userUuid);
      return ApiResult.success(true);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<bool>> unblockUser(String userUuid) async {
    try {
      await _client.unblockUser(userUuid);
      return ApiResult.success(true);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<List<BlockedUserDM>>> getBlockedUsers() async {
    try {
      final response = await _client.getBlockedUsers();
      return ApiResult.success(response.blockedUsers);
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
