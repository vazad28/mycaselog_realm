part of '../case_timeline_item_view.dart';

class CaseTimelineItemHeader extends ConsumerStatefulWidget {
  const CaseTimelineItemHeader({
    required this.timelineItemModel,
    super.key,
  });

  final TimelineItemModel timelineItemModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CaseTimelineItemHeaderState();
}

class _CaseTimelineItemHeaderState extends ConsumerState<CaseTimelineItemHeader>
    with TimelineMixin, MediaMixin {
  bool _isTodayTimeline = false;

  late final DateTime surgeryDateTimeMidNight;
  late final TimelineItemModel timelineItemModel;

  String timeAgoString = '';
  String timeAgoSuffix = '';

  @override
  void initState() {
    timelineItemModel = widget.timelineItemModel;
    final surgeryDateTime =
        DateTime.fromMillisecondsSinceEpoch(timelineItemModel.surgeryDate);

    surgeryDateTimeMidNight = DateTime(
      surgeryDateTime.year,
      surgeryDateTime.month,
      surgeryDateTime.day,
    );

    final eventDateTime =
        DateTime.fromMillisecondsSinceEpoch(timelineItemModel.eventTimestamp);

    _isTodayTimeline = eventDateTime.isToday;

    if (eventDateTime.day == surgeryDateTimeMidNight.day) {
      timeAgoSuffix = 'on surgery day';
      timeAgoString = '';
    } else {
      timeAgoString = surgeryDateTimeMidNight.millisecondsSinceEpoch.timeAgo(
        fromTimestamp: timelineItemModel.eventTimestamp,
        extended: true,
      );

      if (surgeryDateTimeMidNight.difference(eventDateTime).isNegative) {
        timeAgoSuffix = 'post-op';
      } else {
        timeAgoSuffix = 'pre-op';
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Widget sinceTime = Expanded(
      child: Text('$timeAgoString $timeAgoSuffix'),
    );

    final Widget moreMenu = IconButton(
      icon: const Icon(Icons.more_vert_sharp),
      onPressed: _onHeaderTap,
    );

    final Widget child = ColoredBox(
      color: _isTodayTimeline
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

  void _onHeaderTap() {
    context.openActionsBottomSheet(timelineItemActions).then((headerAction) {
      if (headerAction == null) return;

      switch (headerAction.action) {
        case TimelineActionEnum.addCameraPhoto:
          addTimelinePhoto(ref, timelineItemModel.caseID, ImageSource.camera);
        case TimelineActionEnum.addGalleryPhoto:
          addTimelinePhoto(ref, timelineItemModel.caseID, ImageSource.gallery);
        case TimelineActionEnum.addNote:
          addTimelineNote(ref, timelineItemModel.caseID);
        case TimelineActionEnum.shareMedia:
          shareMediaList(
              ref, timelineItemModel.mediaList, timelineItemModel.caseID);
        case TimelineActionEnum.changeTimelineDate:
          changeTimelineEventDate(ref, timelineItemModel);
      }
    });
  }

  // void _onMoreMenuTap() {
  //   final notifier = ref.watch(
  //       caseTimelineItemNotifierProvider(widget.timelineItemModel.id).notifier);
  //   context.openActionsBottomSheet(timelineItemActions).then(
  //     (headerAction) {
  //       if (headerAction == null) return;

  //       switch (headerAction.action) {
  //         case TimelineActionEnum.addCameraPhoto:
  //           addTimelinePhoto(
  //             notifier,
  //             ImageSource.camera,
  //           );
  //         case TimelineActionEnum.addGalleryPhoto:
  //           addTimelinePhoto(
  //             notifier,
  //             ImageSource.gallery,
  //           );
  //         // case TimelineActionEnum.addNote:
  //         //   context
  //         //       .openOverlay<TimelineNoteModel?>(
  //         //     TimelineNoteModal(
  //         //       timelineNoteModel: TimelineNoteModel.zero(
  //         //         caseID: timelineItemModel.caseID,
  //         //         authorID: userID,
  //         //       ),
  //         //     ),
  //         //   )
  //         //       .then((noteModelUpdated) {
  //         //     if (noteModelUpdated == null) return;
  //         //     notifier.onEvent(
  //         //       CaseTimelineItemEvent.onNoteCrud(noteModelUpdated),
  //         //     );
  //         //   });
  //         // case TimelineActionEnum.shareMedia:
  //         //   notifier.onEvent(const CaseTimelineItemEvent.onShareMediaAll());
  //         // case TimelineActionEnum.changeTimelineDate:
  //         //   notifier.onEvent(const CaseTimelineItemEvent.onChangeEventDate());
  //         // ignore: no_default_cases
  //         default:
  //           break;
  //       }
  //     },
  //   );
  // }
}
