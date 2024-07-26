import 'dart:async';

import 'package:app_annotations/app_annotations.dart';
import 'package:app_repositories/app_repositories.dart';
import 'package:logger_client/logger_client.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

import '../../core/failures/app_failures.dart';
import '../../core/app_providers.dart';

part '../../generated/sync/provider/sync_providers.g.dart';

@riverpod
class SyncCollectionsMap extends _$SyncCollectionsMap {
  @override
  Map<DbCollection, BaseCollection> build() {
    final database = ref.watch(dbProvider);

    final collectionsMap = <DbCollection, BaseCollection>{
      DbCollection.cases: database.casesCollection,
      DbCollection.notes: database.notesCollection,
      DbCollection.media: database.mediaCollection,
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

  void syncCollection(
    int timestamp,
  ) {
    if (_collection == null) {
      state =
          const StateOf<int>.failure(AppFailure.generic('No such collection'));
      return;
    }

    state = const StateOf<int>.loading();
    _collection?.syncByTimestamp(timestamp).then((count) {
      state = StateOf<int>.success(count);
    }).catchError((Object? err) {
      state = StateOf<int>.failure(Exception(err));
    });
  }
}

@riverpod
class FirestoreLiveSync extends _$FirestoreLiveSync with LoggerMixin {
  Map<String, StreamSubscription> subs = {};

  bool _syncIsOn = false;

  @override
  void build() {
    // ref.listen(settingsNotifierProvider.select((data) => data.syncOnStart),
    //     (prev, next) {
    //   if (prev == next) return;
    //   if (next) startFirebaseListeners();
    // });

    // ignore: cascade_invocations
    ref.onDispose(() {
      // ignore: curly_braces_in_flow_control_structures
      for (final sub in subs.values) sub.cancel();
      subs.clear();
      logger.fine('FirestoreLiveSync is disposing');
    });

    return;
  }

  //Future<void> initializeFirestoreSync() => Future<void>.sync(() => {});

  void startFirebaseListeners() {
    if (_syncIsOn) {
      logger.fine('sync listeners are on');
      return;
    }
    _syncIsOn = true;
    try {
      final collectionsMap = ref.read(syncCollectionsMapProvider);
      for (final dbCollection in collectionsMap.keys) {
        // if (dbCollection == DbCollection.media ||
        //     dbCollection == DbCollection.timelineNotes) continue;

        final collectionsMap = ref.read(syncCollectionsMapProvider);
        final collection = collectionsMap[dbCollection];
        if (collection == null) continue;

        // ignore: cancel_subscriptions
        // final sub = collection.listenForChanges().listen((_) {});

        // subs.putIfAbsent(dbCollection.name, () => sub);
      }
      _syncIsOn = false;
    } catch (err) {
      logger.severe('sync listeners error $err');
      _syncIsOn = false;
    }
  }

  // void stopFirebaseListeners() {
  //   // ignore: curly_braces_in_flow_control_structures
  //   for (final sub in subs.values) sub.cancel();
  //   subs.clear();
  // }

  // void loadFirebaseListenerOnStart() {
  //   Future<void>.delayed(const Duration(milliseconds: 1000)).then((_) {
  //     logger.fine('calling sync provider');
  //     //startFirebaseListeners();
  //   });
  // }
}
