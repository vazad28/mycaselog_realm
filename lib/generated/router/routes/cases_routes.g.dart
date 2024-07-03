// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../router/routes/cases_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $casesRoute,
    ];

RouteBase get $casesRoute => GoRouteData.$route(
      path: '/cases',
      factory: $CasesRouteExtension._fromState,
    );

extension $CasesRouteExtension on CasesRoute {
  static CasesRoute _fromState(GoRouterState state) => const CasesRoute();

  String get location => GoRouteData.$location(
        '/cases',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
