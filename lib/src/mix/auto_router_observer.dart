import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todos/src/mix/logger.dart';

class AppRouterObserver extends AutoRouterObserver {
  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    logger.d('didChangeTabRoute($route, $previousRoute');
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    logger.d('didInitTabRoute($route, $previousRoute');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    logger.d('didPop($route, $previousRoute');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    logger.d('didPush($route, $previousRoute');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    logger.d('didRemove($route, $previousRoute');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    logger.d('didReplace(newRoute: $newRoute, oldRoute: $oldRoute');
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    logger.d('didStartUserGesture($route, $previousRoute');
  }
}
