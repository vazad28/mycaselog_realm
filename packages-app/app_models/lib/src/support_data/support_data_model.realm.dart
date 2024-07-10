// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_data_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class SupportDataModel extends _SupportDataModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  SupportDataModel(
    String userID, {
    Iterable<AssistantModel> assistants = const [],
    Iterable<String> activeBasicFields = const [],
    Iterable<String> anesthesiaBlocks = const [],
    Iterable<SurgeryLocationModel> surgeryLocations = const [],
    int timestamp = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<SupportDataModel>({
        'timestamp': 0,
      });
    }
    RealmObjectBase.set(this, 'userID', userID);
    RealmObjectBase.set<RealmList<AssistantModel>>(
        this, 'assistants', RealmList<AssistantModel>(assistants));
    RealmObjectBase.set<RealmList<String>>(
        this, 'activeBasicFields', RealmList<String>(activeBasicFields));
    RealmObjectBase.set<RealmList<String>>(
        this, 'anesthesiaBlocks', RealmList<String>(anesthesiaBlocks));
    RealmObjectBase.set<RealmList<SurgeryLocationModel>>(this,
        'surgeryLocations', RealmList<SurgeryLocationModel>(surgeryLocations));
    RealmObjectBase.set(this, 'timestamp', timestamp);
  }

  SupportDataModel._();

  @override
  String get userID => RealmObjectBase.get<String>(this, 'userID') as String;
  @override
  set userID(String value) => RealmObjectBase.set(this, 'userID', value);

  @override
  RealmList<AssistantModel> get assistants =>
      RealmObjectBase.get<AssistantModel>(this, 'assistants')
          as RealmList<AssistantModel>;
  @override
  set assistants(covariant RealmList<AssistantModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<String> get activeBasicFields =>
      RealmObjectBase.get<String>(this, 'activeBasicFields')
          as RealmList<String>;
  @override
  set activeBasicFields(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<String> get anesthesiaBlocks =>
      RealmObjectBase.get<String>(this, 'anesthesiaBlocks')
          as RealmList<String>;
  @override
  set anesthesiaBlocks(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<SurgeryLocationModel> get surgeryLocations =>
      RealmObjectBase.get<SurgeryLocationModel>(this, 'surgeryLocations')
          as RealmList<SurgeryLocationModel>;
  @override
  set surgeryLocations(covariant RealmList<SurgeryLocationModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  int get timestamp => RealmObjectBase.get<int>(this, 'timestamp') as int;
  @override
  set timestamp(int value) => RealmObjectBase.set(this, 'timestamp', value);

  @override
  Stream<RealmObjectChanges<SupportDataModel>> get changes =>
      RealmObjectBase.getChanges<SupportDataModel>(this);

  @override
  Stream<RealmObjectChanges<SupportDataModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<SupportDataModel>(this, keyPaths);

  @override
  SupportDataModel freeze() =>
      RealmObjectBase.freezeObject<SupportDataModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'userID': userID.toEJson(),
      'assistants': assistants.toEJson(),
      'activeBasicFields': activeBasicFields.toEJson(),
      'anesthesiaBlocks': anesthesiaBlocks.toEJson(),
      'surgeryLocations': surgeryLocations.toEJson(),
      'timestamp': timestamp.toEJson(),
    };
  }

  static EJsonValue _toEJson(SupportDataModel value) => value.toEJson();
  static SupportDataModel _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'userID': EJsonValue userID,
        'assistants': EJsonValue assistants,
        'activeBasicFields': EJsonValue activeBasicFields,
        'anesthesiaBlocks': EJsonValue anesthesiaBlocks,
        'surgeryLocations': EJsonValue surgeryLocations,
        'timestamp': EJsonValue timestamp,
      } =>
        SupportDataModel(
          fromEJson(userID),
          assistants: fromEJson(assistants),
          activeBasicFields: fromEJson(activeBasicFields),
          anesthesiaBlocks: fromEJson(anesthesiaBlocks),
          surgeryLocations: fromEJson(surgeryLocations),
          timestamp: fromEJson(timestamp),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(SupportDataModel._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, SupportDataModel, 'SupportDataModel', [
      SchemaProperty('userID', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('assistants', RealmPropertyType.object,
          linkTarget: 'AssistantModel',
          collectionType: RealmCollectionType.list),
      SchemaProperty('activeBasicFields', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('anesthesiaBlocks', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('surgeryLocations', RealmPropertyType.object,
          linkTarget: 'SurgeryLocationModel',
          collectionType: RealmCollectionType.list),
      SchemaProperty('timestamp', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class AssistantModel extends _AssistantModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  AssistantModel(
    String assistantID, {
    String? name,
    String? phone,
    String? photoUrl,
    int? removed = 0,
    int? createdAt = 0,
    int? timestamp = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<AssistantModel>({
        'removed': 0,
        'createdAt': 0,
        'timestamp': 0,
      });
    }
    RealmObjectBase.set(this, 'assistantID', assistantID);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'phone', phone);
    RealmObjectBase.set(this, 'photoUrl', photoUrl);
    RealmObjectBase.set(this, 'removed', removed);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'timestamp', timestamp);
  }

  AssistantModel._();

  @override
  String get assistantID =>
      RealmObjectBase.get<String>(this, 'assistantID') as String;
  @override
  set assistantID(String value) =>
      RealmObjectBase.set(this, 'assistantID', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  String? get phone => RealmObjectBase.get<String>(this, 'phone') as String?;
  @override
  set phone(String? value) => RealmObjectBase.set(this, 'phone', value);

  @override
  String? get photoUrl =>
      RealmObjectBase.get<String>(this, 'photoUrl') as String?;
  @override
  set photoUrl(String? value) => RealmObjectBase.set(this, 'photoUrl', value);

  @override
  int? get removed => RealmObjectBase.get<int>(this, 'removed') as int?;
  @override
  set removed(int? value) => RealmObjectBase.set(this, 'removed', value);

  @override
  int? get createdAt => RealmObjectBase.get<int>(this, 'createdAt') as int?;
  @override
  set createdAt(int? value) => RealmObjectBase.set(this, 'createdAt', value);

  @override
  int? get timestamp => RealmObjectBase.get<int>(this, 'timestamp') as int?;
  @override
  set timestamp(int? value) => RealmObjectBase.set(this, 'timestamp', value);

  @override
  Stream<RealmObjectChanges<AssistantModel>> get changes =>
      RealmObjectBase.getChanges<AssistantModel>(this);

  @override
  Stream<RealmObjectChanges<AssistantModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<AssistantModel>(this, keyPaths);

  @override
  AssistantModel freeze() => RealmObjectBase.freezeObject<AssistantModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'assistantID': assistantID.toEJson(),
      'name': name.toEJson(),
      'phone': phone.toEJson(),
      'photoUrl': photoUrl.toEJson(),
      'removed': removed.toEJson(),
      'createdAt': createdAt.toEJson(),
      'timestamp': timestamp.toEJson(),
    };
  }

  static EJsonValue _toEJson(AssistantModel value) => value.toEJson();
  static AssistantModel _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'assistantID': EJsonValue assistantID,
        'name': EJsonValue name,
        'phone': EJsonValue phone,
        'photoUrl': EJsonValue photoUrl,
        'removed': EJsonValue removed,
        'createdAt': EJsonValue createdAt,
        'timestamp': EJsonValue timestamp,
      } =>
        AssistantModel(
          fromEJson(assistantID),
          name: fromEJson(name),
          phone: fromEJson(phone),
          photoUrl: fromEJson(photoUrl),
          removed: fromEJson(removed),
          createdAt: fromEJson(createdAt),
          timestamp: fromEJson(timestamp),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(AssistantModel._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, AssistantModel, 'AssistantModel', [
      SchemaProperty('assistantID', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('phone', RealmPropertyType.string, optional: true),
      SchemaProperty('photoUrl', RealmPropertyType.string, optional: true),
      SchemaProperty('removed', RealmPropertyType.int, optional: true),
      SchemaProperty('createdAt', RealmPropertyType.int, optional: true),
      SchemaProperty('timestamp', RealmPropertyType.int, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class SurgeryLocationModel extends _SurgeryLocationModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  SurgeryLocationModel(
    String locationID, {
    String? name,
    String? phone,
    String? address,
    int? removed = 0,
    int? createdAt = 0,
    int? timestamp = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<SurgeryLocationModel>({
        'removed': 0,
        'createdAt': 0,
        'timestamp': 0,
      });
    }
    RealmObjectBase.set(this, 'locationID', locationID);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'phone', phone);
    RealmObjectBase.set(this, 'address', address);
    RealmObjectBase.set(this, 'removed', removed);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'timestamp', timestamp);
  }

  SurgeryLocationModel._();

  @override
  String get locationID =>
      RealmObjectBase.get<String>(this, 'locationID') as String;
  @override
  set locationID(String value) =>
      RealmObjectBase.set(this, 'locationID', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  String? get phone => RealmObjectBase.get<String>(this, 'phone') as String?;
  @override
  set phone(String? value) => RealmObjectBase.set(this, 'phone', value);

  @override
  String? get address =>
      RealmObjectBase.get<String>(this, 'address') as String?;
  @override
  set address(String? value) => RealmObjectBase.set(this, 'address', value);

  @override
  int? get removed => RealmObjectBase.get<int>(this, 'removed') as int?;
  @override
  set removed(int? value) => RealmObjectBase.set(this, 'removed', value);

  @override
  int? get createdAt => RealmObjectBase.get<int>(this, 'createdAt') as int?;
  @override
  set createdAt(int? value) => RealmObjectBase.set(this, 'createdAt', value);

  @override
  int? get timestamp => RealmObjectBase.get<int>(this, 'timestamp') as int?;
  @override
  set timestamp(int? value) => RealmObjectBase.set(this, 'timestamp', value);

  @override
  Stream<RealmObjectChanges<SurgeryLocationModel>> get changes =>
      RealmObjectBase.getChanges<SurgeryLocationModel>(this);

  @override
  Stream<RealmObjectChanges<SurgeryLocationModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<SurgeryLocationModel>(this, keyPaths);

  @override
  SurgeryLocationModel freeze() =>
      RealmObjectBase.freezeObject<SurgeryLocationModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'locationID': locationID.toEJson(),
      'name': name.toEJson(),
      'phone': phone.toEJson(),
      'address': address.toEJson(),
      'removed': removed.toEJson(),
      'createdAt': createdAt.toEJson(),
      'timestamp': timestamp.toEJson(),
    };
  }

  static EJsonValue _toEJson(SurgeryLocationModel value) => value.toEJson();
  static SurgeryLocationModel _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'locationID': EJsonValue locationID,
        'name': EJsonValue name,
        'phone': EJsonValue phone,
        'address': EJsonValue address,
        'removed': EJsonValue removed,
        'createdAt': EJsonValue createdAt,
        'timestamp': EJsonValue timestamp,
      } =>
        SurgeryLocationModel(
          fromEJson(locationID),
          name: fromEJson(name),
          phone: fromEJson(phone),
          address: fromEJson(address),
          removed: fromEJson(removed),
          createdAt: fromEJson(createdAt),
          timestamp: fromEJson(timestamp),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(SurgeryLocationModel._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, SurgeryLocationModel, 'SurgeryLocationModel', [
      SchemaProperty('locationID', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('phone', RealmPropertyType.string, optional: true),
      SchemaProperty('address', RealmPropertyType.string, optional: true),
      SchemaProperty('removed', RealmPropertyType.int, optional: true),
      SchemaProperty('createdAt', RealmPropertyType.int, optional: true),
      SchemaProperty('timestamp', RealmPropertyType.int, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
