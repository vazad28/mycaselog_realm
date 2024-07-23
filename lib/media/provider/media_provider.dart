import 'dart:async';

import 'package:app_models/app_models.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';
import '../../core/services/services.dart';

part '../../generated/media/provider/media_provider.g.dart';

enum MediaGridStyleEnum { list, grid }

@riverpod
class MediaGridTileStyle extends _$MediaGridTileStyle {
  @override
  int build() {
    final localStorage = ref.watch(localStorageProvider);
    return localStorage.getMediaGridTileStyle();
  }

  // ignore: use_setters_to_change_properties
  void update(int toggledStyle) {
    state = toggledStyle;
    ref.read(localStorageProvider).setMediaGridTileStyle(toggledStyle);
  }
}

@Riverpod(keepAlive: true)
Stream<RealmResultsChanges<MediaModel>> mediaStream(MediaStreamRef ref) {
  return ref.read(collectionsProvider).mediaCollection.getAll().changes;
}
