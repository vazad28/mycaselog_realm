import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

import '../../app_models.dart';

part 'note_model.realm.dart';
part 'note_model.g.dart';

enum NoteModelProps {
  title,
  note,
}

@RealmModel()
@JsonSerializable(explicitToJson: true)
class _NoteModel {
  @PrimaryKey()
  late String noteID;
  String? authorID;
  @Indexed(RealmIndexType.fullText)
  String? title;
  String? note;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @Indexed(RealmIndexType.fullText)
  String? noteText;
  int removed = 0;
  int createdAt = 0;
  int timestamp = 0;

  NoteModel toUnmanaged() {
    return NoteModel(
      noteID,
      authorID: authorID,
      title: title,
      note: note,
      noteText: noteText,
      removed: removed,
      createdAt: createdAt,
      timestamp: timestamp,
    );
  }
}

extension NoteModelX on NoteModel {
  quill.Document get quillDocument {
    if (note?.isEmpty ?? true) return quill.Document();

    final json = jsonDecode(note!) as List<dynamic>;
    return quill.Document.fromJson(json);
  }

  Map<String, dynamic> toJson() => _$NoteModelToJson(this);

  static NoteModel fromJson(Map<String, dynamic> json) {
    return _$NoteModelFromJson(json).toUnmanaged();
  }

  static NoteModel zero() {
    final timestamp = ModelUtils.getTimestamp;
    return NoteModel(
      ModelUtils.uniqueID,
      createdAt: timestamp,
      timestamp: timestamp,
    );
  }
}

extension QuillDocumentNoteExt on quill.Document {
  String toJsonString() {
    // ignore: unnecessary_this
    return json.encode(this.toDelta().toJson());
  }
}
