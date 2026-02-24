import 'package:dio/dio.dart' show MultipartFile;
import 'package:foodly_world/core/enums/review_enums.dart';
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/reviews/review_client.dart';
import 'package:foodly_world/core/utils/file_handler/file_handler_selector.dart';
import 'package:foodly_world/data_models/reviews/review_dm.dart';
import 'package:foodly_world/data_transfer_objects/reviews/review_update_dto.dart';

class ReviewRepo {
  final ReviewClient _reviewClient;

  const ReviewRepo({required ReviewClient reviewClient}) : _reviewClient = reviewClient;

  Future<ApiResult<ReviewsResponseDM>> getBusinessReviews(String businessUuid, {int? page, int? perPage}) async {
    try {
      return ApiResult.success(await _reviewClient.getBusinessReviews(businessUuid, page: page, perPage: perPage));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ReviewsResponseDM>> getMyReviews({int? page}) async {
    try {
      return ApiResult.success(await _reviewClient.getMyReviews(page: page));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ReviewCheckResponseDM>> checkReview(String businessUuid) async {
    try {
      return ApiResult.success(await _reviewClient.checkReview(businessUuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ReviewCreateResponseDM>> createReview({
    required String businessUuid,
    required int rating,
    ReviewType? reviewType,
    String? comment,
    DateTime? businessVisitedAt,
    List<String>? photoPaths,
  }) async {
    List<MultipartFile>? multipartPhotos;

    if (photoPaths != null && photoPaths.isNotEmpty) {
      final fileHandler = getFileHandler();
      multipartPhotos = [];

      for (final path in photoPaths) {
        final multipartFile = await fileHandler.getMultipartFile(path);
        if (multipartFile != null) multipartPhotos.add(multipartFile);
      }
    }

    try {
      return ApiResult.success(
        await _reviewClient.createReview(
          businessUuid: businessUuid,
          rating: rating,
          reviewType: reviewType?.name,
          comment: comment,
          businessVisitedAt: businessVisitedAt != null
              ? '${businessVisitedAt.year}-${businessVisitedAt.month.toString().padLeft(2, '0')}-${businessVisitedAt.day.toString().padLeft(2, '0')}'
              : null,
          photos: multipartPhotos,
        ),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ReviewUpdateResponseDM>> updateReview(String uuid, ReviewUpdateDTO dto) async {
    try {
      return ApiResult.success(await _reviewClient.updateReview(uuid, dto));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ReviewCreateResponseDM>> addPhotos({
    required String reviewUuid,
    required List<String> photoPaths,
  }) async {
    final fileHandler = getFileHandler();
    final multipartPhotos = <MultipartFile>[];

    for (final path in photoPaths) {
      final multipartFile = await fileHandler.getMultipartFile(path);
      if (multipartFile != null) multipartPhotos.add(multipartFile);
    }

    try {
      return ApiResult.success(
        await _reviewClient.addPhotos(reviewUuid: reviewUuid, photos: multipartPhotos),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> destroyPhoto(String photoUuid) async {
    try {
      return ApiResult.success(await _reviewClient.destroyPhoto(photoUuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> deleteReview(String uuid) async {
    try {
      return ApiResult.success(await _reviewClient.deleteReview(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
