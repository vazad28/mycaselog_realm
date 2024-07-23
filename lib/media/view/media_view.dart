import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:realm/realm.dart';

import '../../media_gallery/media_gallery.dart';
import '../media.dart';

class MediaView extends ConsumerWidget {
  const MediaView({
    required this.mediaModels,
    super.key,
  });

  final RealmResults<MediaModel> mediaModels;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaTileStyle = ref.watch(mediaGridTileStyleProvider);

    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth ~/ 180 > 4 ? 4 : 3;

    final widgetKey = mediaTileStyle == 0
        ? const Key('__MediasView_list_key__')
        : const Key('__MediasView_grid_key__');

    return SliverGrid.builder(
      key: widgetKey,
      // crossAxisCount: crossAxisCount,
      // mainAxisSpacing: AppSpacing.sm,
      // crossAxisSpacing: AppSpacing.sm,
      // childCount: mediaModels.length,
      itemCount: mediaModels.length,
      gridDelegate: mediaTileStyle == 0
          ? SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: AppSpacing.xs,
              crossAxisSpacing: AppSpacing.xs,
            )
          : SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              //childAspectRatio: 0.75,
              mainAxisSpacing: AppSpacing.sm,
              crossAxisSpacing: AppSpacing.sm,
            ),
      itemBuilder: (context, int index) {
        final mediaModel = mediaModels[index];
        return Thumbnail(
          mediaModel: mediaModel,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
