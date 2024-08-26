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
    required this.mediaUploadService,
    required this.onRemoveController,
    this.uploadFullSize = false,
  }) {
    startUpload();
  }
  final MediaUploadService mediaUploadService;

  final MediaModel mediaModel;
  final bool uploadFullSize;
  final Null Function(String mediaID) onRemoveController;

  double _uploadProgress = 0;
  @override
  double get uploadProgress => _uploadProgress;

  UploadStatus _uploadStatus = UploadStatus.queued;
  @override
  UploadStatus get uploadStatus => _uploadStatus;

  final _cacheManager = AppCacheManager.instance;

  @override
  Future<void> startUpload() async {
    if (mediaModel.fileUri == null || mediaModel.fileName == null) {
      _onFailure(UploadStatus.failed, 'File not found');
      return;
    }

    final imageFile = XFile(mediaModel.fileUri!);
    final resizedFiles = await Future.wait([
      _resizeImage(imageFile, ResizeType.thumbnail),
      _resizeImage(imageFile, ResizeType.medium),
    ]);

    if (resizedFiles.any((file) => file == null)) {
      _onFailure(UploadStatus.failed, 'Resize failed');
      return;
    }

    final thumbnailFile = resizedFiles[0]!;
    final mediumFile = resizedFiles[1]!;
    final uploadTasks = [
      mediaUploadService
          .getThumbRef(mediaModel)
          .putData(await thumbnailFile.readAsBytes()),
      mediaUploadService
          .getMediumRef(mediaModel)
          .putData(await mediumFile.readAsBytes()),
    ];

    if (uploadFullSize) {
      uploadTasks.add(
        mediaUploadService
            .getOriginalRef(mediaModel)
            .putData(await imageFile.readAsBytes()),
      );
    }

    _uploadStatus = UploadStatus.uploading;
    notifyListeners();

    final totalUploadSize = await Future.wait([
      thumbnailFile.length(),
      mediumFile.length(),
      if (uploadFullSize) imageFile.length() else Future.value(0),
    ]).then((values) => values.reduce((a, b) => a + b));

    var completedTasks = 0.0;
    StreamSubscription<TaskSnapshot>? sub;
    try {
      sub = StreamGroup.merge<TaskSnapshot>(
        uploadTasks.map((e) => e.snapshotEvents).toList(),
      ).listen(
        (snapshot) {
          completedTasks += snapshot.bytesTransferred;
          _uploadProgress = completedTasks / totalUploadSize;
          _uploadStatus = UploadStatus.uploading;
          notifyListeners();
        },
        onError: (Object? err) {
          _onFailure(UploadStatus.failed, err.toString());
        },
      );

      await Future.wait(uploadTasks);

      final downloadUrls = await Future.wait([
        mediaUploadService.getThumbRef(mediaModel).getDownloadURL(),
        mediaUploadService.getMediumRef(mediaModel).getDownloadURL(),
        if (uploadFullSize)
          mediaUploadService.getOriginalRef(mediaModel).getDownloadURL(),
      ]);

      await Future.wait([
        _putInCache(
          downloadUrls[0],
          await thumbnailFile.readAsBytes(),
          extension(thumbnailFile.path).substring(1),
        ),
        _putInCache(
          downloadUrls[1],
          await mediumFile.readAsBytes(),
          extension(mediumFile.path).substring(1),
        ),
      ]);

      _onSuccess(downloadUrls);
    } on FirebaseException catch (err) {
      _onFailure(UploadStatus.failed, err.message ?? err.code);
    } catch (err) {
      _onFailure(UploadStatus.failed, err.toString());
    } finally {
      await sub?.cancel();
      logger.fine('Upload reached finally');
    }
  }

  void _removeUploadController() => onRemoveController(mediaModel.mediaID);

  @override
  void retryUpload() {
    _uploadProgress = 0;
    _uploadStatus = UploadStatus.queued;
    startUpload();
  }

  @override
  void cancelUpload() {
    _onFailure(UploadStatus.cancelled, 'User cancelled upload');
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Local methods
  /// ////////////////////////////////////////////////////////////////////
  Future<void> _putInCache(
    String? url,
    Uint8List fileData,
    String fileExt,
  ) {
    if (url == null) return Future<void>.sync(() => {});
    return _cacheManager.putFile(
      url,
      fileData,
      eTag: ModelUtils.uniqueID,
      maxAge: const Duration(days: 15),
      fileExtension: fileExt,
    );
  }

  Future<String> _getResizeFilePath(String fileName, ResizeType type) async {
    final tempDir = await getTemporaryDirectory();

    return '${tempDir.path}/${type == ResizeType.thumbnail ? 'thumb_' : 'medium_'}$fileName';
  }

  Future<XFile?> _resizeImage(XFile imageFile, ResizeType type) async {
    final targetPath = await _getResizeFilePath(mediaModel.fileName!, type);

    final minHeight = type == ResizeType.thumbnail ? 200 : 1080;
    final quality = type == ResizeType.thumbnail ? 80 : 90;

    try {
      final result = await FlutterImageCompress.compressAndGetFile(
        imageFile.path,
        targetPath,
        minHeight: minHeight,
        quality: quality,
      );
      return result;
    } catch (err) {
      logger.severe(err);
      return null;
    }
  }

  void _onFailure(UploadStatus uploadStatus, String? message) {
    logger.severe(message);
    mediaUploadService.onUploadFailure(mediaModel, uploadStatus, message);
    _uploadStatus = uploadStatus;
    notifyListeners();
    _removeUploadController();
  }

  void _onSuccess(List<String> downloadUrls) {
    mediaUploadService.onUploadSucces(
      mediaModel,
      thumbUri: downloadUrls[0],
      mediumUri: downloadUrls[1],
      fullUri: downloadUrls.length > 2 ? downloadUrls[2] : null,
    );
    _uploadStatus = UploadStatus.success;
    notifyListeners();
    _removeUploadController();
  }
}
