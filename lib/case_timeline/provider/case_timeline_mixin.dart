part of './case_timeline_provider.dart';

mixin TimelineMixin {
  /// Delete case timeline note
  Future<void> deleteTimelineNote(
    WidgetRef ref,
    TimelineNoteModel timelineNoteModel,
  ) {
    return ref
        .watch(dbProvider)
        .timelineNotesCollection
        .upsert(() => timelineNoteModel..removed = 1);
  }

  /// Change timeline  note data
  Future<void> changeTimelineNoteDate(
    WidgetRef ref,
    TimelineNoteModel timelineNoteModel,
  ) async {
    final dateTimePicked = await ref.read(dialogServiceProvider).openDatePicker(
          initialDate: DateTime.now(),
        );
    final createdAt = (dateTimePicked ?? DateTime.now()).millisecondsSinceEpoch;

    await ref.watch(dbProvider).timelineNotesCollection.upsert(
          () => timelineNoteModel..createdAt = createdAt,
        );
  }

  Future<void> openTimelineNote(
    WidgetRef ref,
    TimelineNoteModel timelineNoteModel,
  ) async {
    await ref
        .watch(dialogServiceProvider)
        .rootContext
        .openModalScreen<TimelineNoteModel?>(
          CaseTimelineNoteModal(timelineNoteModel: timelineNoteModel),
        );
  }

  Future<void> changeTimelineEventDate(
    WidgetRef ref,
    TimelineItemModel timelineItemModel,
  ) async {
    try {
      final originalTimestamp = timelineItemModel.eventTimestamp;

      final dateTimePicked = await ref
          .read(dialogServiceProvider)
          .openDatePicker(
            initialDate: DateTime.fromMillisecondsSinceEpoch(originalTimestamp),
          );

      /// of no date time selected - nothing doing
      if (dateTimePicked == null) return;

      /// no media and no notes. nothing doing
      if (timelineItemModel.mediaList.isEmpty &&
          timelineItemModel.noteList.isEmpty) return;

      await ref.watch(dbProvider).mediaCollection.changeTimelineMediaTimestamp(
            timelineItemModel.mediaList,
            dateTimePicked.millisecondsSinceEpoch,
          );

      await ref
          .watch(dbProvider)
          .timelineNotesCollection
          .changeTimelineNotesTimestamp(
            timelineItemModel.noteList,
            dateTimePicked.millisecondsSinceEpoch,
          );
    } catch (err) {
      ref.watch(dialogServiceProvider).showSnackBar(err.toString());
    }
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
        ref.watch(userIDProvider), //author
        fileType: MediaType.image.name,
        caseID: caseID,
        fileUri: imageXFile.path,
        createdAt: timestamp,
        timestamp: ModelUtils.getTimestamp,
        fileName: imageXFile.name.changeFileName(mediaID), //-> extension method
      );

      /// add image to database
      ref.watch(dbProvider).mediaCollection.add(mediaModel);
    }).catchError((dynamic err) {
      debugPrint(err.toString());
      ref.read(dialogServiceProvider).showSnackBar('Failed to add image');
    });
  }
}
