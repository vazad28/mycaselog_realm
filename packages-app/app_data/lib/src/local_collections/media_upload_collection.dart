// part of '../database_service.dart';

// /// Implementation of [DatabaseCollection] with [MediaCollection] collection
// class MediaUploadCollection {
//   MediaUploadCollection(
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
