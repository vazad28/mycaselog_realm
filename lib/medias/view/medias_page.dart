import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../medias.dart';

class MediasPage extends ConsumerWidget with MediasEventMixin, MediasStateMixin{
  const MediasPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: MediasPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(mediasNotifierProvider.notifier);
    

    return  Scaffold(
      appBar: AppBar(title: const Text('MediasScreen'),),
      body: const MediasView(),
    );
  }
}