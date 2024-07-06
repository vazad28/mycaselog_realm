import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cases.dart';

class CaseTileStyleToggle extends ConsumerWidget
    with CasesEventMixin, CasesStateMixin {
  const CaseTileStyleToggle({super.key});

  static const _tileDisplayIcons = [
    Icon(Icons.list),
    Icon(Icons.format_list_bulleted),
    Icon(Icons.storage),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = watchCaseTileStyle(ref);

    // ignore: require_trailing_commas
    return IconButton(
      onPressed: () {
        final toggledStyle = style == 2 ? 0 : style + 1;
        updateCaseTileStyle(ref, toggledStyle);
      },
      icon: _tileDisplayIcons[style],
    );
  }
}
