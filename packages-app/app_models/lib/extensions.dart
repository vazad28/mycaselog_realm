import 'package:realm/realm.dart';

extension RealmListX<T> on List<T> {
  RealmList<T> get toRealmList => RealmList<T>(this);
}
