import 'package:app_models/app_models.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class MediaUploadService {
  bool get uploadFullSizePhoto;

  Reference getThumbRef(MediaModel mediaModel);

  Reference getMediumRef(MediaModel mediaModel);

  Reference getOriginalRef(MediaModel mediaModel);

  /// on media upload success
  void onUploadSucces(
    MediaModel mediaModel, {
    String? thumbUri,
    String? mediumUri,
    String? fullUri,
  });

  /// on media upload failure
  void onUploadFailure(
      MediaModel mediaModel, MediaStatus mediaStatus, String? message,);
}
