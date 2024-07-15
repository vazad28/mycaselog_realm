import 'package:app_extensions/app_extensions.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_manager/media_manager.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:recase/recase.dart';

import '../../core/mixins/mixins.dart';
import '../../media_uploader/media_uploader.dart';

class Thumbnail extends ConsumerStatefulWidget {
  const Thumbnail({
    required this.mediaModel,
    this.width = 120,
    super.key,
  });

  final MediaModel mediaModel;
  final double width;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ThumbnailState();
}

class _ThumbnailState extends ConsumerState<Thumbnail> with MediaMixin {
  @override
  Widget build(BuildContext context) {
    final cachedImage = CachedImage(
      key: ValueKey(widget.mediaModel),
      mediaModel: widget.mediaModel,
      width: 96,
    );

    final child = switch (widget.mediaModel.status) {
      MediaStatus.queued ||
      MediaStatus.uploading ||
      MediaStatus.failed =>
        Stack(
          alignment: Alignment.center,
          children: [
            cachedImage,
            if (widget.mediaModel.status == MediaStatus.failed)
              Icon(Icons.error, color: Colors.red.shade400, size: 48),
            if (widget.mediaModel.status != MediaStatus.failed)
              MediaUploadOverlayWidget(
                mediaModel: widget.mediaModel,
                width: widget.width,
                uploadController: () {
                  return ref
                          .read(imageUploadControllerList)
                          .getUploadController(widget.mediaModel.mediaID) ??
                      ref
                          .read(imageUploadControllerList)
                          .addController(mediaModel: widget.mediaModel);
                },
                key: Key(
                    '__media_upload_overlay_widget_${widget.mediaModel.mediaID}__'),
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
      onLongPress: _onLongPressOfThumb,
      child: child,
    );
  }

  Future<void> _onLongPressOfThumb() async {
    await context.openActionsBottomSheet(thumbnailActions).then((appAction) {
      switch (appAction?.action) {
        case ThumbnailActionsEnum.deleteMedia:
          if (!context.mounted) return;
          context
              .showConfirmDialog(S.current.contentHardDeleteWarning)
              .then((res) {
            if (!res) return;

            ///  use mixin
            deleteMedia(ref, widget.mediaModel);
          });

        case ThumbnailActionsEnum.shareMedia:
          shareMedia(ref, widget.mediaModel);
        default:
          break;
      }
    });
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
