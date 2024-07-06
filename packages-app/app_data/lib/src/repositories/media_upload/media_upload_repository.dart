part of 'media_upload_repository_impl.dart';

abstract class MediaUploadRepository {
  /// prepare media files for upload and
  Future<MediaModel> resizeAndCompressPhoto(MediaModel mediaModel);

  /// create path for original size photo
  Reference getOriginalRef(MediaModel mediaModel);

  /// create path for medium size photo
  Reference getMediumRef(MediaModel mediaModel);

  /// create path for thumbnail size photo
  Reference getThumbRef(MediaModel mediaModel);

  /// Upload media and get uploaded file uri
  Future<String?> uploadAndGetUri(UploadTaskModel? uploadTaskModel);

  GroupedUploadTaskModel createUploadTaskModels(
    MediaModel mediaModel, {
    required bool uploadFullSizePhoto,
  });

  /// save media on server
  Future<void> saveMedia(MediaModel mediaModel);
}
