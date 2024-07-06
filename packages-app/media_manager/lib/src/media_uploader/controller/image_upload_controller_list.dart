import 'package:app_data/app_data.dart';
import 'package:app_models/app_models.dart';
import 'package:collection/collection.dart';
import 'package:logger_client/logger_client.dart';

import 'image_upload_controller.dart';
import 'upload_controller.dart';

class ImageUploadControllersList with LoggerMixin {
  /// Consumable Constructor
  factory ImageUploadControllersList() {
    return _instance;
  }

  /// Internal Constructor
  ImageUploadControllersList._internal();

  /// Always return a singleton instance
  static final _instance = ImageUploadControllersList._internal();

  final Map<String, UploadController> _uploadList = {};

  Map<String, UploadController> get uploadList => _uploadList;

  void removeController(String mediaID) {
    _uploadList.removeWhere((id, element) => id == mediaID);
  }

  void addController({
    required MediaModel mediaModel,
    required MediaUploadRepository mediaUploadRepository,
    required void Function(Object err) onFailure,
  }) {
    try {
      _uploadList.putIfAbsent(
        mediaModel.mediaID,
        () => ImageUploadController(
          mediaModel: mediaModel,
          mediaUploadRepository: mediaUploadRepository,
        ),
      );
      print(' upload controller list ${_uploadList.length}');
    } catch (err) {
      onFailure.call(err);
    }
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
