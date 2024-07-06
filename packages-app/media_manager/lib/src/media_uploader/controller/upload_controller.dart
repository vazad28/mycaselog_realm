import 'package:app_data/app_data.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter/foundation.dart';

abstract class UploadController implements ChangeNotifier {
  UploadModel get uploadModel;

  MediaModel get mediaModel;

  void startUpload();
  void stopUpload();
  void retryUpload();
  void removeMedia();
}
