import 'package:app_annotations/app_annotations.dart';
import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';
import '../media_uploader.dart';

/// provider
final mediaUploader = Provider<MediaUploader>((ref) => MediaUploader(ref));

/// uploader abstract class
abstract class MediaUploaderInterface {
  void uploadImage({required XFile imageFile, required String caseID});

  void uploadVideo({required XFile videoFile, required String caseID});
}

/// uploader class
class MediaUploader implements MediaUploaderInterface {
  late final ProviderRef<MediaUploader> _ref;

  MediaUploader(ProviderRef<MediaUploader> ref) : _ref = ref;

  @override
  void uploadImage(
      {required XFile? imageFile, required String caseID, int? timestamp}) {
    if (imageFile == null) return;

    final mediaID = ModelUtils.uniqueID;

    final mediaModel = MediaModel(
      mediaID,
      caseID,
      fileType: MediaType.image.name,
      caseID: caseID,
      fileUri: imageFile.path,
      createdAt: timestamp ?? ModelUtils.getTimestamp,
      timestamp: ModelUtils.getTimestamp,
      fileName: imageFile.name.changeFileName(mediaID), //-> extension method
    );

    /// add image to database
    _ref.read(dbProvider).casesCollection.putMedia(
          mediaModel,
        );

    /// add media to upload queue
    _ref.read(imageUploadControllerList).addController(mediaModel: mediaModel);
  }

  @override
  void uploadVideo({required XFile? videoFile, required String caseID}) {
    // TODO: implement uploadVideo
  }
}
