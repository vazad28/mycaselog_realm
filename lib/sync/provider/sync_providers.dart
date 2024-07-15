import 'dart:async';

import 'package:app_annotations/app_annotations.dart';
import 'package:app_data/app_data.dart';
import 'package:logger_client/logger_client.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

import '../../core/failures/app_failures.dart';
import '../../core/providers/providers.dart';
import '../../settings/settings.dart';

part '../../generated/sync/provider/sync_providers.g.dart';

@riverpod
class SyncCollectionsMap extends _$SyncCollectionsMap {
  @override
  Map<DbCollection, DatabaseCollection> build() {
    final database = ref.watch(dbProvider);

    final collectionsMap = <DbCollection, DatabaseCollection>{
      DbCollection.cases: database.casesCollection,
      //DbCollection.media: database.mediaCollection,
      DbCollection.notes: database.notesCollection,
      //DbCollection.timelineNotes: database.timelineNotesCollection,
      DbCollection.templates: database.templatesCollection,
      DbCollection.supportData: database.supportDataCollection,
      DbCollection.settings: database.settingsCollection,
    };

    return collectionsMap;
  }
}

@riverpod
class CollectionSyncer extends _$CollectionSyncer {
  DatabaseCollection<RealmObject>? _collection;

  @override
  StateOf<int> build(DbCollection dbCollection) {
    final collectionsMap = ref.read(syncCollectionsMapProvider);
    _collection = collectionsMap[dbCollection];
    return const StateOf<int>.init();
  }

  void syncCollection(
    int timestamp,
  ) {
    if (_collection == null) {
      state =
          const StateOf<int>.failure(AppFailure.generic('No such collection'));
      return;
    }

    _collection?.syncByTimestamp(timestamp).then((count) {
      state = StateOf<int>.success(count);
    }).catchError((Object? err) {
      state = StateOf<int>.failure(Exception(err));
    });
  }
}

@riverpod
class FirestoreSync extends _$FirestoreSync with LoggerMixin {
  Map<String, StreamSubscription> subs = {};

  @override
  void build() {
    ref.onDispose(() {
      for (final sub in subs.values) {
        sub.cancel();
      }

      subs.clear();
    });

    final syncOnStart =
        ref.watch(appSettingsProvider.select((data) => data.syncOnStart));

    logger.fine('syncOnStart $syncOnStart');

    if (!syncOnStart) return;

    if (subs.isNotEmpty) {
      //<- need this check to prevent loop
      ref.invalidateSelf();
    } else {
      doSync();
    }
  }

  void doSync() {
    // final sub =
    //     ref.watch(dbProvider).casesCollection.listenForChanges().listen((_) {});
    // subs.putIfAbsent(DbCollection.cases.name, () => sub);
    final collectionsMap = ref.read(syncCollectionsMapProvider);
    for (final dbCollection in collectionsMap.keys) {
      if (dbCollection == DbCollection.media ||
          dbCollection == DbCollection.timelineNotes) continue;

      final collectionsMap = ref.watch(syncCollectionsMapProvider);
      final collection = collectionsMap[dbCollection];
      if (collection == null) continue;

      // ignore: cancel_subscriptions
      final sub = collection.listenForChanges().listen((_) {});

      subs.putIfAbsent(dbCollection.name, () => sub);
    }
  }
}
