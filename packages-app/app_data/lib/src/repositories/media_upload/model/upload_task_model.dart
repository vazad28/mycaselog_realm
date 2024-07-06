part of '../media_upload_repository_impl.dart';

/// model class to hold the taskCreated for upload
class UploadTaskModel {
  UploadTaskModel({
    required this.file,
    required this.storageRef,
    required this.uploadTask,
  });

  final File file;
  final Reference storageRef;
  final UploadTask uploadTask;
}

class GroupedUploadTaskModel {
  GroupedUploadTaskModel({
    required this.thumbUploadTaskModel,
    required this.mediumUploadTaskModel,
    this.originalUploadTaskModel,
  });

  final UploadTaskModel thumbUploadTaskModel;
  final UploadTaskModel mediumUploadTaskModel;
  final UploadTaskModel? originalUploadTaskModel;
}
