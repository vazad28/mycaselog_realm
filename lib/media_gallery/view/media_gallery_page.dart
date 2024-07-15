import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/mixins/mixins.dart';
import '../media_gallery.dart';

class MediaGalleryPage extends ConsumerWidget with MediaMixin {
  const MediaGalleryPage({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: MediaGalleryPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(mediaGalleryNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MediaGalleryScreen'),
      ),
      body: const MediaGalleryView(),
    );
  }
}
