// import 'package:json_annotation/json_annotation.dart';
// import 'package:realm/realm.dart';

// import '../cases/case_model.dart';
// import '../model_utils.dart';

// part 'media_model.g.dart';
// part 'media_model.realm.dart';

// ///Media status
// enum MediaStatus {
//   cancelled,
//   failed,
//   processing,
//   queued,
//   removed,
//   success,
//   uploading,
// }

// class HybridMediaModel {
//   HybridMediaModel({
//     required this.caseModel,
//     required this.mediaModel,
//   });

//   final CaseModel? caseModel;
//   final MediaModel mediaModel;
// }

// @RealmModel()
// @JsonSerializable(explicitToJson: true)
// class $MediaModel {
//   @PrimaryKey()
//   late String mediaID;
//   late String authorID;
//   late String? fileType;
//   late String? fileName;
//   late String? fileUri;
//   late String? mediumUri;
//   late String? thumbUri;
//   @Indexed()
//   late String? caseID;
//   @MapTo('status')
//   late String? _status;
//   @Ignored()
//   MediaStatus get status {
//     return MediaStatus.values.byName(_status ?? MediaStatus.queued.name);
//   }

//   @Ignored()
//   set status(MediaStatus value) => _status = value.name;

//   @Indexed(RealmIndexType.fullText)
//   late String? comment;
//   @Indexed()
//   late int removed = 0;
//   late int createdAt = 0;
//   late int timestamp = 0;

//   // Backlink field. Links back to the `tasks` property in the `odel` model.
//   @Ignored()
//   @Backlink(#mediaModels)
//   late Iterable<$CaseModel> linkedCaseModel;

//   MediaModel toRealmObject() {
//     return MediaModel(
//       mediaID,
//       authorID,
//       fileType: fileType,
//       fileName: fileName,
//       fileUri: fileUri,
//       mediumUri: mediumUri,
//       thumbUri: thumbUri,
//       caseID: caseID,
//       status: _status,
//       comment: comment,
//       removed: removed,
//       createdAt: createdAt,
//       timestamp: timestamp,
//     );
//   }

//   // static MediaModel fromJson(Map<String, dynamic> json) =>
//   //     MediaModelX.fromJson(json);

//   Map<String, dynamic> toJson() => _$$MediaModelToJson(this);
// }

// extension MediaModelX on MediaModel {
//   static MediaModel fromJson(Map<String, dynamic> json) =>
//       _$$MediaModelFromJson(json).toRealmObject();

//   Map<String, dynamic> toJson() => _$$MediaModelToJson(this);

//   static MediaModel zero(String authorID) {
//     final timestamp = ModelUtils.getTimestamp;

//     final mediaModel = MediaModel(
//       ModelUtils.uniqueID,
//       authorID,
//       createdAt: timestamp,
//       timestamp: timestamp,
//     );

//     return mediaModel;
//   }
// }
