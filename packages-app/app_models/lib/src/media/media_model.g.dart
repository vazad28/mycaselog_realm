// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MediaModel _$MediaModelFromJson(Map<String, dynamic> json) => _MediaModel()
  ..mediaID = json['mediaID'] as String
  ..authorID = json['authorID'] as String
  ..fileType = json['fileType'] as String?
  ..fileName = json['fileName'] as String?
  ..fileUri = json['fileUri'] as String?
  ..mediumUri = json['mediumUri'] as String?
  ..thumbUri = json['thumbUri'] as String?
  ..caseID = json['caseID'] as String?
  ..status = $enumDecode(_$MediaStatusEnumMap, json['status'])
  ..comment = json['comment'] as String?
  ..removed = (json['removed'] as num).toInt()
  ..createdAt = (json['createdAt'] as num).toInt()
  ..timestamp = (json['timestamp'] as num).toInt();

Map<String, dynamic> _$MediaModelToJson(_MediaModel instance) =>
    <String, dynamic>{
      'mediaID': instance.mediaID,
      'authorID': instance.authorID,
      'fileType': instance.fileType,
      'fileName': instance.fileName,
      'fileUri': instance.fileUri,
      'mediumUri': instance.mediumUri,
      'thumbUri': instance.thumbUri,
      'caseID': instance.caseID,
      'status': _$MediaStatusEnumMap[instance.status]!,
      'comment': instance.comment,
      'removed': instance.removed,
      'createdAt': instance.createdAt,
      'timestamp': instance.timestamp,
    };

const _$MediaStatusEnumMap = {
  MediaStatus.cancelled: 'cancelled',
  MediaStatus.failed: 'failed',
  MediaStatus.processing: 'processing',
  MediaStatus.queued: 'queued',
  MediaStatus.removed: 'removed',
  MediaStatus.success: 'success',
  MediaStatus.uploading: 'uploading',
};
