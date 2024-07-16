import 'package:realm/realm.dart';

import '../../app_models.dart';

part 'media_upload_model.realm.dart';

@RealmModel()
class _MediaUploadModel {
  @PrimaryKey()
  late String mediaID;
  late String? caseID;
  late String fileUri = '';
  late String? medium;
  late String? thumb;
  late double uploadProgress = 0;

  @MapTo('status')
  late String? _status;

  @Ignored()
  MediaStatus get status {
    return MediaStatus.values.byName(_status ?? MediaStatus.queued.name);
  }

  @Ignored()
  set status(MediaStatus value) => _status = value.name;
}
