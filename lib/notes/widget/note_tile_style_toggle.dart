import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notes.dart';

class NoteTileStyleToggle extends ConsumerWidget {
  const NoteTileStyleToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = ref.watch(noteTileStyleProvider);

    // ignore: require_trailing_commas
    return IconButton(
      onPressed: () {
        final toggledStyle = style == NoteTileStyleEnum.list
            ? NoteTileStyleEnum.grid
            : NoteTileStyleEnum.list;
        ref.watch(noteTileStyleProvider.notifier).update(toggledStyle);
      },
      icon: style == NoteTileStyleEnum.grid
          ? const Icon(Icons.grid_view)
          : const Icon(Icons.format_list_bulleted),
    );
  }
}
