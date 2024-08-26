part of '../collections.dart';

class UserCollection extends SyncCollection<UserModel> {
  UserCollection(super.realmDatabase) {
    final userModel = getSingle(userID);
    // must load user model data from server to prevent empty write
    if (userModel?.timestamp == 0) syncByTimestamp(timestamp: 0);
  }

  /// Firestore Methods
  @override
  String get path => 'users/$userID/data';

  @override
  String getPrimaryKey(UserModel object) => object.userID;

  @override
  UserModel mapToModel(Map<String, dynamic> data) => UserModelX.fromJson(data);

  @override
  Map<String, dynamic> modelToMap(UserModel object) => object.toJson();

  UserModel userModelFromUser(AuthenticationUser user) {
    return UserModelX.fromUser(
      userID: user.id,
      email: user.email,
      displayName: user.name,
      photoUrl: user.photo,
    );
  }

  @override
  Future<void> add(UserModel model) {
    return realm.writeAsync(() {
      model.timestamp = ModelUtils.getTimestamp;
      realm.add<UserModel>(model, update: true);
      addToFirestore(model);
    });
  }
}
