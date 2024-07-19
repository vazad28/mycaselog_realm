import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';

/// ////////////////////////////////////////////////////////////////////
/// Model for gallery screen data to we can use it as $extra in router
/// ////////////////////////////////////////////////////////////////////
class MediaGalleryModel {
  const MediaGalleryModel({
    required this.mediaModels,
    this.routeObserver,
    this.index = 0,
    this.navigateOnTap = true,
  });

  final int index;
  final List<MediaModel> mediaModels;
  final bool navigateOnTap;
  final RouteObserver<ModalRoute<void>>? routeObserver;
}
