import '../../app_models.dart';

class TimelineItemModel {
  TimelineItemModel({
    required this.id,
    required this.eventDate,
    required this.eventTimestamp,
    required this.caseID,
    required this.surgeryDate,
    this.mediaList = const [],
    this.noteList = const [],
  });

  factory TimelineItemModel.zero() {
    return TimelineItemModel(
      id: ModelUtils.uniqueID,
      eventDate: '',
      eventTimestamp: 0,
      caseID: '',
      surgeryDate: 0,
    );
  }

  final String id;
  final String? eventDate;
  final int eventTimestamp;
  final String caseID;
  final int surgeryDate;
  final List<MediaModel> mediaList;
  final List<TimelineNoteModel> noteList;

  TimelineItemModel copyWith({
    String? id,
    String? eventDate,
    int? eventTimestamp,
    String? caseID,
    int? surgeryDate,
    List<MediaModel>? mediaList,
    List<TimelineNoteModel>? noteList,
  }) {
    return TimelineItemModel(
      id: id ?? this.id,
      eventDate: eventDate ?? this.eventDate,
      eventTimestamp: eventTimestamp ?? this.eventTimestamp,
      caseID: caseID ?? this.caseID,
      surgeryDate: surgeryDate ?? this.surgeryDate,
      mediaList: mediaList ?? this.mediaList,
      noteList: noteList ?? this.noteList,
    );
  }
}
