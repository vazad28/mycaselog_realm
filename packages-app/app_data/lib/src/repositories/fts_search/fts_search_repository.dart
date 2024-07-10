part of 'fts_search_repository_impl.dart';

abstract class FtsSearchRepository {
  Future<List<T>> searchCaseMedia<T>(String searchTerm);

  Future<List<NoteModel>> searchNotes(String searchTerm);
}
