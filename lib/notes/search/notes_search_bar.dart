import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notes.dart';
import 'notes_search_anchor.dart';

class NotesSearchBar extends ConsumerWidget {
  const NotesSearchBar({super.key});

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
      title: const NotesSearchAnchor(
        anchorStyle: NotesSearchBarStyle.bar,
      ),
      actions: const [
        NoteTileStyleToggle(),
        SizedBox(width: AppSpacing.sm),
      ],
    );
  }
}
