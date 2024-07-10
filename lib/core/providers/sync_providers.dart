import 'dart:async';

import 'package:app_annotations/app_annotations.dart';
import 'package:app_data/app_data.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

import 'providers.dart';

part '../../generated/core/providers/sync_providers.g.dart';

@Riverpod(keepAlive: true)
class SyncCollectionsMap extends _$SyncCollectionsMap {
  @override
  Map<DbCollection, DatabaseCollection> build() {
    final databaseService = ref.read(databaseServiceProvider);

    final collectionsMap = <DbCollection, DatabaseCollection>{
      DbCollection.cases: databaseService.casesCollection,
      DbCollection.media: databaseService.mediaCollection,
      DbCollection.notes: databaseService.notesCollection,
      DbCollection.timelineNotes: databaseService.timelineNotesCollection,
      DbCollection.templates: databaseService.templatesCollection,
      DbCollection.supportData: databaseService.supportDataCollection,
      DbCollection.settings: databaseService.settingsCollection,
    };

    return collectionsMap;
  }
}

@Riverpod(keepAlive: true)
class CollectionSync extends _$CollectionSync {
  StreamSubscription<List>? _syncSubscription;
  late final DatabaseCollection _collection;

  @override
  void build(DatabaseCollection collection) {
    _collection = collection;
  }

  void syncCollection() => _collection.listenForChanges().listen((_) => {});

  void resetSyncCollection(DbCollection dbCollection, int timestamp) {
    final sharedPrefs = ref.read(sharedPrefsProvider);
    final storageKey = _collection.lastSyncTimestampKey;
    sharedPrefs.setInt(storageKey, timestamp);

    _syncSubscription?.cancel().then((_) {
      _collection.createCollectionStream(lastSyncTimestamp: 0);
      _syncSubscription = _collection.listenForChanges().listen(
            (items) => ref
                .read(syncResultProvider(dbCollection).notifier)
                .update(items.length),
          );
    });
  }
}

@Riverpod(keepAlive: true)
class FirestoreSync extends _$FirestoreSync {
  @override
  void build() {
    final currentUser = ref.watch(authenticationUserProvider);

    if (currentUser.isAnonymous) return;

    Future<void>.delayed(Durations.medium1).then((_) {
      for (final dbCollection in DbCollection.values) {
        final collectionsMap = ref.read(syncCollectionsMapProvider);
        final collection = collectionsMap[dbCollection];
        if (collection == null) continue;

        ref.read(collectionSyncProvider(collection).notifier).syncCollection();
      }
    });
  }
}

// @Riverpod(keepAlive: true)
// class FirestoreSync extends _$FirestoreSync with LoggerMixin {
//   StreamSubscription<List<CaseModel>>? _casesSyncSubscription;
//   StreamSubscription<List<MediaModel>>? _mediaSyncSubscription;
//   StreamSubscription<List<TemplateModel>>? _templatesSyncSubscription;
//   StreamSubscription<List<SupportDataModel>>? _supportDataSyncSubscription;
//   StreamSubscription<List<SettingsModel>>? _settingsSyncSubscription;
//   StreamSubscription<List<NoteModel>>? _notesSyncSubscription;

//   late final CasesCollection _casesCollection;
//   late final MediaCollection _mediaCollection;
//   late final TemplatesCollection _templatesCollection;
//   late final SupportDataCollection _supportDataCollection;
//   late final SettingsCollection _settingsCollection;
//   late final NotesCollection _notesCollection;

//   @override
//   void build() {
//     /// we sttart sync business only when user is logged in
//     final currentUser = ref.watch(authenticationUserProvider);
//     final databaseService = ref.read(databaseServiceProvider);

//     _casesCollection = databaseService.casesCollection;
//     _mediaCollection = databaseService.mediaCollection;
//     _templatesCollection = databaseService.templatesCollection;
//     _supportDataCollection = databaseService.supportDataCollection;
//     _settingsCollection = databaseService.settingsCollection;
//     _notesCollection = databaseService.notesCollection;

//     if (!currentUser.isAnonymous) {
//       Future<void>.delayed(Durations.medium1).then((_) => startSync());
//     }

//     //ref.onDispose(cancelSync);
//     return;
//   }

//   void startSync() {
//     logger.fine('startSync called');

//     // ///casesSyncSubscription
//     _casesSyncSubscription =
//         _casesCollection.listenForChanges().listen((_) => {});

//     // ///mediaSyncSubscription
//     // _mediaSyncSubscription =
//     //     _mediaCollection.listenForChanges().listen((_) => {});

//     // ///templatesSyncSubscription
//     // _templatesSyncSubscription =
//     //     _templatesCollection.listenForChanges().listen((_) => {});

//     //supportDataSyncSubscription
//     _supportDataSyncSubscription =
//         _supportDataCollection.listenForChanges().listen((_) => {});

//     //settingsCollectionSubscription
//     _settingsSyncSubscription =
//         _settingsCollection.listenForChanges().listen((_) => {});

//     // ///casesSyncSubscription
//     _notesSyncSubscription =
//         _notesCollection.listenForChanges().listen((_) => {});
//   }

//   void cancelSync() {
//     logger.fine('cancelSync called');
//     _casesSyncSubscription?.cancel();
//     _mediaSyncSubscription?.cancel();
//     _templatesSyncSubscription?.cancel();
//     _supportDataSyncSubscription?.cancel();
//     _settingsSyncSubscription?.cancel();
//     _notesSyncSubscription?.cancel();
//   }

//   void resetSyncForCollection(DbCollection dbCollection, int timestamp) {
//     logger.fine('resetSyncForCollection called for ${dbCollection.name}');
//     final sharedPrefs = ref.read(sharedPrefsProvider);

//     switch (dbCollection) {
//       case DbCollection.cases:
//         final storageKey = _casesCollection.lastSyncTimestampKey;
//         sharedPrefs.setInt(storageKey, timestamp);

//         _casesSyncSubscription?.cancel().then((_) {
//           _casesCollection.createCollectionStream(lastSyncTimestamp: 0);
//           _casesSyncSubscription = _casesCollection.listenForChanges().listen(
//                 (items) => ref
//                     .read(syncResultProvider(dbCollection).notifier)
//                     .update(items.length),
//               );
//         });
//       case DbCollection.media:
//         final storageKey = _mediaCollection.lastSyncTimestampKey;
//         sharedPrefs.setInt(storageKey, timestamp);

//         _mediaSyncSubscription?.cancel().then((_) {
//           _mediaCollection.createCollectionStream(lastSyncTimestamp: 0);
//           _mediaSyncSubscription = _mediaCollection.listenForChanges().listen(
//                 (items) => ref
//                     .read(syncResultProvider(dbCollection).notifier)
//                     .update(items.length),
//               );
//         });
//       case DbCollection.templates:
//         final storageKey = _templatesCollection.lastSyncTimestampKey;
//         sharedPrefs.setInt(storageKey, timestamp);

//         _templatesSyncSubscription?.cancel().then((_) {
//           _templatesCollection.createCollectionStream(lastSyncTimestamp: 0);
//           _templatesSyncSubscription =
//               _templatesCollection.listenForChanges().listen(
//                     (items) => ref
//                         .read(syncResultProvider(dbCollection).notifier)
//                         .update(items.length),
//                   );
//         });
//       case DbCollection.supportData:
//         final storageKey = _supportDataCollection.lastSyncTimestampKey;
//         sharedPrefs.setInt(storageKey, timestamp);

//         _supportDataSyncSubscription?.cancel().then((_) {
//           _supportDataCollection.createCollectionStream(lastSyncTimestamp: 0);
//           _supportDataSyncSubscription =
//               _supportDataCollection.listenForChanges().listen(
//                     (items) => ref
//                         .read(syncResultProvider(dbCollection).notifier)
//                         .update(items.length),
//                   );
//         });
//       case DbCollection.settings:
//         final storageKey = _settingsCollection.lastSyncTimestampKey;
//         sharedPrefs.setInt(storageKey, timestamp);

//         _settingsSyncSubscription?.cancel().then((_) {
//           _settingsCollection.createCollectionStream(lastSyncTimestamp: 0);
//           _settingsSyncSubscription =
//               _settingsCollection.listenForChanges().listen(
//                     (items) => ref
//                         .read(syncResultProvider(dbCollection).notifier)
//                         .update(items.length),
//                   );
//         });
//       case DbCollection.notes:
//         final storageKey = _notesCollection.lastSyncTimestampKey;
//         sharedPrefs.setInt(storageKey, timestamp);

//         _notesSyncSubscription?.cancel().then((_) {
//           _notesCollection.createCollectionStream(lastSyncTimestamp: 0);
//           _notesSyncSubscription = _notesCollection.listenForChanges().listen(
//                 (items) => ref
//                     .read(syncResultProvider(dbCollection).notifier)
//                     .update(items.length),
//               );
//         });

//       default:
//     }
//   }
//}
/// ////////////////////////////////////////////////////////////////////
/// Collection sync reset
/// ////////////////////////////////////////////////////////////////////

@Riverpod(keepAlive: true)
class SyncResult extends _$SyncResult {
  @override
  StateOf<int> build(DbCollection dbCollection) {
    return const StateOf<int>.init();
  }

  void update(int length) {
    state = StateOf<int>.success(length);
  }

  void showLoading() => state = const StateOf<int>.loading();
}
