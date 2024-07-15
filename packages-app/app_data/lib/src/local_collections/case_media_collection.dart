part of '../database_service.dart';

// class CaseMediaCollection {
//   CaseMediaCollection(
//     this.user,
//     this.realm,
//     this.sharedPrefs,
//   ) {
//     //createCollectionStream();
//   }

//   final SharedPreferences sharedPrefs;
//   final Realm realm;
//   final String user;

  // void createCollectionStream() {
  //   realm.all<CaseModel>().changes.listen(_onCaseUpdate);
  //   realm.all<MediaModel>().changes.listen(_onMediaUpdate);
  // }

  // void _onCaseUpdate(RealmResultsChanges<CaseModel> event) {
  //   realm.writeAsync(() {
  //     final models = event.results.map((e) {
  //       return CaseMediaModel(e.caseID, caseModel: e);
  //     });

  //     realm.addAll<CaseMediaModel>(models, update: true);
  //   });
  // }

  // void _onMediaUpdate(RealmResultsChanges<MediaModel> event) {
  //   realm.writeAsync(() {
  //     event.results.map((mediaModel) {
  //       final caseMediaModel = realm.find<CaseMediaModel>(mediaModel.caseID);
  //       if (caseMediaModel == null) return;
  //       caseMediaModel.mediaModels
  //           .removeWhere((e) => e.mediaID == mediaModel.mediaID);
  //       caseMediaModel.mediaModels.add(mediaModel);
  //     });
  //   });
  // }

  // RealmResults<CaseMediaModel> getAll() => realm.all<CaseMediaModel>();
//}
