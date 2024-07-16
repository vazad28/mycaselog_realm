import 'package:app_models/app_models.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';


part '../../generated/media_gallery/provider/media_gallery_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

@riverpod
class MediaGalleryNotifier extends _$MediaGalleryNotifier with LoggerMixin {
  @override
  StateOf<MediaModel> build() {
    return const StateOf<MediaModel>.init();
  }
}
