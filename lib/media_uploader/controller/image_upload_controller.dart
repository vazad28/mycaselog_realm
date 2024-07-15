import 'dart:async';

import 'package:app_models/app_models.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger_client/logger_client.dart';
import 'package:media_manager/media_manager.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/providers/providers.dart';
import '../media_uploader.dart';
import 'upload_controller.dart';

class ImageUploadController extends UploadController
    with ChangeNotifier, LoggerMixin {
  ImageUploadController(Ref ref,
      {required this.mediaModel, this.uploadFullSize = false})
      : _ref = ref,
        _meddiaStatus = mediaModel.status {
    if (mediaModel.status == MediaStatus.queued) startUpload();
  }

  final MediaModel mediaModel;
  final bool uploadFullSize;
  final Ref _ref;

  double _uploadProgress = 0;
  double get uploadProgress => _uploadProgress;

  MediaStatus _meddiaStatus;
  MediaStatus get mediaStatus => _meddiaStatus;

  final _cacheManager = AppCacheManager.instance;

  @override
  Future<void> startUpload() async {
    try {
      // _meddiaStatus = MediaStatus.uploading;
      // _uploadProgress = 0.6;
      // notifyListeners();
      // return;

      if (mediaModel.fileUri == null || mediaModel.fileName == null) {
        throw Exception('File not found');
      }

      if (mediaModel.fileUri?.isEmpty ?? true) {
        throw Exception('File not found');
      }

      final imageFile = XFile(mediaModel.fileUri!);

      _meddiaStatus = MediaStatus.uploading;
      notifyListeners();

      final thumbnailFile = await _resizeImage(
          imageFile, mediaModel.fileName!, ResizeType.thumbnail);
      if (thumbnailFile == null) throw Exception('Thumb not found');

      final mediumFile = await _resizeImage(
          imageFile, mediaModel.fileName!, ResizeType.medium);
      if (mediumFile == null) throw Exception('Medium not found');

      /// refs
      final thumbnailRef =
          _ref.read(dbProvider).storageCollection.getThumbRef(mediaModel);
      final thumbFileData = await thumbnailFile.readAsBytes();
      final thumbnailTask = thumbnailRef.putData(thumbFileData);

      final mediumRef =
          _ref.read(dbProvider).storageCollection.getMediumRef(mediaModel);
      final mediumFileData = await mediumFile.readAsBytes();
      final mediumTask = mediumRef.putData(mediumFileData);

      final uploadTasks = <UploadTask>[thumbnailTask, mediumTask];

      if (uploadFullSize) {
        final originalRef =
            _ref.read(dbProvider).storageCollection.getOriginalRef(mediaModel);
        final originalTask = originalRef.putData(await imageFile.readAsBytes());
        uploadTasks.add(originalTask);
      }

      _meddiaStatus = MediaStatus.uploading;
      notifyListeners();

      // Track combined upload progress for all tasks
      StreamSubscription<TaskSnapshot>? sub;

      sub = Stream<TaskSnapshot>.multi((subs) {
        for (final task in uploadTasks) {
          subs.add(task.snapshot);
        }
      }).listen(
        (event) {
          final progress = event.bytesTransferred / event.totalBytes;
          _uploadProgress = (uploadTasks.length * progress) /
              uploadTasks.length; // Combine progress
          notifyListeners();
        },
        onError: (err) {
          sub?.cancel();
          uploadTasks.clear();
        },
        onDone: () {
          sub?.cancel();
          uploadTasks.clear();
        },
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
      _onError(MediaStatus.failed, err.message ?? err.code);
    } catch (err) {
      _onError(MediaStatus.failed, err.toString());
    } finally {
      _ref.read(imageUploadControllerList).removeController(mediaModel.mediaID);
    }
  }

  @override
  void removeMedia() {
    // TODO: implement removeMedia
  }

  @override
  void retryUpload() {
    // TODO: implement retryUpload
  }

  @override
  void stopUpload() {
    // TODO: implement stopUpload
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
      maxAge: const Duration(days: 365),
      fileExtension: fileExt,
    );
  }

  Future<XFile?> _resizeImage(
      XFile imageFile, String fileName, ResizeType type) async {
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

  void _onError(MediaStatus status, String? message) {
    final updatedMediaModel =
        _ref.read(dbProvider).updateRealmObject<MediaModel>(() {
      return mediaModel..status = status;
    });

    _ref.read(dbProvider).casesCollection.putMedia(updatedMediaModel);
    _meddiaStatus = status;
    notifyListeners();
  }

  void _onSuccess(String thumbUri, String mediumUri, String? fullUri) {
    ///  update the database
    final updatedMediaModel =
        _ref.read(dbProvider).updateRealmObject<MediaModel>(() {
      return mediaModel
        ..fileUri = fullUri
        ..mediumUri = mediumUri
        ..thumbUri = thumbUri
        ..status = MediaStatus.success;
    });

    _ref.read(dbProvider).casesCollection.putMedia(updatedMediaModel);
    _meddiaStatus = MediaStatus.success;
    notifyListeners();
  }
}

enum ResizeType { thumbnail, medium }
