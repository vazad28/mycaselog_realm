import 'dart:async';

import 'package:realm/realm.dart';

extension<T> on Stream<T> {
  // ignore: unused_element
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
  // ignore: unused_element
  T? get nullIfInvalid => isValid ? this : null;
}
