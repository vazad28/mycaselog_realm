// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_template_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class SharedTemplateModel extends _SharedTemplateModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  SharedTemplateModel(
    String templateID, {
    String speciality = 'no_speciality',
    String? userID,
    String? title,
    String? desc,
    String? type = 'surgery',
    Iterable<TemplateFieldModel> fields = const [],
    bool shared = true,
    String? displayName,
    int useCount = 0,
    int? createdAt = 0,
    int? timestamp = 0,
    int? removed = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<SharedTemplateModel>({
        'speciality': 'no_speciality',
        'type': 'surgery',
        'shared': true,
        'useCount': 0,
        'createdAt': 0,
        'timestamp': 0,
        'removed': 0,
      });
    }
    RealmObjectBase.set(this, 'templateID', templateID);
    RealmObjectBase.set(this, 'speciality', speciality);
    RealmObjectBase.set(this, 'userID', userID);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'desc', desc);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set<RealmList<TemplateFieldModel>>(
        this, 'fields', RealmList<TemplateFieldModel>(fields));
    RealmObjectBase.set(this, 'shared', shared);
    RealmObjectBase.set(this, 'displayName', displayName);
    RealmObjectBase.set(this, 'useCount', useCount);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'timestamp', timestamp);
    RealmObjectBase.set(this, 'removed', removed);
  }

  SharedTemplateModel._();

  @override
  String get templateID =>
      RealmObjectBase.get<String>(this, 'templateID') as String;
  @override
  set templateID(String value) =>
      RealmObjectBase.set(this, 'templateID', value);

  @override
  String get speciality =>
      RealmObjectBase.get<String>(this, 'speciality') as String;
  @override
  set speciality(String value) =>
      RealmObjectBase.set(this, 'speciality', value);

  @override
  String? get userID => RealmObjectBase.get<String>(this, 'userID') as String?;
  @override
  set userID(String? value) => RealmObjectBase.set(this, 'userID', value);

  @override
  String? get title => RealmObjectBase.get<String>(this, 'title') as String?;
  @override
  set title(String? value) => RealmObjectBase.set(this, 'title', value);

  @override
  String? get desc => RealmObjectBase.get<String>(this, 'desc') as String?;
  @override
  set desc(String? value) => RealmObjectBase.set(this, 'desc', value);

  @override
  String? get type => RealmObjectBase.get<String>(this, 'type') as String?;
  @override
  set type(String? value) => RealmObjectBase.set(this, 'type', value);

  @override
  RealmList<TemplateFieldModel> get fields =>
      RealmObjectBase.get<TemplateFieldModel>(this, 'fields')
          as RealmList<TemplateFieldModel>;
  @override
  set fields(covariant RealmList<TemplateFieldModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  bool get shared => RealmObjectBase.get<bool>(this, 'shared') as bool;
  @override
  set shared(bool value) => RealmObjectBase.set(this, 'shared', value);

  @override
  String? get displayName =>
      RealmObjectBase.get<String>(this, 'displayName') as String?;
  @override
  set displayName(String? value) =>
      RealmObjectBase.set(this, 'displayName', value);

  @override
  int get useCount => RealmObjectBase.get<int>(this, 'useCount') as int;
  @override
  set useCount(int value) => RealmObjectBase.set(this, 'useCount', value);

  @override
  int? get createdAt => RealmObjectBase.get<int>(this, 'createdAt') as int?;
  @override
  set createdAt(int? value) => RealmObjectBase.set(this, 'createdAt', value);

  @override
  int? get timestamp => RealmObjectBase.get<int>(this, 'timestamp') as int?;
  @override
  set timestamp(int? value) => RealmObjectBase.set(this, 'timestamp', value);

  @override
  int? get removed => RealmObjectBase.get<int>(this, 'removed') as int?;
  @override
  set removed(int? value) => RealmObjectBase.set(this, 'removed', value);

  @override
  Stream<RealmObjectChanges<SharedTemplateModel>> get changes =>
      RealmObjectBase.getChanges<SharedTemplateModel>(this);

  @override
  Stream<RealmObjectChanges<SharedTemplateModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<SharedTemplateModel>(this, keyPaths);

  @override
  SharedTemplateModel freeze() =>
      RealmObjectBase.freezeObject<SharedTemplateModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'templateID': templateID.toEJson(),
      'speciality': speciality.toEJson(),
      'userID': userID.toEJson(),
      'title': title.toEJson(),
      'desc': desc.toEJson(),
      'type': type.toEJson(),
      'fields': fields.toEJson(),
      'shared': shared.toEJson(),
      'displayName': displayName.toEJson(),
      'useCount': useCount.toEJson(),
      'createdAt': createdAt.toEJson(),
      'timestamp': timestamp.toEJson(),
      'removed': removed.toEJson(),
    };
  }

  static EJsonValue _toEJson(SharedTemplateModel value) => value.toEJson();
  static SharedTemplateModel _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'templateID': EJsonValue templateID,
        'speciality': EJsonValue speciality,
        'userID': EJsonValue userID,
        'title': EJsonValue title,
        'desc': EJsonValue desc,
        'type': EJsonValue type,
        'fields': EJsonValue fields,
        'shared': EJsonValue shared,
        'displayName': EJsonValue displayName,
        'useCount': EJsonValue useCount,
        'createdAt': EJsonValue createdAt,
        'timestamp': EJsonValue timestamp,
        'removed': EJsonValue removed,
      } =>
        SharedTemplateModel(
          fromEJson(templateID),
          speciality: fromEJson(speciality),
          userID: fromEJson(userID),
          title: fromEJson(title),
          desc: fromEJson(desc),
          type: fromEJson(type),
          fields: fromEJson(fields),
          shared: fromEJson(shared),
          displayName: fromEJson(displayName),
          useCount: fromEJson(useCount),
          createdAt: fromEJson(createdAt),
          timestamp: fromEJson(timestamp),
          removed: fromEJson(removed),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(SharedTemplateModel._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, SharedTemplateModel, 'SharedTemplateModel', [
      SchemaProperty('templateID', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('speciality', RealmPropertyType.string),
      SchemaProperty('userID', RealmPropertyType.string, optional: true),
      SchemaProperty('title', RealmPropertyType.string, optional: true),
      SchemaProperty('desc', RealmPropertyType.string, optional: true),
      SchemaProperty('type', RealmPropertyType.string, optional: true),
      SchemaProperty('fields', RealmPropertyType.object,
          linkTarget: 'TemplateFieldModel',
          collectionType: RealmCollectionType.list),
      SchemaProperty('shared', RealmPropertyType.bool),
      SchemaProperty('displayName', RealmPropertyType.string, optional: true),
      SchemaProperty('useCount', RealmPropertyType.int),
      SchemaProperty('createdAt', RealmPropertyType.int, optional: true),
      SchemaProperty('timestamp', RealmPropertyType.int, optional: true),
      SchemaProperty('removed', RealmPropertyType.int, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
