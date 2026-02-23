import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/reviews/review_dm.dart';
import 'package:foodly_world/data_transfer_objects/reviews/review_update_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'review_client.g.dart';

@RestApi()
abstract class ReviewClient {
  factory ReviewClient(Dio dio) = _ReviewClient;

  @GET('/reviews/{businessUuid}')
  Future<ReviewsResponseDM> getBusinessReviews(
    @Path('businessUuid') String businessUuid, {
    @Query('page') int? page,
  });

  @GET('/reviews/my-reviews')
  Future<ReviewsResponseDM> getMyReviews({
    @Query('page') int? page,
  });

  // This endpoint checks if the user can review the business and returns the necessary information to create a review (e.g., if they have visited the business, if they have already reviewed it, etc.)
  @GET('/reviews/check/{businessUuid}')
  Future<ReviewCheckResponseDM> checkReview(@Path('businessUuid') String businessUuid);

  @POST('/reviews/store')
  @MultiPart()
  Future<ReviewCreateResponseDM> createReview({
    @Part(name: 'business_uuid') required String businessUuid,
    @Part(name: 'rating') required int rating,
    @Part(name: 'review_type') String? reviewType,
    @Part(name: 'comment') String? comment,
    @Part(name: 'business_visited_at') String? businessVisitedAt,
    @Part(name: 'photos[]') List<MultipartFile>? photos,
  });

  @PATCH('/reviews/update/{uuid}')
  Future<ReviewUpdateResponseDM> updateReview(
    @Path('uuid') String uuid,
    @Body() ReviewUpdateDTO body,
  );

  @POST('/reviews/{reviewUuid}/photos')
  @MultiPart()
  Future<ReviewCreateResponseDM> addPhotos({
    @Path('reviewUuid') required String reviewUuid,
    @Part(name: 'photos[]') required List<MultipartFile> photos,
  });

  @DELETE('/reviews/photos/{photoUuid}')
  Future<void> destroyPhoto(@Path('photoUuid') String photoUuid);

  @DELETE('/reviews/delete/{uuid}')
  Future<void> deleteReview(@Path('uuid') String uuid);
}
