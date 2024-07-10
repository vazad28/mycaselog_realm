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
        activeTab: int.parse(state.pathParameters['activeTab']!),
        state.extra as CaseModel,
      );

  String get location => GoRouteData.$location(
        '/cases/${Uri.encodeComponent(caseID)}/${Uri.encodeComponent(activeTab!.toString())}',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $AddCaseRouteExtension on AddCaseRoute {
  static AddCaseRoute _fromState(GoRouterState state) => AddCaseRoute(
        tabIndex: int.parse(state.pathParameters['tabIndex']!) ?? 0,
        newRecord: _$convertMapValue(
                'new-record', state.uri.queryParameters, _$boolConverter) ??
            false,
        state.extra as CaseModel,
      );

  String get location => GoRouteData.$location(
        '/cases/case/${Uri.encodeComponent(caseID)}/${Uri.encodeComponent(tabIndex.toString())}',
        queryParams: {
          if (newRecord != false) 'new-record': newRecord.toString(),
        },
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}
