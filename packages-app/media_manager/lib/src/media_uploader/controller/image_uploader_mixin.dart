// import 'dart:io';

// import 'package:app_annotations/app_annotations.dart';
// import 'package:app_data/app_data.dart';
// import 'package:app_models/app_models.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:path_provider/path_provider.dart';

part of './image_upload_controller.dart';

/// Mixin  class for helping with image upload
mixin ImageUploaderMixin {
  /// prepare media files
  Future<MediaModel> resizeAndCompressPhoto(MediaModel mediaModel) async {
    final tempDir = await getTemporaryDirectory();
    final tempPath = tempDir.path;

    // ignore: lines_longer_than_80_chars
    final kThumbSize = ImageSize.thumb.pixels;

    if (mediaModel.fileUri == null) {
      throw const ImageUploadException.fileNotFound();
    }

    if (mediaModel.fileUri?.isEmpty ?? true) {
      throw const ImageUploadException.fileNotFound();
    }
    final file = File(mediaModel.fileUri!);

    final targetPathThumb = '$tempPath/thumb_${mediaModel.fileName}';

    final targetPathMedium = '$tempPath/medium_${mediaModel.fileName}';

    await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPathMedium,
      // minHeight: kMediumSize,
      // minWidth: kMediumSize,
      keepExif: true,
    ).catchError(
      (Object err) => throw const ImageUploadException.compressionFailure(),
    );

    await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPathThumb,
      //quality: 90,
      minHeight: kThumbSize,
      minWidth: kThumbSize,
      keepExif: true,
    ).catchError(
      (Object err) => throw const ImageUploadException.compressionFailure(),
    );

    //update media model
    return mediaModel
      ..thumbUri = targetPathThumb
      ..mediumUri = targetPathMedium;
  }

  /// Use the grouped task models and create a list of upload task
  List<UploadTask> createGroupedTasks(
    GroupedUploadTaskModel groupedUploadTaskModels,
  ) {
    final groupedUploadTasks = [
      groupedUploadTaskModels.thumbUploadTaskModel.uploadTask,
      groupedUploadTaskModels.mediumUploadTaskModel.uploadTask,
    ];

    if (groupedUploadTaskModels.originalUploadTaskModel != null) {
      groupedUploadTasks
          .add(groupedUploadTaskModels.originalUploadTaskModel!.uploadTask);
    }
    return groupedUploadTasks;
  }
}
