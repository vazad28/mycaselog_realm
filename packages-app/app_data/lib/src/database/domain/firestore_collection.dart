import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger_client/logger_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Abstract class defining [FirestoreCollection] structure
abstract class FirestoreCollection<T> with LoggerMixin {
  FirestoreCollection(this.userID, this.sharedPrefs);

  /// root string for server collections path
  final String root = 'usersData';

  final String path = '';

  final String userID;
  final SharedPreferences sharedPrefs;

  String get _lastSyncTimestampKey => '${T.runtimeType}_lastSyncTimestampKey';

  CollectionReference<Map<String, dynamic>> get collectionRef =>
      firestore.collection(path);

  Stream<QuerySnapshot<Map<String, dynamic>>> get stream;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// Get collection data converted to a Model
  CollectionReference<T> get withConverter =>
      throw UnimplementedError('withConverter not set');

  /// is Collection empty
  Future<bool> isEmptyCollection() async {
    final snapshots = await firestore.collection(path).limit(1).get();
    return snapshots.size > 0;
  }

  /// stream to listen for collection change
  Stream<List<T>> listenForChanges();

  /// Get ordered data
  Query<T> orderBy(String field, {bool desc = false}) =>
      withConverter.orderBy(field, descending: desc);

  /// Get single document by ID
  Future<T?> getSingle(String id) async =>
      (await withConverter.doc(id).get()).data();

  /// Get all sorted documents
  Future<Map<String, T>> getAll({String? orderBy, bool desc = false}) async {
    List<QueryDocumentSnapshot<T>> docs;

    docs = orderBy != null
        ? (await this.orderBy(orderBy, desc: desc).get()).docs
        : (await withConverter.get()).docs;

    return {
      for (final QueryDocumentSnapshot<T> doc in docs) doc.id: doc.data(),
    };
  }

  /// GET DATA BY TIMESTAMP. USED BY THE SYNC FUNCTIONS
  Future<List<T>> getCollectionByTimestamp(int? timestamp) async {
    List<QueryDocumentSnapshot<T>> docs;

    docs = timestamp != null
        ? (await withConverter
                .where('timestamp', isGreaterThan: timestamp)
                .get())
            .docs
        : (await withConverter.get()).docs;

    return docs.map((e) => e.data()).toList();
  }

  /// save the model
  Future<void> put(String docId, T model) => withConverter
          .doc(docId)
          .set(model)
          .then((_) => logger.info('success'))
          .catchError((dynamic err) {
        logger.severe(err.toString());
      });

  int get getLastSyncTimestamp =>
      sharedPrefs.getInt(_lastSyncTimestampKey) ?? 0;

  void setLastSyncTimestamp() {
    sharedPrefs.setInt(
      _lastSyncTimestampKey,
      DateTime.now().millisecondsSinceEpoch,
    );
  }
}
