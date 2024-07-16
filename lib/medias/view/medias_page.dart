import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../medias.dart';

class MediasPage extends ConsumerWidget {
  const MediasPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: MediasPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MediasScreen'),
      ),
      body: const MediasView(),
    );
  }
}
