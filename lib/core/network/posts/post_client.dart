import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/posts/post_dm.dart';
import 'package:retrofit/retrofit.dart';

part 'post_client.g.dart';

@RestApi()
abstract class PostClient {
  factory PostClient(Dio dio) = _PostClient;

  @GET('/posts')
  Future<PostsResponseDM> getPosts({
    @Query('page') int? page,
    @Query('per_page') int? perPage,
    @Query('latitude') double? latitude,
    @Query('longitude') double? longitude,
    @Query('radius') int? radius,
    // 'following' → feed social del user actual; sin valor → feed por
    // proximidad. El BE ignora cualquier otro string (cae al default).
    @Query('filter') String? filter,
  });

  @POST('/posts/store')
  @MultiPart()
  Future<PostDM> createPost({
    @Part(name: 'content') required String content,
    @Part(name: 'photo') List<MultipartFile>? photo,
    @Part(name: 'latitude') double? latitude,
    @Part(name: 'longitude') double? longitude,
  });

  @DELETE('/posts/delete/{uuid}')
  Future<void> deletePost(@Path('uuid') String uuid);

  @POST('/posts/like/{uuid}')
  Future<ToggleLikeResponseDM> toggleLike(@Path('uuid') String uuid);

  @GET('/posts/user/{userUuid}')
  Future<PostsResponseDM> getUserPosts(
    @Path('userUuid') String userUuid, {
    @Query('page') int? page,
  });
}
