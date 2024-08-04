import 'dart:async';

import 'package:app_annotations/app_annotations.dart';
import 'package:app_data/app_data.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

import '../../core/failures/app_failures.dart';
import '../../core/providers/providers.dart';

part '../../generated/sync/provider/sync_providers.g.dart';

@riverpod
class SyncCollectionsMap extends _$SyncCollectionsMap {
  @override
  Map<DbCollection, SyncCollection> build() {
    final database = ref.watch(dbProvider);

    final collectionsMap = <DbCollection, SyncCollection>{
      DbCollection.cases: database.casesCollection,
      DbCollection.media: database.mediaCollection,
      // DbCollection.timelineNotes: database.timelineNotesCollection,
      // DbCollection.notes: database.notesCollection,
      // DbCollection.templates: database.templatesCollection,
      // DbCollection.supportData: database.supportDataCollection,
      // DbCollection.settings: database.settingsCollection,
    };

    return collectionsMap;
  }
}

/// A family provider to fire sync on each collection with
/// status updates
@riverpod
class CollectionSyncer extends _$CollectionSyncer {
  SyncCollection<RealmObject>? _collection;

  @override
  StateOf<int> build(DbCollection dbCollection) {
    final collectionsMap = ref.read(syncCollectionsMapProvider);
    _collection = collectionsMap[dbCollection];
    return const StateOf<int>.init();
  }

  void syncCollection(int timestamp) {
    if (_collection == null) {
      state =
          const StateOf<int>.failure(AppFailure.generic('No such collection'));
      return;
    }

    state = const StateOf<int>.loading();
    _collection?.syncByTimestamp(timestamp).then((ids) async {
      state = StateOf<int>.success(ids.length);

      /// if timestamp is 0, we send null for ids so
      /// link functions can load all cases instead of  by ids
      await _onSuccess(timestamp == 0 ? null : ids);
    }).catchError((Object? err) {
      state = StateOf<int>.failure(Exception(err));
    });
  }

  /// null for ids means  collection runs backlinks on all items
  Future<void> _onSuccess(List<String>? ids) async {
    if (dbCollection == DbCollection.media) {
      return ref.watch(dbProvider).mediaCollection.refreshBacklinks(ids);
    } else if (dbCollection == DbCollection.timelineNotes) {
      return ref
          .watch(dbProvider)
          .timelineNotesCollection
          .refreshBacklinks(ids);
    } else if (dbCollection == DbCollection.cases) {
      return ref.watch(dbProvider).casesCollection.refreshBacklinks(ids);
    }
  }
}
