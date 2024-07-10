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

  /// get single item from database
  T? getSingle(String key, String value) {
    try {
      return realm.query<T>('$key == \$0', [value]).first;
    } catch (err) {
      return null;
    }
  }

  Stream<RealmResultsChanges<T>> getSingleStream(String key, String value) {
    return realm.query<T>('$key == \$0', [value]).changes;
  }

  /// get all data of the collection
  RealmResults<T> getAll({int removed = 0}) =>
      realm.all<T>().query(r'removed == \$0', [removed]);

  /// get count of the data
  int getCount({int removed = 0}) =>
      realm.all<T>().query(r'removed == \$0', [removed]).length;

  /// stream to listen for collection change
  Stream<List<T>> listenForChanges();

  void createCollectionStream({int? lastSyncTimestamp}) {
    final timestamp = (lastSyncTimestamp ?? getLastSyncTimestamp) - 10000;
    _stream = collectionRef
        .where(
          'timestamp',
          isGreaterThan: timestamp < 0 ? 0 : timestamp,
        )
        .snapshots();
  }

  /// save the model
  Future<void> put(String docId, T model) => withConverter
          .doc(docId)
          .set((model as RealmObject).setTimestamp<T>())
          .then((_) => logger.info('success'))
          .catchError((dynamic err) {
        logger.severe(err.toString());
      });

  int get getLastSyncTimestamp =>
      sharedPrefs.getInt(_lastSyncTimestampKey) ?? 0;

  void setLastSyncTimestamp() {
    logger.fine('setLastSyncTimestamp for key - $_lastSyncTimestampKey');
    sharedPrefs.setInt(
      _lastSyncTimestampKey,
      ModelUtils.getTimestamp,
    );
  }
}
