import 'package:app_models/app_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misc_packages/misc_packages.dart';

import '../../case_timeline/case_timeline.dart';
import '../providers/providers.dart';
import '../services/dialog_service.dart';

mixin TimelineMixin {
  /// Delete case timeline note
  Future<void> deleteTimelineNote(
    WidgetRef ref,
    TimelineNoteModel model,
  ) {
    return ref.watch(dbProvider).casesCollection.putNote(model, delete: true);
  }

  /// Change timeline  note data
  Future<void> changeTimelineNoteDate(
    WidgetRef ref,
    TimelineNoteModel model,
  ) async {
    final dateTimePicked = await ref.read(dialogServiceProvider).openDatePicker(
          initialDate: DateTime.now(),
        );
    final createdAt = (dateTimePicked ?? DateTime.now()).millisecondsSinceEpoch;

    final updatedModel =
        ref.watch(dbProvider).updateRealmObject<TimelineNoteModel>(() {
      return model..createdAt = createdAt;
    });

    await ref.watch(dbProvider).casesCollection.putNote(updatedModel);
  }

  Future<void> addTimelineNote(WidgetRef ref, String caseID) async {
    await ref
        .watch(dialogServiceProvider)
        .rootContext
        .openModalScreen<TimelineNoteModel?>(
          CaseTimelineNoteModal(
            timelineNoteModel: TimelineNoteModelX.zero(
              caseID: caseID,
              authorID: ref.read(authenticationUserProvider).id,
            ),
          ),
        )
        .then((note) {
      if (note == null) return;

      /// add to database
      ref.watch(dbProvider).casesCollection.putNote(note);
    });
  }

  Future<void> changeTimelineEventDate(
    WidgetRef ref,
    TimelineItemModel timelineItemModel,
  ) async {
    final originalTimestamp = timelineItemModel.eventTimestamp;

    final dateTimePicked = await ref.read(dialogServiceProvider).openDatePicker(
          initialDate: DateTime.fromMillisecondsSinceEpoch(originalTimestamp),
        );

    /// of no date time selected - nothing doing
    if (dateTimePicked == null) return;

    /// no media and no notes. nothing doing
    if (timelineItemModel.mediaList.isEmpty &&
        timelineItemModel.noteList.isEmpty) return;

    /// change all media dates
    final updatedMediaModels = timelineItemModel.mediaList.map((e) {
      return ref.watch(dbProvider).updateRealmObject<MediaModel>(() {
        return e..createdAt = dateTimePicked.millisecondsSinceEpoch;
      });
    });

    final updatedNoteModels = timelineItemModel.noteList.map((e) {
      return ref.watch(dbProvider).updateRealmObject<TimelineNoteModel>(() {
        return e..createdAt = dateTimePicked.millisecondsSinceEpoch;
      });
    });

    await ref.watch(dbProvider).casesCollection.updateTimelineData(
          timelineItemModel.caseID,
          timelineItemModel.mediaList,
          timelineItemModel.noteList,
          dateTimePicked.millisecondsSinceEpoch,
        );
  }
}
