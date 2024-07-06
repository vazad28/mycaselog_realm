part of 'media_repository_impl.dart';

abstract class MediaRepository {
  /// get totcal media count
  Future<int> getTotalMediaCount();

  /// get list of HybridMediaModels with offset and limit
  Future<Result<List<HybridMediaModel>, RepositoryFailure>> getHybridMedias({
    String? location,
  });

  /// Add a new media
  Future<Result<MediaModel, RepositoryFailure>> saveMedia(
    MediaModel mediaModel,
  );

  /// fetch asingle media
  Future<MediaModel?> getSingleMedia(String mediaID);

  Future<HybridMediaModel?> getSingleHybridMedia(String mediaID);

  /// fetch all media models for a case
  List<MediaModel> getCaseMedia(String caseID);
  Future<List<TimelineNoteModel>> getCaseNotes(String caseID);

  /// Remove media
  Future<Result<MediaModel, RepositoryFailure>> removeMedia(
    MediaModel mediaModel,
  );

  Future<Result<MediaModel, RepositoryFailure>> hardDeleteMedia(
    MediaModel params,
  );

  /// get download URL of the media file for the media path
  /// as string from firebase
  Future<String> getMediaDownloadUrl(String path);

  /// get media models that are yet to be uploaded
  Future<List<MediaModel>> getMediaByStatus(MediaStatus status);

  /// fetch remoed media
  Future<List<MediaModel>> getRemovedMediaList();

  /// TIMELINE METHODS
  /// get case timeline
  Future<Result<List<TimelineItemModel>, RepositoryFailure>>
      getCaseTimelineItems(CaseModel caseModel);

  /// save timeline notes
  Future<Result<TimelineNoteModel, RepositoryFailure>> saveTimelineNote(
    TimelineNoteModel noteModel,
  );

  /// is timeline empty
  Result<bool, RepositoryFailure> isTimelineEmpty(String caseID);

  /// fetch deleted data
  Future<Result<List<TimelineNoteModel>, RepositoryFailure>>
      fetchRemovedNotesList();

  /// fetch case notes
  Future<Result<List<TimelineNoteModel>, RepositoryFailure>> fetchCaseNotes(
    String caseID,
  );

  /// Delete timeline notes and Media of a case
  Future<Result<Unit, RepositoryFailure>> deleteCaseMediaAndNotes(
    String caseID,
  );
}
