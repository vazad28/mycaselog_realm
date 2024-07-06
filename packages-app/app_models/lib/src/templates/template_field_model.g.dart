// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_field_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

$TemplateFieldModel _$$TemplateFieldModelFromJson(Map<String, dynamic> json) =>
    $TemplateFieldModel()
      ..fieldID = json['fieldID'] as String
      ..title = json['title'] as String?
      ..idx = (json['idx'] as num).toInt()
      ..isRequired = json['isRequired'] as bool
      ..options =
          (json['options'] as List<dynamic>).map((e) => e as String).toList()
      ..defaultValue = json['defaultValue'] as String?
      ..value = json['value'] as String?
      ..inputMask = json['inputMask'] as String?
      ..suffixText = json['suffixText'] as String?
      ..fieldType = $enumDecode(_$FieldTypeEnumMap, json['fieldType'])
      ..fieldDataType =
          $enumDecode(_$FieldDataTypeEnumMap, json['fieldDataType']);

Map<String, dynamic> _$$TemplateFieldModelToJson(
        $TemplateFieldModel instance) =>
    <String, dynamic>{
      'fieldID': instance.fieldID,
      'title': instance.title,
      'idx': instance.idx,
      'isRequired': instance.isRequired,
      'options': instance.options,
      'defaultValue': instance.defaultValue,
      'value': instance.value,
      'inputMask': instance.inputMask,
      'suffixText': instance.suffixText,
      'fieldType': _$FieldTypeEnumMap[instance.fieldType]!,
      'fieldDataType': _$FieldDataTypeEnumMap[instance.fieldDataType]!,
    };

const _$FieldTypeEnumMap = {
  FieldType.text: 'text',
  FieldType.number: 'number',
  FieldType.bool: 'bool',
  FieldType.radio: 'radio',
  FieldType.select: 'select',
};

const _$FieldDataTypeEnumMap = {
  FieldDataType.string: 'string',
  FieldDataType.int: 'int',
  FieldDataType.bool: 'bool',
};
