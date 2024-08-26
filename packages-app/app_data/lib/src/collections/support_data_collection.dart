part of '../collections.dart';

class SupportDataCollection extends SyncCollection<SupportDataModel> {
  SupportDataCollection(super.realmDatabase) {
    final supportData = getSingle(userID);
    // must load support data from server to prevent empty write
    if (supportData?.timestamp == 0) syncByTimestamp(timestamp: 0);
  }

  @override
  String get path => '$root/$userID/${DbCollection.supportData.name}';

  @override
  String getPrimaryKey(SupportDataModel object) => object.userID;

  @override
  SupportDataModel mapToModel(Map<String, dynamic> data) =>
      SupportDataModelX.fromJson(data);

  @override
  Map<String, dynamic> modelToMap(SupportDataModel object) => object.toJson();

  @override
  Future<void> add(SupportDataModel model) {
    return realm.writeAsync(() {
      model.timestamp = ModelUtils.getTimestamp;
      realm.add<SupportDataModel>(model, update: true);
      addToFirestore(model);
    });
  }

  SupportDataModel? getSupportData() => getSingle(userID);
}
