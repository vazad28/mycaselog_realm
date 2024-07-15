// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_note_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class TimelineNoteModel extends $TimelineNoteModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  TimelineNoteModel(
    String noteID, {
    String authorID = 'unknown',
    String caseID = 'unknown',
    String? note,
    int createdAt = 0,
    int timestamp = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<TimelineNoteModel>({
        'authorID': 'unknown',
        'caseID': 'unknown',
        'createdAt': 0,
        'timestamp': 0,
      });
    }
    RealmObjectBase.set(this, 'noteID', noteID);
    RealmObjectBase.set(this, 'authorID', authorID);
    RealmObjectBase.set(this, 'caseID', caseID);
    RealmObjectBase.set(this, 'note', note);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'timestamp', timestamp);
  }

  TimelineNoteModel._();

  @override
  String get noteID => RealmObjectBase.get<String>(this, 'noteID') as String;
  @override
  set noteID(String value) => RealmObjectBase.set(this, 'noteID', value);

  @override
  String get authorID =>
      RealmObjectBase.get<String>(this, 'authorID') as String;
  @override
  set authorID(String value) => RealmObjectBase.set(this, 'authorID', value);

  @override
  String get caseID => RealmObjectBase.get<String>(this, 'caseID') as String;
  @override
  set caseID(String value) => RealmObjectBase.set(this, 'caseID', value);

  @override
  String? get note => RealmObjectBase.get<String>(this, 'note') as String?;
  @override
  set note(String? value) => RealmObjectBase.set(this, 'note', value);

  @override
  int get createdAt => RealmObjectBase.get<int>(this, 'createdAt') as int;
  @override
  set createdAt(int value) => RealmObjectBase.set(this, 'createdAt', value);

  @override
  int get timestamp => RealmObjectBase.get<int>(this, 'timestamp') as int;
  @override
  set timestamp(int value) => RealmObjectBase.set(this, 'timestamp', value);

  @override
  Stream<RealmObjectChanges<TimelineNoteModel>> get changes =>
      RealmObjectBase.getChanges<TimelineNoteModel>(this);

  @override
  Stream<RealmObjectChanges<TimelineNoteModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<TimelineNoteModel>(this, keyPaths);

  @override
  TimelineNoteModel freeze() =>
      RealmObjectBase.freezeObject<TimelineNoteModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'noteID': noteID.toEJson(),
      'authorID': authorID.toEJson(),
      'caseID': caseID.toEJson(),
      'note': note.toEJson(),
      'createdAt': createdAt.toEJson(),
      'timestamp': timestamp.toEJson(),
    };
  }

  static EJsonValue _toEJson(TimelineNoteModel value) => value.toEJson();
  static TimelineNoteModel _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'noteID': EJsonValue noteID,
        'authorID': EJsonValue authorID,
        'caseID': EJsonValue caseID,
        'note': EJsonValue note,
        'createdAt': EJsonValue createdAt,
        'timestamp': EJsonValue timestamp,
      } =>
        TimelineNoteModel(
          fromEJson(noteID),
          authorID: fromEJson(authorID),
          caseID: fromEJson(caseID),
          note: fromEJson(note),
          createdAt: fromEJson(createdAt),
          timestamp: fromEJson(timestamp),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(TimelineNoteModel._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, TimelineNoteModel, 'TimelineNoteModel', [
      SchemaProperty('noteID', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('authorID', RealmPropertyType.string),
      SchemaProperty('caseID', RealmPropertyType.string),
      SchemaProperty('note', RealmPropertyType.string,
          optional: true, indexType: RealmIndexType.fullText),
      SchemaProperty('createdAt', RealmPropertyType.int,
          indexType: RealmIndexType.regular),
      SchemaProperty('timestamp', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
