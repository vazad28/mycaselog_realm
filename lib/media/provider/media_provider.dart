import 'dart:async';

import 'package:app_models/app_models.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';

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
class MediaNotifier extends _$MediaNotifier {
  @override
  Stream<RealmResultsChanges<MediaModel>> build() {
    return ref.read(dbProvider).mediaCollection.getAllMedia().changes;
  }

  /// Full text search notes
  RealmResults<MediaModel> searchMedia(String searchTerm) {
    final caseResults =
        ref.watch(dbProvider).casesCollection.search(searchTerm);

    // list of case IDs matching the search term
    final ids = caseResults.map((e) => e.caseID);

    return ref.watch(dbProvider).mediaCollection.search(ids);
  }

  Future<void> pullToRefresh() {
    try {
      return ref.watch(dbProvider).mediaCollection.refreshMediaBacklinks(null);
    } catch (err) {
      ref.watch(dialogServiceProvider).showSnackBar('Refresh failed');
      return Future<void>.sync(() => {});
    }
  }
}
