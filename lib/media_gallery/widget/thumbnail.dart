import 'package:app_extensions/app_extensions.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_manager/media_manager.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:recase/recase.dart';

import '../../core/mixins/mixins.dart';
import '../../core/providers/providers.dart';

class Thumbnail extends ConsumerWidget with MediaMixin {
  const Thumbnail({
    required this.mediaModel,
    this.fit,
    this.width = 120,
    this.onTap,
    this.onLongPress,
    super.key,
  });

  final MediaModel mediaModel;
  final double width;
  final BoxFit? fit;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cachedImage = CachedImage(
      key: ValueKey(mediaModel),
      mediaModel: mediaModel,
      fit: fit,
      width: 96,
    );

    final child = switch (mediaModel.status) {
      MediaStatus.queued ||
      MediaStatus.uploading ||
      MediaStatus.failed =>
        Stack(
          alignment: Alignment.center,
          children: [
            cachedImage,
            if (mediaModel.status == MediaStatus.failed)
              Icon(Icons.error, color: Colors.red.shade400, size: 48),
            if (mediaModel.status != MediaStatus.failed)
              MediaUploadOverlayWidget(
                key: Key(
                  '__media_upload_overlay_widget_${mediaModel.mediaID}__',
                ),
                mediaModel: mediaModel,
                width: width,
                uploadController: MediaManager.getUploadController(
                  mediaModel: mediaModel,
                  mediaUploadRepository:
                      ref.read(imageUploadRepositoryProvider),
                ),
              ),
          ],
        ),
      MediaStatus.success => cachedImage,
      MediaStatus.removed ||
      MediaStatus.processing ||
      MediaStatus.cancelled =>
        const SizedBox.shrink(),
    };

    return InkWell(
      onTap: () {},
      onLongPress: () async {
        await context
            .openActionsBottomSheet(thumbnailActions)
            .then((appAction) {
          switch (appAction?.action) {
            case ThumbnailActionsEnum.deleteMedia:
              if (!context.mounted) return;
              context
                  .showConfirmDialog(S.current.contentHardDeleteWarning)
                  .then((res) {
                if (!res) return;

                ///  use mixin
                deleteMedia(ref, mediaModel);
              });

            case ThumbnailActionsEnum.shareMedia:
              shareMedia(ref, mediaModel);
            default:
              break;
          }
        });
      },
      child: child,
    );
  }
}

enum ThumbnailActionsEnum { deleteMedia, shareMedia }

class ThumbnailAction extends BaseAppAction {
  ThumbnailAction({
    required super.action,
    required super.title,
    required super.leading,
  });
}

final thumbnailActions = [
  ThumbnailAction(
    action: ThumbnailActionsEnum.deleteMedia,
    title: ThumbnailActionsEnum.deleteMedia.name.titleCase,
    leading: const Icon(Icons.delete),
  ),
  ThumbnailAction(
    action: ThumbnailActionsEnum.shareMedia,
    title: ThumbnailActionsEnum.shareMedia.name.titleCase,
    leading: const Icon(Icons.share),
  ),
];
