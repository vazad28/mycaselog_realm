// import 'dart:async';

// import 'package:app_models/app_models.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:logger_client/logger_client.dart';
// import 'package:realm/realm.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'disposable.dart';
// import 'realm_database.dart';

// enum OrderByType {
//   descending('DESC'),
//   ascending('ASC');

//   const OrderByType(this.type);
//   final String type;
// }

// /// Abstract class defining [BaseCollection] structure
// abstract class BaseCollection<T extends RealmObject> extends Disposable
//     with LoggerMixin {
//   BaseCollection(RealmDatabase realmDatabase)
//       : _realm = realmDatabase.realm,
//         userID = realmDatabase.user.id,
//         sharedPrefs = realmDatabase.sharedPrefs {
//     // try to reconnect on any network change, to wake up as early as possible
//     Connectivity().onConnectivityChanged.listen((results) {
//       if (results.contains(ConnectivityResult.mobile) ||
//           results.contains(ConnectivityResult.wifi)) {
//         isOffline = false;
//       } else {
//         isOffline = true;
//       }
//     }).cancelOnDisposeOf(this);

//     /// create  stream to listen for firebase changes
//     //createCollectionStream();
//   }

//   final Realm _realm;
//   final String userID;
//   final SharedPreferences sharedPrefs;

//   /// root string and path string for server collections
//   final String root = 'usersData';
//   final String path = '';

//   /// Last sync time in local storage
//   final String _lastSyncTimestampKey = '${T}_lastSyncTimestampKey';
//   String get lastSyncTimestampKey => _lastSyncTimestampKey;

//   bool isOffline = false;

//   /// get primaryKey of the Type T
//   String getPrimaryKey(T object);

//   /// ////////////////////////////////////////////////////////////////////
//   /// FIRESTORE Methods
//   /// ////////////////////////////////////////////////////////////////////

//   /// Instance of firestore
//   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   /// Collection ref for the collection
//   CollectionReference<Map<String, dynamic>> get collectionRef =>
//       firestore.collection(path);

//   /// Firestore collectione stream
//   Stream<QuerySnapshot<Map<String, dynamic>>>? _stream;
//   Stream<QuerySnapshot<Map<String, dynamic>>>? get stream => _stream;

//   /// Get collection data converted to a Model
//   CollectionReference<T> get withConverter =>
//       throw UnimplementedError('withConverter not set');

//   /// Listener to be created in each collection for listening to data changes
//   Stream<List<T>>? listenForChanges();

//   /// save the model
//   Future<void> putInFirestore(String docId, T model) {
//     // if (isOffline) {
//     //   return _realm.writeAsync(() {
//     //     _realm.add<T>(model, update: true);
//     //     withConverter.doc(docId).set(model);
//     //   });
//     // } else {
//     return withConverter.doc(docId).set(model).then((_) {
//       logger.info('success put');
//     }).catchError((dynamic err) {
//       logger.severe(err.toString());
//     });
//     //}
//   }

//   /// create collection stream
//   void createCollectionStream({int? lastSyncTimestamp}) {
//     //print('created stream for type $T');
//     final timestamp = (lastSyncTimestamp ?? getLastSyncTimestamp) - 5000;
//     _stream = collectionRef
//         .where('timestamp', isGreaterThan: timestamp <= 0 ? 0 : timestamp)
//         .snapshots();
//   }

//   Future<List<T>> syncByTimestamp(int timestamp) async {
//     final models = await _getDocsByTimestamp(timestamp);

//     /// write all models to _realm
//     await _realm.writeAsync(() {
//       _realm.addAll<T>(models, update: true);
//     });

//     return models;
//   }

//   /// Get the timestamp of  last  sync
//   int get getLastSyncTimestamp =>
//       sharedPrefs.getInt(_lastSyncTimestampKey) ?? 0;

//   /// set the lst sync timestamp
//   void setLastSyncTimestamp() {
//     logger.fine('set lastSyncTimestamp');
//     sharedPrefs.setInt(
//       _lastSyncTimestampKey,
//       ModelUtils.getTimestamp,
//     );
//   }

//   /// ////////////////////////////////////////////////////////////////////
//   /// REALM methods
//   /// ////////////////////////////////////////////////////////////////////

//   Future<void> add(String primaryKey, T object) {
//     return _realm.writeAsync(() {
//       _realm.add<T>(
//         object,
//         update: true,
//       );
//     }).then((_) {
//       logger.fine('added $T');
//       putInFirestore(primaryKey, object);
//     });
//   }

//   Future<T> upsert(String primaryKey, T Function() upsertCallback) async {
//     return _realm
//         .writeAsync<T>(
//       upsertCallback,
//     )
//         .then((upsertedModel) {
//       putInFirestore(primaryKey, upsertedModel);
//       return upsertedModel;
//     });
//   }

//   RealmResults<T> getAll({
//     String? orderByField,
//     OrderByType orderByType = OrderByType.descending,
//   }) {
//     if (orderByField != null) {
//       final order = orderByType.type;
//       return _realm.query<T>('TRUEPREDICATE SORT($orderByField $order)');
//     }
//     return _realm.all<T>();
//   }

//   T? getSingle(String primaryKey) {
//     return _realm.find<T>(primaryKey);
//   }

//   int count() => _realm.all<T>().query(r'removed == $0', [0]).length;

//   /// ////////////////////////////////////////////////////////////////////
//   /// Local methods
//   /// ////////////////////////////////////////////////////////////////////

//   Future<List<T>> _getDocsByTimestamp(int? timestamp) async {
//     List<QueryDocumentSnapshot<T>> docs;

//     docs = timestamp != null
//         ? (await withConverter
//                 .where('timestamp', isGreaterThan: timestamp)
//                 //.limit(100)
//                 .get())
//             .docs
//         : (await withConverter.get()).docs;

//     return docs.map((e) => e.data()).toList();
//   }
// }
