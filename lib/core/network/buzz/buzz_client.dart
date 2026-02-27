import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/buzz/buzz_item_dm.dart';
import 'package:retrofit/retrofit.dart';

part 'buzz_client.g.dart';

@RestApi()
abstract class BuzzClient {
  factory BuzzClient(Dio dio) = _BuzzClient;

  @GET('/buzz')
  Future<BuzzResponseDM> getBuzz({
    @Query('latitude') required double latitude,
    @Query('longitude') required double longitude,
    @Query('radius') double? radius,
    @Query('page') int? page,
  });
}
