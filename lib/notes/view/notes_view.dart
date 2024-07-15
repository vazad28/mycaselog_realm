import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../notes.dart';

class NotesView extends ConsumerWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider);

    final noteStyle = ref.watch(noteTileStyleProvider);

    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth ~/ 180 > 4 ? 3 : 2;

    final maxLines = noteStyle == NoteTileStyleEnum.list ? 4 : 8;

    final widgetKey = noteStyle == NoteTileStyleEnum.list
        ? const Key('__NotesView_list_key__')
        : const Key('__NotesView_grid_key__');

    return StreamBuilder(
      stream: notes.changes,
      builder: (context, snapshot) => SliverMasonryGrid.count(
        key: widgetKey,
        crossAxisCount:
            noteStyle == NoteTileStyleEnum.grid ? crossAxisCount : 1,
        mainAxisSpacing: AppSpacing.sm,
        crossAxisSpacing: AppSpacing.sm,
        childCount: notes.length,
        itemBuilder: (context, int index) {
          return NoteItem(
            noteModel: notes[index],
            maxLines: maxLines,
          );
        },
      ),
    );
  }
}
