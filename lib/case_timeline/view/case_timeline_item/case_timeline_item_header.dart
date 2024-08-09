part of '../case_timeline_item_view.dart';

class CaseTimelineItemHeader extends ConsumerWidget
    with TimelineMixin, AppMixins {
  const CaseTimelineItemHeader({
    required this.timelineItemModel,
    super.key,
  });

  final TimelineItemModel timelineItemModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventDateTime =
        DateTime.fromMillisecondsSinceEpoch(timelineItemModel.eventTimestamp);

    final isTodayTimeline = eventDateTime.isToday;

    final timeAgoString = _getTimeAgo();

    final Widget sinceTime = Expanded(
      child: Text(timeAgoString),
    );

    final Widget moreMenu = IconButton(
      icon: const Icon(Icons.more_vert_sharp),
      onPressed: () {
        _onHeaderTap(ref, context);
      },
    );

    final Widget child = ColoredBox(
      color: isTodayTimeline
          ? context.colorScheme.primaryContainer
          : context.colorScheme.surfaceContainerHighest,
      child: SizedBox(
        height: kMinInteractiveDimension,
        child: Row(
          children: [const SizedBox(width: 16), sinceTime, moreMenu],
        ),
      ),
    );

    return child;
  }

  String _getTimeAgo() {
    final eventDateTime =
        DateTime.fromMillisecondsSinceEpoch(timelineItemModel.eventTimestamp);

    final surgeryDateTime =
        DateTime.fromMillisecondsSinceEpoch(timelineItemModel.surgeryDate);

    final surgeryDateTimeMidNight = DateTime(
      surgeryDateTime.year,
      surgeryDateTime.month,
      surgeryDateTime.day,
    );

    if (eventDateTime.day == surgeryDateTimeMidNight.day) {
      return 'on surgery day';
    } else {
      final timeAgo = surgeryDateTimeMidNight.millisecondsSinceEpoch.timeAgo(
        fromTimestamp: timelineItemModel.eventTimestamp,
        extended: true,
      );
      return '${timeAgo} ${surgeryDateTimeMidNight.difference(eventDateTime).isNegative ? 'post-op' : 'pre-op'}';
    }
  }

  void _onHeaderTap(WidgetRef ref, BuildContext context) {
    context.openActionsBottomSheet(timelineItemActions).then((headerAction) {
      if (headerAction == null) return;

      switch (headerAction.action) {
        case TimelineActionEnum.addCameraPhoto:
          addTimelinePhoto(
            ref,
            caseID: timelineItemModel.caseID,
            source: ImageSource.camera,
            timestamp: timelineItemModel.eventTimestamp,
          );
        case TimelineActionEnum.addGalleryPhoto:
          addTimelinePhoto(
            ref,
            caseID: timelineItemModel.caseID,
            source: ImageSource.gallery,
            timestamp: timelineItemModel.eventTimestamp,
          );
        case TimelineActionEnum.addNote:
          openTimelineNote(
            ref,
            TimelineNoteModelX.zero(
              caseID: timelineItemModel.caseID,
              authorID: ref.read(userIDProvider),
            )..createdAt = timelineItemModel.eventTimestamp,
          );
        case TimelineActionEnum.shareMedia:
          shareMedia(
            ref,
            mediaModels: timelineItemModel.mediaList,
          );
        case TimelineActionEnum.changeTimelineDate:
          changeTimelineEventDate(ref, timelineItemModel);
      }
    });
  }
}
