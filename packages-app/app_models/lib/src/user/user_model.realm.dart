// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class UserModel extends _UserModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  UserModel(
    String userID, {
    String? email,
    String? displayName,
    String? photoUrl,
    String? speciality,
    String? subSpeciality,
    String? about,
    int? creationTime,
    int? lastSignInTime,
    int timestamp = 0,
    String? subscriptionPlan,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<UserModel>({
        'timestamp': 0,
      });
    }
    RealmObjectBase.set(this, 'userID', userID);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set(this, 'displayName', displayName);
    RealmObjectBase.set(this, 'photoUrl', photoUrl);
    RealmObjectBase.set(this, 'speciality', speciality);
    RealmObjectBase.set(this, 'subSpeciality', subSpeciality);
    RealmObjectBase.set(this, 'about', about);
    RealmObjectBase.set(this, 'creationTime', creationTime);
    RealmObjectBase.set(this, 'lastSignInTime', lastSignInTime);
    RealmObjectBase.set(this, 'timestamp', timestamp);
    RealmObjectBase.set(this, 'subscriptionPlan', subscriptionPlan);
  }

  UserModel._();

  @override
  String get userID => RealmObjectBase.get<String>(this, 'userID') as String;
  @override
  set userID(String value) => RealmObjectBase.set(this, 'userID', value);

  @override
  String? get email => RealmObjectBase.get<String>(this, 'email') as String?;
  @override
  set email(String? value) => RealmObjectBase.set(this, 'email', value);

  @override
  String? get displayName =>
      RealmObjectBase.get<String>(this, 'displayName') as String?;
  @override
  set displayName(String? value) =>
      RealmObjectBase.set(this, 'displayName', value);

  @override
  String? get photoUrl =>
      RealmObjectBase.get<String>(this, 'photoUrl') as String?;
  @override
  set photoUrl(String? value) => RealmObjectBase.set(this, 'photoUrl', value);

  @override
  String? get speciality =>
      RealmObjectBase.get<String>(this, 'speciality') as String?;
  @override
  set speciality(String? value) =>
      RealmObjectBase.set(this, 'speciality', value);

  @override
  String? get subSpeciality =>
      RealmObjectBase.get<String>(this, 'subSpeciality') as String?;
  @override
  set subSpeciality(String? value) =>
      RealmObjectBase.set(this, 'subSpeciality', value);

  @override
  String? get about => RealmObjectBase.get<String>(this, 'about') as String?;
  @override
  set about(String? value) => RealmObjectBase.set(this, 'about', value);

  @override
  int? get creationTime =>
      RealmObjectBase.get<int>(this, 'creationTime') as int?;
  @override
  set creationTime(int? value) =>
      RealmObjectBase.set(this, 'creationTime', value);

  @override
  int? get lastSignInTime =>
      RealmObjectBase.get<int>(this, 'lastSignInTime') as int?;
  @override
  set lastSignInTime(int? value) =>
      RealmObjectBase.set(this, 'lastSignInTime', value);

  @override
  int get timestamp => RealmObjectBase.get<int>(this, 'timestamp') as int;
  @override
  set timestamp(int value) => RealmObjectBase.set(this, 'timestamp', value);

  @override
  String? get _subscriptionPlan =>
      RealmObjectBase.get<String>(this, 'subscriptionPlan') as String?;
  @override
  set _subscriptionPlan(String? value) =>
      RealmObjectBase.set(this, 'subscriptionPlan', value);

  @override
  Stream<RealmObjectChanges<UserModel>> get changes =>
      RealmObjectBase.getChanges<UserModel>(this);

  @override
  Stream<RealmObjectChanges<UserModel>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<UserModel>(this, keyPaths);

  @override
  UserModel freeze() => RealmObjectBase.freezeObject<UserModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'userID': userID.toEJson(),
      'email': email.toEJson(),
      'displayName': displayName.toEJson(),
      'photoUrl': photoUrl.toEJson(),
      'speciality': speciality.toEJson(),
      'subSpeciality': subSpeciality.toEJson(),
      'about': about.toEJson(),
      'creationTime': creationTime.toEJson(),
      'lastSignInTime': lastSignInTime.toEJson(),
      'timestamp': timestamp.toEJson(),
      'subscriptionPlan': _subscriptionPlan.toEJson(),
    };
  }

  static EJsonValue _toEJson(UserModel value) => value.toEJson();
  static UserModel _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'userID': EJsonValue userID,
        'email': EJsonValue email,
        'displayName': EJsonValue displayName,
        'photoUrl': EJsonValue photoUrl,
        'speciality': EJsonValue speciality,
        'subSpeciality': EJsonValue subSpeciality,
        'about': EJsonValue about,
        'creationTime': EJsonValue creationTime,
        'lastSignInTime': EJsonValue lastSignInTime,
        'timestamp': EJsonValue timestamp,
        'subscriptionPlan': EJsonValue _subscriptionPlan,
      } =>
        UserModel(
          fromEJson(userID),
          email: fromEJson(email),
          displayName: fromEJson(displayName),
          photoUrl: fromEJson(photoUrl),
          speciality: fromEJson(speciality),
          subSpeciality: fromEJson(subSpeciality),
          about: fromEJson(about),
          creationTime: fromEJson(creationTime),
          lastSignInTime: fromEJson(lastSignInTime),
          timestamp: fromEJson(timestamp),
          subscriptionPlan: fromEJson(_subscriptionPlan),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(UserModel._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, UserModel, 'UserModel', [
      SchemaProperty('userID', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('email', RealmPropertyType.string, optional: true),
      SchemaProperty('displayName', RealmPropertyType.string, optional: true),
      SchemaProperty('photoUrl', RealmPropertyType.string, optional: true),
      SchemaProperty('speciality', RealmPropertyType.string, optional: true),
      SchemaProperty('subSpeciality', RealmPropertyType.string, optional: true),
      SchemaProperty('about', RealmPropertyType.string, optional: true),
      SchemaProperty('creationTime', RealmPropertyType.int, optional: true),
      SchemaProperty('lastSignInTime', RealmPropertyType.int, optional: true),
      SchemaProperty('timestamp', RealmPropertyType.int),
      SchemaProperty('_subscriptionPlan', RealmPropertyType.string,
          mapTo: 'subscriptionPlan', optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
