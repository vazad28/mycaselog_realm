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
      routes: [
        GoRouteData.$route(
          path: ':caseID/:activeTab',
          factory: $CaseDetailsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'case/:caseID/:tabIndex',
          factory: $AddCaseRouteExtension._fromState,
        ),
      ],
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

extension $CaseDetailsRouteExtension on CaseDetailsRoute {
  static CaseDetailsRoute _fromState(GoRouterState state) => CaseDetailsRoute(
        state.pathParameters['caseID']!,
        activeTab: int.parse(state.pathParameters['activeTab']!),
      );

  String get location => GoRouteData.$location(
        '/cases/${Uri.encodeComponent(caseID)}/${Uri.encodeComponent(activeTab!.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AddCaseRouteExtension on AddCaseRoute {
  static AddCaseRoute _fromState(GoRouterState state) => AddCaseRoute(
        caseID: state.pathParameters['caseID']! ?? 'new',
        tabIndex: int.parse(state.pathParameters['tabIndex']!) ?? 0,
      );

  String get location => GoRouteData.$location(
        '/cases/case/${Uri.encodeComponent(caseID)}/${Uri.encodeComponent(tabIndex.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
