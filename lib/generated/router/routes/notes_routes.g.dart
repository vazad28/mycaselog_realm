// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../router/routes/notes_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $notesRoute,
    ];

RouteBase get $notesRoute => GoRouteData.$route(
      path: '/notes',
      factory: $NotesRouteExtension._fromState,
    );

extension $NotesRouteExtension on NotesRoute {
  static NotesRoute _fromState(GoRouterState state) => const NotesRoute();

  String get location => GoRouteData.$location(
        '/notes',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
