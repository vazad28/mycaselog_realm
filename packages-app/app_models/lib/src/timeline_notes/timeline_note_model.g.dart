// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimelineNoteModel _$TimelineNoteModelFromJson(Map<String, dynamic> json) =>
    _TimelineNoteModel()
      ..noteID = json['noteID'] as String
      ..authorID = json['authorID'] as String?
      ..caseID = json['caseID'] as String?
      ..note = json['note'] as String?
      ..createdAt = (json['createdAt'] as num).toInt()
      ..initialTimestamp = (json['initialTimestamp'] as num).toInt()
      ..removed = (json['removed'] as num).toInt()
      ..timestamp = (json['timestamp'] as num).toInt();

Map<String, dynamic> _$TimelineNoteModelToJson(_TimelineNoteModel instance) =>
    <String, dynamic>{
      'noteID': instance.noteID,
      'authorID': instance.authorID,
      'caseID': instance.caseID,
      'note': instance.note,
      'createdAt': instance.createdAt,
      'initialTimestamp': instance.initialTimestamp,
      'removed': instance.removed,
      'timestamp': instance.timestamp,
    };
