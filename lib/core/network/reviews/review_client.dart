import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/reviews/review_dm.dart';
import 'package:foodly_world/data_transfer_objects/reviews/review_create_dto.dart';
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
  Future<ReviewCreateResponseDM> createReview(@Body() ReviewCreateDTO body);

  @PATCH('/reviews/update/{uuid}')
  Future<ReviewUpdateResponseDM> updateReview(
    @Path('uuid') String uuid,
    @Body() ReviewUpdateDTO body,
  );

  @DELETE('/reviews/delete/{uuid}')
  Future<void> deleteReview(@Path('uuid') String uuid);
}
