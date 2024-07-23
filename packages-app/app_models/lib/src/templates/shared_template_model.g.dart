// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SharedTemplateModel _$SharedTemplateModelFromJson(Map<String, dynamic> json) =>
    _SharedTemplateModel()
      ..templateID = json['templateID'] as String
      ..speciality = json['speciality'] as String
      ..userID = json['userID'] as String?
      ..title = json['title'] as String?
      ..desc = json['desc'] as String?
      ..type = json['type'] as String?
      ..fields = (json['fields'] as List<dynamic>)
          .map((e) => $TemplateFieldModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..shared = json['shared'] as bool
      ..displayName = json['displayName'] as String?
      ..useCount = (json['useCount'] as num).toInt()
      ..createdAt = (json['createdAt'] as num?)?.toInt()
      ..timestamp = (json['timestamp'] as num?)?.toInt()
      ..removed = (json['removed'] as num?)?.toInt();

Map<String, dynamic> _$SharedTemplateModelToJson(
        _SharedTemplateModel instance) =>
    <String, dynamic>{
      'templateID': instance.templateID,
      'speciality': instance.speciality,
      'userID': instance.userID,
      'title': instance.title,
      'desc': instance.desc,
      'type': instance.type,
      'fields': instance.fields.map((e) => e.toJson()).toList(),
      'shared': instance.shared,
      'displayName': instance.displayName,
      'useCount': instance.useCount,
      'createdAt': instance.createdAt,
      'timestamp': instance.timestamp,
      'removed': instance.removed,
    };
