// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class NoteModel extends _NoteModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  NoteModel(
    String noteID, {
    String? authorID,
    String? title,
    String? note,
    int removed = 0,
    int createdAt = 0,
    int timestamp = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<NoteModel>({
        'removed': 0,
        'createdAt': 0,
        'timestamp': 0,
      });
    }
    RealmObjectBase.set(this, 'noteID', noteID);
    RealmObjectBase.set(this, 'authorID', authorID);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'note', note);
    RealmObjectBase.set(this, 'removed', removed);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'timestamp', timestamp);
  }

  NoteModel._();

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
  String? get title => RealmObjectBase.get<String>(this, 'title') as String?;
  @override
  set title(String? value) => RealmObjectBase.set(this, 'title', value);

  @override
  String? get note => RealmObjectBase.get<String>(this, 'note') as String?;
  @override
  set note(String? value) => RealmObjectBase.set(this, 'note', value);

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
  Stream<RealmObjectChanges<NoteModel>> get changes =>
      RealmObjectBase.getChanges<NoteModel>(this);

  @override
  Stream<RealmObjectChanges<NoteModel>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<NoteModel>(this, keyPaths);

  @override
  NoteModel freeze() => RealmObjectBase.freezeObject<NoteModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'noteID': noteID.toEJson(),
      'authorID': authorID.toEJson(),
      'title': title.toEJson(),
      'note': note.toEJson(),
      'removed': removed.toEJson(),
      'createdAt': createdAt.toEJson(),
      'timestamp': timestamp.toEJson(),
    };
  }

  static EJsonValue _toEJson(NoteModel value) => value.toEJson();
  static NoteModel _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'noteID': EJsonValue noteID,
        'authorID': EJsonValue authorID,
        'title': EJsonValue title,
        'note': EJsonValue note,
        'removed': EJsonValue removed,
        'createdAt': EJsonValue createdAt,
        'timestamp': EJsonValue timestamp,
      } =>
        NoteModel(
          fromEJson(noteID),
          authorID: fromEJson(authorID),
          title: fromEJson(title),
          note: fromEJson(note),
          removed: fromEJson(removed),
          createdAt: fromEJson(createdAt),
          timestamp: fromEJson(timestamp),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(NoteModel._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, NoteModel, 'NoteModel', [
      SchemaProperty('noteID', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('authorID', RealmPropertyType.string, optional: true),
      SchemaProperty('title', RealmPropertyType.string, optional: true),
      SchemaProperty('note', RealmPropertyType.string, optional: true),
      SchemaProperty('removed', RealmPropertyType.int),
      SchemaProperty('createdAt', RealmPropertyType.int),
      SchemaProperty('timestamp', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
