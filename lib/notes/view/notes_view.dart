import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:realm/realm.dart';

import '../notes.dart';

class NotesView extends ConsumerWidget {
  const NotesView({required this.noteModels, super.key});

  final RealmResults<NoteModel> noteModels;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteStyle = ref.watch(noteTileStyleProvider);
    final maxLines = noteStyle == NoteTileStyleEnum.list ? 4 : 8;

    return SliverLayoutBuilder(
      builder: (BuildContext context, SliverConstraints constraints) {
        final widgetKey = constraints.crossAxisExtent <= Breakpoints.mobile
            ? const Key('__NotesView_list_key__')
            : const Key('__NotesView_grid_key__');

        final crossAxisCount =
            constraints.crossAxisExtent <= Breakpoints.mobile ? 1 : 2;

        return SliverMasonryGrid.count(
          key: widgetKey,
          crossAxisCount:
              noteStyle == NoteTileStyleEnum.grid ? crossAxisCount : 1,
          mainAxisSpacing: AppSpacing.sm,
          crossAxisSpacing: AppSpacing.sm,
          childCount: noteModels.length,
          itemBuilder: (context, int index) {
            return NoteItem(
              noteModel: noteModels[index],
              maxLines: maxLines,
            );
          },
        );
      },
    );
  }
}
