// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class TemplateModel extends _TemplateModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  TemplateModel(
    String templateID, {
    String speciality = 'no_speciality',
    String? title,
    String? desc,
    String? type = 'surgery',
    Iterable<TemplateFieldModel> fields = const [],
    bool shared = false,
    int? createdAt = 0,
    int? timestamp = 0,
    int? removed = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<TemplateModel>({
        'speciality': 'no_speciality',
        'type': 'surgery',
        'shared': false,
        'createdAt': 0,
        'timestamp': 0,
        'removed': 0,
      });
    }
    RealmObjectBase.set(this, 'templateID', templateID);
    RealmObjectBase.set(this, 'speciality', speciality);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'desc', desc);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set<RealmList<TemplateFieldModel>>(
        this, 'fields', RealmList<TemplateFieldModel>(fields));
    RealmObjectBase.set(this, 'shared', shared);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'timestamp', timestamp);
    RealmObjectBase.set(this, 'removed', removed);
  }

  TemplateModel._();

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
  Stream<RealmObjectChanges<TemplateModel>> get changes =>
      RealmObjectBase.getChanges<TemplateModel>(this);

  @override
  Stream<RealmObjectChanges<TemplateModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<TemplateModel>(this, keyPaths);

  @override
  TemplateModel freeze() => RealmObjectBase.freezeObject<TemplateModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'templateID': templateID.toEJson(),
      'speciality': speciality.toEJson(),
      'title': title.toEJson(),
      'desc': desc.toEJson(),
      'type': type.toEJson(),
      'fields': fields.toEJson(),
      'shared': shared.toEJson(),
      'createdAt': createdAt.toEJson(),
      'timestamp': timestamp.toEJson(),
      'removed': removed.toEJson(),
    };
  }

  static EJsonValue _toEJson(TemplateModel value) => value.toEJson();
  static TemplateModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'templateID': EJsonValue templateID,
      } =>
        TemplateModel(
          fromEJson(templateID),
          speciality:
              fromEJson(ejson['speciality'], defaultValue: 'no_speciality'),
          title: fromEJson(ejson['title']),
          desc: fromEJson(ejson['desc']),
          type: fromEJson(ejson['type'], defaultValue: 'surgery'),
          fields: fromEJson(ejson['fields'], defaultValue: const []),
          shared: fromEJson(ejson['shared'], defaultValue: false),
          createdAt: fromEJson(ejson['createdAt'], defaultValue: 0),
          timestamp: fromEJson(ejson['timestamp'], defaultValue: 0),
          removed: fromEJson(ejson['removed'], defaultValue: 0),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(TemplateModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, TemplateModel, 'TemplateModel', [
      SchemaProperty('templateID', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('speciality', RealmPropertyType.string),
      SchemaProperty('title', RealmPropertyType.string, optional: true),
      SchemaProperty('desc', RealmPropertyType.string, optional: true),
      SchemaProperty('type', RealmPropertyType.string, optional: true),
      SchemaProperty('fields', RealmPropertyType.object,
          linkTarget: 'TemplateFieldModel',
          collectionType: RealmCollectionType.list),
      SchemaProperty('shared', RealmPropertyType.bool),
      SchemaProperty('createdAt', RealmPropertyType.int, optional: true),
      SchemaProperty('timestamp', RealmPropertyType.int, optional: true),
      SchemaProperty('removed', RealmPropertyType.int, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
