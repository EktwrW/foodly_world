import 'package:dio/dio.dart';
import 'package:foodly_world/data_models/public_menu/public_menu_dm.dart';
import 'package:retrofit/retrofit.dart';

part 'public_menu_client.g.dart';

@RestApi()
abstract class PublicMenuClient {
  factory PublicMenuClient(Dio dio) = _PublicMenuClient;

  @GET('/public/menu/{businessUuid}')
  Future<PublicMenuResponseDM> fetchPublicMenu(
    @Path('businessUuid') String businessUuid,
  );
}
