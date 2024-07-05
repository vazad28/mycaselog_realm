// This class gets app info from `atlasConfig.json`, which is
// automatically populated by the server when you download the
// template app through the Atlas App Services UI or CLI.
import 'package:app_models/app_models.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../generated/core/realm/realm_config.g.dart';

/// Realm config provider
@riverpod
Configuration realmConfig(RealmConfigRef ref) {
  final config = Configuration.local([
    AssistantModel.schema,
    CaseModel.schema,
    PatientModel.schema,
    SupportDataModel.schema,
    SurgeryLocationModel.schema,
    TemplateFieldModel.schema,
    TemplateModel.schema,
  ]);
  return config;
}

/// Realm  provider
@riverpod
Realm realm(RealmRef ref) {
  final realm = Realm(ref.watch(realmConfigProvider));
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
