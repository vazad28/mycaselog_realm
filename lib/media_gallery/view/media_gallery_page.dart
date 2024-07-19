import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/mixins/mixins.dart';
import '../media_gallery.dart';

class MediaGalleryPage extends ConsumerWidget with MediaMixin {
  const MediaGalleryPage({required this.mediaGalleryModel, super.key});

  final MediaGalleryModel mediaGalleryModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(mediaGalleryNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MediaGalleryScreen'),
      ),
      body: const MediaGalleryView(),
    );
  }
}
