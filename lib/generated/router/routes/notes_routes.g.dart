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
        newRecord: _$convertMapValue(
                'new-record', state.uri.queryParameters, _$boolConverter) ??
            false,
        state.extra as NoteModel,
      );

  String get location => GoRouteData.$location(
        '/notes/note/${Uri.encodeComponent(noteID)}',
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
