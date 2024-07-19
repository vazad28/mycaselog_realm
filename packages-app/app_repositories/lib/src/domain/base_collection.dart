import 'package:realm/realm.dart';

abstract class BaseCollection<T extends RealmObject> {
  T? getSingle(String primaryKey);
  RealmResults<T> getAll();
  Future<void> add(T object);
  Future<T> upsert(T Function() updateCallback);
  int count();

  /// Firestore sync methods
  Future<int> syncByTimestamp(int timestamp);
  Stream<List<T>> listenForChanges();
}
