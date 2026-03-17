import 'package:dio/dio.dart';
import 'package:foodly_world/data_transfer_objects/analytics/event_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'events_client.g.dart';

@RestApi()
abstract class EventsClient {
  factory EventsClient(Dio dio) = _EventsClient;

  @POST('/events')
  Future<void> trackEvent(@Body() EventDTO body);

  @POST('/events/batch')
  Future<void> trackBatch(@Body() BatchEventsDTO body);
}
