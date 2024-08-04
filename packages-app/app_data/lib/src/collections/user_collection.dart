part of '../collections.dart';

class UserCollection extends SyncCollection<UserModel> {
  UserCollection(super.realmDatabase);

  /// Firestore Methods
  @override
  String get path => 'users/$userID/data';

  @override
  String getPrimaryKey(UserModel object) => object.userID;

  @override
  UserModel mapToModel(Map<String, dynamic> data) => UserModelX.fromJson(data);

  @override
  Map<String, dynamic> modelToMap(UserModel object) => object.toJson();
}
