import 'dart:async';

import 'package:app_models/app_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger_client/logger_client.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_data.dart';
import 'sync_mixin.dart';

enum OrderByType {
  descending('DESC'),
  ascending('ASC');

  const OrderByType(this.type);
  final String type;
}

// Abstract class for a synchronized collection of Realm objects
abstract class SyncCollection<T extends RealmObject>
    with LoggerMixin, SyncMixin {
  SyncCollection(
    RealmDatabase realmDatabase, // Realm database instance
  )   : realm = realmDatabase.realm, // Realm instance for local data storage
        userID = realmDatabase.user.id, // User ID for the current user
        sharedPrefs = realmDatabase.sharedPrefs,
        _baseCollection = BaseCollection() {
    if (realmDatabase.user.isAnonymous) {
      _baseCollection.ignoreRealmChanges = true;
    } else {
      _baseCollection.ignoreRealmChanges = false;
      _syncToFirestore();
    }
  }

  final Realm realm;
  final String userID;
  final SharedPreferences sharedPrefs;
  final BaseCollection _baseCollection;

  final String root = 'usersData';
  final String path = '';

  // Key used to store the last sync timestamp in SharedPreferences
  final String _lastSyncTimestampKey = '${T}_lastSyncTimestampKey';

  // Firestore instance for accessing the database
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// Function to retrieve the primary key value for a given model object.
  String getPrimaryKey(T object);

  /// Function to convert a Map<String, dynamic> to a model object.
  T mapToModel(Map<String, dynamic> data);

  /// Function to convert a model object to a Map<String, dynamic>.
  Map<String, dynamic> modelToMap(T object);

  // Getter for the Firestore collection reference
  CollectionReference<Map<String, dynamic>> get collectionRef =>
      firestore.collection(path); // Construct collection path

  // Retrieves a single item from Realm based on its primary key
  T? getSingle(String primaryKey) => realm.find<T>(primaryKey);

  // ignore: avoid_setters_without_getters
  set ignoreRealmChanges(bool status) =>
      _baseCollection.ignoreRealmChanges = status;

  // Retrieves all items from Realm, optionally sorted by a specific field
  RealmResults<T> getAll({
    String? orderByField, // Field to sort by
    OrderByType orderByType = OrderByType.descending, // Sort order
  }) {
    if (orderByField != null) {
      // Query Realm with sorting
      return realm
          .query<T>('TRUEPREDICATE SORT($orderByField ${orderByType.type})');
    }
    // Return all items without sorting
    return realm.all<T>();
  }

  // Upserts data in Realm by executing the provided callback function
  Future<T> upsert(T Function() upsertCallback) async {
    return realm.writeAsync<T>(() {
      return realm.add<T>(
        upsertCallback.call(),
        update: true,
      );
    });
  }

  // Returns the total count of non-removed items in Realm for this collection
  int count() => realm.all<T>().query(r'removed == $0', [0]).length;

  /// sync cases based on timestamp
  Future<List<String>> syncByTimestamp(int timestamp) async {
    logger.fine('timestamp syncByTimestamp = $timestamp');
    _baseCollection.ignoreRealmChanges = true;

    final query = collectionRef.where('timestamp', isGreaterThan: timestamp);
    final snapshot = await query.get();

    final ids = <String>[];

    // Use batch operations and async/await
    await realm.writeAsync(() {
      for (final e in snapshot.docs) {
        final model = mapToModel(e.data());
        ids.add(getPrimaryKey(model));
        realm.add(model, update: true);
      }

      if (T == MediaModel) {
        refreshMediaBacklinks(realm, ids);
      } else if (T == TimelineNoteModel) {
        refreshTimelineNotesBacklinks(realm, ids);
      } else if (T == CaseModel) {
        refreshCasesBacklinks(realm, ids);
      }
    }).whenComplete(() {
      logger.fine(ids.length.toString());
      Future<void>.delayed(Durations.short1).then((_) {
        _baseCollection.ignoreRealmChanges = false;
      });
    });

    return ids;
  }

  // Retrieves the last sync timestamp from SharedPreferences
  int get getLastSyncTimestamp =>
      sharedPrefs.getInt(_lastSyncTimestampKey) ?? 0;

  // Sets the last sync timestamp in SharedPreferences
  void setLastSyncTimestamp() {
    logger.fine('Set lastSyncTimestamp'); // Log timestamp update
    sharedPrefs.setInt(_lastSyncTimestampKey, ModelUtils.getTimestamp);
  }

  /// ////////////////////////////////////////////////////////////////////
  /// SYNC TO FIRESTORE
  /// Synchronizes data from Realm to Firestore.
  /// Listens for changes in Realm and adds/modifies/deletes data
  /// in Firestore accordingly.
  /// ////////////////////////////////////////////////////////////////////
  void _syncToFirestore() {
    final models = realm.all<T>();

    models.changes.listen((changes) async {
      if (_baseCollection.ignoreRealmChanges) return;

      _baseCollection.ignoreFirestoreChanges = true; // Prevent infinite loop

      for (final index in changes.inserted) {
        debugPrint('Received model $T from Realm to sync (inserted)');
        _addToFirestore(models[index]);
      }

      for (final index in changes.modified) {
        debugPrint('Received model $T from Realm to sync (modified)');
        _addToFirestore(models[index]);
      }

      for (final index in changes.deleted) {
        debugPrint('Received model $T from Realm to sync (deleted)');
        _deleteFromFirestore(getPrimaryKey(models[index]));
      }

      // Reset flag after a short delay to avoid conflicts
      await Future<void>.delayed(const Duration(milliseconds: 300)).then((_) {
        _baseCollection.ignoreFirestoreChanges = false;
      });
    });
  }

  /// Adds a model object to Firestore.
  void _addToFirestore(T model) {
    final docId = getPrimaryKey(model);
    final modelToFirestore = modelToMap(model);

    collectionRef.doc(docId).set(modelToFirestore).then((_) {
      debugPrint('Successfully added model to Firestore');
    }).catchError((dynamic err) {
      debugPrint('Error adding to Firestore: $err');
    });
  }

  /// Deletes a model object from Firestore.
  void _deleteFromFirestore(String docId) {
    collectionRef.doc(docId).delete().catchError((dynamic err) {
      debugPrint('Error deleting from Firestore: $err');
    });
  }

  /// ////////////////////////////////////////////////////////////////////
  /// SYNC FROM FIRESTORE
  /// Synchronizes data from Firestore to Realm.
  /// Listens for changes in Firestore and adds/modifies/deletes
  /// data in Realm accordingly.
  /// ////////////////////////////////////////////////////////////////////
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
      _syncFromFirestoreSubs;

  void updateFirebaseSyncStatus({required bool status}) {
    if (status) {
      resumeSync();
    } else {
      pauseSync();
    }
  }

  void pauseSync() {
    logger.fine('pauseSync called');
    if (_syncFromFirestoreSubs != null) _syncFromFirestoreSubs?.pause();
  }

  void resumeSync() {
    logger.fine('resumeSync called');
    if (_syncFromFirestoreSubs == null) {
      _syncFromFirestore();
    } else {
      _syncFromFirestoreSubs?.resume();
    }
  }

  void _syncFromFirestore() {
    final timestamp = (getLastSyncTimestamp - 5000).clamp(0, double.infinity);

    _syncFromFirestoreSubs = collectionRef
        .where('timestamp', isGreaterThan: timestamp)
        .snapshots()
        .listen((snapshot) async {
      if (_baseCollection.ignoreFirestoreChanges) return;

      _baseCollection.ignoreRealmChanges = true; // Prevent infinite loop

      for (final docChange in snapshot.docChanges) {
        debugPrint('Received model  $T from Firestore to sync');
        final data = docChange.doc.data();
        if (data == null) continue;

        switch (docChange.type) {
          case DocumentChangeType.added:
          case DocumentChangeType.modified:
            await _addToRealm(data);
            break;
          case DocumentChangeType.removed:
            await _deleteFromRealm(data);
            break;
        }
      }

      // Set last update time after successful sync
      setLastSyncTimestamp();

      // Reset flag after processing changes
      await Future<void>.delayed(const Duration(milliseconds: 300)).then((_) {
        _baseCollection.ignoreRealmChanges = false;
      });
    });
  }

  /// Adds a model object to Realm.
  Future<void> _addToRealm(Map<String, dynamic> data) async {
    final model = mapToModel(data);
    return realm.writeAsync(() => realm.add<T>(model, update: true));
  }

  /// delete from realm
  Future<void> _deleteFromRealm(Map<String, dynamic> data) {
    final model = mapToModel(data);
    return realm.writeAsync(() => realm.delete(model));
  }
}
