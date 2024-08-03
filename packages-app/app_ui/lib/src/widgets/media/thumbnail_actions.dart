import 'package:app_extensions/app_extensions.dart';
import 'package:flutter/material.dart';
//import 'package:recase/recase.dart';

enum ThumbnailActionsEnum { deleteMedia, shareMedia, refreshMedia }

class ThumbnailAction extends BaseAppAction {
  ThumbnailAction({
    required super.action,
    required super.title,
    required super.leading,
  });
}

final thumbnailActions = [
  ThumbnailAction(
    action: ThumbnailActionsEnum.refreshMedia,
    title: ThumbnailActionsEnum.refreshMedia.name.titleCase,
    leading: const Icon(Icons.refresh),
  ),
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
