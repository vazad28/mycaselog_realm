import 'package:app_models/src/cases/case_model.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:realm_dart/src/results.dart';

import '../../media_gallery/media_gallery.dart';
import '../media.dart';

class MediaView extends ConsumerWidget with MediaEventMixin, MediaStateMixin {
  const MediaView({
    required this.mediaModels,
    super.key,
  });

  final RealmResults<MediaModel> mediaModels;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaStyle = ref.watch(mediaTileStyleProvider);

    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth ~/ 180 > 4 ? 3 : 2;

    final widgetKey = mediaStyle == MediaGridStyleEnum.list
        ? const Key('__MediasView_list_key__')
        : const Key('__MediasView_grid_key__');

    // return StreamBuilder(
    //     stream: medias.,
    //     builder: (context, snapshot) {
    //       if (!snapshot.hasData) return const LoadingSliver();

    //       final medias = snapshot.data!.results.fold(<MediaModel>[], combine);

    return SliverMasonryGrid.count(
      key: widgetKey,
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: AppSpacing.sm,
      crossAxisSpacing: AppSpacing.sm,
      childCount: mediaModels.length,
      itemBuilder: (context, int index) {
        final mediaModel = mediaModels[index];
        return Thumbnail(mediaModel: mediaModel);
      },
    );

    // return SliverMasonryGrid.count(
    //   key: widgetKey,
    //   crossAxisCount:
    //       mediaStyle == MediaGridStyleEnum.grid ? crossAxisCount : 1,
    //   mainAxisSpacing: AppSpacing.sm,
    //   crossAxisSpacing: AppSpacing.sm,
    //   childCount: medias.length,
    //   itemBuilder: (context, int index) {
    //     return MediaListTile(
    //       caseModel: medias[index],
    //     );
    //   },
    // );
    //});
  }

  // List<MediaModel> combine(List<MediaModel> previousValue, CaseModel element) {
  //   return element.medias;
  // }
}
