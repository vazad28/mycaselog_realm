part of 'providers.dart';

/// Riverpod provider to use the dialog service
@Riverpod(keepAlive: true)
ImageUploadService imageUploadService(ImageUploadServiceRef ref) {
  return ImageUploadService(ref);
}

/// provider class
class ImageUploadService with LoggerMixin implements MediaUploadService {
  ImageUploadService(this.ref);

  final ProviderRef<ImageUploadService> ref;

  @override
  bool get uploadFullSizePhoto =>
      ref.read(settingsNotifierProvider).uploadFullSizePhoto;

  @override
  Reference getMediumRef(MediaModel mediaModel) {
    return ref.read(dbProvider).storageCollection.getMediumRef(mediaModel);
  }

  @override
  Reference getOriginalRef(MediaModel mediaModel) {
    return ref.read(dbProvider).storageCollection.getOriginalRef(mediaModel);
  }

  @override
  Reference getThumbRef(MediaModel mediaModel) {
    return ref.read(dbProvider).storageCollection.getThumbRef(mediaModel);
  }

  @override
  void onUploadFailure(
    MediaModel mediaModel,
    UploadStatus uploadStatus,
    String? message,
  ) {
    var mediaStatus = MediaStatus.failed;

    if (uploadStatus == UploadStatus.cancelled) {
      mediaStatus = MediaStatus.cancelled;
    }

    ref
        .read(dbProvider)
        .mediaCollection
        .upsert(() => mediaModel..status = mediaStatus)
        .then((_) {
      ref.watch(dialogServiceProvider).showSnackBar(message);
    });
  }

  @override
  Future<void> onUploadSucces(
    MediaModel mediaModel, {
    String? thumbUri,
    String? mediumUri,
    String? fullUri,
  }) async {
    logger.fine('reached onUploadSucces $thumbUri');

    ///  update the database
    await ref.read(dbProvider).mediaCollection.upsert(
          () => mediaModel
            ..fileUri = fullUri
            ..mediumUri = mediumUri
            ..thumbUri = thumbUri
            ..status = MediaStatus.success
            ..timestamp = ModelUtils.getTimestamp,
        );
  }
}
