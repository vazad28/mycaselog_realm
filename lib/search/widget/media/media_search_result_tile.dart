import 'package:animations/animations.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';

import '../../../media_gallery/media_gallery.dart';
import '../../../router/router.dart';

class MediaSearchResultTile extends ConsumerWidget {
  const MediaSearchResultTile({
    required this.mediaModel,
    required this.results,
    required this.width,
    super.key,
  });

  final RealmResults<MediaModel> results;
  final MediaModel mediaModel;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OpenContainer<MediaModel>(
      tappable: false,
      closedColor: context.colorScheme.surfaceContainerLow,
      openColor: context.colorScheme.surface,
      closedBuilder: (_, action) => Thumbnail(
        mediaModel: mediaModel,
        width: width,
        onTap: action,
      ),
      openBuilder: (_, action) {
        return MediaGalleryPage(
          mediaGalleryModel: MediaGalleryModel(
            mediaModels: results,
            index: results.indexOf(mediaModel),
            routeObserver:
                ref.read(shellRoutesObserversProvider).mediaRouteObserver,
          ),
        );
      },
      onClosed: (_) => {},
    );
  }
}
