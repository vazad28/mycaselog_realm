import 'package:app_models/app_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger_client/logger_client.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Abstract class defining [DatabaseCollection] structure
abstract class DatabaseCollection<T extends RealmObject> with LoggerMixin {
  DatabaseCollection(this.userID, this.realm, this.sharedPrefs);

  final String userID;
  final Realm realm;
  final SharedPreferences sharedPrefs;

  /// Instance of firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// root string and path string for server collections
  final String root = 'usersData';
  final String path = '';

  /// Last sync time in local storage
  final String _lastSyncTimestampKey = '${T}_lastSyncTimestampKey';
  String get lastSyncTimestampKey => _lastSyncTimestampKey;

  /// Collection ref for the collection
  CollectionReference<Map<String, dynamic>> get collectionRef =>
      firestore.collection(path);

  /// Firestore collectione stream
  late Stream<QuerySnapshot<Map<String, dynamic>>> _stream;
  Stream<QuerySnapshot<Map<String, dynamic>>> get stream => _stream;

  /// Get collection data converted to a Model
  CollectionReference<T> get withConverter =>
      throw UnimplementedError('withConverter not set');

  /// method to be overridden in collection for adding data
  /// to both local Realm and Firestore
  void upsert(String id, T Function() updateCallback) {
    final model = realm.write<T>(updateCallback);
    put(id, model);
  }

  /// get sinlge object
  T? getSingle(String primaryKey) => realm.find<T>(primaryKey);

  /// stream to listen for collection change
  Stream<List<T>> listenForChanges();

  /// listenf or chnage item stream
  Stream<RealmResultsChanges<T>> getSingleStream(String key, String value) {
    return realm.query<T>('$key == \$0', [value]).changes;
  }

  /// get all data of the collection
  RealmResults<T> getAll({int removed = 0}) =>
      realm.all<T>().query(r'removed == $0', [removed]);

  /// get count of the data
  int getCount({int removed = 0}) =>
      realm.all<T>().query(r'removed == $0', [removed]).length;

  /// create collection stream
  void createCollectionStream({int? lastSyncTimestamp}) {
    final timestamp = (lastSyncTimestamp ?? getLastSyncTimestamp) - 5000;
    _stream = collectionRef
        .where('timestamp', isGreaterThan: timestamp < 0 ? 0 : timestamp)
        .snapshots();
  }

  /// save the model
  Future<void> put(String docId, T model, {bool saveLocal = false}) =>
      withConverter
          .doc(docId)
          .set((model as RealmObject).setTimestamp<T>())
          .then((_) {
        logger.info('success put');
        if (saveLocal) {
          realm.write(() {
            realm.add<T>(model, update: true);
          });
        }
      }).catchError((dynamic err) {
        logger.severe(err.toString());
      });

  /// save the model
  Future<void> update(String docID, Map<String, dynamic> obj) =>
      withConverter.doc(docID).update(obj).then((_) {
        logger.info('success update');
      }).catchError((dynamic err) {
        logger.severe(err.toString());
      });

  /// GET DATA BY TIMESTAMP. USED BY THE SYNC FUNCTIONS
  Future<int> syncByTimestamp(int? timestamp) async {
    List<QueryDocumentSnapshot<T>> docs;

    docs = timestamp != null
        ? (await withConverter
                .where('timestamp', isGreaterThan: timestamp)
                .get())
            .docs
        : (await withConverter.get()).docs;

    final models = docs.map((e) => e.data()).toList();

    /// write all models to realm
    await realm.writeAsync(() {
      realm.addAll<T>(models, update: true);
    });

    /// set new lastSyncTimestamp for this collection
    setLastSyncTimestamp();

    return models.length;
  }

  int get getLastSyncTimestamp =>
      sharedPrefs.getInt(_lastSyncTimestampKey) ?? 0;

  void setLastSyncTimestamp() {
    logger.fine('set lastSyncTimestamp');
    sharedPrefs.setInt(
      _lastSyncTimestampKey,
      ModelUtils.getTimestamp,
    );
  }
}
