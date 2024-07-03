import 'package:app_models/app_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

part 'notes_mixins.dart';

part '../../generated/notes/provider/notes_provider.freezed.dart';
part '../../generated/notes/provider/notes_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////
class NoteModel {}

@riverpod
class NotesNotifier extends _$NotesNotifier with LoggerMixin {
  @override
  StateOf<NoteModel> build() {
    return const StateOf<NoteModel>.init();
  }

  /// Map events to state
  void on(NotesEvent event) {
    event.map(addNotes: (value) => {});
  }
}
