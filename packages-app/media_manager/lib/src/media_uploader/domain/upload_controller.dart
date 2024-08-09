import 'package:flutter/foundation.dart';

import '../../../media_manager.dart';

///  abstract class
abstract class UploadController implements ChangeNotifier {
  double get uploadProgress;
  UploadStatus get uploadStatus;

  Future<void> startUpload();
  void cancelUpload();
  void retryUpload();
}
