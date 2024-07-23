import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../media.dart';

class MediaTileStyleToggle extends ConsumerWidget {
  const MediaTileStyleToggle({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = ref.watch(mediaGridTileStyleProvider);

    // ignore: require_trailing_commas
    return IconButton(
      onPressed: () {
        final toggledStyle = style == 1 ? 0 : 1;
        ref.watch(mediaGridTileStyleProvider.notifier).update(toggledStyle);
      },
      icon:
          style == 0 ? const Icon(Icons.grid_on) : const Icon(Icons.grid_view),
    );
  }
}
