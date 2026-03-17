import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:foodly_world/core/services/event_tracking_service.dart';

/// Wraps a [ScrollController] and fires `social.feed_scroll` events at
/// 25 / 50 / 75 / 100 % scroll depth — exactly once per scroll session.
///
/// Attach to a scrollable widget:
/// ```dart
/// final _scrollTracker = ScrollTracker(
///   tracker: di<EventTrackingService>(),
///   sourceModule: 'CommunityPage',
///   page: 'community',
/// );
///
/// // in initState:
/// _scrollTracker.attach(scrollController);
///
/// // in dispose:
/// _scrollTracker.dispose();
/// ```
class ScrollTracker {
  final EventTrackingService _tracker;
  final String sourceModule;
  final String? page;
  final String? section;

  ScrollController? _controller;
  final Set<int> _reported = {};
  Timer? _debounce;

  static const List<int> _milestones = [25, 50, 75, 100];
  static const Duration _debounceDelay = Duration(seconds: 2);

  ScrollTracker({
    required EventTrackingService tracker,
    required this.sourceModule,
    this.page,
    this.section,
  }) : _tracker = tracker;

  void attach(ScrollController controller) {
    _controller = controller;
    _reported.clear();
    controller.addListener(_onScroll);
  }

  void detach() {
    _controller?.removeListener(_onScroll);
    _controller = null;
    _debounce?.cancel();
    _reported.clear();
  }

  void dispose() {
    detach();
    _debounce?.cancel();
  }

  void _onScroll() {
    final ctrl = _controller;
    if (ctrl == null || !ctrl.hasClients) return;

    final pos = ctrl.position;
    final maxExtent = pos.maxScrollExtent;
    if (maxExtent <= 0) return;

    final pct = (pos.pixels / maxExtent * 100).clamp(0, 100).toInt();

    for (final milestone in _milestones) {
      if (pct >= milestone && !_reported.contains(milestone)) {
        _reported.add(milestone);
        _scheduleTrack(milestone);
      }
    }
  }

  void _scheduleTrack(int percent) {
    _debounce?.cancel();
    _debounce = Timer(_debounceDelay, () {
      _tracker.track(
        'social.feed_scroll',
        sourceModule,
        page: page,
        section: section,
        scrollPercent: percent,
      );
    });
  }
}
