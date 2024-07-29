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
      flexibleSpace: const FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: EdgeInsetsDirectional.only(start: 24, bottom: 16),
        title: Row(
          children: [
            Expanded(
              child: NotesCountWidget(),
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
