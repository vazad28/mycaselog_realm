
import 'package:logger_client/logger_client.dart';

import '../../../../app_data.dart';

part 'media_repository.dart';

class MediaRepositoryImpl extends MediaRepository with LoggerMixin {
  ///  constructor
  MediaRepositoryImpl({
    required DatabaseService databaseService,
  }) : _databaseService = databaseService;

  final DatabaseService _databaseService;

  // @override
  // Future<Result<List<TimelineNoteModel>, RepositoryFailure>> fetchCaseNotes(
  //   String caseID,
  // ) async {
  //   try {
  //     final notes =
  //         _databaseService.timelineNotesCollection.getCaseNotes(caseID);
  //     return Result.success(notes);
  //   } catch (err) {
  //     return Result.failure(RepositoryFailureFromError(err));
  //   }
  // }

  // // @override
  // // Future<Result<List<TimelineNoteModel>, RepositoryFailure>>
  // //     fetchRemovedNotesList() async {
  // //   try {
  // //     final removedNotes = _databaseService.timelineNotesCollection.getAll();
  // //     return Result.success(removedNotes);
  // //   } catch (err, st) {
  // //     logger.severe(err, st);
  // //     return Result.failure(RepositoryFailureFromError(err));
  // //   }
  // // }

  // @override
  // List<MediaModel> getCaseMedia(
  //   String caseID,
  // ) =>
  //     _databaseService.mediaCollection.getCaseMedia(caseID);

  // ///  get time line notes file
  // @override
  // Future<List<TimelineNoteModel>> getCaseNotes(
  //   String caseID,
  // ) async =>
  //     _databaseService.timelineNotesCollection.getCaseNotes(caseID);

  // @override
  // Future<Result<List<TimelineItemModel>, RepositoryFailure>>
  //     getCaseTimelineItems(CaseModel caseModel) async {
  //   try {
  //     final timelineItems = <TimelineItemModel>[];

  //     // get data from database
  //     final timelineMediaModels = await getCaseMedia(caseModel.caseID);
  //     final timelineNoteModels = await getCaseNotes(caseModel.caseID);

  //     // group media by date YMD
  //     final mediaModelsGroupedByDateMap =
  //         _groupMediaByDate(timelineMediaModels);

  //     // group notes by date YMD
  //     final timelineNotesGroupedByDateMap =
  //         _groupTimelineNotesByDate(timelineNoteModels);

  //     //get all the keys which are dates of timeline events both media and notes
  //     final mediaModelsDates = mediaModelsGroupedByDateMap.keys.toList();
  //     final timelineNotesDates = timelineNotesGroupedByDateMap.keys.toList();

  //     /// dates are in string format of formatYMD()
  //     final allDates = List<String>.from(mediaModelsDates)
  //       ..addAll(timelineNotesDates);

  //     /// add todays date if not in list of events
  //     final todaysDate = DateTime.now().formatYMD();

  //     if (!allDates.contains(todaysDate)) {
  //       allDates.add(todaysDate);
  //     }

  //     final distinctDates = allDates.toSet().toList()..sort();

  //     // timelineItems
  //     for (final eventDate in distinctDates.reversed) {
  //       final timelineItem = TimelineItemModel.zero().copyWith(
  //         eventDate: eventDate,
  //         caseID: caseModel.caseID,
  //         surgeryDate: caseModel.surgeryDate,
  //         eventTimestamp: eventDate.timestampFromYMD(),
  //         mediaList: mediaModelsGroupedByDateMap[eventDate] ?? [],
  //         noteList: timelineNotesGroupedByDateMap[eventDate] ?? [],
  //       );

  //       timelineItems.add(timelineItem);
  //     }

  //     return Result.success(timelineItems);
  //   } catch (err) {
  //     return Result.failure(RepositoryFailureFromError(err));
  //   }
  // }

  // @override
  // Future<Result<List<HybridMediaModel>, RepositoryFailure>> getHybridMedias({
  //   String? location,
  // }) async {
  //   try {
  //     final mediaModels =
  //         _databaseService.mediaCollection.getAll();

  //     /// to create an object of HybridMediaModel we need to get the case models
  //     /// for this set of media models
  //     final caseIDs =
  //         mediaModels.map((e) => e.caseID).toSet().nonNulls.toList();

  //     final caseModels = _databaseService.casesCollection
  //         .getAllByCaseIDs(caseIDs)
  //         .nonNulls
  //         .toList();

  //     /// create a lookup map of the caseModel by caseID
  //     final lookup = <String, CaseModel>{};

  //     for (final caseModel in caseModels) {
  //       lookup.putIfAbsent(caseModel.caseID, () => caseModel);
  //     }

  //     /// Hold list of hybrid models
  //     final hybridMedia = <HybridMediaModel>[];

  //     for (final mediaModel in mediaModels) {
  //       hybridMedia.add(
  //         HybridMediaModel(
  //           mediaModel: mediaModel,
  //           caseModel: lookup[mediaModel.caseID],
  //         ),
  //       );
  //     }

  //     return Result.success(hybridMedia);
  //   } catch (err) {
  //     return Result.failure(
  //       RepositoryFailure.generic(err.toString()),
  //     );
  //   }
  // }

  // @override
  // Future<List<MediaModel>> getMediaByStatus(MediaStatus status) async {
  //   return _databaseService.mediaCollection.getMediaByStatus(status);
  // }

  // @override
  // Future<String> getMediaDownloadUrl(String path) {
  //   return _databaseService.storageCollection.getDownloadURL(path);
  // }

  // @override
  // Future<HybridMediaModel?> getSingleHybridMedia(String mediaID) async {
  //   final mediaModel = await getSingleMedia(mediaID);
  //   if (mediaModel == null) return null;

  //   CaseModel? caseModel;
  //   if (mediaModel.caseID != null) {
  //     caseModel =
  //         await _databaseService.casesCollection.getSingle(mediaModel.caseID!);
  //   }

  //   return HybridMediaModel(
  //     mediaModel: mediaModel,
  //     caseModel: caseModel,
  //   );
  // }

  // @override
  // MediaModel? getSingleMedia(String mediaID) {
  //   return _databaseService.mediaCollection.getSingle(mediaID);
  // }

  // @override
  // Future<int> getTotalMediaCount() {
  //   return Future.sync(
  //     () => _databaseService.mediaCollection.countAll(),
  //   );
  // }

  // @override
  // Future<Result<MediaModel, RepositoryFailure>> hardDeleteMedia(
  //   MediaModel params,
  // ) {
  //   // TODO(vazad): implement hardDeleteMedia
  //   throw UnimplementedError();
  // }

  // @override
  // Result<bool, RepositoryFailure> isTimelineEmpty(
  //   String caseID,
  // ) {
  //   try {
  //     final mediaCount =
  //         _databaseService.mediaCollection.getCaseMediaCount(caseID);

  //     final notesCount =
  //         _databaseService.timelineNotesCollection.getCaseNoteCount(caseID);

  //     return Result.success(mediaCount == 0 && notesCount == 0);
  //   } catch (err) {
  //     return Result.failure(RepositoryFailureFromError(err));
  //   }
  // }

  // @override
  // Future<Result<MediaModel, RepositoryFailure>> removeMedia(
  //   MediaModel mediaModel,
  // ) {
  //   return _saveMediaModel(mediaModel..removed = 1);
  // }

  // @override
  // Future<Result<MediaModel, RepositoryFailure>> saveMedia(
  //   MediaModel mediaModel,
  // ) {
  //   return _saveMediaModel(mediaModel);
  // }

  // @override
  // Future<Result<TimelineNoteModel, RepositoryFailure>> saveTimelineNote(
  //   TimelineNoteModel noteModel,
  // ) {
  //   return _saveTimelineNote(noteModel);
  // }

  // /// ////////////////////////////////////////////////////////////////////
  // /// Local Methods
  // /// ////////////////////////////////////////////////////////////////////

  // /// Group timeline media by date ymd format
  // Map<String, List<MediaModel>> _groupMediaByDate(
  //   List<MediaModel?> mediaModels,
  // ) {
  //   final map = <String, List<MediaModel>>{};
  //   for (final mediaModel in mediaModels) {
  //     if (mediaModel == null) continue;
  //     final kee = mediaModel.createdAt.formatYMD();

  //     map.putIfAbsent(kee, () => <MediaModel>[]).add(mediaModel);
  //   }
  //   return map;
  // }

  // /// /// Group timeline notes by date ymd format
  // Map<String, List<TimelineNoteModel>> _groupTimelineNotesByDate(
  //   List<TimelineNoteModel?> timelineNotes,
  // ) {
  //   final map = <String, List<TimelineNoteModel>>{};

  //   for (final timelineNote in timelineNotes) {
  //     if (timelineNote == null) continue;
  //     final kee = timelineNote.createdAt.formatYMD();

  //     map.putIfAbsent(kee, () => <TimelineNoteModel>[]).add(timelineNote);
  //   }
  //   return map;
  // }

  // Future<Result<MediaModel, RepositoryFailure>> _saveMediaModel(
  //   MediaModel mediaModel,
  // ) async {
  //   try {
  //     final mediaModelTimestamped = mediaModel
  //       ..timestamp = ModelUtils.getTimestamp;

  //     await _databaseService.mediaCollection
  //         .put(mediaModel.mediaID, mediaModelTimestamped);

  //     /// TODO : May be an issue
  //     unawaited(
  //       _databaseService.mediaCollection
  //           .put(mediaModel.mediaID, mediaModelTimestamped)
  //           .then((_) {
  //         _databaseService.mediaCollection
  //             .put(mediaModel.mediaID, mediaModelTimestamped);
  //       }),
  //     );

  //     return Result.success(mediaModelTimestamped);
  //   } catch (err) {
  //     return Result.failure(RepositoryFailureFromError(err));
  //   }
  // }

  // Future<Result<TimelineNoteModel, RepositoryFailure>> _saveTimelineNote(
  //   TimelineNoteModel noteModel,
  // ) async {
  //   final noteModelTimestamped = noteModel..timestamp = ModelUtils.getTimestamp;
  //   try {
  //     await _databaseService.timelineNotesCollection
  //         .put(noteModel.noteID, noteModelTimestamped);

  //     return Result.success(noteModelTimestamped);
  //   } catch (err) {
  //     return Result.failure(RepositoryFailureFromError(err));
  //   }
  // }

  // @override
  // Future<Result<Unit, RepositoryFailure>> deleteCaseMediaAndNotes(
  //   String caseID,
  // ) async {
  //   try {
  //     // get data from database
  //     final timelineMediaModels = await getCaseMedia(caseID);
  //     final timelineNoteModels = await getCaseNotes(caseID);

  //     for (final timelineNote in timelineNoteModels) {
  //       await _saveTimelineNote(timelineNote..removed = 1);
  //     }

  //     for (final mediaModel in timelineMediaModels) {
  //       await _saveMediaModel(mediaModel..removed = 1);
  //     }

  //     return Result.success(unit);
  //   } catch (err) {
  //     return Result.failure(RepositoryFailureFromError(err));
  //   }
  // }
}
