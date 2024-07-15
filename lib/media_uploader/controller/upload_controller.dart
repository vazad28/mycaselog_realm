import 'package:app_models/app_models.dart';
import 'package:flutter/foundation.dart';

abstract class UploadController implements ChangeNotifier {
  double get uploadProgress;
  MediaStatus get mediaStatus;

  Future<void> startUpload();
  void stopUpload();
  void retryUpload();
  void removeMedia();
}
