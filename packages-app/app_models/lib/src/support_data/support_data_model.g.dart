// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupportDataModel _$SupportDataModelFromJson(Map<String, dynamic> json) =>
    _SupportDataModel()
      ..userID = json['userID'] as String?
      ..assistants = (json['assistants'] as List<dynamic>)
          .map((e) => _AssistantModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..activeBasicFields = (json['activeBasicFields'] as List<dynamic>)
          .map((e) => e as String)
          .toList()
      ..anesthesiaBlocks = (json['anesthesiaBlocks'] as List<dynamic>)
          .map((e) => e as String)
          .toList()
      ..surgeryLocations = (json['surgeryLocations'] as List<dynamic>)
          .map((e) => _SurgeryLocationModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..timestamp = (json['timestamp'] as num?)?.toInt()
      ..synced = json['synced'] as bool?;

Map<String, dynamic> _$SupportDataModelToJson(_SupportDataModel instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'assistants': instance.assistants.map((e) => e.toJson()).toList(),
      'activeBasicFields': instance.activeBasicFields,
      'anesthesiaBlocks': instance.anesthesiaBlocks,
      'surgeryLocations':
          instance.surgeryLocations.map((e) => e.toJson()).toList(),
      'timestamp': instance.timestamp,
      'synced': instance.synced,
    };

_AssistantModel _$AssistantModelFromJson(Map<String, dynamic> json) =>
    _AssistantModel()
      ..assistantID = json['assistantID'] as String
      ..name = json['name'] as String?
      ..phone = json['phone'] as String?
      ..photoUrl = json['photoUrl'] as String?
      ..removed = (json['removed'] as num?)?.toInt()
      ..createdAt = (json['createdAt'] as num?)?.toInt()
      ..timestamp = (json['timestamp'] as num?)?.toInt();

Map<String, dynamic> _$AssistantModelToJson(_AssistantModel instance) =>
    <String, dynamic>{
      'assistantID': instance.assistantID,
      'name': instance.name,
      'phone': instance.phone,
      'photoUrl': instance.photoUrl,
      'removed': instance.removed,
      'createdAt': instance.createdAt,
      'timestamp': instance.timestamp,
    };

_SurgeryLocationModel _$SurgeryLocationModelFromJson(
        Map<String, dynamic> json) =>
    _SurgeryLocationModel()
      ..locationID = json['locationID'] as String
      ..name = json['name'] as String?
      ..phone = json['phone'] as String?
      ..address = json['address'] as String?
      ..removed = (json['removed'] as num?)?.toInt()
      ..createdAt = (json['createdAt'] as num?)?.toInt()
      ..timestamp = (json['timestamp'] as num?)?.toInt();

Map<String, dynamic> _$SurgeryLocationModelToJson(
        _SurgeryLocationModel instance) =>
    <String, dynamic>{
      'locationID': instance.locationID,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'removed': instance.removed,
      'createdAt': instance.createdAt,
      'timestamp': instance.timestamp,
    };
