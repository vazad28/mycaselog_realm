import 'dart:async';

import 'package:app_models/app_models.dart';
import 'package:async/async.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:logger_client/logger_client.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../media_manager.dart';

///  enum
enum ResizeType { thumbnail, medium }

/// Image uploader class
class ImageUploadController extends UploadController
    with ChangeNotifier, LoggerMixin {
  ImageUploadController({
    required this.mediaModel,
    required this.mediaUploadRepository,
    required this.onRemoveController,
    this.uploadFullSize = false,
  }) : _mediaStatus = mediaModel.status {
    if (mediaModel.status == MediaStatus.queued) startUpload();
  }
  final MediaUploadRepository mediaUploadRepository;

  final MediaModel mediaModel;
  final bool uploadFullSize;
  final Null Function(String mediaID) onRemoveController;

  double _uploadProgress = 0;
  @override
  double get uploadProgress => _uploadProgress;

  MediaStatus _mediaStatus;
  @override
  MediaStatus get mediaStatus => _mediaStatus;

  final _cacheManager = AppCacheManager.instance;

  @override
  Future<void> startUpload() async {
    StreamSubscription<TaskSnapshot>? sub;
    try {
      _mediaStatus = MediaStatus.processing;
      notifyListeners();

      if (mediaModel.fileUri == null || mediaModel.fileName == null) {
        throw Exception('File not found');
      }

      if (mediaModel.fileUri?.isEmpty ?? true) {
        throw Exception('File not found');
      }

      final imageFile = XFile(mediaModel.fileUri!);

      final thumbnailFile = await _resizeImage(
          imageFile, mediaModel.fileName!, ResizeType.thumbnail,);
      if (thumbnailFile == null) throw Exception('Thumb not found');

      final mediumFile = await _resizeImage(
          imageFile, mediaModel.fileName!, ResizeType.medium,);
      if (mediumFile == null) throw Exception('Medium not found');

      /// refs
      final thumbnailRef = mediaUploadRepository.getThumbRef(mediaModel);
      final thumbFileData = await thumbnailFile.readAsBytes();
      final thumbnailTask = thumbnailRef.putData(thumbFileData);

      final mediumRef = mediaUploadRepository.getMediumRef(mediaModel);
      final mediumFileData = await mediumFile.readAsBytes();
      final mediumTask = mediumRef.putData(mediumFileData);

      final uploadTasks = <UploadTask>[thumbnailTask, mediumTask];

      if (uploadFullSize) {
        final originalRef = mediaUploadRepository.getOriginalRef(mediaModel);
        final originalTask = originalRef.putData(await imageFile.readAsBytes());
        uploadTasks.add(originalTask);
      }

      _mediaStatus = MediaStatus.uploading;
      notifyListeners();

      /// starrt processing the upload stream
      var totalUpload = 0.0;

      final groupedUploadTaskStream = StreamGroup.merge<TaskSnapshot>(
        uploadTasks.map((e) => e.snapshotEvents).toList(),
      );

      sub = groupedUploadTaskStream.listen(
        (snapshot) {
          final progress = snapshot.bytesTransferred / snapshot.totalBytes;

          /// sometimes the progress is NaN as the total byte may be 0
          if (!progress.isNaN) totalUpload += progress;

          //print('progress $progress - totalProgress $totalUpload');

          final progressClamped = totalUpload / uploadTasks.length;
          //print('progressClamped $progressClamped');

          _uploadProgress = progressClamped.clamp(0.0, 0.95);
          _mediaStatus = MediaStatus.uploading;
          notifyListeners();
        },
        onError: (Object? err) {
          uploadTasks.clear();
          throw Exception(err);
        },
        cancelOnError: true,
      );

      await Future.wait(uploadTasks.map((task) => task));

      final downloadUrlThumb = await thumbnailRef.getDownloadURL();
      await _putInCache(
        downloadUrlThumb,
        thumbFileData,
        extension(thumbnailFile.path).substring(1),
      );

      final downloadUrlMedium = await mediumRef.getDownloadURL();
      await _putInCache(
        downloadUrlMedium,
        mediumFileData,
        extension(mediumFile.path).substring(1),
      );

      String? downloadUrlFull;
      if (uploadTasks.length == 3) {
        downloadUrlFull = await mediumRef.getDownloadURL();
      }

      _onSuccess(downloadUrlThumb, downloadUrlMedium, downloadUrlFull);
    } on FirebaseException catch (err) {
      _onFailure(MediaStatus.failed, err.message ?? err.code);
    } catch (err) {
      _onFailure(MediaStatus.failed, err.toString());
    } finally {
      await sub?.cancel();
      logger.fine('startUpload reached  finally');
      _removeUploadController();
    }
  }

  void _removeUploadController() => onRemoveController(mediaModel.mediaID);

  @override
  void retryUpload() {
    _uploadProgress = 0;
    _mediaStatus = MediaStatus.queued;
    startUpload();
  }

  @override
  void cancelUpload() {
    _onFailure(MediaStatus.cancelled, 'User cancelled upload');
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Local methods
  /// ////////////////////////////////////////////////////////////////////
  Future<void> _putInCache(
    String url,
    Uint8List fileData,
    String fileExt,
  ) {
    return _cacheManager.putFile(
      url,
      fileData,
      eTag: ModelUtils.uniqueID,
      maxAge: const Duration(days: 15),
      fileExtension: fileExt,
    );
  }

  Future<XFile?> _resizeImage(
      XFile imageFile, String fileName, ResizeType type,) async {
    final tempDir = await getTemporaryDirectory();
    final tempPath = tempDir.path;
    final targetPath = type == ResizeType.thumbnail
        ? '$tempPath/thumb_$fileName'
        : '$tempPath/medium_$fileName';

    final minHeight = type == ResizeType.thumbnail ? 200 : 1080;
    final quality = type == ResizeType.thumbnail ? 80 : 90;

    final result = await FlutterImageCompress.compressAndGetFile(
      imageFile.path,
      targetPath,
      minHeight: minHeight,
      quality: quality,
    );

    return result;
  }

  void _onFailure(MediaStatus mediaStatus, String? message) {
    mediaUploadRepository.onUploadFailure(mediaModel, mediaStatus);
    _mediaStatus = mediaStatus;
    notifyListeners();
  }

  void _onSuccess(String thumbUri, String mediumUri, String? fullUri) {
    _mediaStatus = MediaStatus.success;
    notifyListeners();
  }
}
