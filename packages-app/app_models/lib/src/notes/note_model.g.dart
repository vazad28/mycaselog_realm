// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NoteModel _$NoteModelFromJson(Map<String, dynamic> json) => _NoteModel()
  ..noteID = json['noteID'] as String
  ..authorID = json['authorID'] as String?
  ..title = json['title'] as String?
  ..note = json['note'] as String?
  ..removed = (json['removed'] as num).toInt()
  ..createdAt = (json['createdAt'] as num).toInt()
  ..timestamp = (json['timestamp'] as num).toInt();

Map<String, dynamic> _$NoteModelToJson(_NoteModel instance) =>
    <String, dynamic>{
      'noteID': instance.noteID,
      'authorID': instance.authorID,
      'title': instance.title,
      'note': instance.note,
      'removed': instance.removed,
      'createdAt': instance.createdAt,
      'timestamp': instance.timestamp,
    };
