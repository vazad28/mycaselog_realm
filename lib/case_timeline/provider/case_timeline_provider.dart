import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

import '../../case_details/case_details.dart';
import '../../core/providers/providers.dart';

part '../../generated/case_timeline/provider/case_timeline_provider.g.dart';

@riverpod
class CaseTimelineNotifier extends _$CaseTimelineNotifier with LoggerMixin {
  @override
  StateOf<List<TimelineItemModel>> build() {
    final caseID = ref.watch(caseIDSeeder);
    if (caseID == null) {
      return const StateOf<List<TimelineItemModel>>.init();
    }

    final sub = ref
        .watch(dbProvider)
        .casesCollection
        .getSingle(caseID)
        ?.changes
        .listen((data) {
      _createTimelines(data.object);
    });

    ref.onDispose(() => sub?.cancel());

    return const StateOf<List<TimelineItemModel>>.success([]);
  }

  void _createTimelines(CaseModel caseModel,
      // List<MediaModel> medias,
      // List<TimelineNoteModel> notes,
      // int surgeryDate,
      ) {
    final timelineItems = <TimelineItemModel>[];

    // group media by date YMD
    final mediaModelsGroupedByDateMap = _groupMediaByDate(caseModel.medias);

    // group notes by date YMD
    final timelineNotesGroupedByDateMap =
        _groupTimelineNotesByDate(caseModel.notes);

    //get all the keys which are dates of timeline events both media and notes
    final mediaModelsDates = mediaModelsGroupedByDateMap.keys.toList();
    final timelineNotesDates = timelineNotesGroupedByDateMap.keys.toList();

    /// dates are in string format of formatYMD()
    final allDates = List<String>.from(mediaModelsDates)
      ..addAll(timelineNotesDates);

    /// add todays date if not in list of events
    final todaysDate = DateTime.now().formatYMD();

    if (!allDates.contains(todaysDate)) {
      allDates.add(todaysDate);
    }

    final distinctDates = allDates.toSet().toList()..sort();

    // timelineItems
    for (final eventDate in distinctDates.reversed) {
      final timelineItem = TimelineItemModel.zero().copyWith(
        eventDate: eventDate,
        caseID: caseModel.caseID,
        surgeryDate: caseModel.surgeryDate,
        eventTimestamp: eventDate.timestampFromYMD(),
        mediaList: mediaModelsGroupedByDateMap[eventDate] ?? [],
        noteList: timelineNotesGroupedByDateMap[eventDate] ?? [],
      );

      timelineItems.add(timelineItem);
    }

    state = StateOf<List<TimelineItemModel>>.success(timelineItems);
  }

  /// Group timeline media by date ymd format
  Map<String, List<MediaModel>> _groupMediaByDate(
    List<MediaModel?> mediaModels,
  ) {
    final map = <String, List<MediaModel>>{};
    for (final mediaModel in mediaModels) {
      if (mediaModel == null) continue;
      final kee = mediaModel.createdAt.formatYMD();

      map.putIfAbsent(kee, () => <MediaModel>[]).add(mediaModel);
    }
    return map;
  }

  /// /// Group timeline notes by date ymd format
  Map<String, List<TimelineNoteModel>> _groupTimelineNotesByDate(
    List<TimelineNoteModel?> timelineNotes,
  ) {
    final map = <String, List<TimelineNoteModel>>{};

    for (final timelineNote in timelineNotes) {
      if (timelineNote == null) continue;
      final kee = timelineNote.createdAt.formatYMD();

      map.putIfAbsent(kee, () => <TimelineNoteModel>[]).add(timelineNote);
    }
    return map;
  }

  void createTempTimelineItem(CaseModel caseModel, DateTime dateTime) {
    final stateList = List<TimelineItemModel>.from(state.data?.toList() ?? []);
    final eventDate = dateTime.formatYMD();

    final timelineItem = TimelineItemModel.zero().copyWith(
      eventDate: eventDate,
      caseID: caseModel.caseID,
      surgeryDate: caseModel.surgeryDate,
      eventTimestamp: eventDate.timestampFromYMD(),
      mediaList: [],
      noteList: [],
    );

    stateList.add(timelineItem);

    state = StateOf.success(stateList);
  }
}
