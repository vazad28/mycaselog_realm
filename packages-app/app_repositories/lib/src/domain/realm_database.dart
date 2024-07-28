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
    debugPrint('realm database int called');
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
