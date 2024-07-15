// ignore_for_file: public_member_api_docs

// ignore: prefer_relative_imports
import 'package:app_annotations/app_annotations.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';

import '../../media_manager.dart';
import 'transparent_image.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    required this.mediaModel,
    this.imageSize = ImageSize.thumb,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    super.key,
  });

  final MediaModel mediaModel;
  final double? height;
  final double? width;
  final ImageSize imageSize;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final imageUrl = imageSize == ImageSize.thumb
        ? mediaModel.thumbUri
        : mediaModel.mediumUri;

    return FadeInImage(
      placeholder: MemoryImage(kTransparentImage),
      fit: fit,
      width: width,
      fadeInDuration: Durations.short1,
      // ignore: avoid_redundant_argument_values
      fadeOutDuration: Durations.short1,
      image: MediaCacheManager(
        imageUrl ?? mediaModel.fileUri ?? '',
        //errorListener: (_) => Assets.images.missingImage.path,
      ),
      // imageErrorBuilder: (_, err, __) {
      //   return ColoredBox(
      //     color: Theme.of(context).colorScheme.surface,
      //     child: Assets.images.missingImage.image(),
      //   );
      // },
    );
  }
}
