import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = _Success<T>;
  const factory ApiResult.failure(AppRequestException error) = _Error<T>;
}

enum ApiResponseStatus {
  internalServerError(code: 500);

  final int code;

  const ApiResponseStatus({required this.code});
}
