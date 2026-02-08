import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/nlp_search/nlp_search_response_dm.dart';
import 'package:foodly_world/data_transfer_objects/nlp_search/nlp_search_request_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'nlp_search_client.g.dart';

@RestApi()
abstract class NlpSearchClient {
  factory NlpSearchClient(Dio dio) = _NlpSearchClient;

  @POST('/search')
  Future<NlpSearchResponseDM> search(@Body() NlpSearchRequestDTO body);
}
