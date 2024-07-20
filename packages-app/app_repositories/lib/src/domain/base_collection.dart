import 'dart:async';

import 'package:app_models/app_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger_client/logger_client.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'disposable.dart';
import 'realm_database.dart';

/// Abstract class defining [BaseCollection] structure
abstract class BaseCollection<T extends RealmObject> extends Disposable
    with LoggerMixin {
  BaseCollection(RealmDatabase realmDatabase)
      : _realm = realmDatabase.realm,
        userID = realmDatabase.user.id,
        sharedPrefs = realmDatabase.sharedPrefs;
  //        {
  //   final startTimestamp = DateTime.now().millisecondsSinceEpoch;

  //   realmDatabase.realm
  //       .query<T>(r'timestamp > $0', [startTimestamp])
  //       .changes
  //       .listen((changes) {
  //         if (changes.results.isNotEmpty) print("$T Collection updated!");
  //         // // Handle changes here
  //         // print("Collection updated!");

  //         // // Access specific changes
  //         // print("Inserted: ${changes.inserted}");
  //         // print("Modified: ${changes.modified}");
  //         // print("Deleted: ${changes.deleted}");
  //       })
  //       .cancelOnDisposeOf(this);
  // }

  final Realm _realm;
  final String userID;
  final SharedPreferences sharedPrefs;

  /// root string and path string for server collections
  final String root = 'usersData';
  final String path = '';

  /// Last sync time in local storage
  final String _lastSyncTimestampKey = '${T}_lastSyncTimestampKey';
  String get lastSyncTimestampKey => _lastSyncTimestampKey;

  /// ////////////////////////////////////////////////////////////////////
  /// FIRESTORE Methods
  /// ////////////////////////////////////////////////////////////////////

  /// Instance of firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// Collection ref for the collection
  CollectionReference<Map<String, dynamic>> get collectionRef =>
      firestore.collection(path);

  /// Firestore collectione stream
  late Stream<QuerySnapshot<Map<String, dynamic>>> _stream;
  Stream<QuerySnapshot<Map<String, dynamic>>> get stream => _stream;

  /// Get collection data converted to a Model
  CollectionReference<T> get withConverter =>
      throw UnimplementedError('withConverter not set');

  /// Listener to be created in each collection for listening to data changes
  Stream<List<T>> listenForChanges();

  /// save the model
  Future<void> putInFirestore(String docId, T model) =>
      withConverter.doc(docId).set(model).then((_) {
        logger.info('success put');
      }).catchError((dynamic err) {
        logger.severe(err.toString());
      });

  /// create collection stream
  void createCollectionStream({int? lastSyncTimestamp}) {
    final timestamp = (lastSyncTimestamp ?? getLastSyncTimestamp) - 5000;
    _stream = collectionRef
        .where('timestamp', isGreaterThan: timestamp < 0 ? 0 : timestamp)
        .snapshots();
  }

  Future<int> syncByTimestamp(int timestamp) async {
    final models = await _getDocsByTimestamp(timestamp);

    /// write all models to _realm
    await _realm.writeAsync(() {
      _realm.addAll<T>(models, update: true);
    });

    return models.length;
  }

  /// Get the timestamp of  last  sync
  int get getLastSyncTimestamp =>
      sharedPrefs.getInt(_lastSyncTimestampKey) ?? 0;

  /// set the lst sync timestamp
  void setLastSyncTimestamp() {
    logger.fine('set lastSyncTimestamp');
    sharedPrefs.setInt(
      _lastSyncTimestampKey,
      ModelUtils.getTimestamp,
    );
  }

  /// ////////////////////////////////////////////////////////////////////
  /// REALM methods
  /// ////////////////////////////////////////////////////////////////////

  Future<void> add(String primaryKey, T object) {
    return _realm.writeAsync(() {
      _realm.add<T>(object, update: true);
      unawaited(putInFirestore(primaryKey, object));
    });
  }

  Future<T> upsert(String primaryKey, T Function() updateCallback) async {
    final upsertedModel = await _realm.writeAsync<T>(updateCallback);
    unawaited(putInFirestore(primaryKey, upsertedModel));
    return upsertedModel;
  }

  RealmResults<T> getAll({String? orderBy, bool isDecenting = true}) {
    if (orderBy != null) {
      final order = isDecenting ? 'DESCENDING' : 'ASCENDING';
      return _realm.query<T>('TRUEPREDICATE SORT($orderBy $order)');
    }
    return _realm.all<T>();
  }

  T? getSingle(String primaryKey) {
    return _realm.find<T>(primaryKey);
  }

  int count() => _realm.all<T>().query(r'removed == $0', [0]).length;

  /// ////////////////////////////////////////////////////////////////////
  /// Local methods
  /// ////////////////////////////////////////////////////////////////////

  Future<List<T>> _getDocsByTimestamp(int? timestamp) async {
    List<QueryDocumentSnapshot<T>> docs;

    docs = timestamp != null
        ? (await withConverter
                .where('timestamp', isGreaterThan: timestamp)
                .get())
            .docs
        : (await withConverter.get()).docs;

    return docs.map((e) => e.data()).toList();
  }
}
