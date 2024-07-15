import 'src/image_picker/image_picker.dart';
import 'src/image_picker/s_image_picker.dart';

export './src/media_cache/media_cache.dart';

/// The core manager of this package
class MediaManager {
  static final ImagePickerService imagePickerService =
      ImagePickerService.defaultImpl();
}
