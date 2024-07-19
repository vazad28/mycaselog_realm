import 'package:app_models/app_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger_client/logger_client.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Abstract class defining [FirestoreCollection] structure
abstract class FirestoreCollection<T extends RealmObject> with LoggerMixin {
  FirestoreCollection(this.userID, this.sharedPrefs);

  final String userID;
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

  /// create collection stream
  void createCollectionStream({int? lastSyncTimestamp}) {
    final timestamp = (lastSyncTimestamp ?? getLastSyncTimestamp) - 5000;
    _stream = collectionRef
        .where('timestamp', isGreaterThan: timestamp < 0 ? 0 : timestamp)
        .snapshots();
  }

  /// GET DATA BY TIMESTAMP. USED BY THE SYNC FUNCTIONS
  Future<List<T>> getByTimestamp(int? timestamp) async {
    List<QueryDocumentSnapshot<T>> docs;

    docs = timestamp != null
        ? (await withConverter
                .where('timestamp', isGreaterThan: timestamp)
                .get())
            .docs
        : (await withConverter.get()).docs;

    final models = docs.map((e) => e.data()).toList();

    return models;
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
}
