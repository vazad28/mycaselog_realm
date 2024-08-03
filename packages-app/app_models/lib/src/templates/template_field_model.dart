import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';
import 'package:recase/recase.dart';

import '../model_utils.dart';

part 'template_field_model.realm.dart';
part 'template_field_model.g.dart';

enum FieldDataType { string, int, bool }

enum FieldType {
  text('Single line Text'),
  number('Numerical data'),
  bool('True or False'),
  radio('Single Select'),
  select('Multi select');

  const FieldType(this.description);
  final String description;

  // ignore: unnecessary_this
  String get title => '$description (${this.name})';
}

enum TemplateFieldModelProps {
  idx,
  fieldID,
  title,
  slug,
  fieldType,
  fieldDataType,
  isRequired,
  options,
  defaultValue,
  value,
  inputMask,
  suffixText
}

///TemplateFieldModel entity

@RealmModel()
@JsonSerializable(explicitToJson: true)
// ignore: unused_element
class $TemplateFieldModel {
  late String fieldID;
  late String? title;
  late int idx = 0;
  late bool isRequired = false;
  late List<String> options = [];
  late String? defaultValue;
  late String? value;
  late String? inputMask;
  late String? suffixText;

  @Ignored()
  String get slug {
    return title?.snakeCase ?? 'slug${ModelUtils.uniqueID}';
  }

  /// FieldType
  @MapTo('fieldType')
  late String? _fieldType;

  @Ignored()
  FieldType get fieldType {
    return FieldType.values.byName(_fieldType ?? FieldType.text.name);
  }

  @Ignored()
  set fieldType(FieldType value) => _fieldType = value.name;

  /// FieldType
  @MapTo('fieldDataType')
  late String? _fieldDataType;

  @Ignored()
  FieldDataType get fieldDataType {
    return FieldDataType.values
        .byName(_fieldDataType ?? FieldDataType.string.name);
  }

  @Ignored()
  set fieldDataType(FieldDataType value) => _fieldDataType = value.name;

  TemplateFieldModel toUnmanaged() {
    return TemplateFieldModel(
      fieldID,
      title: title,
      idx: idx,
      isRequired: isRequired,
      fieldType: _fieldType,
      fieldDataType: _fieldDataType ??= (fieldType == FieldType.bool)
          ? FieldDataType.bool.name
          : fieldType == FieldType.number
              ? FieldDataType.int.name
              : FieldDataType.string.name,
      options: options,
      defaultValue: defaultValue,
      value: value,
      inputMask: inputMask,
      suffixText: suffixText,
    );
  }

  static TemplateFieldModel fromJson(Map<String, dynamic> json) {
    json['options'] ??= <String>[];
    json['fieldDataType'] ??= (json['fieldType'] == FieldType.bool.name)
        ? FieldDataType.bool.name
        : json['fieldType'] == FieldType.number.name
            ? FieldDataType.int.name
            : FieldDataType.string.name;

    return TemplateFieldModelX.fromJson(json);
  }

  Map<String, dynamic> toJson() => _$$TemplateFieldModelToJson(this);
}

extension TemplateFieldModelX on TemplateFieldModel {
  static TemplateFieldModel zero() {
    final templateFieldModel =
        TemplateFieldModel(ModelUtils.uniqueID, options: <String>[]);

    return templateFieldModel;
  }

  static TemplateFieldModel fromJson(Map<String, dynamic> json) {
    json['options'] ??= <String>[];
    return _$$TemplateFieldModelFromJson(json).toUnmanaged();
  }

  //Map<String, dynamic> toJson() => _$$TemplateFieldModelToJson(this);
}
