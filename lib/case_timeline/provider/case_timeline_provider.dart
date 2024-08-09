import 'package:app_annotations/app_annotations.dart';
import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:media_manager/media_manager.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import '../../core/providers/providers.dart';
import '../case_timeline.dart';

part '../../generated/case_timeline/provider/case_timeline_provider.g.dart';
part './case_timeline_actions.dart';
part './case_timeline_mixin.dart';

@riverpod
class CaseTimelineNotifier extends _$CaseTimelineNotifier {
  @override
  AsyncValue<List<TimelineItemModel>> build(String caseID) {
    final caseModel = ref.watch(dbProvider).casesCollection.getSingle(caseID);
    if (caseModel == null) {
      return AsyncError('No case model', StackTrace.current);
    }

    final mediaStream =
        ref.watch(dbProvider).mediaCollection.getCaseMedia(caseID).changes;

    final timelineNotesStream = ref
        .watch(dbProvider)
        .timelineNotesCollection
        .getCaseNotes(caseID)
        .changes;

    final sub = Rx.combineLatest2(
      mediaStream.map((event) => event.results.toList()),
      timelineNotesStream.map((event) => event.results.toList()),
      (mediaModels, timelineNotes) {
        final items = _groupByDate(caseModel, mediaModels, timelineNotes);
        state =
            AsyncValue.data(items); // Update the state with the grouped items
      },
    ).listen((_) {});

    ref.onDispose(sub.cancel);

    return const AsyncData([]);
  }

  List<TimelineItemModel> _groupByDate(
    CaseModel caseModel,
    List<MediaModel> mediaModels,
    List<TimelineNoteModel> timelineNotes,
  ) {
    final groupedData = <String, TimelineItemModel>{};

    void addGroupItem(String date, dynamic item) {
      if (!groupedData.containsKey(date)) {
        final eventDateTime = DateTime.parse(date);
        groupedData[date] = TimelineItemModel(
          id: ModelUtils.uniqueID,
          eventDate: date,
          eventTimestamp: eventDateTime.millisecondsSinceEpoch,
          caseID: caseModel.caseID,
          surgeryDate: caseModel.surgeryDate,
          mediaList: [],
          noteList: [],
        );
      }
      if (item is MediaModel) {
        groupedData[date]!.mediaList.add(item);
      } else if (item is TimelineNoteModel) {
        groupedData[date]!.noteList.add(item);
      }
    }

    for (final media in mediaModels) {
      final date = DateTime.fromMillisecondsSinceEpoch(media.timestamp)
          .toIso8601String()
          .split('T')
          .first;
      addGroupItem(date, media);
    }

    for (final note in timelineNotes) {
      final date = DateTime.fromMillisecondsSinceEpoch(note.timestamp)
          .toIso8601String()
          .split('T')
          .first;
      addGroupItem(date, note);
    }

    return groupedData.values.toList();
  }

  // Method to create and add a new empty TimelineItemModel
  void createEmptyTimelineItem(CaseModel caseModel, DateTime dateTime) {
    state.whenData((currentItems) {
      final newTimelineItem = TimelineItemModel(
        id: ModelUtils.uniqueID, // Assuming this is a unique ID generator
        eventDate: dateTime.toIso8601String().split('T').first,
        eventTimestamp: dateTime.millisecondsSinceEpoch,
        caseID: caseModel.caseID,
        surgeryDate: caseModel.surgeryDate,
        mediaList: [],
        noteList: [],
      );

      // Add the new item to the current list of timeline items
      state = AsyncValue.data(
          [...currentItems, newTimelineItem]); // Update the state
    });
  }
}
