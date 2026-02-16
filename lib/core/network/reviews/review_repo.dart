import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/reviews/review_client.dart';
import 'package:foodly_world/data_models/reviews/review_dm.dart';
import 'package:foodly_world/data_transfer_objects/reviews/review_create_dto.dart';
import 'package:foodly_world/data_transfer_objects/reviews/review_update_dto.dart';

class ReviewRepo {
  final ReviewClient _reviewClient;

  const ReviewRepo({required ReviewClient reviewClient}) : _reviewClient = reviewClient;

  Future<ApiResult<ReviewsResponseDM>> getBusinessReviews(String businessUuid, {int? page}) async {
    try {
      return ApiResult.success(await _reviewClient.getBusinessReviews(businessUuid, page: page));
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

  Future<ApiResult<ReviewCreateResponseDM>> createReview(ReviewCreateDTO dto) async {
    try {
      return ApiResult.success(await _reviewClient.createReview(dto));
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

  Future<ApiResult<void>> deleteReview(String uuid) async {
    try {
      return ApiResult.success(await _reviewClient.deleteReview(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
