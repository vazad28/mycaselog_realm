import 'package:app_models/app_models.dart';

import 'src/image_picker/s_image_picker.dart';
import 'src/media_uploader/media_uploader.dart';

export './src/media_cache/media_cache.dart';
export './src/media_uploader/media_uploader.dart';

/// The core manager of this package, providing methods for
/// accessing and managing assets.
class MediaManager {
  static final ImagePickerService imagePickerService =
      ImagePickerService.defaultImpl();

  static final ImageUploadControllersList imageUploadControllersList =
      ImageUploadControllersList();

  static UploadController? getUploadController({
    required MediaModel mediaModel,
    required MediaUploadService mediaUploadService,
  }) {
    return imageUploadControllersList.getUploadController(
      mediaModel,
      mediaUploadService,
    );
  }
}
