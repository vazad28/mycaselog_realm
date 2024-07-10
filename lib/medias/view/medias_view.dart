import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../medias.dart';

class MediasView extends ConsumerWidget with MediasEventMixin, MediasStateMixin{
  const MediasView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediasAsync = ref.watch(mediasNotifierProvider);

    return const Center(child: Text('MediasView'));
  }
}