import 'dart:async';

import 'package:app_annotations/app_annotations.dart';
import 'package:app_models/app_models.dart';
import 'package:app_repositories/app_repositories.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

import '../../core/app_providers.dart';
import '../../core/failures/app_failures.dart';

part '../../generated/sync/provider/sync_providers.g.dart';

@riverpod
class SyncCollectionsMap extends _$SyncCollectionsMap {
  @override
  Map<DbCollection, BaseCollection> build() {
    final database = ref.watch(dbProvider);

    final collectionsMap = <DbCollection, BaseCollection>{
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

/// A family provider to fire sync on each collection with
/// status updates
@riverpod
class CollectionSyncer extends _$CollectionSyncer {
  BaseCollection<RealmObject>? _collection;

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
    _collection?.syncByTimestamp(timestamp).then((items) async {
      state = StateOf<int>.success(items.length);
      await _onSuccess(items);
    }).catchError((Object? err) {
      state = StateOf<int>.failure(Exception(err));
    });
  }

  Future<void> _onSuccess(List<RealmObject> items) async {
    if (dbCollection == DbCollection.media) {
      return ref
          .watch(dbProvider)
          .mediaCollection
          .refreshMediaBacklinks(items as List<MediaModel>);
    } else if (dbCollection == DbCollection.timelineNotes) {
      return ref
          .watch(dbProvider)
          .timelineNotesCollection
          .refreshTimelineNotesBacklinks(items as List<TimelineNoteModel>);
    } else if (dbCollection == DbCollection.cases) {
      return ref
          .watch(dbProvider)
          .casesCollection
          .refreshCasesBacklinks(items as List<CaseModel>);
    }
  }
}
