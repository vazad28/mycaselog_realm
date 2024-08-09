import 'dart:async';

import 'package:app_models/app_models.dart';
import 'package:authentication_client/authentication_client.dart';
import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'disposable.dart';

class RealmDatabase extends Disposable {
  final Realm realm;
  final AuthenticationUser user;
  final SharedPreferences sharedPrefs;

  // ignore: sort_constructors_first
  RealmDatabase._(this.realm, this.user, this.sharedPrefs);

  static Future<RealmDatabase> init(AuthenticationUser user) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final realm = await _createRealm(user);
    return RealmDatabase._(realm, user, sharedPrefs);
  }

  static Future<Realm> _createRealm(AuthenticationUser user) async {
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
    );

    return Realm(config);
  }

  @override
  Future<void> dispose() {
    return Future<void>.sync(realm.close);
  }
}
