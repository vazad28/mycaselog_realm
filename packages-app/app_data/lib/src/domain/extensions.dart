import 'dart:async';

import 'package:realm/realm.dart';

extension<T> on Stream<T> {
  StreamSubscription<void> asyncListen(
    Future<void> Function(T) onData, {
    Function? onError,
    void Function()? onDone,
  }) =>
      asyncMap(onData).listen((_) {}, onError: onError, onDone: onDone);
}

extension RealmEx on Realm {
  T addOrUpdate<T extends RealmObject>(T object) =>
      write(() => add(object, update: true));

  T findOrAdd<T extends RealmObject, I>(I id, T Function(I id) factory) =>
      write(() => find(id) ?? add(factory(id)));
}

extension<T extends RealmObject> on T {
  T? get nullIfInvalid => isValid ? this : null;
}

/// Adds or updates an object in the list based on its ID.
///
/// - [object]: The object to add or update.
/// - [idGetter]: A function that retrieves the ID from an object in the list.
/// - [updateFn]: An optional function to modify the existing object before update (in-place).

// extension ObjectListX<T extends RealmObject> on RealmList<T> {
//   RealmList<T> replaceOrAddComplex(T object, String Function(T) idGetter) {
//     final index = indexWhere((item) => idGetter(item) == idGetter(object));
//     if (index == -1) {
//       // Object not found, add it
//       add(object);
//     } else {
//       final obj = this[index];
//       remove(obj);
//       insert(index, object);
//     }
//   }
// }

// extension ObjectsList<T> on List<T> {
//   void replaceOrAddObject(T object, String Function(T) idGetter) {
//     final index = indexWhere((item) => idGetter(item) == idGetter(object));
//     if (index == -1) {
//       // Object not found, add it
//       add(object);
//     } else {
//       final obj = this[index];
//       remove(obj);
//       insert(index, object);
//     }
//   }
// }
