import 'package:app_models/app_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';

import '../../core/app_providers.dart';

mixin SearchMixin {
  /// Full text search cases
  RealmResults<CaseModel> searchCases(WidgetRef ref, String searchTerm) {
    return ref.watch(dbProvider).casesCollection.search(searchTerm);
  }

  /// Full text search notes
  RealmResults<MediaModel> searchMedia(WidgetRef ref, String searchTerm) {
    final caseResults = searchCases(ref, searchTerm);

    // list of case IDs matching the search term
    final ids = caseResults.map((e) => e.caseID);

    return ref.watch(dbProvider).mediaCollection.search(ids);
  }

  /// Full text search notes
  RealmResults<NoteModel> searchNotes(WidgetRef ref, String searchTerm) {
    return ref.watch(dbProvider).notesCollection.search(searchTerm);
  }
}
