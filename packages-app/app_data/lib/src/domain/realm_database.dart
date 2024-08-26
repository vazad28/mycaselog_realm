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

  // Define the initial schema version
  static const initialSchemaVersion = 1;

  // ignore: sort_constructors_first
  RealmDatabase._(this.realm, this.user, this.sharedPrefs);

  static Future<RealmDatabase> init(AuthenticationUser user) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final realm = await _createRealm(user);
    return RealmDatabase._(realm, user, sharedPrefs);
  }

  // ignore: unused_element
  static void _migrationCallback(Migration migration, int oldSchemaVersion) {
    // Check if the migration is needed
    if (oldSchemaVersion < 2) {
      // Add the new property
      // migration.newRealm.(
      //   NoteModel.className,
      //   'noteText',
      //   RealmPropertyType.string, // or RealmPropertyType.stringNullable
      //   nullable: true, // to make it nullable
      // );
    }
  }

  static Future<Realm> _createRealm(AuthenticationUser user) async {
    Configuration.defaultRealmName = '${user.id}.realm';

    /// on sign out we want  to return empty realm
    /// to  prevent collections recreated and starting listeners
    if (user.isAnonymous) return Realm(Configuration.local([]));

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
      //shouldDeleteIfMigrationNeeded: kDebugMode,
      schemaVersion: 2, // added NoteText property in version 2
      //migrationCallback: _migrationCallback,
    );

    return Realm(config);
  }

  @override
  Future<void> dispose() {
    return Future<void>.sync(realm.close);
  }
}
