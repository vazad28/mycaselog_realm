part of '../case_timeline_item_view.dart';

class CaseTimelineItemNotes extends ConsumerStatefulWidget {
  const CaseTimelineItemNotes({
    required this.timelineItemModel,
    super.key,
  });

  final TimelineItemModel timelineItemModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CaseTimelineItemNotesState();
}

class _CaseTimelineItemNotesState extends ConsumerState<CaseTimelineItemNotes>
    with TimelineMixin {
  @override
  Widget build(BuildContext context) {
    final noteModels = widget.timelineItemModel.noteList;

    if (noteModels.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: context.colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: noteModels
            .mapIndexed(
              (index, noteModel) => noteModel.note != null
                  ? OpenContainer<TimelineNoteModel>(
                      closedElevation: 0,
                      closedColor: Colors.transparent,
                      tappable: false,
                      closedBuilder: (_, action) => InkWell(
                        onTap: action,
                        onLongPress: () => _onLongPress(noteModel),
                        child: _NoteModelTile(noteModel: noteModel),
                      ),
                      openBuilder: (_, action) => CaseTimelineNoteModal(
                        timelineNoteModel: noteModel,
                      ),
                    )
                  : const SizedBox.shrink(),
            )
            .toList(),
      ),
    );
  }

  Future<void> _onLongPress(TimelineNoteModel noteModel) async {
    return context
        .openActionsBottomSheet(timelineNoteActions)
        .then((headerAction) {
      if (headerAction == null) return;
      switch (headerAction.action) {
        case TimelineActionEnum.changeNoteDate:
          changeTimelineNoteDate(ref, noteModel);
        case TimelineActionEnum.deleteNote:
          deleteTimelineNote(ref, noteModel);
        // ignore: no_default_cases
        default:
          break;
      }
    });
  }
}

class _NoteModelTile extends StatelessWidget {
  const _NoteModelTile({required this.noteModel});

  final TimelineNoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).disabledColor;
    final timestamp = noteModel.createdAt;
    final dateText = timestamp.format('MMMM dd, yyyy hh:mm a');

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            dateText,
            textAlign: TextAlign.start,
            style: context.textTheme.labelSmall
                ?.copyWith(color: color.withAlpha(100)),
          ),
          Text(
            noteModel.note ?? 'nothing as note',
            style: context.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
