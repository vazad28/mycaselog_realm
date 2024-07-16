import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/mixins/mixins.dart';

class MediaGalleryView extends ConsumerWidget with MediaMixin {
  const MediaGalleryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final mediaGalleryAsync = ref.watch(mediaGalleryNotifierProvider);

    return const Center(child: Text('MediaGalleryView'));
  }
}
