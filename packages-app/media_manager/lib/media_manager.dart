import 'src/image_picker/s_image_picker.dart';
import 'src/media_uploader/controller/image_upload_controller_list.dart';

export './src/media_cache/media_cache_manager.dart';
export './src/media_uploader/media_uploader.dart';

/// The core manager of this package, providing methods for
/// accessing and managing assets.
class MediaManager {
  static final ImagePickerService imagePickerService =
      ImagePickerService.defaultImpl();

  // static final ImageSaverService imageSavedService =
  //     ImageSaverService.defaultImpl();

  static final ImageUploadControllersList imageUploadControllersList =
      ImageUploadControllersList();
}
