import 'package:app_models/app_models.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:media_manager/media_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../settings/settings.dart';
import 'providers.dart';

/// provider
final imageUploadRepositoryProvider =
    Provider<ImageUploadRepository>(ImageUploadRepository.new);

/// provider class
class ImageUploadRepository implements MediaUploadRepository {
  ImageUploadRepository(this.ref);

  final ProviderRef<ImageUploadRepository> ref;

  @override
  bool get uploadFullSizePhoto =>
      ref.read(appSettingsProvider).uploadFullSizePhoto;

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
  void onUploadFailure(MediaModel mediaModel, MediaStatus mediaStatus) {
    final updatedMediaModel =
        ref.read(dbProvider).casesCollection.updateObject<MediaModel>(() {
      return mediaModel..status = mediaStatus;
    });

    ref.read(dbProvider).casesCollection.putMedia(updatedMediaModel);
  }

  @override
  void onUploadSucces(
    MediaModel mediaModel,
    String? thumbUri,
    String? mediumUri,
    String? fullUri,
  ) {
    ///  update the database
    final updatedMediaModel =
        ref.read(dbProvider).casesCollection.updateObject<MediaModel>(() {
      return mediaModel
        ..fileUri = fullUri
        ..mediumUri = mediumUri
        ..thumbUri = thumbUri
        ..status = MediaStatus.success;
    });

    ref.read(dbProvider).casesCollection.putMedia(updatedMediaModel);
  }
}
