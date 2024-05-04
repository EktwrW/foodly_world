import 'package:flutter/material.dart';
import 'package:foodly_world/core/services/dependency_injection_service.dart';
import 'package:logger/logger.dart';

class GoRouterObserver extends NavigatorObserver {
  final _logger = di<Logger>();
  final _str = 'GoRouterObserver';

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) => _logger.i('$_str didPush: $route');

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) => _logger.i('$_str didPop: $route');

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) => _logger.i('$_str didRemove: $route');

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) =>
      _logger.i('$_str didReplace old route ${oldRoute ?? ""} with $newRoute');

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      _logger.i('$_str didStartUserGesture: $route');
}
