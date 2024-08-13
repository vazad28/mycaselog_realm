import 'package:animations/animations.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../media_gallery/media_gallery.dart';
import '../../../router/router.dart';

/// ////////////////////////////////////////////////////////////////////
/// Picture preview list in case tile
/// ////////////////////////////////////////////////////////////////////

class MediaPreviewTile extends ConsumerWidget {
  const MediaPreviewTile({
    required this.caseModel,
    required this.leftPadding,
    super.key,
  });

  final double leftPadding;
  final CaseModel caseModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (caseModel.medias.isEmpty) return const SizedBox.shrink();

    final mediaModels = caseModel.medias.where((e) => e.removed != 1).toList();
    if (mediaModels.isEmpty) return const SizedBox.shrink();

    const height = kToolbarHeight + 12;

    final routeObserver =
        ref.read(shellRoutesObserversProvider).casesRouteObserver;

    return SizedBox(
      height: height,
      child: ListView(
        key: ValueKey(caseModel.medias),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(top: AppSpacing.sm, left: leftPadding),
        shrinkWrap: true,
        children: mediaModels
            .mapIndexed(
              (index, e) => _MediaPreviewTile(
                mediaModels: mediaModels,
                index: index,
                routeObserver: routeObserver,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _MediaPreviewTile extends StatelessWidget {
  const _MediaPreviewTile({
    required this.mediaModels,
    required this.index,
    required this.routeObserver,
  });

  final List<MediaModel> mediaModels;
  final int index;
  final RouteObserver<ModalRoute<void>>? routeObserver;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<MediaModel>(
      closedElevation: 0,
      tappable: false,
      closedColor: context.colorScheme.surface,
      openColor: context.colorScheme.surface,
      closedBuilder: (_, action) => Thumbnail(
        mediaModel: mediaModels[index],
        fit: BoxFit.fitHeight,
        onTap: () => action.call(),
        onLongPress: () => {},
      ),
      openBuilder: (_, action) {
        final mediaGalleryModel = MediaGalleryModel(
          mediaModels: mediaModels,
          index: index,
          routeObserver: routeObserver,
        );
        return MediaGalleryPage(mediaGalleryModel: mediaGalleryModel);
      },
      onClosed: (_) => {},
    ).paddingOnly(right: 4);
  }
}
