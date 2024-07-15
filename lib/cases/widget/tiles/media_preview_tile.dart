import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../router/router.dart';

/// ////////////////////////////////////////////////////////////////////
/// Picture preview list in case tile
/// ////////////////////////////////////////////////////////////////////

class MediaPreviewTile extends ConsumerWidget {
  const MediaPreviewTile({
    required this.hybridCaseModel,
    required this.leftPadding,
    super.key,
  });

  final double leftPadding;
  final HybridCaseModel hybridCaseModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (hybridCaseModel.mediaModels.isEmpty) {
      return const SizedBox.shrink();
    }

    const height = kToolbarHeight + 12;

    final routeObserver =
        ref.read(shellRoutesObserversProvider).casesRouteObserver;

    return SizedBox(
      height: height,
      child: ListView(
        key: ValueKey(hybridCaseModel.mediaModels),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(top: AppSpacing.sm, left: leftPadding),
        shrinkWrap: true,
        children: hybridCaseModel.mediaModels
            .mapIndexed(
              (index, e) => _MediaPreviewTile(
                mediaModels: hybridCaseModel.mediaModels,
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
    //required this.mediaRepository,
  });

  final List<MediaModel> mediaModels;
  final int index;
  final RouteObserver<ModalRoute<void>>? routeObserver;
  //final MediaRepository mediaRepository;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 90, child: Placeholder());
    // return OpenContainer<MediaModel>(
    //   closedElevation: 0,
    //   tappable: false,
    //   closedColor: context.colorScheme.surface,
    //   openColor: context.colorScheme.surface,
    //   closedBuilder: (_, action) => Thumbnail.simple(
    //     mediaModel: mediaModels[index],
    //     mediaRepository: mediaRepository,
    //     fit: BoxFit.cover,
    //     onTap: () => action.call(),
    //     onLongPress: () => {},
    //   ),
    //   openBuilder: (_, action) {
    //     final mediaGalleryModel = MediaGalleryModel(
    //       mediaModels: mediaModels,
    //       index: index,
    //       routeObserver: routeObserver,
    //     );
    //     return MediaGalleryPage(mediaGalleryModel: mediaGalleryModel);
    //   },
    //   onClosed: (_) => {},
    // ).paddingOnly(right: 4);
  }
}
