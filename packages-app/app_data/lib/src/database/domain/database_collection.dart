import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger_client/logger_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Abstract class defining [DatabaseCollection] structure
abstract class DatabaseCollection<T> with LoggerMixin {
  DatabaseCollection(this.userID, this.sharedPrefs);

  final String userID;
  final SharedPreferences sharedPrefs;

  /// Instance of firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// root string and path string for server collections
  final String root = 'usersData';
  final String path = '';

  /// Last sync time in local storage
  final String _lastSyncTimestampKey = '${T.runtimeType}_lastSyncTimestampKey';
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

  void createCollectionStream({int? lastSyncTimestamp}) {
    _stream = collectionRef
        .where(
          'timestamp',
          isGreaterThan: (lastSyncTimestamp ?? getLastSyncTimestamp) - 50000,
        )
        .snapshots();
  }

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
  // Future<Map<String, T>> getAll({String? orderBy, bool desc = false}) async {
  //   List<QueryDocumentSnapshot<T>> docs;

  //   docs = orderBy != null
  //       ? (await this.orderBy(orderBy, desc: desc).get()).docs
  //       : (await withConverter.get()).docs;

  //   return {
  //     for (final QueryDocumentSnapshot<T> doc in docs) doc.id: doc.data(),
  //   };
  // }

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
