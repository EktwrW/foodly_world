import 'package:foodly_world/core/network/base/api_result.dart';
import 'package:foodly_world/core/network/base/request_exception.dart';
import 'package:foodly_world/core/network/nlp_search/nlp_search_client.dart';
import 'package:foodly_world/data_models/nlp_search/nlp_search_response_dm.dart';
import 'package:foodly_world/data_transfer_objects/nlp_search/nlp_search_request_dto.dart';

class NlpSearchRepo {
  final NlpSearchClient _nlpSearchClient;

  const NlpSearchRepo({required NlpSearchClient nlpSearchClient}) : _nlpSearchClient = nlpSearchClient;

  Future<ApiResult<NlpSearchResponseDM>> search(NlpSearchRequestDTO body) async {
    try {
      return ApiResult.success(await _nlpSearchClient.search(body));
    } catch (e, s) {
      return ApiResult.failure(AppRequestException(error: e, stackTrace: s));
    }
  }
}
