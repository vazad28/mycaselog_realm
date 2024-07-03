// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../router/routes/media_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mediaRoute,
    ];

RouteBase get $mediaRoute => GoRouteData.$route(
      path: '/media',
      factory: $MediaRouteExtension._fromState,
    );

extension $MediaRouteExtension on MediaRoute {
  static MediaRoute _fromState(GoRouterState state) => const MediaRoute();

  String get location => GoRouteData.$location(
        '/media',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
