part of '../media_upload_repository_impl.dart';

enum UploadStatus {
  init,
  processing,
  uploading,
  stopped,
  cancelled,
  success,
  failed,
}

@immutable
class UploadModel {
  const UploadModel({
    required this.mediaID,
    required this.progress,
    required this.uploadStatus,
  });

  ///String representing unique media ID
  final String mediaID;

  /// A value between 0.0 and 1.0 representing the progress of the download.
  final double progress;

  /// upload status currently
  final UploadStatus uploadStatus;

  UploadModel copyWith({
    String? mediaID,
    double? progress,
    UploadStatus? uploadStatus,
  }) =>
      UploadModel(
        mediaID: mediaID ?? this.mediaID,
        progress: progress ?? this.progress,
        uploadStatus: uploadStatus ?? this.uploadStatus,
      );
}
