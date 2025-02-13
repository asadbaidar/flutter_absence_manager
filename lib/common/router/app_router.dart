import 'package:common/common.dart';
import 'package:core/common/router/router.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter({
    String? intiialRoute,
    List<RouteBase>? routes,
    GlobalKey<NavigatorState>? navigatorKey,
    List<NavigatorObserver>? observers,
  }) : router = GoRouter(
          navigatorKey: navigatorKey,
          initialLocation: intiialRoute ?? AppRoutes.initial,
          routes: routes ?? AppRoutes.list(),
          observers: observers,
          redirect: (context, state) {
            $debugLog(state.uri, tag: 'route');
            return null;
          },
        );

  @visibleForTesting
  final GoRouter router;

  RouteInformationProvider get routeInformationProvider =>
      router.routeInformationProvider;

  RouteInformationParser<Object> get routeInformationParser =>
      router.routeInformationParser;

  RouterDelegate<Object> get routerDelegate => router.routerDelegate;
}
