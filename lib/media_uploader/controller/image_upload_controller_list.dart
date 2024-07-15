import 'package:app_models/app_models.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger_client/logger_client.dart';

import '../../settings/settings.dart';
import 'image_upload_controller.dart';
import 'upload_controller.dart';

final imageUploadControllerList = Provider<ImageUploadControllersList>(
  ImageUploadControllersList.new,
);

class ImageUploadControllersList with LoggerMixin {
  final Ref ref;

  ImageUploadControllersList(this.ref);

  final Map<String, ImageUploadController> _uploadList = {};

  Map<String, ImageUploadController> get uploadList => _uploadList;

  void removeController(String mediaID) {
    _uploadList.removeWhere((id, element) => id == mediaID);
  }

  ImageUploadController addController({
    required MediaModel mediaModel,
  }) {
    final uploadFullSize = ref.read(appSettingsProvider).uploadFullSizePhoto;
    final controller = ImageUploadController(
      ref,
      mediaModel: mediaModel,
      uploadFullSize: uploadFullSize,
    );

    _uploadList.putIfAbsent(
      mediaModel.mediaID,
      () => ImageUploadController(
        ref,
        mediaModel: mediaModel,
        uploadFullSize: uploadFullSize,
      ),
    );

    print(' upload controller list ${_uploadList.length}');
    return controller;
  }

  UploadController? getUploadController(String? mediaID) {
    if (mediaID == null) {
      logger.severe('Medial ID is null for medial upload controller');
      return null;
    }

    final entry = _uploadList.entries
        .firstWhereOrNull((element) => element.key == mediaID);

    return entry?.value;
  }
}
