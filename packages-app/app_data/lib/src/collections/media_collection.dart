part of '../database_service.dart';

enum ResizeType { thumbnail, medium }

/// Implementation of [DatabaseCollection] with [MediaCollection] collection
class MediaCollection {
  MediaCollection(
    this.user,
    this.realm,
    this.sharedPrefs,
  );

  final String user;
  final Realm realm;
  final SharedPreferences sharedPrefs;

  Future<void> addMedia(MediaModel mediaModel) async {
    if (mediaModel.fileUri?.isEmpty ?? true) {
      throw Exception('Media file to upload not found');
    }

    if (mediaModel.fileUri == null || mediaModel.fileName == null) {
      throw Exception('File name not found');
    }

    final imageFile = File(mediaModel.fileUri!);
    final thumbData = await _resizeImage(
      imageFile,
      mediaModel.fileName!,
      ResizeType.thumbnail,
    );

    final mediumData =
        await _resizeImage(imageFile, mediaModel.fileName!, ResizeType.medium);

    final thumbBase64 = thumbData != null ? base64Encode(thumbData) : null;
    final mediumBase64 = mediumData != null ? base64Encode(mediumData) : null;

    realm.write(() {
      realm.add<MediaUploadModel>(
        MediaUploadModel(mediaModel.mediaID)
          ..caseID = mediaModel.caseID
          ..fileUri = mediaModel.fileUri ?? ''
          ..medium = mediumBase64
          ..thumb = thumbBase64
          ..uploadProgress = 0.0,
      );
    });
  }

  /// ////////////////////////////////////////////////////////////////////
  /// local functions
  /// ////////////////////////////////////////////////////////////////////

  Future<List<int>?> _resizeImage(
    File imageFile,
    String fileName,
    ResizeType type,
  ) async {
    final tempDir = await getTemporaryDirectory();
    final tempPath = tempDir.path;
    final targetPath = type == ResizeType.thumbnail
        ? '$tempPath/thumb_$fileName'
        : '$tempPath/medium_$fileName';

    final minHeight = type == ResizeType.thumbnail ? 200 : 1080;
    final quality = type == ResizeType.thumbnail ? 80 : 90;

    final result = await FlutterImageCompress.compressAndGetFile(
      imageFile.path,
      targetPath,
      minHeight: minHeight,
      quality: quality,
    );

    return result?.path == null ? null : File(result!.path).readAsBytesSync();
  }

  /// get sinlge object
  MediaUploadModel? getSingle(String primaryKey) =>
      realm.find<MediaUploadModel>(primaryKey);
}


// /// Implementation of [DatabaseCollection] with [MediaCollection] collection
// class MediaCollection extends DatabaseCollection<MediaModel> {
//   MediaCollection(
//     super.user,
//     super.realm,
//     super.sharedPrefs,
//   ) {
//     createCollectionStream();
//   }

//   @override
//   String get path => '$root/$userID/${DbCollection.media.name}';

//   @override
//   CollectionReference<MediaModel> get withConverter =>
//       firestore.collection(path).withConverter<MediaModel>(
//             fromFirestore: (snapshot, _) =>
//                 MediaModelX.fromJson(snapshot.data()!),
//             toFirestore: (mediaModel, _) => mediaModel.toJson(),
//           );

//   // @override
//   // Future<MediaModel> upsert(MediaModel model) async {
//   //   final mediaModel = model..timestamp = ModelUtils.getTimestamp;
//   //   await put(model.mediaID, mediaModel);
//   //   return mediaModel;
//   // }

//   @override
//   Stream<List<MediaModel>> listenForChanges() {
//     return stream.map((querySnapshot) {
//       final documents = querySnapshot.docChanges
//           .map((change) {
//             final model = MediaModelX.fromJson(change.doc.data()!);
//             switch (change.type) {
//               case DocumentChangeType.added:
//               case DocumentChangeType.modified:
//                 realm.write(() => realm.add<MediaModel>(model, update: true));
//                 return model;

//               case DocumentChangeType.removed:
//                 realm.write(() => realm.delete<MediaModel>(model));
//                 return null;
//             }
//           })
//           .whereType<MediaModel>()
//           .toList();

//       // set last update time
//       setLastSyncTimestamp();
//       return documents;
//     });
//   }

//   // Get media for a case
//   RealmResults<MediaModel> getCaseMedia(String caseID) {
//     return realm
//         .all<MediaModel>()
//         .query(r'caseID == $0 and removed == $1', [caseID, 0]);
//   }

//   List<MediaModel> getMediaByStatus(MediaStatus status) {
//     return realm.query<MediaModel>("mediaStatus == '$status'").toList();
//   }

//   int getCaseMediaCount(String caseID) {
//     return realm
//         .all<MediaModel>()
//         .where((e) => e.caseID == caseID && e.removed == 0)
//         .length;
//   }

//   List<MediaModel> getMediaModelsForCaseIds(List<String> caseIDs) {
//     return realm.query<MediaModel>(r'caseID IN $0', [caseIDs]).toList();
//   }
// }
