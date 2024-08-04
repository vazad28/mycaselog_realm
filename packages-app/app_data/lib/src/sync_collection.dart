import 'dart:async';

import 'package:app_models/app_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:logger_client/logger_client.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_data.dart';
import 'domain/disposable.dart';

enum OrderByType {
  descending('DESC'),
  ascending('ASC');

  const OrderByType(this.type);
  final String type;
}

// Abstract class for a synchronized collection of Realm objects
abstract class SyncCollection<T extends RealmObject> extends Disposable
    with LoggerMixin {
  SyncCollection(
    RealmDatabase realmDatabase, // Realm database instance
  )   : realm = realmDatabase.realm, // Realm instance for local data storage
        userID = realmDatabase.user.id, // User ID for the current user
        sharedPrefs = realmDatabase.sharedPrefs {
    /// Starts the synchronization process Realm to Firestore.
    _syncToFirestore();
  }

  final Realm realm;
  final String userID;
  final SharedPreferences sharedPrefs;
  final String root = 'usersData';
  final String path = '';

  bool syncFromFirestore = false;

  // Key used to store the last sync timestamp in SharedPreferences
  final String _lastSyncTimestampKey = '${T}_lastSyncTimestampKey';

  // Firestore instance for accessing the database
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
      _syncFromFirestoreSubs;

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

  // Future<void> add(String primaryKey, T object) {
  //   return realm.writeAsync(() {
  //     realm.add<T>(
  //       object,
  //       update: true,
  //     );
  //   }).then((_) {
  //     logger.fine('added $T');
  //     putInFirestore(primaryKey, object);
  //   });
  // }

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
    ignoreRealmChanges = true;

    final query = collectionRef.where('timestamp', isGreaterThan: timestamp);
    final snapshot = await query.get();

    final ids = <String>[];

    // Use batch operations and async/await
    await realm.writeAsync(() {
      snapshot.docs.map((e) async {
        final model = mapToModel(e.data());
        realm.add(model, update: true);
        ids.add(getPrimaryKey(model));
      });
    }).whenComplete(() {
      ignoreRealmChanges = false;
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
  /// SYNC Functionality
  /// ////////////////////////////////////////////////////////////////////

  /// Flag to indicate ignoring changes from the Realm database.
  bool ignoreRealmChanges = false;

  /// Flag to indicate ignoring changes from the Firestore database.
  bool ignoreFirestoreChanges = false;

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

  /// Synchronizes data from Realm to Firestore.
  /// Listens for changes in Realm and adds/modifies/deletes data in Firestore accordingly.
  void _syncToFirestore() {
    final models = realm.all<T>();

    models.changes.listen((changes) async {
      if (ignoreRealmChanges) return;

      ignoreFirestoreChanges = true; // Prevent infinite loop

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
      await Future<void>.delayed(const Duration(milliseconds: 300));
      ignoreFirestoreChanges = false;
    });
  }

  /// Synchronizes data from Firestore to Realm.
  /// Listens for changes in Firestore and adds/modifies/deletes data in Realm accordingly.
  void _syncFromFirestore() {
    final timestamp = (getLastSyncTimestamp - 5000).clamp(0, double.infinity);

    _syncFromFirestoreSubs = collectionRef
        .where('timestamp', isGreaterThan: timestamp)
        .snapshots()
        .listen((snapshot) async {
      if (ignoreFirestoreChanges) return;

      ignoreRealmChanges = true; // Prevent infinite loop

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
      ignoreRealmChanges = false;
    });
  }

  /// Adds a model object to Firestore.
  void _addToFirestore(T model) {
    final docId = getPrimaryKey(model);
    collectionRef.doc(docId).set(modelToMap(model)).then((_) {
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

  void updateFirebaseSyncStatus({required bool status}) {
    if (status) {
      resumeSync();
    } else {
      pauseSync();
    }
  }
}
