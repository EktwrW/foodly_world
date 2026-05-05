import 'package:dio/dio.dart' show MultipartFile;
import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/posts/post_client.dart';
import 'package:foodly_world/core/utils/file_handler/file_handler_selector.dart';
import 'package:foodly_world/data_models/posts/post_dm.dart';

class PostRepo {
  final PostClient _postClient;

  const PostRepo({required PostClient postClient}) : _postClient = postClient;

  Future<ApiResult<PostsResponseDM>> getPosts({
    int? page,
    int? perPage,
    double? latitude,
    double? longitude,
    int? radius,
    String? filter,
  }) async {
    try {
      return ApiResult.success(
        await _postClient.getPosts(
          page: page,
          perPage: perPage,
          latitude: latitude,
          longitude: longitude,
          radius: radius,
          filter: filter,
        ),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<PostDM>> createPost({
    required String content,
    String? photoPath,
    double? latitude,
    double? longitude,
  }) async {
    List<MultipartFile>? photoList;

    if (photoPath != null && photoPath.isNotEmpty) {
      final fileHandler = getFileHandler();
      final multipartPhoto = await fileHandler.getMultipartFile(photoPath);
      if (multipartPhoto != null) photoList = [multipartPhoto];
    }

    try {
      return ApiResult.success(
        await _postClient.createPost(
          content: content,
          photo: photoList,
          latitude: latitude,
          longitude: longitude,
        ),
      );
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<void>> deletePost(String uuid) async {
    try {
      return ApiResult.success(await _postClient.deletePost(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<ToggleLikeResponseDM>> toggleLike(String uuid) async {
    try {
      return ApiResult.success(await _postClient.toggleLike(uuid));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }

  Future<ApiResult<PostsResponseDM>> getUserPosts(String userUuid, {int? page}) async {
    try {
      return ApiResult.success(await _postClient.getUserPosts(userUuid, page: page));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
