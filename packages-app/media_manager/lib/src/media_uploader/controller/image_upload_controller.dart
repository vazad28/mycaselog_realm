import 'dart:async';
import 'dart:io';

import 'package:app_annotations/app_annotations.dart';
import 'package:app_data/app_data.dart';
import 'package:app_models/app_models.dart';
import 'package:async/async.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:logger_client/logger_client.dart';
import 'package:path_provider/path_provider.dart';

import 'upload_controller.dart';

part './image_uploader_mixin.dart';

class ImageUploadController extends UploadController
    with ChangeNotifier, LoggerMixin, ImageUploaderMixin {
  ImageUploadController({
    required MediaModel mediaModel,
    required MediaUploadRepository mediaUploadRepository,
    this.uploadFullSizePhoto = false,
  })  : _mediaModel = mediaModel,
        _mediaUploadRepository = mediaUploadRepository,
        _uploadModel = UploadModel(
          mediaID: mediaModel.mediaID,
          progress: 0,
          uploadStatus: UploadStatus.init,
        ) {
    startUpload();
  }

  final MediaUploadRepository _mediaUploadRepository;
  final bool uploadFullSizePhoto;

  UploadModel _uploadModel;
  MediaModel _mediaModel;

  @override
  UploadModel get uploadModel => _uploadModel;

  @override
  MediaModel get mediaModel => _mediaModel;

  @override
  void removeMedia() {
    // TODO: implement removeMedia
  }

  @override
  void retryUpload() {
    // TODO: implement retryUpload
  }

  @override
  void startUpload() {
    if (_mediaModel.status == MediaStatus.queued) {
      _doUpload();
    }
  }

  @override
  void stopUpload() {
    // TODO: implement stopUpload
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Local Methods
  /// ////////////////////////////////////////////////////////////////////
  Future<void> _doUpload() async {
    try {
      _uploadModel = _uploadModel.copyWith(
        uploadStatus: UploadStatus.processing,
      );
      notifyListeners();

      ///  prepare image for upload
      /// Media model Thumb and medium file path point to resized files
      /// in the local app directory
      _mediaModel = await resizeAndCompressPhoto(_mediaModel);
      debugPrint('resizeAndCompressPhoto success');

      /// update status to uploading
      _uploadModel =
          _uploadModel.copyWith(uploadStatus: UploadStatus.uploading);
      notifyListeners();

      /// crate upload task models as group
      final groupedUploadTaskModels =
          _mediaUploadRepository.createUploadTaskModels(
        _mediaModel,
        uploadFullSizePhoto: uploadFullSizePhoto,
      );

      /// task Models to tasks
      final groupedUploadTasks = createGroupedTasks(groupedUploadTaskModels);
      debugPrint('groupedUploadTasks success');

      ///  run the upload and stream business
      await _uploadGroupedTask(groupedUploadTasks, groupedUploadTaskModels);
      debugPrint('_uploadGroupedTask success');

      /// delete original size file
      await groupedUploadTaskModels.originalUploadTaskModel?.file.delete();
      debugPrint('originalUploadTaskModel delete success');

      // Wait a few milliseconds to simulate a final delay.
      await Future<void>.delayed(const Duration(milliseconds: 100));

      // on success
      await _onUploadSuccess();
      // } on ImageUploadException {
      //   rethrow;
    } catch (err) {
      logger.severe(err.toString());
    }
  }

  Future<void> _uploadGroupedTask(
    List<UploadTask> groupedUploadTasks,
    GroupedUploadTaskModel groupedUploadTaskModels,
  ) async {
    StreamSubscription<TaskSnapshot>? sub;
    try {
      /// Task models to stream of upload task
      // ignore: omit_local_variable_types
      final Stream<TaskSnapshot> groupedUploadTaskStream = StreamGroup.merge(
        groupedUploadTasks.map((e) => e.snapshotEvents).toList(),
      );

      /// starrt processing the upload stream
      var totalUpload = 0.0;

      sub = groupedUploadTaskStream.listen(
        (snapshot) {
          final progress = snapshot.bytesTransferred / snapshot.totalBytes;

          /// sometimes the progress is NaN as the total byte may be 0
          if (!progress.isNaN) totalUpload += progress;

          //print('progress $progress - totalProgress $totalUpload');

          final progressClamped = totalUpload / groupedUploadTasks.length;
          //print('progressClamped $progressClamped');
          _onUploadProgress(progressClamped.clamp(0.0, 0.95));
        },
        onError: (Object? err) {
          _onUploadFailure(err.toString());
          return;
        },
        cancelOnError: true,
      );

      /// call the upload
      final thumbUri = await _mediaUploadRepository
          .uploadAndGetUri(groupedUploadTaskModels.thumbUploadTaskModel);
      final mediumUri = await _mediaUploadRepository
          .uploadAndGetUri(groupedUploadTaskModels.mediumUploadTaskModel);
      final originalUri = await _mediaUploadRepository
          .uploadAndGetUri(groupedUploadTaskModels.originalUploadTaskModel);

      /// on upload success, update the model and save it
      _mediaModel = _mediaModel
        ..thumbUri = thumbUri
        ..mediumUri = mediumUri
        ..fileUri = originalUri;
    } on FirebaseException catch (err) {
      await _onUploadFailure(err.message ?? err.code);
    } catch (err) {
      await _onUploadFailure(err.toString());
    } finally {
      await sub?.cancel();
    }
  }

  void _onUploadProgress(double progressClamped) {
    _uploadModel = _uploadModel.copyWith(
      progress: progressClamped,
      uploadStatus: UploadStatus.uploading,
    );
    notifyListeners();
  }

  /// on succes upload
  Future<void> _onUploadSuccess() async {
    await _saveMedia(MediaStatus.success);
    // MediaManager.imageUploadControllersList
    //     .removeController(_mediaModel.mediaID);
  }

  Future<void> _onUploadFailure(String? failureMessage) async {
    logger.severe(failureMessage);
    await _saveMedia(MediaStatus.failed);
  }

  Future<void> _saveMedia(MediaStatus status) async {
    try {
      await _mediaUploadRepository.saveMedia(
        _mediaModel
          ..status = status
          ..removed = status == MediaStatus.removed ? 1 : 0
          ..timestamp = ModelUtils.getTimestamp,
      );
      _uploadModel = _uploadModel.copyWith(uploadStatus: UploadStatus.success);
      logger.fine('Media saved with status $status');
      notifyListeners();
    } catch (err) {
      _uploadModel =
          _uploadModel.copyWith(uploadStatus: UploadStatus.failed, progress: 0);
      logger.severe(err.toString());
      notifyListeners();
    }
  }
}
