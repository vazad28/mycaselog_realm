// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

$TimelineNoteModel _$$TimelineNoteModelFromJson(Map<String, dynamic> json) =>
    $TimelineNoteModel()
      ..noteID = json['noteID'] as String
      ..authorID = json['authorID'] as String
      ..caseID = json['caseID'] as String
      ..note = json['note'] as String?
      ..createdAt = (json['createdAt'] as num).toInt()
      ..timestamp = (json['timestamp'] as num).toInt();

Map<String, dynamic> _$$TimelineNoteModelToJson($TimelineNoteModel instance) =>
    <String, dynamic>{
      'noteID': instance.noteID,
      'authorID': instance.authorID,
      'caseID': instance.caseID,
      'note': instance.note,
      'createdAt': instance.createdAt,
      'timestamp': instance.timestamp,
    };
