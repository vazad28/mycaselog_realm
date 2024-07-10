import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../add_note/add_note.dart';
import '../../notes/notes.dart';
import '../utils/route_animations.dart';

part '../../generated/router/routes/notes_routes.g.dart';

@TypedGoRoute<NotesRoute>(
  path: NotesRoute.path,
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<AddNoteRoute>(path: AddNoteRoute.path),
  ],
)

/// Root media tab cases
class NotesRoute extends GoRouteData {
  const NotesRoute();
  static const name = 'notes';
  static const path = '/$name';

  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: const NotesPage(),
      );
}

class AddNoteRoute extends GoRouteData {
  AddNoteRoute(this.$extra, {this.newRecord = false}) : noteID = $extra.noteID;
  static const name = 'add_note';
  static const path = 'note/:noteID';

  final NoteModel $extra;
  final String noteID;
  final bool newRecord;

  @override
  Widget build(BuildContext context, GoRouterState state) => AddNotePage(
        noteModel: $extra,
        newRecord: newRecord,
      );
}
