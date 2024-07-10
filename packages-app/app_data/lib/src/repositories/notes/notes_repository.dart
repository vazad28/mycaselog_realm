part of 'notes_repository_impl.dart';

/// Abstract class for the notes repositoru
abstract class NotesRepository {
  // Get list of  note models
  NoteModel? getLastUpdatedNote();

  /// Remove note data (set removed flag to 1)
  //Future<Result<Unit, RepositoryFailure>> deleteNote(NoteModel noteModel);

  /// fet the list of notes with status of removed
  //Iterable<NoteModel> fetchRemovedNotesList();
}
