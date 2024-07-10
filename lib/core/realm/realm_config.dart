// This class gets app info from `atlasConfig.json`, which is
// automatically populated by the server when you download the
// template app through the Atlas App Services UI or CLI.
import 'package:app_models/app_models.dart';
import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers/providers.dart';

part '../../generated/core/realm/realm_config.g.dart';

/// Realm config provider
//@Riverpod(keepAlive: true)
@riverpod
Configuration realmConfig(RealmConfigRef ref) {
  final user = ref.watch(authenticationUserProvider);

  if (user.isAnonymous) {
    return Configuration.local([]);
  }

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
  return config;
}

/// Realm  provider
@riverpod
Realm realm(RealmRef ref) {
  final config = ref.watch(realmConfigProvider);
  final realm = Realm(config);
  // realm.write(() {
  //   realm.deleteAll<SettingsRealm>();
  // });

  // ref.onDispose(() {
  //   if (ref.exists(realmProvider)) {
  //     print('CLOSE REALM INSTANCE');
  //     realm.close();
  //   }
  // });

  print('CREATING REALM INSTANCE');
  return realm;
}

// class Config extends ChangeNotifier {

//   Config._create(dynamic realmConfig) {
//     appId = realmConfig['appId'];
//     atlasUrl = realmConfig['dataExplorerLink'];
//     baseUrl = Uri.parse(realmConfig['baseUrl']);
//   }

//   late String appId;
//   late String atlasUrl;
//   late Uri baseUrl;

//   static Future<Config> getConfig(String jsonConfigPath) async {
//     // final dynamic realmConfig =
//     //     json.decode(await rootBundle.loadString(jsonConfigPath));

//     final config = Configuration.local([CaseModel.schema,]);

//    // final config = Config._create(realmConfig);

//     return config;
//   }
// }
