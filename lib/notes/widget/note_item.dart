import 'package:animations/animations.dart';
import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';

import 'package:flutter/material.dart';

import '../../add_note/add_note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({required this.noteModel, required this.maxLines, super.key});

  final NoteModel noteModel;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<void>(
      transitionType: ContainerTransitionType.fadeThrough,
      closedColor: context.colorScheme.surface,
      openColor: context.colorScheme.surface,
      closedElevation: 0,
      openBuilder: (context, action) {
        return AddNotePage(noteID: noteModel.noteID);
      },
      //tappable: true,
      closedBuilder: (context, action) {
        return NoteTile(
          noteModel: noteModel,
          maxLines: maxLines,
        );
      },
    );
  }
}

class NoteTile extends StatelessWidget {
  const NoteTile({
    required this.noteModel,
    required this.maxLines,
    super.key,
  });

  final NoteModel noteModel;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return MaterialCard.outlined(
      padding: const EdgeInsets.all(AppSpacing.md),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // ignore: avoid_redundant_argument_values
        mainAxisAlignment: MainAxisAlignment.start, //<- need this explict here
        children: [
          if (noteModel.title?.isNotEmpty ?? false)
            Text(
              noteModel.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.titleLarge,
            ),
          const SizedBox(
            height: AppSpacing.md,
          ),
          Text(
            noteModel.quillDocument.toPlainText(),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
          VerticalSpacer.small,
          Text(
            noteModel.timestamp.formatMDY(),
            style: context.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
