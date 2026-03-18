import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:foodly_world/core/network/analytics/events_client.dart';
import 'package:foodly_world/core/services/auth_session_service.dart';
import 'package:foodly_world/data_transfer_objects/analytics/event_dto.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

class EventTrackingService with WidgetsBindingObserver {
  final EventsClient _client;
  final AuthSessionService _authService;
  final Logger _logger;

  final String _sessionId = const Uuid().v4();
  final List<EventDTO> _queue = [];
  Timer? _flushTimer;
  bool _enabled = true;

  static const int _flushThreshold = 20;
  static const int _maxQueueSize = 50;
  static const Duration _flushInterval = Duration(seconds: 5);

  EventTrackingService({
    required EventsClient client,
    required AuthSessionService authService,
    required Logger logger,
  })  : _client = client,
        _authService = authService,
        _logger = logger {
    WidgetsBinding.instance.addObserver(this);
    _startTimer();
  }

  void dispose() {
    _flushTimer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.detached) {
      _flush();
    }
  }

  void setEnabled(bool value) => _enabled = value;

  void track(
    String eventType,
    String sourceModule, {
    String? page,
    String? section,
    String? targetType,
    String? targetUuid,
    int? position,
    int? durationMs,
    int? scrollPercent,
    String? query,
    List<String>? categories,
  }) {
    if (!_enabled) return;

    final event = EventDTO(
      eventClientId: const Uuid().v4(),
      eventType: eventType,
      clientTimestamp: DateTime.now().toUtc().toIso8601String(),
      sourceModule: sourceModule,
      sessionId: _sessionId,
      platform: _authService.platform?.value ?? 'unknown',
      page: page,
      section: section,
      targetType: targetType,
      targetUuid: targetUuid,
      position: position,
      durationMs: durationMs,
      scrollPercent: scrollPercent,
      query: query,
      categories: categories,
    );

    _logger.d('[Analytics] $eventType | module=$sourceModule');

    if (_queue.length >= _maxQueueSize) {
      _queue.removeAt(0);
    }
    _queue.add(event);

    if (_queue.length >= _flushThreshold) {
      _flush();
    }
  }

  void _startTimer() {
    _flushTimer?.cancel();
    _flushTimer = Timer.periodic(_flushInterval, (_) => _flush());
  }

  Future<void> _flush() async {
    if (_queue.isEmpty) return;

    final batch = List<EventDTO>.from(_queue);
    _queue.clear();

    try {
      await _client.trackBatch(BatchEventsDTO(events: batch));
    } catch (e) {
      _logger.w('[Analytics] Batch flush failed — re-queuing ${batch.length} events: $e');
      // Re-prepend to queue for retry; drop overflow if queue is already full
      final available = _maxQueueSize - _queue.length;
      if (available > 0) {
        _queue.insertAll(0, batch.take(available));
      }
    }
  }
}
