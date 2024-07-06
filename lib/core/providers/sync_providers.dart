import 'dart:async';

import 'package:app_annotations/app_annotations.dart';
import 'package:app_data/app_data.dart';
import 'package:app_models/app_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'providers.dart';

part '../../generated/core/providers/sync_providers.g.dart';

@riverpod
class FirestoreSync extends _$FirestoreSync with LoggerMixin {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // static String root = 'usersData';

  // late String userID;

  StreamSubscription<List<CaseModel>>? _casesSyncSubscription;
  StreamSubscription<List<MediaModel>>? _mediaSyncSubscription;

  late final CasesCollection _casesCollection;
  late final MediaCollection _mediaCollection;

  @override
  void build() {
    /// we sttart sync business only when user is logged in
    final currentUser = ref.watch(authenticationUserProvider);

    _casesCollection = ref.read(databaseServiceProvider).casesCollection;
    _mediaCollection = ref.read(databaseServiceProvider).mediaCollection;

    if (!currentUser.isAnonymous) startSync();

    //ref.onDispose(cancelSync);
    return;
  }

  void startSync() {
    print('startSync called');
    _casesSyncSubscription =
        _casesCollection.listenForChanges().listen((_) => {});

    // _mediaSyncSubscription =
    //     _mediaCollection.listenForChanges().listen((_) => {});
  }

  void pauseSync() {
    _casesSyncSubscription?.pause();
    _mediaSyncSubscription?.pause();
  }

  void resumeSync() {
    if (_casesSyncSubscription?.isPaused ?? false) {
      _casesSyncSubscription?.resume();
    }
    if (_mediaSyncSubscription?.isPaused ?? false) {
      _mediaSyncSubscription?.pause();
    }
  }

  void cancelSync() {
    _casesSyncSubscription?.cancel();
    _mediaSyncSubscription?.cancel();
  }

  void resetSyncForCollection(DbCollection dbCollection) {
    logger.fine('resetSyncForCollection called for ${dbCollection.name}');
    final sharedPrefs = ref.read(sharedPrefsProvider);

    switch (dbCollection) {
      case DbCollection.cases:
        final storageKey = _casesCollection.getLastSyncTimestampKey;

        sharedPrefs.setInt(storageKey, 0);
        _casesSyncSubscription?.cancel().then((_) {
          _casesCollection.createCollectionStream(lastSyncTimestamp: 0);
          logger.fine('_casesCollection re-createCollectionStream ');
          _casesSyncSubscription = _casesCollection
              .listenForChanges()
              .listen((_) => print('new _casesCollection.listenForChanges'));
        });
        break;
      default:
    }
  }
}

// Stream<List<CaseModel>> _casesSyncStream() {
//   return stream.map((querySnapshot) {
//     final changes = querySnapshot.docChanges;
//     final documents = changes
//         .map((change) {
//           final doc = change.doc;
//           final model = CaseModelX.fromJson(doc.data()!);
//           print('doc listened from firestore ${model.caseID}');
//           print('timestampDiff = ${getLastSyncTimestamp - (model.timestamp)}');
//           switch (change.type) {
//             case DocumentChangeType.added:
//               final localModel = _realm.find<CaseModel>(model.caseID);
//               if (localModel == null) {
//                 _realm.write(() => _realm.add(model));
//               }
//               return model;

//             case DocumentChangeType.modified:
//               _realm.write(() => _realm.add<CaseModel>(model, update: true));
//               return model;

//             case DocumentChangeType.removed:
//               _realm.write(() => _realm.delete<CaseModel>(model));
//               return null;
//           }
//         })
//         .whereType<CaseModel>()
//         .toList();

//     // set last update time
//     setLastSyncTimestamp();
//     return documents;
//   });
// }
