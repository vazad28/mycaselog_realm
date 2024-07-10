
import 'package:app_models/app_models.dart';

import '../../../../../app_data.dart';

part 'notes_repository.dart';

class NotesRepositoryImpl implements NotesRepository {
  NotesRepositoryImpl({
    required DatabaseService databaseService,
  }) : _databaseService = databaseService;

  final DatabaseService _databaseService;

  @override
  NoteModel? getLastUpdatedNote() {
    final realmResults = _databaseService.notesCollection.getLastUpdated();
    if (realmResults.isEmpty) return null;
    return realmResults.last;
  }
}
