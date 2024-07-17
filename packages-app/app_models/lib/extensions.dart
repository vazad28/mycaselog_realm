import 'package:realm/realm.dart';

import 'app_models.dart';

extension RealmListX<T> on List<T> {
  RealmList<T> get toRealmList => RealmList<T>(this);
}