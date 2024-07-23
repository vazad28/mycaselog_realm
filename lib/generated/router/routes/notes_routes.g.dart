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
      routes: [
        GoRouteData.$route(
          path: 'note/:noteID',
          factory: $AddNoteRouteExtension._fromState,
        ),
      ],
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

extension $AddNoteRouteExtension on AddNoteRoute {
  static AddNoteRoute _fromState(GoRouterState state) => AddNoteRoute(
        noteID: state.pathParameters['noteID']! ?? 'new',
      );

  String get location => GoRouteData.$location(
        '/notes/note/${Uri.encodeComponent(noteID)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
