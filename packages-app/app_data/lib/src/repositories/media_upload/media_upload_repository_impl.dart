import 'dart:async';
import 'dart:io' show File;

import 'package:app_annotations/app_annotations.dart';
import 'package:app_models/app_models.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../app_data.dart';

part './model/upload_model.dart';
part './model/upload_task_model.dart';
part 'media_upload_repository.dart';

class MediaUploadRepositoryImpl extends MediaUploadRepository {
  MediaUploadRepositoryImpl({
    required DatabaseService databaseService,
    required BaseCacheManager cacheManager,
  })  : _databaseService = databaseService,
        _cacheManager = cacheManager;

  final DatabaseService _databaseService;
  final BaseCacheManager _cacheManager;

  @override
  Reference getMediumRef(MediaModel mediaModel) {
    return _databaseService.storageCollection.getMediumRef(mediaModel);
  }

  @override
  Reference getOriginalRef(MediaModel mediaModel) {
    /// important to keep --in front of original to show them
    /// first in firebase storage folders list
    return _databaseService.storageCollection.getOriginalRef(mediaModel);
  }

  @override
  Reference getThumbRef(MediaModel mediaModel) {
    return _databaseService.storageCollection.getThumbRef(mediaModel);
  }

  @override
  Future<MediaModel> resizeAndCompressPhoto(MediaModel mediaModel) async {
    final tempDir = await getTemporaryDirectory();
    final tempPath = tempDir.path;

    // ignore: lines_longer_than_80_chars
    final kThumbSize = ImageSize.thumb.pixels;

    if (mediaModel.fileUri == null) throw Exception('File not found');

    if (mediaModel.fileUri?.isEmpty ?? true) {
      throw Exception('File not found');
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
      (Object err) => throw Exception('Media compression error'),
    );

    await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPathThumb,
      //quality: 90,
      minHeight: kThumbSize,
      minWidth: kThumbSize,
      keepExif: true,
    ).catchError(
      (Object err) => throw Exception('Media compression error}'),
    );

    //update media model
    return mediaModel
      ..thumbUri = targetPathThumb
      ..mediumUri = targetPathMedium;
  }

  /// create upload tasks for uploading the resided files
  @override
  GroupedUploadTaskModel createUploadTaskModels(
    MediaModel mediaModel, {
    required bool uploadFullSizePhoto,
  }) {
    final mimeType = mimeFromExtension(mediaModel.fileName!.toLowerCase()) ??
        'text/plain; charset=UTF-8';

    final thumbTaskModel = _createUploadTask(
      mediaModel,
      ImageSize.thumb,
      mimeType,
    );
    final mediumTaskModel = _createUploadTask(
      mediaModel,
      ImageSize.medium,
      mimeType,
    );
    UploadTaskModel? originalTaskModel;

    if (uploadFullSizePhoto) {
      originalTaskModel = _createUploadTask(
        mediaModel,
        ImageSize.original,
        mimeType,
      );
    }

    return GroupedUploadTaskModel(
      thumbUploadTaskModel: thumbTaskModel,
      mediumUploadTaskModel: mediumTaskModel,
      originalUploadTaskModel: originalTaskModel,
    );
  }

  /// Upload the file, update the local cache on success and return URI
  @override
  Future<String?> uploadAndGetUri(
    UploadTaskModel? uploadTaskModel,
  ) async {
    if (uploadTaskModel == null) return null;

    try {
      await uploadTaskModel.uploadTask;
      final downloadUrl = await uploadTaskModel.storageRef.getDownloadURL();

      await _cacheManager.putFile(
        downloadUrl,
        uploadTaskModel.file.readAsBytesSync(),
        eTag: ModelUtils.uniqueID,
        maxAge: const Duration(days: 365),
        fileExtension: extension(uploadTaskModel.file.path).substring(1),
      );

      return downloadUrl;
    } catch (err) {
      throw FirebaseException(
        plugin: 'firebase_storage',
        message: err.toString(),
      );
    }
  }

  @override
  Future<void> saveMedia(MediaModel mediaModel) async {
    await _databaseService.mediaCollection.put(mediaModel.mediaID, mediaModel);
  }

  /// ////////////////////////////////////////////////////////////////////
  /// local methods
  /// ////////////////////////////////////////////////////////////////////
  UploadTaskModel _createUploadTask(
    MediaModel mediaModel,
    ImageSize imageSize,
    String mimeType,
  ) {
    late Reference storageRef;
    late File file;

    if (imageSize == ImageSize.thumb && mediaModel.thumbUri != null) {
      storageRef = getThumbRef(mediaModel);
      file = File(mediaModel.thumbUri!);
    } else if (imageSize == ImageSize.medium && mediaModel.mediumUri != null) {
      storageRef = getMediumRef(mediaModel);
      file = File(mediaModel.mediumUri!);
    } else if (mediaModel.fileUri != null) {
      storageRef = getOriginalRef(mediaModel);
      file = File(mediaModel.fileUri!); //will return url of original
    }

    return UploadTaskModel(
      file: file,
      storageRef: storageRef,
      uploadTask:
          storageRef.putFile(file, SettableMetadata(contentType: mimeType)),
    );
  }
}
