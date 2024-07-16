import 'package:app_data/app_data.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'providers.dart';

part '../../generated/core/providers/db_provider.g.dart';

/// Realm config provider
@riverpod
Configuration realmConfig(RealmConfigRef ref, String userID) {
  Configuration.defaultRealmName = '$userID.realm';

  final config = Configuration.local(
    [
      AssistantModel.schema,
      CaseModel.schema,
      //CaseMediaModel.schema,
      MediaUploadModel.schema,
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
  return config;
}

/// Realm  provider
@riverpod
Realm realm(RealmRef ref) {
  final userID = ref.read(userIDProvider);
  final config = ref.read(realmConfigProvider(userID));

  final realm = Realm(config);

  if (kDebugMode) {
    print('CREATING REALM INSTANCE');
  }
  return realm;
}

@riverpod
class Db extends _$Db {
  @override
  DatabaseService build() {
    final realm = ref.read(realmProvider);

    return DatabaseService(
      realm: realm,
      userID: ref.read(userIDProvider),
      sharedPrefs: ref.read(sharedPrefsProvider),
    );
  }
}
