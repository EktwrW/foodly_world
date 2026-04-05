import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
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

  String get sessionId => _sessionId;
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
    Map<String, dynamic>? data,
  }) {
    if (!_enabled) return;

    final uuid = _authService.uuid;
    final deviceInfo = _authService.deviceInfo;

    final event = EventDTO(
      eventClientId: const Uuid().v4(),
      eventType: eventType,
      clientTimestamp: DateTime.now().toUtc().toIso8601String(),
      sourceModule: sourceModule,
      sessionId: _sessionId,
      platform: _authService.platform?.value ?? 'unknown',
      userUuid: uuid.isNotEmpty ? uuid : null,
      page: page,
      section: section,
      targetType: targetType,
      targetUuid: targetUuid,
      position: position,
      durationMs: durationMs,
      scrollPercent: scrollPercent,
      query: query,
      categories: categories,
      data: data,
      deviceInfo: deviceInfo != null
          ? {
              'app_version': deviceInfo.appVersion,
              'os_version': deviceInfo.osVersion,
              'model': deviceInfo.model,
            }
          : null,
    );

    _logger.d('[Analytics] $eventType | module=$sourceModule');
    _mirrorToFirebase(eventType, position: position, data: data);

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
      final available = _maxQueueSize - _queue.length;
      if (available > 0) {
        _queue.insertAll(0, batch.take(available));
      }
    }
  }

  void _mirrorToFirebase(
    String eventType, {
    int? position,
    Map<String, dynamic>? data,
  }) {
    try {
      final fa = FirebaseAnalytics.instance;
      switch (eventType) {
        case 'search.results_viewed':
          final count = (data?['results_count'] as int?) ?? 0;
          fa.logEvent(name: 'search_results_viewed', parameters: {
            'results_count': count,
            'has_results': count > 0 ? 1 : 0,
          });
        case 'search.result_clicked':
          fa.logEvent(name: 'search_result_click', parameters: {
            if (position != null) 'position': position,
          });
        case 'business.open':
          fa.logEvent(name: 'business_open', parameters: {
            'entry_source': (data?['entry_source'] as String?) ?? 'unknown',
          });
        case 'business.cta_clicked':
          fa.logEvent(name: 'business_cta_click', parameters: {
            'cta_type': (data?['cta_type'] as String?) ?? 'unknown',
          });
        case 'reservation.started':
          fa.logEvent(name: 'reservation_start');
        case 'reservation.submitted':
          fa.logEvent(name: 'reservation_submit');
        case 'reservation.succeeded':
          fa.logEvent(name: 'reservation_success');
        case 'reservation.failed':
          fa.logEvent(name: 'reservation_fail', parameters: {
            'error_stage': (data?['error_stage'] as String?) ?? 'unknown',
          });
      }
    } catch (_) {
      // Firebase mirror is best-effort — never break main tracking
    }
  }
}
