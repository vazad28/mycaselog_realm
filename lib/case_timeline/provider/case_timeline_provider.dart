import 'package:app_annotations/app_annotations.dart';
import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger_client/logger_client.dart';
import 'package:media_manager/media_manager.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:recase/recase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../case_details/case_details.dart';
import '../../core/providers/providers.dart';
import '../case_timeline.dart';

part '../../generated/case_timeline/provider/case_timeline_provider.g.dart';
part './case_timeline_actions.dart';
part './case_timeline_mixin.dart';

@riverpod
class CaseTimelineNotifier extends _$CaseTimelineNotifier with LoggerMixin {
  @override
  AsyncValue<List<TimelineItemModel>> build() {
    final caseID = ref.watch(caseIDProvider);

    if (caseID == null) return const AsyncData([]);

    final sub = ref
        .watch(dbProvider)
        .casesCollection
        .getSingle(caseID)
        ?.changes
        .listen((data) {
      state = AsyncData(ref.watch(caseTimelineProvider(data.object)));
    });

    //return _createTimelines(caseModel);
    ref.onDispose(() => sub?.cancel());

    return const AsyncLoading();
  }

  void createTempTimelineItem(CaseModel caseModel, DateTime dateTime) {
    final stateList = List<TimelineItemModel>.from(state.requireValue.toList());
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

    state = AsyncData(stateList);
  }
}

@riverpod
class CaseTimeline extends _$CaseTimeline {
  @override
  List<TimelineItemModel> build(CaseModel caseModel) {
    return createTimelines(caseModel);
  }

  List<TimelineItemModel> createTimelines(CaseModel caseModel) {
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

    return timelineItems;
  }

  /// Group timeline media by date ymd format
  Map<String, List<MediaModel>> _groupMediaByDate(
    List<MediaModel?> mediaModels,
  ) {
    final map = <String, List<MediaModel>>{};
    for (final mediaModel in mediaModels) {
      if (mediaModel == null || mediaModel.removed != 0) continue;
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
      if (timelineNote == null || timelineNote.removed != 0) continue;
      final kee = timelineNote.createdAt.formatYMD();

      map.putIfAbsent(kee, () => <TimelineNoteModel>[]).add(timelineNote);
    }
    return map;
  }
}
