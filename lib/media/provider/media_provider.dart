import 'dart:async';

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

@Riverpod(keepAlive: true)
class MediaStream extends _$MediaStream {
  @override
  Stream<RealmResultsChanges<MediaModel>> build() {
    final results = ref.read(collectionsProvider).mediaCollection.getAll();

    return results.changes;
  }
}

@riverpod
class MediaNotifier extends _$MediaNotifier with LoggerMixin {
  @override
  RealmResults<CaseModel> build() {
    return ref.watch(collectionsProvider).casesCollection.getAll();
  }

  // @override
  // Iterable<HybridMediaModel> build() {
  //   final cases = ref.watch(collectionsProvider).casesCollection.getAll();

  //   final initialList = <HybridMediaModel>[];
  //   return cases
  //       .query('medias.@size > 0')
  //       .fold<List<HybridMediaModel>>(initialList, (media, caseModel) {
  //     final list = caseModel.medias.toList().expand(
  //           (e) => media
  //             ..add(HybridMediaModel(
  //               caseModel: caseModel,
  //               mediaModel: e,
  //             )),
  //         );
  //     return list;
  //   });
  // }

  Future<void> pullToRefresh() async {
    ref
        .watch(collectionsProvider)
        .casesCollection
        .getAll()
        .changes
        .listen((data) {
      data.results.query('medias.@size > 0').expand((e) => e.medias);
    });
  }
}
