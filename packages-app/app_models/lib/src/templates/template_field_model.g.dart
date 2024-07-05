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
      ..suffixText = json['suffixText'] as String?;

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
    };
