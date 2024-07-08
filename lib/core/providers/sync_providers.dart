import 'dart:async';

import 'package:app_annotations/app_annotations.dart';
import 'package:app_data/app_data.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

import 'providers.dart';

part '../../generated/core/providers/sync_providers.g.dart';

// class SyncResult {
//   SyncResult({
//     required this.dbCollection,
//     this.count = 0,
//     this.exception,
//   });

//   final DbCollection dbCollection;
//   final int? count;
//   final Exception? exception;

//   SyncResult copyWith({
//     DbCollection? dbCollection,
//     int? count,
//     Exception? exception,
//   }) =>
//       SyncResult(
//         dbCollection: dbCollection ?? this.dbCollection,
//         count: count ?? this.count,
//         exception: exception ?? this.exception,
//       );
// }

// @riverpod
// class SynsResults extends _$SynsResults {
//   @override
//   StateOf<SyncResult> build() {
//     return const StateOf<SyncResult>.init();
//   }
// }

@Riverpod(keepAlive: true)
class FirestoreSync extends _$FirestoreSync with LoggerMixin {
  StreamSubscription<List<CaseModel>>? _casesSyncSubscription;
  StreamSubscription<List<MediaModel>>? _mediaSyncSubscription;
  StreamSubscription<List<TemplateModel>>? _templatesSyncSubscription;
  StreamSubscription<List<SupportDataModel>>? _supportDataSyncSubscription;
  StreamSubscription<List<SettingsModel>>? _settingsSyncSubscription;

  late final CasesCollection _casesCollection;
  late final MediaCollection _mediaCollection;
  late final TemplatesCollection _templatesCollection;
  late final SupportDataCollection _supportDataCollection;
  late final SettingsCollection _settingsCollection;

  @override
  void build() {
    /// we sttart sync business only when user is logged in
    final currentUser = ref.watch(authenticationUserProvider);
    final databaseService = ref.read(databaseServiceProvider);

    _casesCollection = databaseService.casesCollection;
    _mediaCollection = databaseService.mediaCollection;
    _templatesCollection = databaseService.templatesCollection;
    _supportDataCollection = databaseService.supportDataCollection;
    _settingsCollection = databaseService.settingsCollection;

    if (!currentUser.isAnonymous) {
      Future<void>.delayed(Durations.medium1).then((_) => startSync());
    }

    //ref.onDispose(cancelSync);
    return;
  }

  void startSync() {
    logger.fine('startSync called');

    // ///casesSyncSubscription
    _casesSyncSubscription =
        _casesCollection.listenForChanges().listen((_) => {});

    // ///mediaSyncSubscription
    // _mediaSyncSubscription =
    //     _mediaCollection.listenForChanges().listen((_) => {});

    // ///templatesSyncSubscription
    // _templatesSyncSubscription =
    //     _templatesCollection.listenForChanges().listen((_) => {});

    // ///supportDataSyncSubscription
    _supportDataSyncSubscription =
        _supportDataCollection.listenForChanges().listen((_) => {});

    //settingsCollectionSubscription
    _settingsSyncSubscription =
        _settingsCollection.listenForChanges().listen((_) => {});
  }

  void cancelSync() {
    logger.fine('cancelSync called');
    _casesSyncSubscription?.cancel();
    _mediaSyncSubscription?.cancel();
    _templatesSyncSubscription?.cancel();
    _supportDataSyncSubscription?.cancel();
    _settingsSyncSubscription?.cancel();
  }

  void resetSyncForCollection(DbCollection dbCollection, int timestamp) {
    logger.fine('resetSyncForCollection called for ${dbCollection.name}');
    final sharedPrefs = ref.read(sharedPrefsProvider);

    switch (dbCollection) {
      case DbCollection.cases:
        final storageKey = _casesCollection.lastSyncTimestampKey;
        sharedPrefs.setInt(storageKey, timestamp);

        _casesSyncSubscription?.cancel().then((_) {
          _casesCollection.createCollectionStream(lastSyncTimestamp: 0);
          _casesSyncSubscription = _casesCollection.listenForChanges().listen(
                (items) => ref
                    .read(syncResultProvider(dbCollection).notifier)
                    .update(items.length),
              );
        });
      case DbCollection.media:
        final storageKey = _mediaCollection.lastSyncTimestampKey;
        sharedPrefs.setInt(storageKey, timestamp);

        _mediaSyncSubscription?.cancel().then((_) {
          _mediaCollection.createCollectionStream(lastSyncTimestamp: 0);
          _mediaSyncSubscription = _mediaCollection.listenForChanges().listen(
                (items) => ref
                    .read(syncResultProvider(dbCollection).notifier)
                    .update(items.length),
              );
        });
      case DbCollection.templates:
        final storageKey = _templatesCollection.lastSyncTimestampKey;
        sharedPrefs.setInt(storageKey, timestamp);

        _templatesSyncSubscription?.cancel().then((_) {
          _templatesCollection.createCollectionStream(lastSyncTimestamp: 0);
          _templatesSyncSubscription =
              _templatesCollection.listenForChanges().listen(
                    (items) => ref
                        .read(syncResultProvider(dbCollection).notifier)
                        .update(items.length),
                  );
        });
      case DbCollection.supportData:
        final storageKey = _supportDataCollection.lastSyncTimestampKey;
        sharedPrefs.setInt(storageKey, timestamp);

        _supportDataSyncSubscription?.cancel().then((_) {
          _supportDataCollection.createCollectionStream(lastSyncTimestamp: 0);
          _supportDataSyncSubscription =
              _supportDataCollection.listenForChanges().listen(
                    (items) => ref
                        .read(syncResultProvider(dbCollection).notifier)
                        .update(items.length),
                  );
        });
      case DbCollection.settings:
        final storageKey = _settingsCollection.lastSyncTimestampKey;
        sharedPrefs.setInt(storageKey, timestamp);

        _settingsSyncSubscription?.cancel().then((_) {
          _settingsCollection.createCollectionStream(lastSyncTimestamp: 0);
          _settingsSyncSubscription =
              _settingsCollection.listenForChanges().listen(
                    (items) => ref
                        .read(syncResultProvider(dbCollection).notifier)
                        .update(items.length),
                  );
        });

      default:
    }
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Collection sync reset
  /// ////////////////////////////////////////////////////////////////////
}

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
