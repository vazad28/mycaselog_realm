// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../router/routes/stats_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $statsRoute,
    ];

RouteBase get $statsRoute => GoRouteData.$route(
      path: '/stats',
      factory: $StatsRouteExtension._fromState,
    );

extension $StatsRouteExtension on StatsRoute {
  static StatsRoute _fromState(GoRouterState state) => const StatsRoute();

  String get location => GoRouteData.$location(
        '/stats',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
