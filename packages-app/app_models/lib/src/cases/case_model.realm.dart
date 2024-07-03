// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CaseModel extends _CaseModel
    with RealmEntity, RealmObjectBase, RealmObject {
  CaseModel(
    ObjectId id,
    String diagnosis,
    String surgery,
    DateTime surgeryDate, {
    int? timestamp,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'diagnosis', diagnosis);
    RealmObjectBase.set(this, 'surgery', surgery);
    RealmObjectBase.set(this, 'surgeryDate', surgeryDate);
    RealmObjectBase.set(this, 'timestamp', timestamp);
  }

  CaseModel._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get diagnosis =>
      RealmObjectBase.get<String>(this, 'diagnosis') as String;
  @override
  set diagnosis(String value) => RealmObjectBase.set(this, 'diagnosis', value);

  @override
  String get surgery => RealmObjectBase.get<String>(this, 'surgery') as String;
  @override
  set surgery(String value) => RealmObjectBase.set(this, 'surgery', value);

  @override
  DateTime get surgeryDate =>
      RealmObjectBase.get<DateTime>(this, 'surgeryDate') as DateTime;
  @override
  set surgeryDate(DateTime value) =>
      RealmObjectBase.set(this, 'surgeryDate', value);

  @override
  int? get timestamp => RealmObjectBase.get<int>(this, 'timestamp') as int?;
  @override
  set timestamp(int? value) => RealmObjectBase.set(this, 'timestamp', value);

  @override
  Stream<RealmObjectChanges<CaseModel>> get changes =>
      RealmObjectBase.getChanges<CaseModel>(this);

  @override
  Stream<RealmObjectChanges<CaseModel>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<CaseModel>(this, keyPaths);

  @override
  CaseModel freeze() => RealmObjectBase.freezeObject<CaseModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'diagnosis': diagnosis.toEJson(),
      'surgery': surgery.toEJson(),
      'surgeryDate': surgeryDate.toEJson(),
      'timestamp': timestamp.toEJson(),
    };
  }

  static EJsonValue _toEJson(CaseModel value) => value.toEJson();
  static CaseModel _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'diagnosis': EJsonValue diagnosis,
        'surgery': EJsonValue surgery,
        'surgeryDate': EJsonValue surgeryDate,
        'timestamp': EJsonValue timestamp,
      } =>
        CaseModel(
          fromEJson(id),
          fromEJson(diagnosis),
          fromEJson(surgery),
          fromEJson(surgeryDate),
          timestamp: fromEJson(timestamp),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(CaseModel._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, CaseModel, 'CaseModel', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('diagnosis', RealmPropertyType.string),
      SchemaProperty('surgery', RealmPropertyType.string),
      SchemaProperty('surgeryDate', RealmPropertyType.timestamp),
      SchemaProperty('timestamp', RealmPropertyType.int, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
