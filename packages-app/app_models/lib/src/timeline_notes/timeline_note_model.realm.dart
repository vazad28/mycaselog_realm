// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_note_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class TimelineNoteModel extends _TimelineNoteModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  TimelineNoteModel(
    String noteID, {
    String? authorID,
    String? caseID,
    String? note,
    int createdAt = 0,
    int initialTimestamp = 0,
    int removed = 0,
    int timestamp = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<TimelineNoteModel>({
        'createdAt': 0,
        'initialTimestamp': 0,
        'removed': 0,
        'timestamp': 0,
      });
    }
    RealmObjectBase.set(this, 'noteID', noteID);
    RealmObjectBase.set(this, 'authorID', authorID);
    RealmObjectBase.set(this, 'caseID', caseID);
    RealmObjectBase.set(this, 'note', note);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'initialTimestamp', initialTimestamp);
    RealmObjectBase.set(this, 'removed', removed);
    RealmObjectBase.set(this, 'timestamp', timestamp);
  }

  TimelineNoteModel._();

  @override
  String get noteID => RealmObjectBase.get<String>(this, 'noteID') as String;
  @override
  set noteID(String value) => RealmObjectBase.set(this, 'noteID', value);

  @override
  String? get authorID =>
      RealmObjectBase.get<String>(this, 'authorID') as String?;
  @override
  set authorID(String? value) => RealmObjectBase.set(this, 'authorID', value);

  @override
  String? get caseID => RealmObjectBase.get<String>(this, 'caseID') as String?;
  @override
  set caseID(String? value) => RealmObjectBase.set(this, 'caseID', value);

  @override
  String? get note => RealmObjectBase.get<String>(this, 'note') as String?;
  @override
  set note(String? value) => RealmObjectBase.set(this, 'note', value);

  @override
  int get createdAt => RealmObjectBase.get<int>(this, 'createdAt') as int;
  @override
  set createdAt(int value) => RealmObjectBase.set(this, 'createdAt', value);

  @override
  int get initialTimestamp =>
      RealmObjectBase.get<int>(this, 'initialTimestamp') as int;
  @override
  set initialTimestamp(int value) =>
      RealmObjectBase.set(this, 'initialTimestamp', value);

  @override
  int get removed => RealmObjectBase.get<int>(this, 'removed') as int;
  @override
  set removed(int value) => RealmObjectBase.set(this, 'removed', value);

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
      'initialTimestamp': initialTimestamp.toEJson(),
      'removed': removed.toEJson(),
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
        'initialTimestamp': EJsonValue initialTimestamp,
        'removed': EJsonValue removed,
        'timestamp': EJsonValue timestamp,
      } =>
        TimelineNoteModel(
          fromEJson(noteID),
          authorID: fromEJson(authorID),
          caseID: fromEJson(caseID),
          note: fromEJson(note),
          createdAt: fromEJson(createdAt),
          initialTimestamp: fromEJson(initialTimestamp),
          removed: fromEJson(removed),
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
      SchemaProperty('authorID', RealmPropertyType.string, optional: true),
      SchemaProperty('caseID', RealmPropertyType.string, optional: true),
      SchemaProperty('note', RealmPropertyType.string,
          optional: true, indexType: RealmIndexType.fullText),
      SchemaProperty('createdAt', RealmPropertyType.int,
          indexType: RealmIndexType.regular),
      SchemaProperty('initialTimestamp', RealmPropertyType.int),
      SchemaProperty('removed', RealmPropertyType.int),
      SchemaProperty('timestamp', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
