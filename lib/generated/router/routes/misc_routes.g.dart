// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../router/routes/misc_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $authFlowRoute,
    ];

RouteBase get $authFlowRoute => GoRouteData.$route(
      path: '/auth_flow',
      factory: $AuthFlowRouteExtension._fromState,
    );

extension $AuthFlowRouteExtension on AuthFlowRoute {
  static AuthFlowRoute _fromState(GoRouterState state) => const AuthFlowRoute();

  String get location => GoRouteData.$location(
        '/auth_flow',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
