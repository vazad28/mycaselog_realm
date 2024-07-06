import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

import '../model_utils.dart';

part 'timeline_note_model.g.dart';
part 'timeline_note_model.realm.dart';

@RealmModel()
@JsonSerializable(explicitToJson: true)
class _TimelineNoteModel {
  @PrimaryKey()
  late String noteID;
  late String? authorID;
  late String? caseID;
  @Indexed(RealmIndexType.fullText)
  late String? note;
  @Indexed()
  late int createdAt = 0;
  late int initialTimestamp = 0;
  late int removed = 0;
  late int timestamp = 0;

  TimelineNoteModel toRealmObject() {
    return TimelineNoteModel(noteID,
        authorID: authorID,
        caseID: caseID,
        note: note,
        createdAt: createdAt,
        initialTimestamp: initialTimestamp,
        removed: removed,
        timestamp: timestamp);
  }
}

extension TimelineNoteModelX on TimelineNoteModel {
  static TimelineNoteModel fromJson(Map<String, dynamic> json) =>
      _$TimelineNoteModelFromJson(json).toRealmObject();

  Map<String, dynamic> toJson() => _$TimelineNoteModelToJson(this);

  static TimelineNoteModel zero({
    required String caseID,
    required String authorID,
  }) {
    final timestamp = ModelUtils.getTimestamp;

    return TimelineNoteModel(
      ModelUtils.uniqueID,
      authorID: authorID,
      caseID: caseID,
      createdAt: timestamp,
      initialTimestamp: timestamp,
    );
  }
}
