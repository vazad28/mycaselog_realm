import 'package:app_models/app_models.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger_client/logger_client.dart';
import 'package:media_manager/media_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../settings/settings.dart';
import 'providers.dart';

/// provider
final imageUploadRepositoryProvider =
    Provider<ImageUploadRepository>(ImageUploadRepository.new);

/// provider class
class ImageUploadRepository with LoggerMixin implements MediaUploadRepository {
  ImageUploadRepository(this.ref);

  final ProviderRef<ImageUploadRepository> ref;

  @override
  bool get uploadFullSizePhoto =>
      ref.read(settingsProvider).uploadFullSizePhoto;

  @override
  Reference getMediumRef(MediaModel mediaModel) {
    return ref
        .read(collectionsProvider)
        .storageCollection
        .getMediumRef(mediaModel);
  }

  @override
  Reference getOriginalRef(MediaModel mediaModel) {
    return ref
        .read(collectionsProvider)
        .storageCollection
        .getOriginalRef(mediaModel);
  }

  @override
  Reference getThumbRef(MediaModel mediaModel) {
    return ref
        .read(collectionsProvider)
        .storageCollection
        .getThumbRef(mediaModel);
  }

  @override
  void onUploadFailure(MediaModel mediaModel, MediaStatus mediaStatus) {
    ref
        .read(collectionsProvider)
        .mediaCollection
        .upsert(mediaModel.mediaID, () => mediaModel..status = mediaStatus);
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
    await ref.read(collectionsProvider).mediaCollection.upsert(
          mediaModel.mediaID,
          () => mediaModel
            ..fileUri = fullUri
            ..mediumUri = mediumUri
            ..thumbUri = thumbUri
            ..status = MediaStatus.success
            ..timestamp = ModelUtils.getTimestamp,
        );
  }
}
