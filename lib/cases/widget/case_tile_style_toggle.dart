import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cases.dart';

class CaseTileStyleToggle extends ConsumerWidget {
  const CaseTileStyleToggle({super.key});

  static const _tileDisplayIcons = [
    Icon(Icons.list),
    Icon(Icons.format_list_bulleted),
    Icon(Icons.storage),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseTileStyle = ref.watch(caseTileStyleProvider);

    // ignore: require_trailing_commas
    return IconButton(
      onPressed: () {
        final toggledStyle = caseTileStyle == 2 ? 0 : caseTileStyle + 1;
        ref.watch(caseTileStyleProvider.notifier).update(toggledStyle);
      },
      icon: _tileDisplayIcons[caseTileStyle],
    );
  }
}
