import 'package:app_models/app_models.dart';
import 'package:logger_client/logger_client.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';
import '../../core/services/services.dart';

part '../../generated/media/provider/media_provider.g.dart';
part 'media_mixins.dart';

enum MediaGridStyleEnum { list, grid }

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

/// media tile style provider
@riverpod
class MediaTileStyle extends _$MediaTileStyle {
  @override
  MediaGridStyleEnum build() {
    final localStorage = ref.watch(localStorageProvider);
    final index = localStorage.getMediaGridTileStyle();
    return MediaGridStyleEnum.values.elementAt(index);
  }

  // ignore: use_setters_to_change_properties
  void update(MediaGridStyleEnum mediaStyle) {
    state = mediaStyle;
    ref
        .read(localStorageProvider)
        .setMediaGridTileStyle(MediaGridStyleEnum.values.indexOf(mediaStyle));
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

@riverpod
class MediaNotifier extends _$MediaNotifier with LoggerMixin {
  @override
  Iterable<MediaModel> build() {
    return ref.watch(dbProvider).casesCollection.getAllMedia();
  }

  Future<void> pullToRefresh() async {
    ref.watch(dbProvider).casesCollection.getAll().changes.listen((data) {
      data.results.query('medias.@size > 0').expand((e) => e.medias);
    });
  }
}
