import 'package:app_models/app_models.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

mixin CasesMixin {
  /// delete case media
  Future<void> deleteCase(
    WidgetRef ref,
    CaseModel caseModel,
  ) async {
    try {
      /// delete media from storage
      for (final mediaModel in caseModel.medias) {
        await ref
            .watch(collectionsProvider)
            .storageCollection
            .deleteMedia(mediaModel);
      }
    } on FirebaseException catch (error) {
      debugPrint(error.toString());
    } finally {
      /// delete from firestore because we need to make sure the error deleting
      /// files does not compromise this part and also we can  not reference a file
      /// if the ref object is removed from tree if we delete caseModel itself first
      ref
          .watch(collectionsProvider)
          .casesCollection
          .upsert(() => caseModel..removed = 1);
    }
  }
}
