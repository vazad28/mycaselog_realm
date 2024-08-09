import 'package:app_annotations/app_annotations.dart';
import 'package:app_data/app_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

import '../../core/failures/app_failures.dart';
import '../../core/providers/providers.dart';

part '../../generated/sync/provider/sync_provider.g.dart';

@riverpod
class SyncCollectionsMap extends _$SyncCollectionsMap {
  @override
  Map<DbCollection, SyncCollection> build() {
    final database = ref.watch(dbProvider);

    final collectionsMap = <DbCollection, SyncCollection>{
      DbCollection.cases: database.casesCollection,
      DbCollection.media: database.mediaCollection,
      DbCollection.timelineNotes: database.timelineNotesCollection,
      DbCollection.notes: database.notesCollection,
      DbCollection.templates: database.templatesCollection,
      DbCollection.supportData: database.supportDataCollection,
      DbCollection.settings: database.settingsCollection,
    };

    return collectionsMap;
  }
}

@Riverpod(keepAlive: true)
class SyncNotifier extends _$SyncNotifier {
  @override
  StateOf<List<String>> build(DbCollection dbCollection) {
    return const StateOf<List<String>>.init();
  }

  void syncCollection(int timestamp) {
    final collectionsMap = ref.read(syncCollectionsMapProvider);
    final collection = collectionsMap[dbCollection];

    if (collection == null) {
      state = const StateOf<List<String>>.failure(
        AppFailure.generic('No such collection'),
      );
      return;
    }

    state = const StateOf<List<String>>.loading();

    collection.syncByTimestamp(timestamp).then((ids) async {
      //collection.ignoreRealmChanges = true; //  important
      state = StateOf<List<String>>.success(ids);
    }).catchError((Object? err) {
      state = StateOf<List<String>>.failure(Exception(err));
    });
  }

  // /// null for ids means  collection runs backlinks on all items
  // Future<void> _onSuccess(List<String>? ids) async {
  //   if (dbCollection == DbCollection.media) {
  //     return ref.watch(dbProvider).mediaCollection.refreshBacklinks(ids);
  //   } else if (dbCollection == DbCollection.timelineNotes) {
  //     return ref
  //         .watch(dbProvider)
  //         .timelineNotesCollection
  //         .refreshBacklinks(ids);
  //   } else if (dbCollection == DbCollection.cases) {
  //     return ref.watch(dbProvider).casesCollection.refreshBacklinks(ids);
  //   }
  // }
}
