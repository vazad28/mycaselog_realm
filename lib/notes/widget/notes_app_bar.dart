import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import '../search/notes_search_anchor.dart';
import 'note_tile_style_toggle.dart';
import 'notes_count_widget.dart';

class NotesAppBar extends StatelessWidget {
  const NotesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.medium(
      titleSpacing: 4,
      elevation: 0,
      floating: true,
      pinned: false,
      snap: true,
      surfaceTintColor: context.colorScheme.surface,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: const EdgeInsetsDirectional.only(start: 24, bottom: 16),
        title: Row(
          children: [
            Expanded(child: NotesCountWidget()
                // child: Text(
                //   'Notes',
                //   textAlign: TextAlign.left,
                //   style: Theme.of(context)
                //       .textTheme
                //       .headlineSmall
                //       ?.copyWith(letterSpacing: -1),
                // ),
                ),
          ],
        ),
      ),
      actions: const [
        NotesSearchAnchor(
          anchorStyle: NotesSearchBarStyle.icon,
        ),
        NoteTileStyleToggle(),
        SizedBox(width: AppSpacing.sm),
      ],
    );
  }
}
