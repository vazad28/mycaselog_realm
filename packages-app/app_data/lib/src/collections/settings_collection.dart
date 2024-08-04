part of '../collections.dart';

/// class SettingsCollection {
class SettingsCollection extends SyncCollection<SettingsModel> {
  SettingsCollection(super.realmDatabase);

  /// Firestore Methods
  @override
  String get path => '$root/$userID/${DbCollection.settings.name}';

  @override
  String getPrimaryKey(SettingsModel object) => object.userID;

  SettingsModel? getSettings() {
    return realm.find<SettingsModel>(userID);
  }

  Stream<RealmObjectChanges<SettingsModel>> getSettingsChanges() {
    return (realm.find<SettingsModel>(userID) ?? SettingsModel(userID)).changes;
  }

  @override
  SettingsModel mapToModel(Map<String, dynamic> data) =>
      SettingsModelX.fromJson(data);

  @override
  Map<String, dynamic> modelToMap(SettingsModel object) => object.toJson();
}
