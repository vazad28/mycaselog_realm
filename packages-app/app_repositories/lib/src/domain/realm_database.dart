import 'dart:async';

import 'package:app_models/app_models.dart';
import 'package:authentication_client/authentication_client.dart';
import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'disposable.dart';

class RealmDatabase extends Disposable {
  RealmDatabase._(this._realm, this._user, this._sharedPrefs);

  final Realm _realm;
  final AuthenticationUser _user;
  final SharedPreferences _sharedPrefs;

  Realm get realm => _realm;
  AuthenticationUser get user => _user;
  SharedPreferences get sharedPrefs => _sharedPrefs;

  /// Init repository
  static Future<RealmDatabase> init(AuthenticationUser user) async {
    print('realm database int called');
    final sharedPrefs = await SharedPreferences.getInstance();
    return RealmDatabase._(_initRealm(user), user, sharedPrefs);
  }

  /// Initialize realm with user
  static Realm _initRealm(AuthenticationUser user) {
    Configuration.defaultRealmName = '${user.id}.realm';

    final config = Configuration.local(
      [
        AssistantModel.schema,
        CaseModel.schema,
        MediaModel.schema,
        NoteModel.schema,
        PatientModel.schema,
        SettingsModel.schema,
        SharedTemplateModel.schema,
        SupportDataModel.schema,
        SurgeryLocationModel.schema,
        TemplateFieldModel.schema,
        TemplateModel.schema,
        TimelineNoteModel.schema,
        UserModel.schema,
      ],
      shouldDeleteIfMigrationNeeded: kDebugMode,
      //schemaVersion: 2,
    );
    return Realm(config);
  }

  /// check if the auto sync is on
  static void checkAutoSync() {}
}

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

extension ObjectListX<T extends RealmObject> on RealmList<T> {
  void replaceOrAddComplex(T object, String Function(T) idGetter) {
    final index = indexWhere((item) => idGetter(item) == idGetter(object));
    if (index == -1) {
      // Object not found, add it
      add(object);
    } else {
      final obj = this[index];
      remove(obj);
      insert(index, object);
    }
  }
}
