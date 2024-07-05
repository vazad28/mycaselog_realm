// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TemplateModel _$TemplateModelFromJson(Map<String, dynamic> json) =>
    _TemplateModel()
      ..templateID = json['templateID'] as String?
      ..speciality = json['speciality'] as String?
      ..title = json['title'] as String?
      ..desc = json['desc'] as String?
      ..type = json['type'] as String?
      ..fields = (json['fields'] as List<dynamic>)
          .map((e) => $TemplateFieldModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..shared = json['shared'] as bool?
      ..createdAt = (json['createdAt'] as num?)?.toInt()
      ..timestamp = (json['timestamp'] as num?)?.toInt()
      ..removed = (json['removed'] as num?)?.toInt();

Map<String, dynamic> _$TemplateModelToJson(_TemplateModel instance) =>
    <String, dynamic>{
      'templateID': instance.templateID,
      'speciality': instance.speciality,
      'title': instance.title,
      'desc': instance.desc,
      'type': instance.type,
      'fields': instance.fields.map((e) => e.toJson()).toList(),
      'shared': instance.shared,
      'createdAt': instance.createdAt,
      'timestamp': instance.timestamp,
      'removed': instance.removed,
    };
