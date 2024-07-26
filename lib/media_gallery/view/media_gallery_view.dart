import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/app_mixins.dart';

class MediaGalleryView extends ConsumerWidget with AppMixins {
  const MediaGalleryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final mediaGalleryAsync = ref.watch(mediaGalleryNotifierProvider);

    return const Center(child: Text('MediaGalleryView'));
  }
}
