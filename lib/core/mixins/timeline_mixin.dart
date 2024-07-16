import 'package:app_annotations/app_annotations.dart';
import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:media_manager/media_manager.dart';
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

    final updatedModel = ref
        .watch(dbProvider)
        .casesCollection
        .updateObject<TimelineNoteModel>(() {
      return model..createdAt = createdAt;
    });

    await ref.watch(dbProvider).casesCollection.putNote(updatedModel);
  }

  Future<void> addTimelineNote(
    WidgetRef ref, {
    required String caseID,
    required int timestamp,
  }) async {
    await ref
        .watch(dialogServiceProvider)
        .rootContext
        .openModalScreen<TimelineNoteModel?>(
          CaseTimelineNoteModal(
            timelineNoteModel: TimelineNoteModelX.zero(
              caseID: caseID,
              authorID: ref.read(authenticationUserProvider).id,
            )..createdAt = timestamp,
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

    await ref.watch(dbProvider).casesCollection.updateTimelineData(
          timelineItemModel.caseID,
          timelineItemModel.mediaList,
          timelineItemModel.noteList,
          dateTimePicked.millisecondsSinceEpoch,
        );
  }

  /// Add timeline image
  void addTimelinePhoto(
    WidgetRef ref, {
    required String caseID,
    required ImageSource source,
    required int timestamp,
  }) {
    MediaManager.imagePickerService
        .pickImage(source: source)
        .then((imageXFile) {
      if (imageXFile == null) throw Exception('No image picked');

      final mediaID = ModelUtils.uniqueID;
      final mediaModel = MediaModel(
        mediaID,
        caseID,
        fileType: MediaType.image.name,
        caseID: caseID,
        fileUri: imageXFile.path,
        createdAt: timestamp,
        timestamp: ModelUtils.getTimestamp,
        fileName: imageXFile.name.changeFileName(mediaID), //-> extension method
      );

      /// add image to database
      ref.read(dbProvider).casesCollection.putMedia(mediaModel);
    }).catchError((dynamic err) {
      debugPrint(err.toString());
      ref.read(dialogServiceProvider).showSnackBar('Failed to add image');
    });
  }
}
