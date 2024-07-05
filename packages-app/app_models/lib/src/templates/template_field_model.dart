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

  /// FieldType
  @MapTo('fieldDataType')
  late String? _fieldDataType;

  @Ignored()
  FieldDataType get fieldDataType {
    return FieldDataType.values
        .byName(_fieldDataType ?? FieldDataType.string.name);
  }

  static TemplateFieldModel fromJson(Map<String, dynamic> json) =>
      TemplateFieldModelX.fromJson(json);

  Map<String, dynamic> toJson() => _$$TemplateFieldModelToJson(this);
}

extension TemplateFieldModelX on TemplateFieldModel {
  static TemplateFieldModel _toRealmObject(
      $TemplateFieldModel templateFieldModel) {
    return TemplateFieldModel(
      templateFieldModel.fieldID,
    );
  }

  static TemplateFieldModel zero(int timestamp) {
    final templateFieldModel = TemplateFieldModel(
      ModelUtils.uniqueID,
    );

    return templateFieldModel;
  }

  static TemplateFieldModel fromJson(Map<String, dynamic> json) =>
      _toRealmObject(_$$TemplateFieldModelFromJson(json));

  Map<String, dynamic> toJson() => _$$TemplateFieldModelToJson(this);
}
