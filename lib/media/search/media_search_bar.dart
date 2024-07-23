import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/media_tile_style_toggle.dart';
import 'media_search_view.dart';

class MediaSearchBar extends ConsumerWidget {
  const MediaSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      primary: false,
      pinned: true,
      expandedHeight: kToolbarHeight + AppSpacing.sm,
      collapsedHeight: kToolbarHeight + AppSpacing.sm,
      scrolledUnderElevation: 0.5,
      shadowColor: context.colorScheme.shadow.lighter(),
      surfaceTintColor: context.colorScheme.surface,
      titleSpacing: AppSpacing.md,
      title: const MediaSearchView(
        anchorStyle: MediaSearchBarStyle.bar,
      ),
      actions: const [
        MediaTileStyleToggle(),
        SizedBox(width: AppSpacing.sm),
      ],
    );
  }
}
