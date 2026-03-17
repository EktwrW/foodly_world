class EventDTO {
  final String eventClientId;
  final String eventType;
  final String clientTimestamp;
  final String sourceModule;
  final String sessionId;
  final String platform;
  final String? page;
  final String? section;
  final String? targetType;
  final String? targetUuid;
  final int? position;
  final int? durationMs;
  final int? scrollPercent;
  final String? query;
  final List<String>? categories;

  const EventDTO({
    required this.eventClientId,
    required this.eventType,
    required this.clientTimestamp,
    required this.sourceModule,
    required this.sessionId,
    required this.platform,
    this.page,
    this.section,
    this.targetType,
    this.targetUuid,
    this.position,
    this.durationMs,
    this.scrollPercent,
    this.query,
    this.categories,
  });

  Map<String, dynamic> toJson() => {
        'event_client_id': eventClientId,
        'event_type': eventType,
        'client_timestamp': clientTimestamp,
        'source_module': sourceModule,
        'session_id': sessionId,
        'platform': platform,
        if (page != null) 'page': page,
        if (section != null) 'section': section,
        if (targetType != null) 'target_type': targetType,
        if (targetUuid != null) 'target_uuid': targetUuid,
        if (position != null) 'position': position,
        if (durationMs != null) 'duration_ms': durationMs,
        if (scrollPercent != null) 'scroll_percent': scrollPercent,
        if (query != null) 'query': query,
        if (categories != null) 'categories': categories,
      };
}

class BatchEventsDTO {
  final List<EventDTO> events;

  const BatchEventsDTO({required this.events});

  Map<String, dynamic> toJson() => {
        'events': events.map((e) => e.toJson()).toList(),
      };
}
