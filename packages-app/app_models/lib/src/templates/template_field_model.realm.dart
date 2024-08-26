// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_field_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class TemplateFieldModel extends $TemplateFieldModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  TemplateFieldModel(
    String fieldID, {
    String? title,
    int idx = 0,
    bool isRequired = false,
    Iterable<String> options = const [],
    String? defaultValue,
    String? value,
    String? inputMask,
    String? suffixText,
    String? fieldType,
    String? fieldDataType,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<TemplateFieldModel>({
        'idx': 0,
        'isRequired': false,
      });
    }
    RealmObjectBase.set(this, 'fieldID', fieldID);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'idx', idx);
    RealmObjectBase.set(this, 'isRequired', isRequired);
    RealmObjectBase.set<RealmList<String>>(
        this, 'options', RealmList<String>(options));
    RealmObjectBase.set(this, 'defaultValue', defaultValue);
    RealmObjectBase.set(this, 'value', value);
    RealmObjectBase.set(this, 'inputMask', inputMask);
    RealmObjectBase.set(this, 'suffixText', suffixText);
    RealmObjectBase.set(this, 'fieldType', fieldType);
    RealmObjectBase.set(this, 'fieldDataType', fieldDataType);
  }

  TemplateFieldModel._();

  @override
  String get fieldID => RealmObjectBase.get<String>(this, 'fieldID') as String;
  @override
  set fieldID(String value) => RealmObjectBase.set(this, 'fieldID', value);

  @override
  String? get title => RealmObjectBase.get<String>(this, 'title') as String?;
  @override
  set title(String? value) => RealmObjectBase.set(this, 'title', value);

  @override
  int get idx => RealmObjectBase.get<int>(this, 'idx') as int;
  @override
  set idx(int value) => RealmObjectBase.set(this, 'idx', value);

  @override
  bool get isRequired => RealmObjectBase.get<bool>(this, 'isRequired') as bool;
  @override
  set isRequired(bool value) => RealmObjectBase.set(this, 'isRequired', value);

  @override
  RealmList<String> get options =>
      RealmObjectBase.get<String>(this, 'options') as RealmList<String>;
  @override
  set options(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  String? get defaultValue =>
      RealmObjectBase.get<String>(this, 'defaultValue') as String?;
  @override
  set defaultValue(String? value) =>
      RealmObjectBase.set(this, 'defaultValue', value);

  @override
  String? get value => RealmObjectBase.get<String>(this, 'value') as String?;
  @override
  set value(String? value) => RealmObjectBase.set(this, 'value', value);

  @override
  String? get inputMask =>
      RealmObjectBase.get<String>(this, 'inputMask') as String?;
  @override
  set inputMask(String? value) => RealmObjectBase.set(this, 'inputMask', value);

  @override
  String? get suffixText =>
      RealmObjectBase.get<String>(this, 'suffixText') as String?;
  @override
  set suffixText(String? value) =>
      RealmObjectBase.set(this, 'suffixText', value);

  @override
  String? get _fieldType =>
      RealmObjectBase.get<String>(this, 'fieldType') as String?;
  @override
  set _fieldType(String? value) =>
      RealmObjectBase.set(this, 'fieldType', value);

  @override
  String? get _fieldDataType =>
      RealmObjectBase.get<String>(this, 'fieldDataType') as String?;
  @override
  set _fieldDataType(String? value) =>
      RealmObjectBase.set(this, 'fieldDataType', value);

  @override
  Stream<RealmObjectChanges<TemplateFieldModel>> get changes =>
      RealmObjectBase.getChanges<TemplateFieldModel>(this);

  @override
  Stream<RealmObjectChanges<TemplateFieldModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<TemplateFieldModel>(this, keyPaths);

  @override
  TemplateFieldModel freeze() =>
      RealmObjectBase.freezeObject<TemplateFieldModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'fieldID': fieldID.toEJson(),
      'title': title.toEJson(),
      'idx': idx.toEJson(),
      'isRequired': isRequired.toEJson(),
      'options': options.toEJson(),
      'defaultValue': defaultValue.toEJson(),
      'value': value.toEJson(),
      'inputMask': inputMask.toEJson(),
      'suffixText': suffixText.toEJson(),
      'fieldType': _fieldType.toEJson(),
      'fieldDataType': _fieldDataType.toEJson(),
    };
  }

  static EJsonValue _toEJson(TemplateFieldModel value) => value.toEJson();
  static TemplateFieldModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'fieldID': EJsonValue fieldID,
      } =>
        TemplateFieldModel(
          fromEJson(fieldID),
          title: fromEJson(ejson['title']),
          idx: fromEJson(ejson['idx'], defaultValue: 0),
          isRequired: fromEJson(ejson['isRequired'], defaultValue: false),
          options: fromEJson(ejson['options'], defaultValue: const []),
          defaultValue: fromEJson(ejson['defaultValue']),
          value: fromEJson(ejson['value']),
          inputMask: fromEJson(ejson['inputMask']),
          suffixText: fromEJson(ejson['suffixText']),
          fieldType: fromEJson(ejson['fieldType']),
          fieldDataType: fromEJson(ejson['fieldDataType']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(TemplateFieldModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, TemplateFieldModel, 'TemplateFieldModel', [
      SchemaProperty('fieldID', RealmPropertyType.string),
      SchemaProperty('title', RealmPropertyType.string, optional: true),
      SchemaProperty('idx', RealmPropertyType.int),
      SchemaProperty('isRequired', RealmPropertyType.bool),
      SchemaProperty('options', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('defaultValue', RealmPropertyType.string, optional: true),
      SchemaProperty('value', RealmPropertyType.string, optional: true),
      SchemaProperty('inputMask', RealmPropertyType.string, optional: true),
      SchemaProperty('suffixText', RealmPropertyType.string, optional: true),
      SchemaProperty('_fieldType', RealmPropertyType.string,
          mapTo: 'fieldType', optional: true),
      SchemaProperty('_fieldDataType', RealmPropertyType.string,
          mapTo: 'fieldDataType', optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
