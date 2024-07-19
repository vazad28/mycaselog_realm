import 'dart:async';

import 'package:app_models/app_models.dart';
import 'package:authentication_client/authentication_client.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Disposable {
  final _disposers = <Future<void> Function()>[];

  Future<void> dispose() async {
    for (final disposer in _disposers) {
      await disposer();
    }
  }

  void onDispose(Future<void> Function() disposer) => _disposers.add(disposer);
}

class RealmDatabase extends Disposable {
  RealmDatabase._(this._realm, this._user, this._sharedPrefs) {
    // try to reconnect on any network change, to wake up as early as possible
    Connectivity()
        .onConnectivityChanged
        .listen((_) => {})
        .cancelOnDisposeOf(this);
  }

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
}

/// ////////////////////////////////////////////////////////////////////
/// EXTENSIONS
/// ////////////////////////////////////////////////////////////////////

extension on StreamSubscription {
  void cancelOnDisposeOf(Disposable disposable) => disposable.onDispose(cancel);
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
