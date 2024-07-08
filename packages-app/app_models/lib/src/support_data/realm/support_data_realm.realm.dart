// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_data_realm.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class SupportDataRealm extends _SupportDataRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  SupportDataRealm(
    String userID, {
    Iterable<AssistantRealm> assistants = const [],
    Iterable<String> activeBasicFields = const [],
    Iterable<String> anesthesiaBlocks = const [],
    Iterable<SurgeryLocationRealm> surgeryLocations = const [],
    int timestamp = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<SupportDataRealm>({
        'timestamp': 0,
      });
    }
    RealmObjectBase.set(this, 'userID', userID);
    RealmObjectBase.set<RealmList<AssistantRealm>>(
        this, 'assistants', RealmList<AssistantRealm>(assistants));
    RealmObjectBase.set<RealmList<String>>(
        this, 'activeBasicFields', RealmList<String>(activeBasicFields));
    RealmObjectBase.set<RealmList<String>>(
        this, 'anesthesiaBlocks', RealmList<String>(anesthesiaBlocks));
    RealmObjectBase.set<RealmList<SurgeryLocationRealm>>(this,
        'surgeryLocations', RealmList<SurgeryLocationRealm>(surgeryLocations));
    RealmObjectBase.set(this, 'timestamp', timestamp);
  }

  SupportDataRealm._();

  @override
  String get userID => RealmObjectBase.get<String>(this, 'userID') as String;
  @override
  set userID(String value) => RealmObjectBase.set(this, 'userID', value);

  @override
  RealmList<AssistantRealm> get assistants =>
      RealmObjectBase.get<AssistantRealm>(this, 'assistants')
          as RealmList<AssistantRealm>;
  @override
  set assistants(covariant RealmList<AssistantRealm> value) =>
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
  RealmList<SurgeryLocationRealm> get surgeryLocations =>
      RealmObjectBase.get<SurgeryLocationRealm>(this, 'surgeryLocations')
          as RealmList<SurgeryLocationRealm>;
  @override
  set surgeryLocations(covariant RealmList<SurgeryLocationRealm> value) =>
      throw RealmUnsupportedSetError();

  @override
  int get timestamp => RealmObjectBase.get<int>(this, 'timestamp') as int;
  @override
  set timestamp(int value) => RealmObjectBase.set(this, 'timestamp', value);

  @override
  Stream<RealmObjectChanges<SupportDataRealm>> get changes =>
      RealmObjectBase.getChanges<SupportDataRealm>(this);

  @override
  Stream<RealmObjectChanges<SupportDataRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<SupportDataRealm>(this, keyPaths);

  @override
  SupportDataRealm freeze() =>
      RealmObjectBase.freezeObject<SupportDataRealm>(this);

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

  static EJsonValue _toEJson(SupportDataRealm value) => value.toEJson();
  static SupportDataRealm _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'userID': EJsonValue userID,
        'assistants': EJsonValue assistants,
        'activeBasicFields': EJsonValue activeBasicFields,
        'anesthesiaBlocks': EJsonValue anesthesiaBlocks,
        'surgeryLocations': EJsonValue surgeryLocations,
        'timestamp': EJsonValue timestamp,
      } =>
        SupportDataRealm(
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
    RealmObjectBase.registerFactory(SupportDataRealm._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, SupportDataRealm, 'SupportDataRealm', [
      SchemaProperty('userID', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('assistants', RealmPropertyType.object,
          linkTarget: 'AssistantRealm',
          collectionType: RealmCollectionType.list),
      SchemaProperty('activeBasicFields', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('anesthesiaBlocks', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('surgeryLocations', RealmPropertyType.object,
          linkTarget: 'SurgeryLocationRealm',
          collectionType: RealmCollectionType.list),
      SchemaProperty('timestamp', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class AssistantRealm extends _AssistantRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  AssistantRealm(
    String assistantID, {
    String? name,
    String? phone,
    String? photoUrl,
    int removed = 0,
    int createdAt = 0,
    int timestamp = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<AssistantRealm>({
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

  AssistantRealm._();

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
  int get removed => RealmObjectBase.get<int>(this, 'removed') as int;
  @override
  set removed(int value) => RealmObjectBase.set(this, 'removed', value);

  @override
  int get createdAt => RealmObjectBase.get<int>(this, 'createdAt') as int;
  @override
  set createdAt(int value) => RealmObjectBase.set(this, 'createdAt', value);

  @override
  int get timestamp => RealmObjectBase.get<int>(this, 'timestamp') as int;
  @override
  set timestamp(int value) => RealmObjectBase.set(this, 'timestamp', value);

  @override
  Stream<RealmObjectChanges<AssistantRealm>> get changes =>
      RealmObjectBase.getChanges<AssistantRealm>(this);

  @override
  Stream<RealmObjectChanges<AssistantRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<AssistantRealm>(this, keyPaths);

  @override
  AssistantRealm freeze() => RealmObjectBase.freezeObject<AssistantRealm>(this);

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

  static EJsonValue _toEJson(AssistantRealm value) => value.toEJson();
  static AssistantRealm _fromEJson(EJsonValue ejson) {
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
        AssistantRealm(
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
    RealmObjectBase.registerFactory(AssistantRealm._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, AssistantRealm, 'AssistantRealm', [
      SchemaProperty('assistantID', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('phone', RealmPropertyType.string, optional: true),
      SchemaProperty('photoUrl', RealmPropertyType.string, optional: true),
      SchemaProperty('removed', RealmPropertyType.int),
      SchemaProperty('createdAt', RealmPropertyType.int),
      SchemaProperty('timestamp', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class SurgeryLocationRealm extends _SurgeryLocationRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  SurgeryLocationRealm(
    String locationID, {
    String? name,
    String? phone,
    String? address,
    int removed = 0,
    int createdAt = 0,
    int timestamp = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<SurgeryLocationRealm>({
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

  SurgeryLocationRealm._();

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
  int get removed => RealmObjectBase.get<int>(this, 'removed') as int;
  @override
  set removed(int value) => RealmObjectBase.set(this, 'removed', value);

  @override
  int get createdAt => RealmObjectBase.get<int>(this, 'createdAt') as int;
  @override
  set createdAt(int value) => RealmObjectBase.set(this, 'createdAt', value);

  @override
  int get timestamp => RealmObjectBase.get<int>(this, 'timestamp') as int;
  @override
  set timestamp(int value) => RealmObjectBase.set(this, 'timestamp', value);

  @override
  Stream<RealmObjectChanges<SurgeryLocationRealm>> get changes =>
      RealmObjectBase.getChanges<SurgeryLocationRealm>(this);

  @override
  Stream<RealmObjectChanges<SurgeryLocationRealm>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<SurgeryLocationRealm>(this, keyPaths);

  @override
  SurgeryLocationRealm freeze() =>
      RealmObjectBase.freezeObject<SurgeryLocationRealm>(this);

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

  static EJsonValue _toEJson(SurgeryLocationRealm value) => value.toEJson();
  static SurgeryLocationRealm _fromEJson(EJsonValue ejson) {
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
        SurgeryLocationRealm(
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
    RealmObjectBase.registerFactory(SurgeryLocationRealm._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, SurgeryLocationRealm, 'SurgeryLocationRealm', [
      SchemaProperty('locationID', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('phone', RealmPropertyType.string, optional: true),
      SchemaProperty('address', RealmPropertyType.string, optional: true),
      SchemaProperty('removed', RealmPropertyType.int),
      SchemaProperty('createdAt', RealmPropertyType.int),
      SchemaProperty('timestamp', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
