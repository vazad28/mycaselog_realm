import 'package:app_extensions/app_extensions.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_manager/media_manager.dart';
import 'package:misc_packages/misc_packages.dart';

import '../../core/app_mixins.dart';
import '../../core/providers/providers.dart';
import '../../core/widgets/widgets.dart';

enum ThumbnailActionsEnum { deleteMedia, shareMedia, retry }

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
    title: ThumbnailActionsEnum.deleteMedia.enumToTitleCase,
    leading: const Icon(Icons.delete),
  ),
  ThumbnailAction(
    action: ThumbnailActionsEnum.shareMedia,
    title: ThumbnailActionsEnum.shareMedia.enumToTitleCase,
    leading: const Icon(Icons.share),
  ),
  ThumbnailAction(
    action: ThumbnailActionsEnum.retry,
    title: ThumbnailActionsEnum.retry.enumToTitleCase,
    leading: const Icon(Icons.upload),
  ),
];

final mediaModelProvider = StreamProvider.autoDispose
    .family<MediaModel, String>((ref, mediaID) async* {
  final mediaObject = ref.watch(dbProvider).mediaCollection.getSingle(mediaID);

  yield* mediaObject?.changes.map((event) => event.object) ??
      const Stream.empty();
});

class Thumbnail extends ConsumerWidget with AppMixins {
  const Thumbnail({
    required this.mediaModel,
    this.fit = BoxFit.cover,
    this.width,
    this.onTap,
    this.onLongPress,
    super.key,
  });

  final MediaModel mediaModel;
  final double? width;
  final BoxFit? fit;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (mediaModel.status == MediaStatus.success) {
      return _Thumbnail(
        mediaModel: mediaModel,
        fit: fit,
        width: width,
        onTap: onTap,
        onLongPress: onLongPress,
      );
    }

    return Consumer(
      builder: (context, ref, child) {
        final mediaModelAsync =
            ref.watch(mediaModelProvider(mediaModel.mediaID));

        return AsyncValueWidget(
          value: mediaModelAsync,
          data: (model) => Stack(
            children: [
              _Thumbnail(
                mediaModel: model,
                fit: fit,
                width: width,
                onTap: onTap,
                onLongPress: onLongPress,
              ),
              if (model.status == MediaStatus.failed)
                Center(
                  child: Icon(Icons.error, color: Colors.red.shade400),
                ),

              /// important else it will be a loop
              /// If we are saying failed, we cant keep uploading
              if (mediaModel.status != MediaStatus.failed &&
                  mediaModel.status != MediaStatus.cancelled &&
                  mediaModel.status != MediaStatus.removed)
                MediaUploadOverlayWidget(
                  key: Key(
                    '__media_upload_overlay_widget_${mediaModel.mediaID}__',
                  ),
                  mediaModel: model,
                  width: width,
                  uploadController: MediaManager.getUploadController(
                    mediaModel: mediaModel,
                    mediaUploadService: ref.read(imageUploadServiceProvider),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _Thumbnail extends ConsumerWidget with AppMixins {
  const _Thumbnail({
    required this.mediaModel,
    this.fit = BoxFit.cover,
    this.width,
    this.onTap,
    this.onLongPress,
  });

  final MediaModel mediaModel;
  final double? width;
  final BoxFit? fit;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress ??
          () async {
            final appAction =
                await context.openActionsBottomSheet(thumbnailActions);
            if (appAction == null) return;

            switch (appAction.action) {
              case ThumbnailActionsEnum.deleteMedia:
                if (!context.mounted) return;
                return context
                    .showConfirmDialog(S.current.contentHardDeleteWarning)
                    .then((res) {
                  if (res) deleteMedia(ref, mediaModel);
                });
              case ThumbnailActionsEnum.shareMedia:
                return shareMedia(ref, mediaModels: [mediaModel]);
              case ThumbnailActionsEnum.retry:
                return retryMediaUpload(ref, mediaModel);
              default:
                break;
            }
          },
      child: CachedImage(
        key: ValueKey(mediaModel),
        mediaModel: mediaModel,
        fit: fit,
        width: width,
      ),
    );
  }
}
