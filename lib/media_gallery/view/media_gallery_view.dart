import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/mixins/mixins.dart';
import '../media_gallery.dart';

class MediaGalleryView extends ConsumerWidget with MediaMixin {
  const MediaGalleryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final mediaGalleryAsync = ref.watch(mediaGalleryNotifierProvider);

    return const Center(child: Text('MediaGalleryView'));
  }
}
