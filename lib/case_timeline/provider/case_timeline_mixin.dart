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
        .upsert(timelineNoteModel.noteID, () => timelineNoteModel..removed = 1);
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
          timelineNoteModel.noteID,
          () => timelineNoteModel..createdAt = createdAt,
        );
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
      ref.watch(dbProvider).timelineNotesCollection.add(note.noteID, note);
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

    // TODO await ref.watch(dbProvider).casesCollection.updateTimelineData(
    //       timelineItemModel.caseID,
    //       timelineItemModel.mediaList,
    //       timelineItemModel.noteList,
    //       dateTimePicked.millisecondsSinceEpoch,
    //     );
    throw UnimplementedError();
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
      ref.read(dbProvider).mediaCollection.add(mediaModel.mediaID, mediaModel);
    }).catchError((dynamic err) {
      debugPrint(err.toString());
      ref.read(dialogServiceProvider).showSnackBar('Failed to add image');
    });
  }
}
